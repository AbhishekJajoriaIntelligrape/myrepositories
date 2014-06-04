package linksharing

class Subscribed {
    String interestLevel
    Date dateCreated
    Date lastUpdated
    static belongsTo = [user:User,topic:Topic]
    static constraints = {
        interestLevel(nullable: true)
    }
}
