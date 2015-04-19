class Book
    attr_reader :title
    @@stop_words=%w(and in the of a an)
    def title=(title)
        title.capitalize!
        @title=title.split.collect do |t| 
            t.capitalize! if !@@stop_words.include? (t)
            t
        end.join(' ')
    end
end