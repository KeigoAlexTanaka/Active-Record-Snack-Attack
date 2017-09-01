class Snack < ApplicationRecord
  belongs_to :brand

  has_many :consumerships
  has_many :consumers, through: :consumerships
end
