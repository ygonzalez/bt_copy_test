class Plan < ActiveRecord::Base
	has_many :accounts


	def self.search(query)
  		where("name ilike ?", "%#{query}%") 
	end

	def total
		total = self.accounts.sum(:market_value)
	end


end
