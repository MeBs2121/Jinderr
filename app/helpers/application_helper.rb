module ApplicationHelper
  def display_image account, size
    if account.photo.url.blank?
      url = 'placeholder.jpg'
    else
      url = account.photo.url
    end
    image_tag(url, alt: account.nickname, size: "#{size}x#{size}", class: "pic")
  end
end
