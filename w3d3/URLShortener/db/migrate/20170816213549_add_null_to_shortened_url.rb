class AddNullToShortenedUrl < ActiveRecord::Migration[5.1]
  def change
    change_column :shortened_urls, :long_url, :string, null: false
    change_column :shortened_urls, :short_url, :string, null: false
    change_column :shortened_urls, :user_id,:string, null: false
    add_index :shortened_urls, :short_url, unique: true
  end
end
