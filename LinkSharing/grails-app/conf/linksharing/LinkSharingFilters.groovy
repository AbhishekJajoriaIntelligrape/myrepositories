package linksharing

class LinkSharingFilters {

    def filters = {
        all(controller:'home|login|user', action: 'index|login|create|save|sentPasswordDetails|sentPassword', invert :true) {
            before = {
                println ">>>>>>>>>>>>>>>>>>>>>>>>>"
                def value = session.getAttribute("user")
                println value
                if(!value){
                   redirect(controller: "home",action: "index")
                    return false
                }
            }
            after = { Map model ->

            }
            afterView = { Exception e ->
            }
        }
    }
}
//, controllerExclude:'home|login', uriExclude:"/user/create"