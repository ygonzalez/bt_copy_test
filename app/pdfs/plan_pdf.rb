class PlanPdf < Prawn::Document
  def initialize(plan, view)
    super(top_margin: 70)
    @plan = plan
    @view = view 
    plan_name
    line_items
    total_price
  end

  def plan_name
    text "#{@plan.name}", size: 20, style: :bold, color: "0000FF"
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
    [["Manager", "Asset Class", "Market Value"]] +
    @plan.accounts("name asc").map do |pm|
      [pm.name, pm.asset_class, price(pm.market_value)]
    end
  end

  def price(num)
    @view.number_to_currency(num)
  end

  def total_price
  	move_down 15
  	text "Total Market Value: #{price(@plan.total)}", size: 16, style: :bold
	end

end