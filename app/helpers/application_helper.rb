module ApplicationHelper
  def locale 
    locale = params[:locale] || I18n.default_locale
  end

  def locale_name object
    if (I18n.locale || locale) == :ru
      object.name_ru
    else
      object.name_en
    end
  end
end