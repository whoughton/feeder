class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.string :name
      t.text :description
      t.references :user, index: true

      t.timestamps
    end
  end
end
