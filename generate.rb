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
    writeFile(javaPackagePath, "MyRouteBuilder.java", @datasource)
    writeFile(javaPackagePath, "MainApp.java", @datasource)
    writeFile(srcMainResourcesPath, "log4j.properties", @datasource)
    writeToFileNamed(projectRootPath, "_.classpath", @datasource, ".classpath")
    writeToFileNamed(projectRootPath, "_.project", @datasource, ".project")
    writeFile(projectRootPath, "pom.xml", @datasource)
    writeFile(projectRootPath, "ReadMe.md", @datasource)
    writeFile(javaTestPackagePath, "AFileInputToAvroTestSupport.java", @datasource)
    writeTestFile
    writeFile(haoopShellScriptPath, "run.hive", @datasource)
    writeFile(haoopShellScriptPath, "run.sh", @datasource)
    writeFile(haoopShellScriptPath, "main.sh", @datasource)
    writeFile(haoopShellScriptPath, "deployToServer.sh", @datasource)
    writeFile(haoopShellScriptPath, "deployLocal.sh", @datasource)
    writeFile(haoopShellScriptPath, "dev2etlDrop.sh", @datasource)
    writeFile(haoopShellScriptPath, "setup.sh", @datasource)
    writeFile(haoopShellScriptPath, "clearAll.sh", @datasource)
    writeTestFile
  end

  def writeTestFile
    if(@datasource.schemaData=='1') then
      writeFile(javaTestPackagePath, "FileInputToAvroUseCase1Test.java", @datasource)
      writeFile(srcTestResourcesPath, "testFile1.csv", @datasource)
    elsif(@datasource.schemaData=='2') then
      writeFile(javaTestPackagePath, "FileInputToAvroUseCase2Test.java", @datasource)
      writeFile(srcTestResourcesPath, "testFile6.csv", @datasource)
    elsif(@datasource.schemaData=='3') then
      writeFile(javaTestPackagePath, "FileInputToAvroUseCase3Test.java", @datasource) 
      writeFile(srcTestResourcesPath, "testFile3.csv", @datasource)
      writeFile(srcTestResourcesPath, "testFile7.avsc", @datasource)
    elsif(@datasource.schemaData=='4') then
      writeFile(javaTestPackagePath, "FileInputToAvroUseCase4Test.java", @datasource)
      writeFile(srcTestResourcesPath, "testFile1.csv", @datasource)
      writeFile(srcTestResourcesPath, "testFile7.avsc", @datasource)
    else
      puts "something is probably wrong with the selection of the data and schema source types, the result of '" + @datasource.schemaData + "' was not recognized."
    end
  end

  def javaPackagePath
    # need to add a cleanup so doesn't add / where there already is one 
    String path = ''+ @datasource.devHome << '/' <<@datasource.workspaceFolder << '/' << @datasource.uniqueName << '/src/main/java/com/datafundamentals/refactorme'
  end

  def javaTestPackagePath
    # need to add a cleanup so doesn't add / where there already is one
    String path = ''+ @datasource.devHome << '/' <<@datasource.workspaceFolder << '/' << @datasource.uniqueName << '/src/test/java/com/datafundamentals/refactorme'
  end

  def srcMainResourcesPath
    # need to add a cleanup so doesn't add / where there already is one
    String path = ''+ @datasource.devHome << '/' <<@datasource.workspaceFolder << '/' << @datasource.uniqueName << '/src/main/resources'
  end

  def srcTestResourcesPath
    # need to add a cleanup so doesn't add / where there already is one
    String path = ''+ @datasource.devHome << '/' <<@datasource.workspaceFolder << '/' << @datasource.uniqueName << '/src/test/resources'
  end

  def projectRootPath
    # need to add a cleanup so doesn't add / where there already is one
    String path = ''+ @datasource.devHome << '/' <<@datasource.workspaceFolder << '/' << @datasource.uniqueName
  end

  def haoopShellScriptPath
    # need to add a cleanup so doesn't add / where there already is one
    String path = ''+ @datasource.devHome << '/' <<@datasource.workspaceFolder << '/' << @datasource.uniqueName << '/bin'
  end

end