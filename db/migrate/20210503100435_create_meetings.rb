class CreateMeetings < ActiveRecord::Migration[6.1]
  def change
    create_table :meetings do |t|
      t.belongs_to :timeslot, null: false, index: true, foreign_key: true
      t.string :name
      t.uuid :uuid, null: false
      t.datetime :starts_at, null: false
      t.datetime :ends_at, null: false
      t.string :location

      t.timestamps
    end
  end
end
