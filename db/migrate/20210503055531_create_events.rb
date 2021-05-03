class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :name, null: false, unique: true
      t.date :date, null: false

      t.timestamps
    end
  end
end
