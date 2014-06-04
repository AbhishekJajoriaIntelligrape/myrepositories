package com.linksharing

import javax.websocket.Session

/**
 * Created by intelligrape on 12/5/14.
 */
public class LoginHelper {
    UserServices userServices = new UserServices()
    boolean userLogin(){
//        User user= userServices.getUser()
        session["user"] = "user"
        return user
    }
}