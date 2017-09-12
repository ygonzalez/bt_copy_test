class CustodianPdf < Prawn::Document
  def initialize(custodian, view, total)
    super(top_margin: 70)
    @custodian = custodian
    @view = view 
    @total = total
    custodian_name
    line_items
    total_price
  end

  def custodian_name
    text "#{@custodian.name}", size: 20, style: :bold, color: "0000FF"
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
    [["Plan", "Market Value"]] +
    @custodian.plans("name asc").map do |pm|
      [pm.name, price(pm.total)]
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