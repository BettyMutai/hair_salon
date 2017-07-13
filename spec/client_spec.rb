require("spec_helper")

describe(Client) do
  describe(".all") do
    it("is empty at first") do
      expect(Client.all()).to(eq([]))
    end
  end
  describe("#save") do
    it("adds a client to the array of saved clients") do
      test_client = Client.new({:name => "Paul", :contact => "0722456283", :stylist_id => 1})
      test_client.save()
      expect(Client.all()).to(eq([test_client]))
    end
  end
  describe("#name") do
    it("lets you see the name of a client") do
      test_client = Client.new({:name => "Paul", :contact => "0722456283", :stylist_id => 1})
      expect(test_client.name()).to(eq("Paul"))
    end
  end
  describe("#contact") do
    it("lets you see the contact of a client") do
      test_client = Client.new({:name => "Paul", :contact => "0722456283", :stylist_id => 1})
      expect(test_client.contact()).to(eq("0722456283"))
    end
  end
  describe("#stylist_id") do
    it("lets you see the stylist id") do
      test_client = Client.new({:name => "Paul", :contact => "0722456283", :stylist_id => 1})
      expect(test_client.stylist_id()).to(eq(1))
    end
  end

end
