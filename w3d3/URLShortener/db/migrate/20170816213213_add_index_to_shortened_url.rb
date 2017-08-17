class AddIndexToShortenedUrl < ActiveRecord::Migration[5.1]
  def change
    add_index :shortened_urls, :user_id, unique: true
  end
end
