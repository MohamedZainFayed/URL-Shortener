class Link < ApplicationRecord
    validates :url, presence: true, uniqueness: true, length: { within: 10..255 }
    validates :slug, presence: true, uniqueness: true, length: { within: 3..255 }

    before_validation :generate_slug
    
    def self.init user_params
        user_params[:url] = "http://#{user_params[:url].strip.downcase.gsub(/(https?:\/\/)|(www\.)/,"")}"
        link_from_db = find_by_url(user_params[:url])
        return link_from_db if link_from_db
        new(user_params)
    end

    private
    
    def generate_slug
        self.slug = "#{Link.last.id + 1}#{SecureRandom.uuid[0..7]}" if self.slug.nil? || self.slug.empty?
        true
    end
end
