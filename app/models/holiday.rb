class Holiday < ActiveRecord::Base
  default_scope :order => 'date ASC'
  paginates_per 100

  attr_accessible :date, :name

  def caldat
    date.to_s.gsub(/-/," ") + ' 00 ' + name
  end
end
