class Task < ActiveRecord::Base
  belongs_to :project
  has_many :discussions, dependent: :destroy

  after_initialize :default

  DONE = "done"
  UNDONE = "undone"

  def default
    self.done ||= false
    self.title.capitalize! if self.title
  end

  validates :title, presence: true

end
