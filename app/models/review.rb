class Review < ApplicationRecord
  belongs_to :customer
  belongs_to :tag
  
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_customers, through: :favorites, source: :customer
  
  has_one_attached :image
 
  def self.search(search)
    if search != ""
      Review.where(['item_name LIKE(?)',"%#{search}%"])  
    else
      Review.all
    end
  end
   
  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no.image.jpeg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpeg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end
  
  validates :item_name, presence: true
  validates :item_price, presence: true
  validates :dog_breed, presence: true
  validates :review, presence: true
  validates :rate, presence: true

end
