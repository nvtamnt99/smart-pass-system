class SmartClass < ApplicationRecord
  has_many :students, dependent: :destroy
end

# == Schema Information
#
# Table name: smart_classes
#
#  id         :bigint           not null, primary key
#  class_code :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
