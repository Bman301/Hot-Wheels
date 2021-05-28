class Car < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  
  include PgSearch::Model
  pg_search_scope :search_by_model_and_brand,
  against: [ :model, :brand ],
  using: {
      tsearch: { prefix: true }
  }

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
