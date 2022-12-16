class CreateSmartClasses < ActiveRecord::Migration[7.0]
  def change
    create_table :smart_classes do |t|
      t.string :name
      t.string :class_code

      t.timestamps
    end
  end
end
