class Like < ActiveRecord::Base
  belongs_to :item, counter_cache: :like_count
  belongs_to :user
end