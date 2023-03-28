class Campany < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
