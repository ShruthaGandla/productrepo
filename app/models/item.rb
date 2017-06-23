class Item < ApplicationRecord
  belongs_to :user

  has_one :purchase ,dependent: :destroy
  validates :product_name, :amount, presence: true
  
end
