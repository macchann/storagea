class Favorite < ActiveRecord::Base
  belongs_to :item, counter_cache: :favorites_count
  belongs_to :user
end