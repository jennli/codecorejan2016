class Departmenting < ActiveRecord::Base
  belongs_to :product
  belongs_to :department

  # validates :department_id, :product_id, presence:true
  validates :department_id, uniqueness: {scope: :product_id}
end
