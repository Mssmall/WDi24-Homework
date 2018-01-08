# == Schema Information
#
# Table name: cities
#
#  id         :integer          not null, primary key
#  name       :text
#  population :integer
#  image      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class City < ActiveRecord::Base
  belongs_to :country
end
