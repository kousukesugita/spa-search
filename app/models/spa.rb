class Spa < ApplicationRecord
  # belongs_to :prefecture
  
  # validates :OnsenName, presence: true, length: { maximum: 255 }
  # validates :OnsenNameKana, presence: true, length: { maximum: 255 }
  # validates :Prefecture, presence: true, length: { maximum: 255 }
  # validates :NatureOfOnsen, presence: true, length: { maximum: 255 }
  # validates :OnsenAreaURL, presence: true, length: { maximum: 255 }
  
  # has_many :reviews
  # has_many :users, through: :reviews
  # has_many :checks
  # has_many :users, through: :checks
end