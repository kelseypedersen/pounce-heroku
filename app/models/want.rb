# require 'rubygems'
# require 'twilio-ruby'

class Want < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  def self.checking
  wants = Want.all
  wants.each do |want|
    client = HTTParty.get("http://api.shopstyle.com/api/v2/products/#{want.product.shopstyle_id}?pid=ENV['SHOPSTYLE_TOKEN']")
    currentShopstylePrice = client["priceLabel"]
    if (currentShopstylePrice == "Sold Out")
    else
      currentShopstylePrice = currentShopstylePrice.split(//)
      currentShopstylePrice.each do |item|
        if item == "$" || item == ","
          currentShopstylePrice.delete(item)
        end
      end
      currentShopstylePrice = currentShopstylePrice.join("")
    end
    if (currentShopstylePrice == "Sold Out")
    elsif (currentShopstylePrice.to_i <= want.max_price)
      want.update(fulfilled: true)
    else (currentShopstylePrice.to_i > want.max_price)
      want.fulfilled = false
    end
  end
end


def self.notification
  puts "Sending notification"

  wants = Want.all
  wants.each do |want|
    userId = want.user_id
    user = User.find(userId)
    # user_phone = "+1" + user.phone_number

    # if ((want.notified == false) && (want.fulfilled == true))
    next unless want.fulfilled && !want.notified
    account_sid = ENV["ACCOUNT_SID"]
    auth_token = ENV["AUTH_TOKEN"]
    client = Twilio::REST::Client.new account_sid, auth_token

    from = ENV['TWILIO_NUMBER']

    client.account.messages.create(
      :from => from,
      :to => user.phone_number,
      :body => "Hey #{user.name}, the #{want.product.title} meets your ideal price!"
    )
    want.update(notified: true)
    end
  end
end



