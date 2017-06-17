class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  mount_uploader :avater, AvaterUploader

  def full_profile?
    nickname? && introduction? && avater?
  end

  has_many :items
  has_many :comments

  has_many :likes, dependent: :destroy
  has_many :like_tweets, through: :likes, source: :item

end
