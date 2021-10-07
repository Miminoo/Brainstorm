class ApplicationController < ActionController::Base
  
  around_action :swich_locale

  private

  def swich_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale locale, &action
  end

  def locale_from_url
    locale = params[:locale]

    return locale if I18n.available_locales.map(&:to_s).include?(locale)
    nill
  end

  def default_url_options
    { locale: I18n.locale }
  end
end
