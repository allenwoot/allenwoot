class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
  end

  def det
    @source = 'https://github.com/rawrjustin/det-android'
  end

  def proxy
    @source = 'https://github.com/allenwoot/proxy-ws'
  end
end
