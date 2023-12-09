module ApplicationHelper
  def gravatar_for(user, size: 80, default_url: 'https://example.com/default_avatar.png')
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}&d=#{CGI.escape(default_url)}"
  end
end
