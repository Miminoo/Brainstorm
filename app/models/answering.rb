class Answering < ActiveRecord::Base
  belongs_to :task
  belongs_to :answer
end
