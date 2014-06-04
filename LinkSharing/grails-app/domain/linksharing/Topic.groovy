package linksharing
class Topic {
    String title
    String access
    String description
    Date dateCreated
    Date lastUpdated
    static belongsTo = [user:User]
    static hasMany = [resources:Resource,subscribers:Subscribed]
    static mapping = {access defaultvalue:"'PUBLIC'"}
    static constraints  = {
        access(nullable:true)
    }
}