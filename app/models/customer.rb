class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_reviews, through: :favorites, source: :review
   has_many :comments, dependent: :destroy
   
  def self.guest
   find_or_create_by!(email: 'aaa@aaa.com') do |customer|
    customer.password = SecureRandom.urlsafe_base64
    customer.password_confirmation = customer.password
    customer.name = 'ゲスト'
   end
  end
  
  def active_for_authentication?
    super && (is_deleted == false)
  end
  
  def favorited_by?(review_id)
   favorites.where(review_id: review_id).exists?
  end
 
  validates :name, presence: true
  validates :introduction, length: {maximum: 50}
end
