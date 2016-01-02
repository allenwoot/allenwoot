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

  def json_to_ruby_hash
    text_area_value = params[:text_area_value]
    begin
      hash = JSON.parse(text_area_value)
      hash.symbolize_keys!
      @magic = hash
    rescue
      @error_text = 'Invalid string' if text_area_value.present?
    end
  end

  def ruby_hash_to_json
    text_area_value = params[:text_area_value]
    begin
      hash = eval(text_area_value)
      @magic = hash.to_json
    rescue
      @error_text = 'Invalid string' if text_area_value.present?
    end
  end
end
