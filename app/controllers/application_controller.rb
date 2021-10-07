class ApplicationController < ActionController::Base
  
  around_action :swich_locale
  def index
    @user = User.find_by_id(current_user.id)
  end
  private

  def swich_locale(&action)
    locale = params[:locale] || I18n.default_locale
    if user_signed_in?
      @user = User.find_by_id(current_user.id)
      @user.update_attribute(:locale, locale)
      I18n.with_locale @user.locale, &action
    else
      I18n.with_locale locale, &action
    end
  end

  def locale_from_url
    locale = params[:locale]
    return locale if I18n.available_locales.map(&:to_s).include?(locale)
    nill
  end

  def default_url_options
    if user_signed_in?
      @user = User.find_by_id(current_user.id)
      { locale: @user.locale }
    else
    { locale: I18n.locale }
    end
  end

end
