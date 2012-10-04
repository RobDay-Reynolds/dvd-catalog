class Actor < ActiveRecord::Base
  attr_accessible :date_of_birth, :gender, :name

  validates :name, :presence => true
  validates :gender, :presence => true
  validates_uniqueness_of :name

  has_and_belongs_to_many :dvds
 
  def age
    dob = self.date_of_birth
    if dob
      now = Time.now.utc.to_date
      @age = now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
    end
  end

  def self.search_name(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end

  def self.search_age_range(search)
    if search && search == 'over'
      now = Time.now.utc.to_date
      date = now.to_time.advance(:years => (-70)).to_date
      @conditions = ['date_of_birth < ?', date]
    elsif search
      bookends = search.split('_')
      now = Time.now.utc.to_date
      early_date = now.to_time.advance(:years => (-1 * Integer(bookends[1]))).to_date
      late_date = now.to_time.advance(:years => (-1 * Integer(bookends[0]))).to_date
      @conditions = ['date_of_birth >= ? AND date_of_birth <= ?', early_date, late_date]
    end
    
    if search
      find(:all, :conditions => @conditions)
    else
      find(:all)
    end
  end

  def self.search_dvd(search)
    if search
      find(:all, :conditions => ["id IN (SELECT actor_id FROM actors_dvds WHERE dvd_id = ?)", search])
    else
      find(:all)
    end
  end
end
