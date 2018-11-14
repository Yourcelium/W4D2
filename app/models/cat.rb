# == Schema Information
#
# Table name: cats
#
#  id          :bigint(8)        not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require "action_view"
require "action_view/helpers"

class Cat < ApplicationRecord
  COLORS = %w( black white orange tabby brown silver hairless chrome )
  GENDER = %w( F M )
  include ActionView::Helpers::DateHelper
   
  validates :birth_date, presence: true 
  validates :color, presence: true 
  validates :color, inclusion: { in: COLORS, message: 'Not a valid color'}
  validates :name, presence: true 
  validates :sex, presence: true
  validates :sex, inclusion: { in: GENDER}
  validates :description, presence: true 
  
  def age
    time_ago_in_words(self.birth_date)
  end
end

