class CreateAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :attendances do |t|
      t.datetime :work_start_time
      t.datetime :work_end_time
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
