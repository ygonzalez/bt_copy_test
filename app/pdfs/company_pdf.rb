class CompanyPdf < Prawn::Document
  def initialize(company, view, total)
    super(top_margin: 70)
    @company = company
    @view = view 
    @total = total
    company_name
    line_items
    total_price
  end

  def company_name
    text "#{@company.name}", size: 20, style: :bold, color: "0000FF"
    horizontal_line 200, 500, :at => 150
  end


  def line_items
    move_down 20
    table line_item_rows do
    	row(0).font_style = :bold
    	columns(1..3).align = :right
    	self.row_colors = ["DDDDDD", "FFFFFF"]
    	self.header = true
    end
  end
  
  def line_item_rows
    [["Plan", "Manager", "Shares", "Market Value"]] +
    @company.securities("name asc").map do |pm|
      [pm.account.plan.name, pm.account.manager.man_name, pm.shares, price(pm.market_value)]
    end
  end

  def price(num)
    @view.number_to_currency(num)
  end

  def total_price
  	move_down 15
  	text "Total Market Value: #{price(@total)}", size: 16, style: :bold
	end

end