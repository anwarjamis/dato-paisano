class Subcategory < ApplicationRecord
  belongs_to :category
  has_many :businesses
end
