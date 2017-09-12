require 'csv'  

task :import_securities => [:environment] do
csv_text = File.read('lib/tasks/568.csv')
csv = CSV.parse(csv_text, :headers => true)
	csv.each do |row|
		acctid = row[0]
		account = Account.find_by(acctid: acctid)
		name = row[1]
		cusip = row[2]
		ticker = row[3]
		shares = row[4]
		market_value = row[5]
		puts "Security = #{ name }"
		Security.create(account_id: account.id, cusip: cusip, name: name, shares: shares, ticker: ticker, market_value: market_value)
	end
end