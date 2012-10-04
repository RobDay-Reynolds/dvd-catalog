class Director < ActiveRecord::Base
  attr_accessible :date_of_birth, :gender, :name

  has_many :dvds
end
