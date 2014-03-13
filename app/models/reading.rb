class Reading < ActiveRecord::Base
  include CallbackMethods
  include Scopes
  belongs_to :meeting
  has_many :users
  has_many :notes
  belongs_to :user
  #validates_uniqueness_of :title => { :message => "Podana książka już istnieje" }
end