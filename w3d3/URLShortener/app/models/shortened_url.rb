class ShortenedUrl < ApplicationRecord

  validates :short_url, :user_id, presence: true, uniqueness: true
  validates :long_url, presence: true

  def self.random_code(user, long_url)
    random_num = SecureRandom.urlsafe_base64
    ShortenedUrl.new({"long_url"=>long_url, "user_id"=> user.id, "short_url" => random_num})
  end

  belongs_to :submitter,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: 'User'

  has_many :visits,
  primary_key: :id,
  foreign_key: :shortened_url_id,
  class_name: 'Visit'

  has_many :visitors,
  through: :visits,
  source: :visitors

  def self.return_long_url(short_url)
    self.select(:long_url).where(short_url: short_url).first.long_url
  end

  def num_clicks
    visits.count
  end

  def num_uniques
    visits.select(:user_id).distinct.count
  end

  def num_recent_uniques
    visits.select(:user_id)
          .distinct
          .where({created_at: (Time.now.utc - 1.hour)..Time.now.utc})
          .count
  end
end
