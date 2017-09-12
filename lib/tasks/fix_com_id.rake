task :fix_company => [:environment] do
	@securities = Security.all
	@securities.each do |security|
		if security.cusip.present?
			cusip = security.cusip[0,6]
			c = Company.find_by("cusip = ?", cusip)
		end
		if c.present?
			puts c.name
			security.update_attributes(company_id: c.id)
		end
	end
end