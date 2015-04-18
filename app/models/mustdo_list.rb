class MustdoList < ActiveRecord::Base
	validates :title, presence: true
	validates :title, length: {minimum: 3}
	validates :category, presence: true, inclusion: {in: %w(Restaurants Cafes Books Movies Recipes Activities), message: "'%{value}' is not equal to one of the following: Restaurants, Cafes, Books, Movies, Recipes, or Activities" }
	validates :description, presence: true
	validates :description, length: {minimum: 3}
end
