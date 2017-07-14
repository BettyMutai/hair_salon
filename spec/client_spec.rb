require("spec_helper")

describe(Client) do
  describe(".all") do
    it("is empty at first") do
      expect(Client.all()).to(eq([]))
    end
  end
  describe("#save") do
    it("adds a client to the array of saved clients") do
      test_client = Client.new({:client_name => "Paul", :contact => "0722456283", :stylist_id => 1})
      test_client.save()
      expect(Client.all()).to(eq([test_client]))
    end
  end
  describe("#name") do
    it("lets you see the name of a client") do
      test_client = Client.new({:client_name => "Paul", :contact => "0722456283", :stylist_id => 1})
      expect(test_client.client_name()).to(eq("Paul"))
    end
  end
  describe("#contact") do
    it("lets you see the contact of a client") do
      test_client = Client.new({:client_name => "Paul", :contact => "0722456283", :stylist_id => 1})
      expect(test_client.contact()).to(eq("0722456283"))
    end
  end
  describe("#stylist_id") do
    it("lets you see the stylist id") do
      test_client = Client.new({:client_name => "Paul", :contact => "0722456283", :stylist_id => 1})
      expect(test_client.stylist_id()).to(eq(1))
    end
  end
  describe("#==") do
    it("is the same client if they have the same name and contact") do
      client1 = Client.new({:client_name => "Paul", :contact => "0722456283", :stylist_id => 1})
      client2 = Client.new({:client_name => "Paul", :contact => "0722456283", :stylist_id => 1})
      expect(client1).to(eq(client2))
    end
  end

end
