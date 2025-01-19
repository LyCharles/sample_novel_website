class LocalesController < ApplicationController
  def switch
    locale = params[:locale].to_sym
    Rails.logger.debug "Switching locale to: #{locale}"
    Rails.logger.debug "Available locales: #{I18n.available_locales}"
    
    if I18n.available_locales.include?(locale)
      session[:locale] = locale
      I18n.locale = locale
      Rails.logger.debug "Locale switched successfully. Current locale: #{I18n.locale}"
    else
      Rails.logger.debug "Invalid locale requested: #{locale}"
    end
    
    redirect_back(fallback_location: root_path)
  rescue ActionController::RedirectBackError
    redirect_to root_path
  end
end 