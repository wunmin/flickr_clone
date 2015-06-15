class User < ActiveRecord::Base
  has_many :albums
  has_many :photos, through: :albums
  validates :username, :password, :name, presence: true

  def self.authenticate(username, password)
    @user = User.find_by_username(username)
    byebug
    if @user.nil?
      nil
    elsif @user.password == password
      @user
    else
      nil
    end
  end

end
