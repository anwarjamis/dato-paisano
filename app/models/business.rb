class Business < ApplicationRecord
  belongs_to :user
  belongs_to :type
  belongs_to :subcategory

  has_many :categories, through: :subcategory_id
end
