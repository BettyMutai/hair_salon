require("spec_helper")

describe(Stylist) do
  describe(".all") do
    it("is emty at first") do
      expect(Stylist.all()).to(eq([]))
    end
  end
  describe("#save") do
    it("adds a stylist to the array of saved stylists") do
      stylist = Stylist.new({:name => "George", :id => nil})
      stylist.save()
      expect(Stylist.all()).to(eq([stylist]))
    end
  end
  describe("#name") do
    it("returns the name of a stylist") do
      stylist = Stylist.new({:name => "George", :id => nil})
      expect(stylist.name()).to(eq("George"))
    end
  end
  describe("#id") do
    it("sets its ID when you save it") do
      stylist = Stylist.new({:name => "George", :id => nil})
      expect(stylist.id()).to(eq(be_an_instance_of(Fixnum)))
    end
  end
  describe("#==") do
    it("is the same stylist if they have the same name") do
      stylist1 = Stylist.new({:name => "George", :id => nil})
      stylist2 = Stylist.new({:name => "George", :id => nil})
      expect(stylist1).to(eq(stylist2))
    end
  end
  describe(".find") do
    it("returns a stylist by their name") do
      test_stylist = Stylist.new({:name => "George", :id => nil})
      test_stylist.save()
      test_stylist2 = Stylist.new({:name => "George", :id => nil})
      test_stylist2.save()
      expect(Stylist.find(test_stylist2.id())).to(eq(test_stylist2))
    end
  end
end
