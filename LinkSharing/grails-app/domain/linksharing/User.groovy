package linksharing

class User {
    String name
    String email
    String password
    String confirmPassWord
    String address
    String country
    String contactNO
    String description
    Date dateCreated
    Date lastUpdated
    String gender
    static hasMany = [topics: Topic,subscribers:Subscribed]
    static transients = ["confirmPassWord"]


   String toString() {
        return name
    }

    static constraints = {
        confirmPassWord bindable: true
        gender (nullable: true)
        address(nullable: true);country(nullable: true);contactNO(nullable: true);description(nullable: true);
        password blank: false, nullable: false, minSize: 8, maxSize: 64, validator: {password, obj ->
            String password2 = obj.confirmPassWord
            println('password = '+password)
            println('password2 = '+password2)
            println("password==password2 "+password==password2)
            password2 == password ? true : ['invalid.matching.passwords']
        }
        email(unique: true)
    }
}