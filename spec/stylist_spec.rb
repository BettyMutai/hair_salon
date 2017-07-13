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
end
