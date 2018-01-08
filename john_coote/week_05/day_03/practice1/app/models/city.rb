# == Schema Information
#
# Table name: cities
#
#  id         :integer          not null, primary key
#  name       :text
#  population :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  country_id :integer
#

class City < ActiveRecord::Base
  belongs_to :country
end
