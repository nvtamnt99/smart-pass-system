class Student < ApplicationRecord
  belongs_to :smart_class
  has_many :time_records, dependent: :destroy
end

# == Schema Information
#
# Table name: students
#
#  id             :bigint           not null, primary key
#  student_name   :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  smart_class_id :bigint
#  student_id     :string
#
# Indexes
#
#  index_students_on_smart_class_id  (smart_class_id)
#
