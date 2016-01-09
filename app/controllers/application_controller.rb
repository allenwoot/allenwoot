class ApplicationController < ActionController::Base
  require "json"

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

  def to_json
    input = params[:input]
    begin
      hash = eval(input).to_json
    rescue
      raise "Syntax error"
    end
    render :text => hash
  end

  def to_ruby
    input = params[:input]
    begin
      hash = JSON.parse(input)
      hash.symbolize_keys!
    rescue
    end
    render :text => hash
  end
end
