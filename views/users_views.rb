module UsersViews
  def user_show_view(user)
    puts "Name: #{user["name"]}"
    puts "Username: #{user["username"]}"
    puts "Bio: #{user["bio"]}"
    puts "Sympols: #{user["sympols"]}"
  end
end