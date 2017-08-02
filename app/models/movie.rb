# == Schema Information
#
# Table name: movies
#
#  id          :integer          not null, primary key
#  title       :string
#  year        :integer
#  duration    :integer
#  description :text
#  image_url   :string
#  director_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Movie < ApplicationRecord
    
    validates :director_id, :presence => true
    validates :title, :presence => true, :uniqueness => { :scope => :year,
    message: "should be unique in combination with year" }
    
    validates :year, numericality: {only_integer: true, :greater_than_or_equal_to => 1870, :less_than_or_equal_to => 2050} 
   
    validates :duration, numericality: {only_integer: true, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 2764800} 



end
