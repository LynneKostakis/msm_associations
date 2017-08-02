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
    validates :title, :presence => true, :uniqueness => true
    
    validates :year, numericality: true, inclusion: 1870..2050
   
    validates :duration, numericality: true, inclusion: 0..2764800, allow_blank: true 

    belongs_to :director
    has_many :characters
    has_many :actors, :through => :characters

end
