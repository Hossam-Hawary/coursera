module CoursesHelper
  require 'rubygems'
  require 'base64'
  require 'cgi'
  require 'openssl'
  require "json"

  DISQUS_SECRET_KEY = 'zjhrrNr8Dc7CP6uy8c7D7V4ARyW2Gjoi5Pz6Fu887xiqjn14YvG7rIYHLahjDevl'
  DISQUS_PUBLIC_KEY = 'XjFMiYJj5GbojsMhu0LRanNxl8lqBpzfKpySCKabHnZ9KD7jfuyD9KyrZM7gYDyu'

  def get_disqus_sso
    # create a JSON packet of our data attributes
    data = 	{
        'id' => current_user['id'],
        'username' => current_user['name'],
        'email' => current_user['email']
        #'avatar' => user['avatar'],
        #'url' => user['url']
    }.to_json

    # encode the data to base64
    message  = Base64.encode64(data).gsub("\n", "")
    # generate a timestamp for signing the message
    timestamp = Time.now.to_i
    # generate our hmac signature
    sig = OpenSSL::HMAC.hexdigest('sha1', DISQUS_SECRET_KEY, '%s %s' % [message, timestamp])

    # return a script tag to insert the sso message
    return "<script type=\"text/javascript\">
        var disqus_config = function() {
            this.page.remote_auth_s3 = \"#{message} #{sig} #{timestamp}\";
            this.page.api_key = \"#{DISQUS_PUBLIC_KEY}\";
        }
	</script>"
  end
end
