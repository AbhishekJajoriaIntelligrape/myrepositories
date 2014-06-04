package linksharing

/**
 * Created by intelligrape on 12/5/14.
 */
class Resource {

    String name
    enum Type{
        doc,pdf,link
    }
    String type
    static belongsTo = [topic:Topic]
}