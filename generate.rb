$LOAD_PATH << '.'
require 'gen_util'

class Generate
    def initialize (my_datasource)
        @datasource = my_datasource
    end
    
    def dosomething
      puts avroSchemaFields(@datasource.pastedColHeads, @datasource.colHeadDelimiter)
      puts "SOMETHING WAS DONE WITH " + @datasource.authorName +  " ON " + @datasource.date + " GOING TO " 
    end
end
