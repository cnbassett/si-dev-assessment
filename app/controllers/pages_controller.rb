class PagesController < ApplicationController
  def home
  end

  def sms
    require 'twilio-ruby'
    
    account_sid = "AC11b3ad695add1a5902319507eef7e265" # Your Account SID from www.twilio.com/console  ENV["TWILIO_ACCOUNT_SID"]
    auth_token = "0a5752ab7271aab520c1d0a51409b061" # Your Auth Token from www.twilio.com/console   ENV["TWILIO_AUTH_TOKEN"]

    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
       body: params[:q1],
       to: params[:q2],    # Replace with your phone number
       from: "7817522055") # Replace with your Twilio number ENV["TWILIO_PHONE_NUMBER"] 

    puts message.sid
    #raise "Action sms in the UsersController is not implemented! received params #{params.to_json}"
  end
end
