prawn_document(:page_layout => :landscape) do |pdf|
  pdf.text "Hello World"
  pdf.move_down 20

  pdf.text "Goodnight World"

  pdf.stroke_horizontal_rule
  pdf.pad(20) { pdf.text "Text padded both before and after." }
  pdf.stroke_horizontal_rule
  pdf.pad_top(20) { pdf.text "Text padded on the top." }
  pdf.stroke_horizontal_rule

  pdf.float do
    pdf.move_down 30
    pdf.bounding_box([0, pdf.cursor], :width => 200) do
      pdf.text "Text written inside the float block."
      pdf.stroke_bounds
    end
  end

  pdf.move_down 100

  pdf.table(@users.collect{ |u| [u.id, u.name, u.email, u.created_at.to_s] })
end