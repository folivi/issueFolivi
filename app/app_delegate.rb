class AppDelegate < PM::Delegate
  include PM::Styling
  #include MyUiModules
  def on_load(app, options)
     #open HomeScreen.new(nav_bar: true)
     set_appearance_defaults
     open HomeScreen.new(nav_bar: true)

  end
  def set_appearance_defaults
     UINavigationBar.appearance.tintColor = UIColor.redColor
   end
end