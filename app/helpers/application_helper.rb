module ApplicationHelper
  def session_locale
    session[:locale]
  end

  def locale_name object
    if (I18n.locale || session_locale) == :ru
      object.name_ru
    else
      object.name_en
    end
  end
end