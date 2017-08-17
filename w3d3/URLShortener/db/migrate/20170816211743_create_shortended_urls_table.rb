class CreateShortendedUrlsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :shortended_urls do |t|
      t.string :long_url
      t.string :short_url
      t.integer :user_id
      t.timestamps
    end
  end
end
