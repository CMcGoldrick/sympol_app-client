require 'unirest'
require_relative 'controllers/sympols_controller'
# require_relative 'views/sympols_views'
# require_relative 'models/sympol'

class Frontend
  include SympolsController

  def run
    puts "Welcome to SYMPOL"
    puts "symbol searching simply made easy"
    puts "---------------------------------"
      puts "Please make a selection"
      puts
      puts "    [1] See all symbols"
      # puts "        [1.1] Search sympol by traits
      puts "        [1.2] Search sympol by name"
      # puts "        [1.3] Display sympol by origin
      # puts "        [1.4] Search sympol by text
      # puts "        [1.5] Show sympol by category"
      puts "    [2] See one sympol"
      puts "    [3] Create a new sympol"
      puts "    [4] Update a sympol"
      puts "    [5] Destroy a sympol"

      input_option = gets.chomp

        if input_option == "1"
          sympols_index_action

        elsif input_option == "1.2"
          sympols_search_action

        elsif input_option == "2"
          sympols_show_action
        elsif input_option == "3"
          sympols_create_action
        elsif input_option == "4"
          sympols_update_action
        elsif input_option == "5"
          sympols_destroy_action
        end
  end
end








