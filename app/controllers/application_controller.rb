class ApplicationController < ActionController::Base
  include HttpAcceptLanguage::AutoLocale
  around_action :switch_locale
  before_action :masquerade_user!
   
  def switch_locale(&action)
    locale = current_user.try(:locale) || I18n.default_locale
    I18n.with_locale(locale, &action)
  end
  
  def default_url_options
    { locale: I18n.locale }
  end
end
