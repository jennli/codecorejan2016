class Department < ActiveRecord::Base
  has_many :departmentings, dependent: :destroy
  has_many :products, through: :departmenting

  validates :name, presence:true, uniqueness: true
end
