require 'unirest'
require 'paint'

require_relative 'controllers/sympols_controller'
require_relative 'controllers/users_controller'
require_relative 'controllers/user_favorites_controller'

require_relative 'views/sympols_views'
require_relative 'views/users_views'

require_relative 'models/sympol'

class Frontend
  include SympolsController
  # include SympolTraitsController
  include UsersController
  include UserFavoritesController

  include SympolsViews
  include UsersViews

  def run
    while true
      system 'clear'

    puts 
    puts    Paint["   Welcome to SYMPOL", '#ff0000']
    puts
    puts    Paint["   symbol searching made simple", '#ff0000']
    puts "---------------------------------"
      puts "Please make a selection:"

      puts "    [signup] Signup (create a user)"
      puts "    [login]  Login "
      puts "    [logout] Logout "
      puts
      puts "    [1] See all sympols"
      puts "        [1.1] Search sympol by traits"
      puts "        [1.2] Search sympol by name"
      puts "        [1.3] Display sympols by origin" 
      puts "        [1.4] Search sympol by description"
      puts
      puts "    [2] See one sympol (detailed description)"
      puts
      puts "    [3] dispay current User profile"
      puts "    [4] edit current User profile"
      puts "    [5] add (favorite) sympol to User profile"
      puts "    [6] delete (favorite) sympol from User profile"
      puts
      puts  Paint["    [7] Add a sympol to the database", "#32CD32"]
      puts  Paint["    [8] Edit a sympol in the database", "#32CD32"]
      puts  Paint["    [9] Delete a sympol from the database", "#32CD32"]
      puts  Paint["    [10] Display all users", "#32CD32"]
      puts
      puts "    [q] Quit"

      input_option = gets.chomp
        # authentication actions
        if input_option == "signup"
         puts "Signup!"
         puts
         client_params = {}

         print "Name: "
         client_params[:name] = gets.chomp
         
         print "User Name: "
         client_params[:username] = gets.chomp
         
         print "Email: "
         client_params[:email] = gets.chomp

         print "Password: "
         client_params[:password] = gets.chomp
         
         print "Password confirmation: "
         client_params[:password_confirmation] = gets.chomp
         
         response = Unirest.post("http://localhost:3000/users", parameters: client_params)
         puts JSON.pretty_generate(response.body)

        elsif input_option == "login"
          puts "Login"
          puts
          print "Email: "
          input_email = gets.chomp
          print "Password: "
          input_password = gets.chomp

          response = Unirest.post(
                                  "http://localhost:3000/user_token", 
                                  parameters: {
                                                auth: {email: input_email, password: input_password}
                                              }
                                  )
          puts JSON.pretty_generate(response.body) #optional

          jwt = response.body["jwt"]
          Unirest.default_header("Authorization", "Bearer #{jwt}")  

        elsif input_option == "logout"
          jwt = ""
          Unirest.clear_default_headers

        # browsing actions
          elsif input_option == "1"
          sympols_index_action
          elsif input_option == "1.1"
            trait_search_action
          elsif input_option == "1.2"
            name_search_action
          elsif input_option == "1.3"
            origin_search_action
          elsif input_option == "1.4"
            description_search_action
        
        elsif input_option == "2"
          sympols_show_action

        elsif input_option == "3"
          current_user_show_action 
        elsif input_option == "4"
          current_user_update_action
        elsif input_option == "5"
          favorite_create_action  

        elsif input_option == "7"
          sympols_create_action
        elsif input_option == "8"
          sympols_update_action
        elsif input_option == "9"
          sympols_destroy_action
        elsif input_option == "10"
          user_index_action
        elsif input_option == "11"
          user_show_action


        elsif input_option == "q"
          puts
          puts Paint["thank you for visiting SYMPOL", '#ffff00']
          exit       
        end
        gets
      end
  end

  private 
  def get_request(url, parameters={})
    Unirest.get("http://localhost:3000/#{url}", parameters: parameters).body
  end
end








