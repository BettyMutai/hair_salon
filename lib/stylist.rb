class Stylist
  attr_reader(:name, :id)
  @@all_stylist = []

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    @@all_stylist
  end

  define_method(:save) do
    @@all_stylist.push(self)
  end

end
