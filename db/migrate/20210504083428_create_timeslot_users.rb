class CreateTimeslotUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :timeslot_users do |t|
      t.belongs_to :timeslot, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true
      t.string :status, null: false

      t.timestamps
    end
    add_index(:timeslot_users, [:timeslot_id, :user_id])
  end
end
