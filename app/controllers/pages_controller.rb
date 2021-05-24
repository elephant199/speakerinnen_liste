# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    # we take the seven newest profiles and keep one as an empty example
    @newest_profiles = Profile
                .with_attached_image
                .includes(:translations)
                .is_published
                .main_topic_translated_in(I18n.locale)
                .last 7
    @categories = Category.sorted_categories
    @blog_posts = BlogPost.order('created_at DESC').limit(2)
    @features   = Feature.published_feature.order(:position)
    @speakerinnen_count = Profile.is_published.size
  end

  def render_footer?
    true
  end

end
