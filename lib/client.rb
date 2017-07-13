class Client
  attr_reader(:name, :contact, :stylist_id)
  @@all_clients = []

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @contact = attributes.fetch(:contact)
    @stylist_id = attributes.fetch(:stylist_id)
  end

  define_singleton_method(:all) do
    @@all_clients
  end

  define_method(:save) do
    @@all_clients.push(self)
  end

  define_method(:==) do |another_client|
    self.name().==(another_client.name())&(self.contact().==(another_client.contact()))&(self.stylist_id().==(another_client.stylist_id()))
  end
end
