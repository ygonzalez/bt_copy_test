require 'csv'  

task :import_securities => [:environment] do
csv_text = File.read('lib/tasks/56.csv')
csv = CSV.parse(csv_text, :headers => true)
	csv.each do |row|
		acctid = row[0]
		account = Account.find_by(acctid: acctid)
		name = row[1]
		cusip = row[2]
		shares = row[3]
		market_value = row[4]
		puts "Market Value = #{ market_value }"
		puts "Security = #{ name }"
		puts "Cusip = #{ cusip }"
		cusip6 = cusip[0,6]
		c = Company.find_by("cusip = ?", cusip6)
		if c.nil?
			Company.create(name: name, cusip: cusip6)
		end	
		com = Company.find_by("cusip = ?", cusip6)
		Security.create(account_id: account.id, cusip: cusip, name: name, shares: shares, 
			market_value: market_value, company_id: com.id)
	end
end