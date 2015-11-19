class Pin < ActiveRecord::Base
  validates :title, presence: true, length: { maximum: 150 }
  validates :description, presence: true
  validates :user_id, presence: true
  validates :rating, presence: true
  
  default_value_for :rating, 0
end
