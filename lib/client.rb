class Client
  attr_reader(:client_name, :contact, :stylist_id)

  define_method(:initialize) do |attributes|
    @client_name = attributes.fetch(:client_name)
    @contact = attributes.fetch(:contact)
    @stylist_id = attributes.fetch(:stylist_id).to_i
  end

  define_singleton_method(:all) do
    returned_clients = DB.exec("SELECT * FROM clients;")
    clients = []
    returned_clients.each() do |client|
      client_name = client.fetch("client_name")
      contact = client.fetch ("contact")
      stylist_id = client.fetch("stylist_id").to_i()
      id = client.fetch("id").to_i()
      clients.push(Client.new({:client_name => client_name, :contact => contact, :stylist_id => stylist_id, :id => id}))
    end
    clients
  end

  define_method(:save) do
    new_client = DB.exec("INSERT INTO clients (client_name, contact, stylist_id) VALUES ('#{@client_name}', '#{@contact}', #{@stylist_id}) RETURNING id;")
    @id = new_client.first.fetch('id').to_i
  end

  define_method(:==) do |another_client|
    self.client_name().==(another_client.client_name())&(self.contact().==(another_client.contact()))&(self.stylist_id().==(another_client.stylist_id()))&(self.id().==(another_client.id()))
  end

  define_singleton_method(:find) do |id|
    found_client = nil
    Client.all().each() do |client|
      found_client = client if client.id.==(id)
    end
    found_client
  end

  #
  # define_method(:update) do |attributes|
  #   @client_name = attributes.fetch('client_name')
  #   @contact = attributes.fetch('contact')
  #   @id = id
  #   @stylist_id = attributes.fetch('stylist_id')
  #   DB.exec("UPDATE clients SET name = '#{@client_name}','#{@contact}', stylist_id=#{@stylist_id} WHERE id = #{@id};")
  # end
  #
  # define_method(:delete) do
  #   DB.exec("DELETE FROM clients WHERE id = #{id};")
  # end
end
