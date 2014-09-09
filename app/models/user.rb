class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :hangmen

  def self.all_id
    User.all.map do |user|
      user.id
    end
  end

  def self.all_email
    User.all.map do |user|
      user.email
    end
  end
end
