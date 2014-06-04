package linksharing

import grails.plugin.mail.MailService

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional


@Transactional(readOnly = false)
class UserController {

    def MailService mailService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond User.list(params), model:[userInstanceCount: User.count()]
    }

    def show(User userInstance) {
        userInstance = session.getAttribute("user")
        render view: "show" ,model: [userinstance:userInstance]
    }

    def create() {
        println "show"
        respond new User(params)
    }

    @Transactional
    def save(User userInstance) {

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'create'
            return
        }
        println params
        userInstance.confirmPassWord = params.confirmPassWord
        println "===================================="
        println userInstance.confirmPassWord
        println "===================================="
        println "in save"
     /*   String passWord = params.password
        String confirmPassword = params.confirmPassWord
        if(!(passWord==confirmPassword)){
           render "Password not matched"
            return
        }*/
        userInstance.properties=params
       /* user.name=params.name
        user.Email=params.userName
        user.password=params.passWord*/
        println "user is valid "+userInstance.validate()
        println userInstance.errors
        println userInstance.save()

   /**    mailService.sendMail {
            to "abhishek.jajoria@intelligrape.com"
            from "Abhishek"
            cc "dheeraj.madaan@intelligrape.com"
            subject "SMTP mail from link sharing"
            body 'New user added'
        }
**/
        redirect(controller: "home",action: "index")
       // show(userInstance)
    }

    def edit(User userInstance) {
        userInstance = session.getAttribute("user")
        println "user " + userInstance

        render view: "edit",model: [user:userInstance]
    }

    @Transactional
    def update(User userInstance) {
        println "in update"
        User sessionUser = session.getAttribute("user")

        userInstance.id=sessionUser.id
    /** User.executeUpdate("update User u set u.name=:newName ,u.address =:newAddress"
             +" where id=:oldId",[newName:userInstance.name,newAddress:userInstance.address,oldId:sessionUser.id.toLong()])*/
  User.executeUpdate("update User u set u.name=:newName ,u.address =:newAddress ,u.contactNO=:newcontactNO"
             +" where id=:oldId",[newName:userInstance.name,newAddress:userInstance.address,newcontactNO:userInstance.contactNO,oldId:userInstance.id.toLong()])

        session["user"] = User.get(sessionUser.id)




  /**  User.executeUpdate("update User b set b.name=:newName ,b.address =:newAddress,b.contactno =:newContactNO,b.description=:newDescription,b.country=:newCountry" +
                "where b.id=:id", [newName: userInstance.name, newAddress: userInstance.address,newDescription:userInstance.description,newCountry:userInstance.country,newContactNO:userInstance.contactNO])
            //update session object**/

       redirect(controller: "user",action: "show")
    }

    @Transactional
    def delete(User userInstance) {

        if (userInstance == null) {
            notFound()
            return
        }

        userInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    @Override
    String toString() {
        return super.toString()
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'userInstance.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}