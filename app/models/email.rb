require 'sparkpost'
class Email
  def self.send(text)
    ENV['SPARKPOST_API_KEY'] = "c2e2188848794dabfd2c51d5209e308a773c3416"

    sp = SparkPost::Client.new() # api key was set in ENV through
    response = sp.transmission.send_message('jasonlum109@gmail.com', 'jasonlum@jason.getknowt.com', 'test email', '<h1>'+text+'</h1>')
    puts response
  end
end
