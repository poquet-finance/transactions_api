# == Schema Information
#
# Table name: banks
#
#  id         :bigint           not null, primary key
#  code       :string           not null
#  name       :string           not null
#  type       :integer          default(0), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Bank < ApplicationRecord
end
