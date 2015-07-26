module CommonMethods

  def it_is_api?
    controller_name == API_CONTROLLER
  end
end