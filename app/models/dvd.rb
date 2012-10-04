class Dvd < ActiveRecord::Base
  attr_accessible :amazon_id, :name, :release_date, :summary, :director_id

  has_and_belongs_to_many :actors
  has_one :director
end
