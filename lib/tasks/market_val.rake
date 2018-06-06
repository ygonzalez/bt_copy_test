task :add_market_value=> [:environment] do
	plan_id = 38
	@accounts = Account.where(plan_id: plan_id)
	@accounts.each do |account|
		puts "#{account.name}"
		total = 0
		account.securities.current.each do |security|
			total = total + security.market_value 
		end
		puts "Total for #{account.name} is #{total}"
		if total > 0
			account.update_attribute :market_value, total
		end
	end

end