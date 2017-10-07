require 'sparkpost'
class Email
  def self.send_list(email, item, quantity)
    ENV['SPARKPOST_API_KEY'] = "c2e2188848794dabfd2c51d5209e308a773c3416"

    sp = SparkPost::Client.new() # api key was set in ENV through
    response = sp.transmission.send_message(email, 'jasonlum@jason.getknowt.com',
      'A new item has been added to the grocery list!',
       '<h1>'+email+' has added '+quantity.to_s+ " "+ item+"(s) to the grocery list"'</h1>')
    puts response
  end
end
