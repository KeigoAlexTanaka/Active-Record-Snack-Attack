class Brand < ApplicationRecord
  has_many :snacks
  has_many :consumers, through: :snacks
end
