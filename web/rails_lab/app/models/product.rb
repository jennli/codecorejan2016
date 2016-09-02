class Product < ActiveRecord::Base

  # Write a validation code that will validate the presence of the name and that price is more than 0 and less than 1000
  validates :name, presence: true
  validates :price,  numericality: {less_than_or_equal_to: 1000, greater_than_or_equal_to: 0 , message: "price must be between 0 and 1000"}


  scope :created_after, lambda{|x| where("update_at > ? ", x) }

  #
  # item = Item.find(1)
  # item.foo_count # => 0
  # Item.increment_counter(:foo_count, 1)
  # item.foo_count # => 0
  # item.reload
  # item.foo_count # => 1
  # item.increment(:foo_count)
  # item.foo_count # => 2


  # Write a code that will fetch the most recent three products on sale (a product is on sale is when the sale_price is not equal to the price). The products must be ordered so that the cheapest product appears first.
  def self.recent
    where(["sale_price < price"]).order("price").limit(3)

  end

  # Find all products priced more than 100 and less than 300. Order them by name and limit the results to 10 products.
  def self.filter_price
    where(["price > 50 AND price < 300"]).order("name").limit(10)
  end

  # Write a validation that makes sure that the name is present, unique and that it's not any of these reserved words: Apple, Microsoft & Sony.

  validates :name, presence: true, uniqueness: true
  validate :reserve_name
  validates :sale_price, numericality: {less_than_or_equal_to: :price}

  before_destroy :delete_p

  private

  def reserve_name
    if (name.downcase.include?"microsoft") || (name.downcase.include?"apple") || (name.downcase.include?"sony")
      errors.add(:name, "name cannot be Apple, Microsoft, or Sony")
    end
  end

  def delete_p
    puts "product '#{self.name}' is about to be destroyed "
  end
end
