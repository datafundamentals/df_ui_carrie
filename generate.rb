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

  def go
    puts avroSchemaFields(@datasource.pastedColHeads, @datasource.colHeadDelimiter)
    write(javaPackagePath, "MyRouteBuilder.java", @datasource)
    write(javaPackagePath, "MainApp.java", @datasource)
    write(srcMainResourcesPath, "log4j.properties", @datasource)
    write(projectRootPath, ".classpath", @datasource)
    write(projectRootPath, ".project", @datasource)
    write(projectRootPath, "pom.xml", @datasource)
    write(projectRootPath, "ReadMe.md", @datasource)
    write(javaTestPackagePath, "AFileInputToAvroTestSupport.java", @datasource)
    writeTestFile
    write(haoopShellScriptPath, "create.hive", @datasource)
    write(haoopShellScriptPath, "runhive.sh", @datasource)
    write(srcTestResourcesPath, ".gitkeep", @datasource)
    writeTestFile
  end

  def writeTestFile
    if(@datasource.schemaData=='1') then
      write(javaTestPackagePath, "FileInputToAvroUseCase1Test.java", @datasource)
      write(srcTestResourcesPath, "testFile1.csv", @datasource)
    elsif(@datasource.schemaData=='2') then
      write(javaTestPackagePath, "FileInputToAvroUseCase2Test.java", @datasource)
      write(srcTestResourcesPath, "testFile6.csv", @datasource)
    elsif(@datasource.schemaData=='3') then
      write(javaTestPackagePath, "FileInputToAvroUseCase3Test.java", @datasource) 
      write(srcTestResourcesPath, "testFile3.csv", @datasource)
      write(srcTestResourcesPath, "testFile7.avsc", @datasource)
    elsif(@datasource.schemaData=='4') then
      write(javaTestPackagePath, "FileInputToAvroUseCase4Test.java", @datasource)
      write(srcTestResourcesPath, "testFile1.csv", @datasource)
      write(srcTestResourcesPath, "testFile7.avsc", @datasource)
    else
      puts "something is probably wrong with the selection of the data and schema source types, the result of '" + @datasource.schemaData + "' was not recognized."
    end
  end

  def javaPackagePath
    # need to add a cleanup so doesn't add / where there already is one
    String path = ''+ @datasource.inputParentFolder << '/' << @datasource.uniqueName << '/src/main/java/com/datafundamentals/refactorme'
  end

  def javaTestPackagePath
    # need to add a cleanup so doesn't add / where there already is one
    String path = ''+ @datasource.inputParentFolder << '/' << @datasource.uniqueName << '/src/test/java/com/datafundamentals/refactorme'
  end

  def srcMainResourcesPath
    # need to add a cleanup so doesn't add / where there already is one
    String path = ''+ @datasource.inputParentFolder << '/' << @datasource.uniqueName << '/src/main/resources'
  end

  def srcTestResourcesPath
    # need to add a cleanup so doesn't add / where there already is one
    String path = ''+ @datasource.inputParentFolder << '/' << @datasource.uniqueName << '/src/test/resources'
  end

  def projectRootPath
    # need to add a cleanup so doesn't add / where there already is one
    String path = ''+ @datasource.inputParentFolder << '/' << @datasource.uniqueName
  end

  def haoopShellScriptPath
    # need to add a cleanup so doesn't add / where there already is one
    String path = ''+ @datasource.inputParentFolder << '/' << @datasource.uniqueName << '/dunnoWhereThisGoes'
  end

end