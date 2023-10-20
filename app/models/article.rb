class Article < ApplicationRecord
  include Visible
  
  has_many :comments, dependent: :destroy

  validates :title, :body, presence: true
end
