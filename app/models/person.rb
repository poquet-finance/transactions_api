# == Schema Information
#
# Table name: people
#
#  id         :bigint           not null, primary key
#  identifier :string           default(""), not null
#  last_name  :string           default(""), not null
#  name       :string           default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Person < ApplicationRecord
end
