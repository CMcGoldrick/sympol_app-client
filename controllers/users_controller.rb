module UsersController
  def user_index_action
    response = Unirest.get("http://localhost:3000/users")

    users = response.body
    puts JSON.pretty_generate(users)
  end

  def current_user_show_action
    user = Unirest.get("http://localhost:3000/user/1").body

    user_show_view(user)
  end

  def current_user_update_action
    user = Unirest.get("http://localhost:3000/user/1").body

    client_params = {}

    print "Name (#{user["name"]}): "
    client_params[:name] = gets.chomp

    print "Bio (#{user["bio"]}): "
    client_params[:bio] = gets.chomp
 
    client_params.delete_if { |key,value| value.empty? }

    response = Unirest.patch(
                             "http://localhost:3000/user/1",
                             parameters: client_params 
                             )
  end
end
