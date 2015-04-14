class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :active_record #this was an accident - don't need it, but don't want to go back and drop everything
      t.string :author
      t.text :photo_url
      t.timestamps
    end
  end
end
