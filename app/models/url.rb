require "securerandom"

class Url
  include Mongoid::Document
  SLUG_SIZE = 5

  field :original, type: String
  field :slug, type: String, default: -> { generate_slug }

  validates :original, presence: true
  validates :slug, presence: true, uniqueness: true

  index({ slug: 1 }, { unique: true })

  def short
    URI.join(Settings.host, slug).to_s
  end

  private

  def generate_slug
    SecureRandom.hex(SLUG_SIZE)
  end
end
