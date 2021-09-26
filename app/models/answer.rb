class Answer < ActiveRecord::Base
  has_many :answerings, :dependent => :destroy
  has_many :tasks, through: :answerings
end
