require 'unirest'
require_relative 'controllers/sympols_controller'
require_relative 'views/sympols_views'
require_relative 'models/sympol'

class Frontend
  include SympolsController
  include SympolsViews

  def run
    puts "Welcome to SYMPOL"
    puts "symbol searching simply made easy"
    puts "---------------------------------"
      puts "Please make a selection"
      puts
      puts "    [1] See all sympols"
      # puts "        [1.1] Search sympol by traits"
      puts "        [1.2] Search sympol by name"
      puts "        [1.3] Display sympols by origin" 
      puts "        [1.4] Search sympol by description"
      puts
      puts "    [2] See one sympol"
      puts
      puts "    [3] add sympol to User Favorite"
      puts "    [4] delete sympol from User Favorite"
      puts
      puts "    [signup] Signup (create a user)"
      puts "    [login]  Login (create a JSON web token)"
      puts "    [logout] Logout (erase the JSON web token)"
      puts "    [q] Quit"

      input_option = gets.chomp

        if input_option == "1"
          sympols_index_action
          # elsif input_option == "1.1"
          #   trait_search_action
          elsif input_option == "1.2"
            name_search_action
          elsif input_option == "1.3"
            origin_search_action
          elsif input_option == "1.4"
            description_search_action
        
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

  private 
  def get_request(url, parameters={})
    Unirest.get("http://localhost:3000/#{url}", parameters: parameters).body
  end
end








