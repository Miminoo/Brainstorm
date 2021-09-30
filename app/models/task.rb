class Task < ActiveRecord::Base
  has_many :taggings, :dependent => :destroy
  has_many :tags, through: :taggings
  has_many :answerings, :dependent => :destroy
  has_many :answers, through: :answerings 
  belongs_to :topic
  belongs_to :user
  has_many_attached :avatar
  has_many :taskuseranswers
  
  def all_tags
    self.tags.map(&:name).join(', ')
  end

  def all_tags=(names)
    self.tags = names.split(',').map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_answers
    self.answers.map(&:name).join(', ')
  end

  def all_answers=(names)
    self.answers = names.split(',').map do |name|
      Answer.where(name: name.strip).first_or_create!
    end
  end
end
