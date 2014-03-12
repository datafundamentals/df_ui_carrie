$LOAD_PATH << '.'
require 'gen_util'
require 'erb'
require 'erubis'

class Replacements_
  def initialize (gen_questions)
    @answers = gen_questions
  end
end

class Generate
  def initialize (my_datasource)
    @datasource = my_datasource
  end

  def dosomething
    puts avroSchemaFields(@datasource.pastedColHeads, @datasource.colHeadDelimiter)
    puts "SOMETHING WAS DONE WITH " + @datasource.authorName +  " ON " + @datasource.date + " GOING TO "

    template = File.read("templates/CamelRoute.java.erb")
    template = Erubis::Eruby.new(template)

    # loadTestDataContent = ERB.new(File.read('templates/CamelRoute.java.erb')).def_class(Replacements_, 'render()').new(@datasource).render()
    File.open 'CamelRoute.java', 'w' do |f|
      f.write ( template.result(:datasource => @datasource))
    end
  end
end
