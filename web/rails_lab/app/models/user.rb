class User < ActiveRecord::Base


  scope :recent, lambda{ order("created_at DESC").limit(5) }

  scope :created_after, lambda{|x| where("created_at > ? ", x) }

  # Find all the users that were created after date1 and before date2
  scope :created_between, lambda{|x,y| where("created_at between ? and ?", x, y) }


  # created_after(10.days.ago)

  def self.search_user(str)
    where(["first_name ILIKE ? OR last_name ilike ? OR email ILIKE ?", "%#{str}%", "%#{str}%", "%#{str}%" ])
  end


  def self.hate_john
    where (["first_name != 'john' and last_name != 'john'"])
  end
end
