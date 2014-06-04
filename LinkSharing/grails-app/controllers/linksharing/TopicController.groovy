package linksharing

import helper.InterestLevel

import javax.websocket.Session

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TopicController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        println("params value "+params)
        User listUser = session.getAttribute("user")
        List<Topic> topicsList = Topic.findAllByUser(listUser)

        respond topicsList, model:[topicInstanceCount: Topic.count()]
    }
    def publicTopics(){
        List<Topic> topicsList = Topic.findAllByAccess("PUBLIC");
        respond topicsList,model:[topicInstanceCount: Topic.count()]
    }
    def show(Topic topicInstance) {
        List<InterestLevel> Interestlist = [new InterestLevel("LOW","LOW"),new InterestLevel("MEDIUM","MEDIUM"),new InterestLevel("HIGH","HIGH")]
        User newUser = session["user"]
        Subscribed subsriber = Subscribed.findByTopicAndUser(topicInstance,newUser)
        render view : "show" ,model: [Interestlist:Interestlist,topicInstance:topicInstance,subsriber:subsriber]
       // respond topicInstance
    }

    def create() {
        respond new Topic(params)
    }

    @Transactional
    def save(Topic topicInstance) {
        if (topicInstance == null) {
            notFound()
            return
        }
        User topicUser =  session.getAttribute("user")
        topicInstance.user=topicUser

        topicInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'topicInstance.label', default: 'Topic'), topicInstance.id])
                redirect topicInstance
            }
            '*' { respond topicInstance, [status: CREATED] }
        }
    }

    def edit(Topic topicInstance) {
        respond topicInstance
    }

    @Transactional
    def update(Topic topicInstance) {
        if (topicInstance == null) {
            notFound()
            return
        }

        if (topicInstance.hasErrors()) {
            respond topicInstance.errors, view:'edit'
            return
        }

        topicInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Topic.label', default: 'Topic'), topicInstance.id])
                redirect topicInstance
            }
            '*'{ respond topicInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Topic topicInstance) {

        if (topicInstance == null) {
            notFound()
            return
        }

        topicInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Topic.label', default: 'Topic'), topicInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'topicInstance.label', default: 'Topic'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}