class TimeRecord < ApplicationRecord
  belongs_to :student
end

# == Schema Information
#
# Table name: time_records
#
#  id          :bigint           not null, primary key
#  description :text
#  end_time    :datetime
#  start_time  :datetime
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  student_id  :bigint
#
# Indexes
#
#  index_time_records_on_student_id  (student_id)
#
