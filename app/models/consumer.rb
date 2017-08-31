class Consumer < ApplicationRecord
  has_many :consumerships
  has_many :snacks, through: :consumerships
end
