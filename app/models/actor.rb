class Actor < ActiveRecord::Base
  attr_accessible :date_of_birth, :gender, :name

  has_and_belongs_to_many :dvds
end
