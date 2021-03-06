class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
  has_many :reviews
  has_many :review_spas, through: :reviews, source: :spas
  has_many :checks
  has_many :spas, through: :checks
  
  def review(spa)
    self.reviews.find_or_create_by(spa_id: spa.id)
  end
  
  def unreview(spa)
    review = self.reviews.find_by(spa_id: spa.id)
    review.destroy if review
  end
  
  def review?(spa)
    self.review_spas.include?(spa)
  end
  
  def check(spa)
    self.checks.find_or_create_by(spa_id: spa.id)
  end
  
  def uncheck(spa)
    check = self.checks.find_by(spa_id: spa.id)
    check.destroy if check
  end
  
  def check?(spa)
    self.check_spas.include?(spa)
  end

  def reviewed?(onsen_code)
    spa = Spa.where(onsen_code: onsen_code).first
    Review.where(user_id: self.id, spa_id: spa.id).present?
  end

  def review_score(onsen_code)
    spa = Spa.where(onsen_code: onsen_code).first
    Review.where(user_id: self.id, spa_id: spa.id).first.score
  end

end
