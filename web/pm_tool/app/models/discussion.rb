class Discussion < ActiveRecord::Base
  belongs_to :task
  has_many :comments, dependent: :destroy

  validates :title, presence:true
  validates :description, presence:true

  def last_replied_time
    self.comments.order("updated_at DESC").first.updated_at
  end

  def is_replied?
    self.comments.count > 0
  end

end
