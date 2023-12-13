module ApplicationHelper
  def gravatar_for(_user, default_url: 'https://gravatar-profile-pictures.s3.eu-north-1.amazonaws.com/BIT.png')
    default_url
  end
end
