package linksharing

class LoginController {

    def login(String userName,String passWord) {
       // com.linksharing.LoginHelper loginHelper
        User userLoggedIN =   User.findByEmailAndPassword(userName,passWord)
        println userLoggedIN
        if (userLoggedIN==null){
            println "invalid user"
         forward(controller: "home",action: "index")
            //render (view: 'home')
            return false
        }
        session["user"] = userLoggedIN
         redirect controller: "user",action: "show"
      }


    def logout(){
        session["user"] = null
        redirect controller: "home",action: "index"

    }
}
