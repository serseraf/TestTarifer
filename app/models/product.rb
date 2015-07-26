class Product < ActiveRecord::Base
  belongs_to :catalog
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, :numericality => {:greater_than => 0}

  def self.empty(id)
    {name: 'empty', description:'no such product', price:0, catalog_id: id}
  end
end
