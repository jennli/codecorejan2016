class Project < ActiveRecord::Base
  has_many :tasks, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
  validate :due_date_cant_be_in_the_past, on: [:create, :update]

  after_initialize :capitalize_title

  def capitalize_title
    self.title.capitalize!
  end

  private
  def due_date_cant_be_in_the_past
    if due_date < 2.days.ago
      errors.add(:due_date, "can't be in the past!")
    end
  end
end
