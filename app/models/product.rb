class Product < ApplicationRecord
  belongs_to :category
  has_many :categories
  has_many :order_items
  has_many :comments
  validates :title, :price, :description, presence: true

  def self.search(search)
    where('title LIKE ?', "%#{search}%")
  end

     def to_param
    "#{id}-#{title.gsub(/[^a-z0-9]+/i, '-')}"
  end

   def rating
    return 0 if comments.empty?
    comments.sum(&:rating).to_f / comments.count.to_f
  end
  
end
