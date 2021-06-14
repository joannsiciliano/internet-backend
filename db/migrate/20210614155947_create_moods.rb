class CreateMoods < ActiveRecord::Migration[6.1]
  def change
    create_table :moods do |t|
      t.string :feeling

      t.timestamps
    end
  end
end
