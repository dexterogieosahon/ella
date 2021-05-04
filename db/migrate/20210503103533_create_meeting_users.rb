class CreateMeetingUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :meeting_users do |t|
      t.belongs_to :meeting, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true
      t.string :status, null: false

      t.timestamps
    end
    add_index(:meeting_users, [:meeting_id, :user_id])
  end
end
