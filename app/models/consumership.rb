class Consumership < ApplicationRecord
  belongs_to :consumer
  belongs_to :snack
end
