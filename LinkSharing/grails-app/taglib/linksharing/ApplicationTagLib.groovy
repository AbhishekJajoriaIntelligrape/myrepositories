package linksharing

class ApplicationTagLib {
    static defaultEncodeAs = 'html'
        //static encodeAsForTags = [tagName: 'raw']

    def dateFormat = {attr,body->
        String dateF = attr.date
        println dateF
        def date = new Date().parse("yyyy-MM-dd",dateF)
        String format = date.format("MMM dd yyyy")
        out << format
    }

}
