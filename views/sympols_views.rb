# require 'paint'

MARGIN = 10

module SympolsViews

  def sympols_index_view(sympols)
    sympols.each do |sympol|
      puts " " * MARGIN + "=" * 40
      sympols_show_view(sympol)
    end
  end

  def sympols_search_form
    print "Enter a name to search by: "
    gets.chomp
  end
end
