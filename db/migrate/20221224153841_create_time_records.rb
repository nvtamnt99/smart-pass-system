class CreateTimeRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :time_records do |t|
      t.string :title
      t.text :description
      t.datetime :start_time
      t.datetime :end_time
      t.references :student

      t.timestamps
    end
  end
end
