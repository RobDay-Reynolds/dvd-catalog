class Dvd < ActiveRecord::Base
  attr_accessible :amazon_id, :name, :release_date, :summary

  has_and_belongs_to_many :actors
  has_one :director
end
