class HomeScreen < PM::TableScreen
  attr_accessor :mtable_data
    @news = []
    #include MyUiModules
    title 'News'
    refreshable callback: :on_refresh,
       pull_message: "Pull to refresh",
       refreshing: "Refreshing data…",
       updated_format: "Last updated at %s",
       updated_time_format: "%l:%M %p"
    def on_refresh

      fill_table

    end

    def table_data
      @cell_data ||= []
    end 
   def on_load   
     fill_table
     #self.tableView.registerClass(CellsLayout, forCellReuseIdentifier: 'NewsCell')
   end

   def will_appear

      #Barbutton.create_bar(self)
      set_attributes self.view, {
        backgroundColor: hex_color("DBDBDB") 
      }        
    end

    def go_to_next
      App.delegate.slide_menu.show_menu    
    end

    def fill_table
      @my_cells = []
      url ="http://www.haberalkibrisli.net/testfile.php"
      BW::HTTP.get url, async:false do |response|
        json = BW::JSON.parse response.body.to_str
        for line in json
          @my_cells << { title: line["tarih"], 
                          cell_style: UITableViewCellStyleSubtitle, 
                          cell_class: CellsLayout, 
                          cell_identifier: "NewsCell", 
                          subtitle: line["baslik"], remote_image: { 
                           url: "http://www.haberalkibrisli.net/images/haberler/#{line['resim']}"}, cell_class: CellsLayout
                        }
        end
        @cell_data = [{cells: @my_cells}]
        end_refreshing
        update_table_data
      end
    end
  
end