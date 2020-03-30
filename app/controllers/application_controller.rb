class ApplicationController < ActionController::Base
  include HttpAcceptLanguage::AutoLocale
  around_action :switch_locale
  before_action :masquerade_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
   
  def switch_locale(&action)
    locale = current_user.try(:locale) || I18n.default_locale
    I18n.with_locale(locale, &action)
  end
  
  def default_url_options
    { locale: I18n.locale }
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
