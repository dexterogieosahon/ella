class CreateTimeslots < ActiveRecord::Migration[6.1]
  def change
    create_table :timeslots do |t|
      t.belongs_to :event, null: false, index: true, foreign_key: true
      t.time :starts_at, null: false
      t.time :ends_at, null: false

      t.timestamps
    end
  end
end
