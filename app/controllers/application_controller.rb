class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  include SessionsHelper
  
  private
  
  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  def read(result)
    name = result['OnsenName']
    kana = result['OnsenNameKana']
    addres = result['OnsenAddres']
    pref = result['Prefecture']
    nature = result['NatureOfOnsen']
    url = result['OnsenAreaURL']
    caption = result['OnsenAreaCaption']
    
    return {
      name: name,
      kana: kana,
      addres: addres,
      pref: pref,
      nature: nature,
      url: url,
      caption: caption,
    }
  end
end
