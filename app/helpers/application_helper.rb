module ApplicationHelper
  def current_class?(test_path)
     return 'active ' if request.path == test_path
     return''
  end

  def controllerActive?(*controller)
    return 'active ' if controller.include?(params[:controller])
    return ''
  end

  def controllerClass?(cssClass, *controller)
    return cssClass if controller.include?(params[:controller])
    return ''
  end
end
