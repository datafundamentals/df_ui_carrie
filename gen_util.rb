def consumeDatasourceParams (params, datasource)
  datasource.authorName = setStringValue params['authorName'], datasource.authorName
  datasource.dateFieldSource = setStringValue params['dateFieldSource'], datasource.dateFieldSource
  datasource.targetDataType = setStringValue params['targetDataType'],  datasource.targetDataType
  datasource.uniqueName = setStringValue params['uniqueName'], datasource.uniqueName
  datasource.workspaceFolder = setStringValue params['workspaceFolder'], datasource.workspaceFolder
  datasource.etlDropFolder = setStringValue params['etlDropFolder'], datasource.etlDropFolder
  datasource.isArchived = setStringValue params['isArchived'],  datasource.isArchived
  datasource.schemaData = setStringValue params['schemaData'],datasource.schemaData
  datasource.exampleInputFile = setStringValue params['exampleInputFile'], datasource.exampleInputFile
  datasource.hasMd5 = setStringValue params['hasMd5'], datasource.hasMd5
  datasource.otherPartitions = setStringValue params['otherPartitions'], datasource.otherPartitions
  datasource.recordValidation = setStringValue params['recordValidation'], datasource.recordValidation
  datasource.tableName = setStringValue params['tableName'], datasource.tableName
  datasource.hiveDb = setStringValue params['hiveDb'], datasource.hiveDb
  datasource.hdfsDir = setStringValue params['hdfsDir'], datasource.hdfsDir
  datasource.pastedColHeads = setStringValue params['pastedColHeads'], datasource.pastedColHeads
  datasource.colHeadDelimiter = setStringValue params['colHeadDelimiter'], datasource.colHeadDelimiter
  datasource.dataDelimiter = setStringValue params['dataDelimiter'], datasource.dataDelimiter
  datasource.colHeadFileName = setStringValue params['colHeadFileName'], datasource.colHeadFileName
  datasource.dataInputFileName = setStringValue params['dataInputFileName'], datasource.dataInputFileName
  datasource.hadoopVmPassword = setStringValue params['hadoopVmPassword'], datasource.hadoopVmPassword
  datasource.hadoopVmUserName = setStringValue params['hadoopVmUserName'], datasource.hadoopVmUserName
  datasource.hadoopVmSshIpAddress = setStringValue params['hadoopVmSshIpAddress'], datasource.hadoopVmSshIpAddress
  datasource.ftpTargetDir = setStringValue params['ftpTargetDir'], datasource.ftpTargetDir
end

def isCompleteInitialDatasourcePage(datasource)
  ready = true
  if isEmptyNil datasource.authorName then
    puts 'author nil'
    ready = false
  end
  if isEmptyNil datasource.uniqueName then
    puts 'uniqueName nil'
    ready = false
  end
  if isEmptyNil datasource.workspaceFolder then
    puts 'workspaceFolder nil'
    ready = false
  end
  if isEmptyNil datasource.etlDropFolder then
    puts 'etlDropFolder nil'
    ready = false
  end
  if isEmptyNil datasource.exampleInputFile then
    puts 'exampleInputFile nil'
    ready = false
  end
  ready
end

def isCompleteForHadoop(datasource)
  ready = true
  if isEmptyNil datasource.tableName then
  ready = false
  end
  if isEmptyNil datasource.hdfsDir then
  ready = false
  end
  if isEmptyNil datasource.ftpTargetDir then
  ready = false
  end
  if isEmptyNil datasource.hiveDb then
  ready = false
  end
  if isEmptyNil datasource.hadoopVmPassword then
  ready = false
  end
  if isEmptyNil datasource.hadoopVmUserName then
  ready = false
  end
  if isEmptyNil datasource.hadoopVmSshIpAddress then
  ready = false
  end
  ready
end

def isCompleteForSchemaDataOption1(datasource)
  ready = true
  if datasource.schemaData =='1' then
    if isEmptyNil datasource.pastedColHeads then
    ready = false
    end
    if isEmptyNil datasource.colHeadDelimiter then
    ready = false
    end
    if isEmptyNil datasource.dataDelimiter then
    ready = false
    end
  end
  ready
end

def isCompleteForSchemaDataOption2(datasource)
  ready = true
  if datasource.schemaData =='2' then
    if isEmptyNil datasource.dataDelimiter then
    ready = false
    end
  end
  ready
end

def isCompleteForSchemaDataOption3(datasource)
  ready = true
  if datasource.schemaData =='3' then
    if isEmptyNil datasource.colHeadFileName then
    ready = false
    end
    if isEmptyNil datasource.dataInputFileName then
    ready = false
    end
  end
  ready
end

def isCompleteForSchemaDataOption4(datasource)
  ready = true
  if datasource.schemaData =='4' then
    if isEmptyNil datasource.colHeadFileName then
    ready = false
    end
  end
  ready
end

def isCompleteForSchemaDataOption5(datasource)
  ready = true
  if datasource.schemaData =='5' then
    if isEmptyNil datasource.colHeadFileName then
    ready = false
    end
  end
  ready
end

def isCompleteForSchemaDataOption6(datasource)
  ready = true
  if datasource.schemaData =='6' then
    if isEmptyNil datasource.colHeadFileName then
    ready = false
    end
  end
  ready
end

def setStringValue(sourceValue, currentValue)
  newValue = currentValue
  if !isEmptyNil sourceValue then
  newValue = sourceValue
  end
  newValue
end

def isEmptyNil(value)
  is = true
  if value.to_s.strip != '' then
  is = false
  end
  is
end


def avroSchemaFields (columnHeads, delimiter)
    fields = ''
    if columnHeads!=nil then
        columnHead = columnHeads.split(delimiter)
        columnHead.each do |col| 
            fields << avroSchemaVal(col.strip)+ "\n"
        end
    end
    if(fields.length>7) then
        # remove last comma
      fields = fields[0..(fields.length-3)] + "\n"
    end
end



def avroSchemaVal (column_head)
    value = ''
    value <<  "        {\"name\":\""
    value << column_head.chomp.strip.downcase
    value << "\",\"type\":[\"null\",\"string\"],\"defaultValue\":null},"
end


  def writeToFileNamed(writePath, fromFileName, datasource, toFileName)
    if !File.exist?(writePath) then
      FileUtils.mkdir_p writePath
    end
    String filePath = "templates/" << fromFileName << '.erb'
    templateMyRouteBuilder = File.read(filePath)
    templateMyRouteBuilder = Erubis::Eruby.new(templateMyRouteBuilder)
    String outputFilePath = writePath + '/' + toFileName 
    File.open outputFilePath, 'w' do |f|
      f.write ( templateMyRouteBuilder.result(:datasource => datasource))
    end 
  end
  
  def writeFile (writePath, myFileName, datasource)
    writeToFileNamed(writePath, myFileName, datasource, myFileName)
  end
