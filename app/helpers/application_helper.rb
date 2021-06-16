module ApplicationHelper

  def image_for account, class_name
    if account.photo.url.blank?
      url = account.gender.name == "male" ? 'male.jpg' : 'female.jpg'
    else
      url = account.photo.url
    end
    image_tag(url, alt: account.nickname, class: "#{class_name}")
  end

end
