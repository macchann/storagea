class Item < ActiveRecord::Base
  belongs_to :user
  belongs_to :brand
  has_many :images
  belongs_to :type
  belongs_to :style
  belongs_to :material
end
