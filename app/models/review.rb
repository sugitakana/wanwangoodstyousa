class Review < ApplicationRecord
  belongs_to :customer
  belongs_to :tag
  
  has_many :favorites, dependent: :destroy
  
  has_one_attached :image
  
  def favorite_customer(customer_id)
    favorites.find_by(customer_id: customer_id)
  end
  
  def self.search(search)
    if search != ""
      Review.where(['item_name LIKE(?) OR review LIKE(?)',"%#{search}%","%#{search}%"])  
    else
      Review.all
    end
  end
   
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end
  
  validates :item_name, presence: true
  validates :item_price, presence: true
  validates :dog_breed, presence: true
  validates :review, presence: true
  validates :rate, presence: true

end
