require 'date'

class DataSource
  def date
    '20'+Time.now().strftime("%y.%m.%d")
  end

  def authorName=(value)
    @authorName = value
  end

  def authorName
      if @authorName.nil? then
        @authorName = 'Carrie White'
      else
        @authorName
      end
    @authorName
  end

  def dateFieldSource=(value)
    @dateFieldSource = value
  end

  def dateFieldSource
    @dateFieldSource
  end

  def targetDataType=(value)
    @targetDataType = value
  end

  def targetDataType
    @targetDataType
  end

  def uniqueName=(value)
    @uniqueName = value
  end

  def uniqueName
    @uniqueName
  end

  def inputParentFolder=(value)
    @inputParentFolder = value
  end

  def inputParentFolder
    @inputParentFolder
  end

  def isArchived=(value)
    @isArchived = value
  end

  def isArchived
    if 'on'==@isArchived or true==@isArchived then
      @isArchived = true
    else
      @isArchived = false
    end
    
  end

  def schemaData=(value)
    @schemaData = value
  end

  def schemaData
    @schemaData
  end

  def exampleInputFile=(value)
    @exampleInputFile = value
  end

  def exampleInputFile
    @exampleInputFile
  end

  def hasMd5=(value)
    @hasMd5 = value
  end

  def hasMd5
    if 'on'==@hasMd5  or true==@hasMd5  then
      @hasMd5 = true
    else
      @hasMd5 = false
    end
  end

  def otherPartitions=(value)
    @otherPartitions = value
  end

  def otherPartitions
    if 'on'==@otherPartitions  or true==@otherPartitions  then
      @otherPartitions = true
    else
      @otherPartitions = false
    end
    
  end

  def recordValidation=(value)
    @recordValidation = value
  end

  def recordValidation
    if 'on'==@recordValidation  or true==@recordValidation then
      @recordValidation = true
    else
      @recordValidation = false
    end
  end

  def tableName=(value)
    @tableName = value
  end

  def tableName
    @tableName
  end

  def hdfsDir=(value)
    @hdfsDir = value
  end

  def hdfsDir
    @hdfsDir
  end

  def pastedColHeads=(value)
    @pastedColHeads = value
  end

  def pastedColHeads
    @pastedColHeads
  end

  def colHeadDelimiter=(value)
    @colHeadDelimiter = value
  end

  def colHeadDelimiter
    if (@colHeadDelimiter == '1') then
       ','
    elsif (@colHeadDelimiter == '2') 
      '\t'
    elsif (@colHeadDelimiter == '3') 
      '||'
    elsif (@colHeadDelimiter == '4') 
      ' '
    elsif (@colHeadDelimiter == '5') 
      ';'
    else
      ','
    end
  end

  def dataDelimiter=(value)
    @dataDelimiter = value
  end

  def dataDelimiter
    if (@dataDelimiter == '1') then
       ','
    elsif (@dataDelimiter == '2') 
      '\t'
    elsif (@dataDelimiter == '3') 
      '||'
    elsif (@dataDelimiter == '4') 
      ' '
    elsif (@dataDelimiter == '5') 
      ';'
    else
      ','
    end
  end

  def schemaFile=(value)
    @schemaFile = value
  end

  def schemaFile
    @schemaFile
  end

  def colHeadFileName=(value)
    @colHeadFileName = value
  end

  def colHeadFileName
    @colHeadFileName
  end

  def dataInputFileName=(value)
    @dataInputFileName = value
  end

  def dataInputFileName
    @dataInputFileName
  end

  def dataInputFileName=(value)
    @dataInputFileName = value
  end

  def dataInputFileName
    @dataInputFileName
  end

  def hadoopVmSshIpAddress=(value)
    @hadoopVmSshIpAddress = value
  end

  def hadoopVmSshIpAddress
    @hadoopVmSshIpAddress
  end
  

  def hadoopVmRootPassword=(value)
    @hadoopVmRootPassword = value
  end

  def hadoopVmRootPassword
    @hadoopVmRootPassword
  end
  
end