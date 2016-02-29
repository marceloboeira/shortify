require "securerandom"

class Url
  include Mongoid::Document
  SLUG_SIZE = 5

  field :link, type: String
  field :slug, type: String, default: -> { generate_slug }

  validates :link, presence: true
  validates :slug, presence: true, uniqueness: true

  index({ slug: 1 }, { unique: true })

  private

  def generate_slug
    SecureRandom.hex(SLUG_SIZE)
  end
end
