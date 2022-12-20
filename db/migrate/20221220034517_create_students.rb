class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :student_name
      t.string :student_id
      t.references :smart_class

      t.timestamps
    end
  end
end
