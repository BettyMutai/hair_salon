require("spec_helper")

describe(Stylist) do
  describe(".all") do
    it("is emty at first") do
      expect(Stylist.all()).to(eq([]))
    end
  end
  describe("#save") do
    it("adds a stylist to the array of saved stylists") do
      stylist = Stylist.new({:stylist_name => "George", :id => nil})
      stylist.save()
      expect(Stylist.all()).to(eq([stylist]))
    end
  end
  describe("#name") do
    it("returns the name of a stylist") do
      stylist = Stylist.new({:stylist_name => "George", :id => nil})
      expect(stylist.stylist_name()).to(eq("George"))
    end
  end
  describe("#id") do
    it("sets its ID when you save it") do
      stylist = Stylist.new({:stylist_name => "George", :id => nil})
      stylist.save()
      expect(stylist.id()).to(be_an_instance_of(Fixnum))
    end
  end
  describe("#==") do
    it("is the same stylist if they have the same name") do
      stylist1 = Stylist.new({:stylist_name => "George", :id => nil})
      stylist2 = Stylist.new({:stylist_name => "George", :id => nil})
      expect(stylist1).to(eq(stylist2))
    end
  end
  describe(".find") do
    it("returns a stylist by their name") do
      test_stylist = Stylist.new({:stylist_name => "George", :id => nil})
      test_stylist.save()
      test_stylist2 = Stylist.new({:stylist_name => "George", :id => nil})
      test_stylist2.save()
      expect(Stylist.find(test_stylist2.id())).to(eq(test_stylist2))
    end
  end
  describe("#clients") do
    it("returns an array of clients for a specific stylist") do
      test_stylist = Stylist.new({:stylist_name => "George", :id => nil})
      test_stylist.save()
      test_client = Client.new({:client_name => "Paul", :contact => "0722456283", :stylist_id => test_stylist.id()})
      test_client.save()
      test_client2 = Client.new({:client_name => "Betty", :contact => "072256283", :stylist_id => test_stylist.id()})
      test_client2.save()
      expect(test_stylist.clients()).to(eq([test_client,test_client2]))
    end
  end
  describe("#update") do
    it("lets the salon update stylists in the database") do
      stylist = Stylist.new({:stylist_name => "George", :id => nil})
      stylist.save()
      stylist.update({:stylist_name => "Chris"})
      expect(stylist.stylist_name()).to(eq("Chris"))
    end
  end
  describe("#delete") do
    it("lets you delete a stylist from the database") do
      stylist = Stylist.new({:stylist_name => "George", :id => nil})
      stylist.save()
      stylist2 = Stylist.new({:stylist_name => "Chris", :id => nil})
      stylist2.save()
      stylist.delete()
      expect(Stylist.all()).to(eq([stylist2]))
    end
    it("deletes a stylist's clients from the database") do
      stylist = Stylist.new({:stylist_name => "George", :id => nil})
      stylist.save()
      client = Client.new({:client_name => "Paul", :contact => "0722456283", :stylist_id => stylist.id()})
      client.save()
      client2 = Client.new({:client_name => "Sam", :contact => "0755665566", :stylist_id => stylist.id()})
      client2.save()
      stylist.delete()
      expect(Client.all()).to(eq([]))
    end
  end
end
