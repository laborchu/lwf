class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :desc
      t.boolean :is_public
      t.integer :capacity

      t.timestamps
    end
  end
end
