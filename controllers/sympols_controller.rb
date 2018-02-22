module SympolsController
  def sympols_index_action
    response = Unirest.get("http://localhost:3000/sympols")
    sympols = response.body
    puts JSON.pretty_generate(sympols)
  end

  def name_search_action
    print "Enter a name to search by: "
    search_name = gets.chomp

    sympol_hashs = get_request("/sympols?search_name=#{search_name}")
    sympols = Sympol.convert_hashs(sympol_hashs)

    sympols_index_view(sympols)
  end 

  def origin_search_action
    print "Enter the origin to search by: "
    search_origin = gets.chomp

    sympol_hashs = get_request("/sympols?search_origin=#{search_origin}")
    sympols = Sympol.convert_hashs(sympol_hashs)

    origin_index_view(sympols)
  end   

  def description_search_action
    print "Type stuff about the sympol: "
    search_description = gets.chomp

    sympol_hashs = get_request("/sympols?search_description=#{search_description}")
    sympols = Sympol.convert_hashs(sympol_hashs)

    sympols_index_view(sympols)
  end

  def sympols_show_action
    print "Enter sympol id: "
    input_id = gets.chomp

    response = Unirest.get("http://localhost:3000/sympols/#{input_id}")
    sympol = response.body
    puts JSON.pretty_generate(sympol)
  end

  def sympols_create_action
    client_params = {}

    print "Name: "
    client_params[:name] = gets.chomp

    print "Origin: "
    client_params[:origin] = gets.chomp

    print "Description: "
    client_params[:description] = gets.chomp

    response = Unirest.post(
                            "http://localhost:3000/sympols",
                            parameters: client_params
                            )

    sympol = response.body
    puts JSON.pretty_generate(sympol)
  end


  def sympols_update_action
    print 'enter sympol id: '
    input_id = gets.chomp

    response = Unirest.get("http://localhost:3000/sympols/#{input_id}")
    sympol = response.body

    client_params = {}

    print "ID (#{sympol["id"]}): "
    client_params[:id] = gets.chomp

    print "Name (#{sympol["name"]}): "
    client_params[:name] = gets.chomp

    print "Origin (#{sympol["origin"]}): "
    client_params[:origin] = gets.chomp

    print "Description (#{sympol["description"]}): "
    client_params[:description] = gets.chomp

    client_params.delete_if { |key,value| value.empty? }

    response = Unirest.patch(
                              "http://localhost:3000/sympols/#{input_id}",
                             parameters: client_params
                            )
  end

  def sympols_destroy_action
    print "Enter sympol id: "
    input_id = gets.chomp

    response = Unirest.delete("http://localhost:3000/sympols/#{input_id}")
    data = response.body
    puts data["message"]
  end
end






































