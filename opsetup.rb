class OpSetup
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

  def persistOption=(value)
    @persistOption = value
  end

  def persistOption
    @persistOption
  end

  def globalDeployPrefOption=(value)
    @globalDeployPrefOption = value
  end

  def globalDeployPrefOption
    @globalDeployPrefOption
  end

  def routerOption=(value)
    @routerOption = value
  end

  def routerOption
    @routerOption
  end

  def apiOption=(value)
    @apiOption = value
  end

  def apiOption
    @apiOption
  end

  def searchOption=(value)
    @searchOption = value
  end

  def searchOption
    @searchOption
  end

  def appServerOption=(value)
    @appServerOption = value
  end

  def appServerOption
    @appServerOption
  end
end