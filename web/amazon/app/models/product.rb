class Product < ActiveRecord::Base
  has_many :reviews, dependent: :destroy

  has_many :departmentings, dependent: :destroy

  has_many :departments, through: :departmentings

  validates :name, presence: true,
  length:{minimum: 3}

  validates :name, uniqueness: {scope: :description}

  validates :price, numericality: {greater_than: 0}
end
