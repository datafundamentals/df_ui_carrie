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
    write(javaTestPackagePath, "FileInputToAvroUseCase1Test.java", @datasource)
    write(javaTestPackagePath, "FileInputToAvroUseCase2Test.java", @datasource)
    write(javaTestPackagePath, "FileInputToAvroUseCase3Test.java", @datasource)
    write(javaTestPackagePath, "FileInputToAvroUseCase4Test.java", @datasource)
    write(haoopShellScriptPath, "create.hive", @datasource)
    write(haoopShellScriptPath, "runhive.sh", @datasource)
  end
  
  
  def javaPackagePath 
    # need to add a cleanup so doesn't add / where there already is one
    String path = ''+ @datasource.inputParentFolder << '/' << @datasource.uniqueName << '/src/main/java/com/datafundamentals/xprmnt'
  end
  
  def javaTestPackagePath 
    # need to add a cleanup so doesn't add / where there already is one
    String path = ''+ @datasource.inputParentFolder << '/' << @datasource.uniqueName << '/src/test/java/com/datafundamentals/xprmnt'
  end
  
  def srcMainResourcesPath 
    # need to add a cleanup so doesn't add / where there already is one
    String path = ''+ @datasource.inputParentFolder << '/' << @datasource.uniqueName << '/src/main/resources'
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