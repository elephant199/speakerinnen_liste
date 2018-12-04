class FeaturedProfile < ApplicationRecord
  validates :title, presence: true
  translates :title, :description
  globalize_accessors :locales => [:de, :en], :attributes => [:title, :description]

  def self.featured_women
    featured = FeaturedProfile.find_by(public: true)
    if featured == nil
      return nil
    else
      featured_profiles = []
      featured.profile_ids.each do | id |
        featured_profiles << Profile.find(id) if Profile.exists?(id)
      end
    end
    featured_profiles
  end
end
