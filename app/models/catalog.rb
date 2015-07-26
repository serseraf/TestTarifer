class Catalog < ActiveRecord::Base
  has_many :products, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
end
