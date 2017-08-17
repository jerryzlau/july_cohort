class RenameOldTable < ActiveRecord::Migration[5.1]
  def change
    rename_table :shortended_urls, :shortened_urls
  end
end
