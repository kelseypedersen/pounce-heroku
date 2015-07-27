class User < ActiveRecord::Base
  has_many :wants

  private

  def self.create_or_login(params)

    user = find_or_create_by(email: params[:users][:email])

    if user.password != nil && user.password == params[:users][:password]
      return user
    end
    if user.password == nil
      user.name = params[:users][:name]
      user.password = params[:users][:password]
      user.phone_number = params[:users][:phone_number]
      user.save!
      return user
    end
  end

end
