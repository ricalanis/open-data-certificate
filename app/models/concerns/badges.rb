module Badges
  extend ActiveSupport::Concern

  def self.badge_file_for_level(level)
    filename = case level
                 when 'basic'
                   'raw_level_badge.png'
                 when 'raw', 'pilot', 'standard', 'exemplar'
                   "#{level}_level_badge.png"
                 else
                   'no_level_badge.png'
               end

    File.open(File.join(Rails.root, 'app/assets/images/badges', filename))
  end

  def badge_file
    Certificate::Badges.badge_file_for_level(attained_level)
  end

  def badge_url
    urlgen.badge_dataset_latest_certificate_path(dataset.id, format: 'png')
  end

  def embed_url
    urlgen.badge_dataset_latest_certificate_path(dataset.id, format: 'js')
  end

  private
  def urlgen
    Rails.application.routes.url_helpers
  end

end
