class Comment < ActiveRecord::Base
  validates :name, :body, presence: true
end
