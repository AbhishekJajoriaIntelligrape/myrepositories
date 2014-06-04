package linksharing

import grails.plugin.mail.MailService


class HomeController {
    def MailService mailService
    def index() {
        println "sss"
        if(session.getAttribute("user")){
            redirect(controller: "user",action:"show")
        }
        else{
            render (view: 'home')
        }
    }

    def sentPasswordDetails(){
        render  view: 'emailPage'
    }

    def sentPassword(String email){
            //String email =
        User l = User.findByEmail(email)
        String msgBody = "Your password is "+l.password
        if(email!=null){
            mailService.sendMail {
                  to email
                  from "LinkSharing"
                  cc "jajoria.abhishek@gmail.com"
                  subject "Confidenial"
                  body msgBody
          }
        }
        render  view: 'mesage' , model : ["msg":"password has been sent to your  mail ID please check your mail"]
    }

}