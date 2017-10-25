class Account < ActiveRecord::Base
	belongs_to :plan
	belongs_to :manager
	has_many :securities


	def total
		total = self.sum(:market_value)
	end

	def self.active
		where(active: true).order("year desc")
	end

end
