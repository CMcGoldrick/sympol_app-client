require 'paint'

MARGIN = 1

module SympolsViews

  def sympols_show_view(sympol)
    puts
    puts "Name: #{sympol.name} (Id: #{sympol.id})"
    puts 
    puts "Origin: #{sympol.origin}"
    puts
    puts "Description: #{sympol.description}"
    puts
  end

  def sympols_index_view(sympols)
    sympols.each do |sympol|
      puts " " * MARGIN + "=" * 40
      sympols_show_view(sympol)
    end
  end

  def origin_show_view(sympol)
    puts 
    puts " " * 20 + "ORIGIN: #{sympol.origin}"
    puts
    puts "name: #{sympol.name}"
    puts "#{sympol.description}"
  end

  def origin_index_view(sympols)
    sympols.each do |sympol|
      puts " " * MARGIN + "=" * 40
      origin_show_view(sympol)
    end
  end
  
  def sympols_search_form
    print "Enter a name to search by: "
    gets.chomp
  end
end




