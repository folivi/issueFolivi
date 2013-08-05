class CellsLayout < PM::TableViewCell
  include PM::TableViewCellModule
  def layoutSubviews
    super
    self.textLabel.textColor = UIColor.redColor
    self.textLabel.font = UIFont.fontWithName("Arial", size:13)    
    self
  end  
end