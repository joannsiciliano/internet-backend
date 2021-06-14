class CreateVoids < ActiveRecord::Migration[6.1]
  def change
    create_table :voids do |t|
      t.string :name
      t.text :message
      t.references :mood, null: false, foreign_key: true

      t.timestamps
    end
  end
end
