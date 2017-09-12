task :sec_to_company => [:environment] do
	@securities = Security.all
	@securities.each do |holding|
		if holding.cusip.nil?
			cusip = ""
		else
			cusip = holding.cusip[0,6]
		end
		name = holding.name
		ticker = holding.ticker
		c = Company.find_by("cusip = ?", cusip)
		if c.nil?
			puts "New Company"
			com = Company.create(cusip: cusip, name: name, ticker: ticker)
			# this is wrong and had to be fixed:
			holding.update_attributes(company_id: com.id)
		else
			puts "Not a new company"
		end
	end
end