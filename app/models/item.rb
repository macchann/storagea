class Item < ActiveRecord::Base

  mount_uploader :image, ImageUploader

  belongs_to :user
  belongs_to :brand
  has_many :images
  belongs_to :type
  belongs_to :style
  belongs_to :material
  has_many :comments
  has_many :favorites, dependent: :destroy
  def favorite_user(user_id)
    favorites.find_by(user_id: user_id)
  end
end
