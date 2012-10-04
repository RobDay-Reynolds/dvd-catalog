class Dvd < ActiveRecord::Base
  attr_accessible :amazon_id, :name, :release_date, :summary, :director_id

  validates :name, :presence => true
  validates :summary, :presence => true
  validates_uniqueness_of :name

  has_and_belongs_to_many :actors
  has_one :director
  
  def self.search_name(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end
  
  def self.search_actor(search)
    if search
      find(:all, :conditions => ["id IN (SELECT dvd_id FROM actors_dvds WHERE actor_id = ?)", search])
    else
      find(:all)
    end
  end
  
  def self.search_director(search)
    if search
      find(:all, :conditions => ['director_id = ?', search])
    else
      find(:all)
    end
  end
end
