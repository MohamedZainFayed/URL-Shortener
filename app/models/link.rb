class Link < ApplicationRecord
    validates :url, presence: true, uniqueness: true, length: { within: 3..255 }
    validates :slug, presence: true, uniqueness: true, length: { within: 3..255 }

    before_validation :generate_slug

    private
    
    def generate_slug
        self.slug = "#{self.id}#{SecureRandom.uuid[0..7]}" if self.slug.nil? || self.slug.empty?
        true
    end
end
