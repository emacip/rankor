class Question < ApplicationRecord
  belongs_to :user
  has_many :answers

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  after_commit on: [:create] do
    __elasticsearch__.index_document
  end

  def self.search(query)
    __elasticsearch__.search(
        {
            query: {
                multi_match: {
                    query: query,
                    fields: ['title^10', 'body']
                }
            }
        }
    )
  end

end
