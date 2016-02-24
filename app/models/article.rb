class Article < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	belongs_to :user
	validates :title, presence: true, length: { minimum: 4 }
	validates :content, presence: true, length: { minimum: 30}
end
