class Sympol
  attr_accessor :id, :name, :origin, :description

  def initialize(input_options)
    @id = input_options["id"]
    @name = input_options["name"]
    @origin = input_options["origin"]
    @description = input_options["description"]
  end
  
  def self.convert_hashs(sympol_hashs)
    collection = []
    sympol_hashs.each do |sympol_hash|
      collection << Sympol.new(sympol_hash)
    end
    collection
  end
end


