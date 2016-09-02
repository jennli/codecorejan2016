class Campaign < ActiveRecord::Base

  # this integrate FriendlyId within our model
  # we are using the 'name' to genrate the slug
  extend FriendlyId
  include AASM
  friendly_id :name, use: [:slugged, :history]

  has_many :pledges, dependent: :destroy
  has_many :rewards, dependent: :destroy
  has_many :comments, as: :commentable
  # this enables us to create associated rewards models at the same time we're
  # creating the campaign model.
  # reject_if: :all_blank means that if the user leaves all the fields for the
  #                       reward empty, it will be ignored and not passed to the
  #                       validation
  # allow_destroy: true   means that if you pass in a special attributes _destroy
  #                       with value `true` as part of the `reward` params it
  #                       will delete the reward record all together.
  accepts_nested_attributes_for :rewards, reject_if: :all_blank, allow_destroy: true


  belongs_to :user

  validates :name, presence: true, uniqueness: true
  validates :goal, presence: true, numericality:  { greater_than_or_equal_to: 10 }

  # setting the whiny_transitions: false option makes it so that it won't
  # throw an exception when an invalid transition happen
  aasm whiny_transitions: false do
    state :draft, initial: true
    state :published
    state :unfunded
    state :funded
    state :canceled

    event :publish do
      transitions from: :draft, to: :published
    end

    event :cancel do
      transitions from: [:draft, :published, :funded], to: :canceled
    end

    event :fund do
      transitions from: :published, to: :funded
    end

    event :unfund do
      transitions from: :published, to: :unfunded
    end

  end

  geocoded_by :address
  after_validation :geocode

  def published
    where(aasm_state: :published)
  end

  # This is CarrierWave config:
  # :image is the field in the database that will store the image name
  # ImageUploader is the uplaoder class we created in /app/uploaders/image_uploader.rb
  mount_uploader :image, ImageUploader

  # default to_param method
  # def to_param
  # id
  # end

  # def to_param
  #   # for to_param to work there must be an id with non-numerical char
  #   # right after. it's good to call a method like 'parameterize' which makes
  #   # it url friendly. For instance, 'parameterize' replaces spaces with `-`s
  #   "#{id}-#{name}".parameterize
  # end

end
