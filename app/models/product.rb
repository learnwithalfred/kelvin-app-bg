class Product < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3 }
  validates :price, presence: true, format: { with: /\A\d+(?:\.\d{0,2})?\z/ },
                    numericality: { greater_than: 0, less_than: 10_000_000 }

  validates :description, presence: true, length: { minimum: 3 }
  validates :img, presence: true

  has_many :orders, dependent: :destroy

  belongs_to :category
  belongs_to :campany
end
