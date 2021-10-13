class Task < ActiveRecord::Base
  has_many :taggings, :dependent => :destroy
  has_many :tags, through: :taggings
  has_many :answerings, :dependent => :destroy
  has_many :answers, through: :answerings 
  belongs_to :topic
  belongs_to :user
  has_many_attached :avatar
  has_many :taskuseranswers, :dependent => :destroy
  has_many :ratings, :dependent => :destroy

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  searchkick

  mappings do
    indexes :name,  analyzer: 'english'
    indexes :condition,  analyzer: 'english'
  end

  def self.search(query)
    __elasticsearch__.search(
      {
        query: {
          multi_match: {
            query: query,
            fields: ['name', 'condition']
          }
        },
        highlight: {
          pre_tags: ['<em>'],
          post_tags: ['</em>'],
          fields: {
            name: {},
            condition: {},
          }
        }
      }
    )
  end

  def all_answers
    self.answers.map(&:name).join(',')
  end

  def all_answers=(names)
    self.answers = names.split(',').map do |name|
      Answer.where(name: name.strip).first_or_create!
    end
  end
end
