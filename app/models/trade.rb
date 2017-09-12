class Trade < ActiveRecord::Base
	has_many :plans

	def self.search(query)
  		where("name ilike ?", "%#{query}%") 
	end

	def total
		total = self.plans.sum(:total)
	end

end
