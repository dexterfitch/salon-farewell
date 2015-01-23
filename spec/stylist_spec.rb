require('spec_helper')

describe(Stylist) do
  describe("#stylist_name") do
    it("lets you read the stylist's name out") do
      stylist_1= Stylist.new({:stylist_name => "Atropos", :id => nil})
      expect(stylist_1.stylist_name()).to(eq("Atropos"))
    end
  end

  describe("#save") do
    it("lets you save a new stylist") do
      stylist_1= Stylist.new({:stylist_name => "Atropos", :id => nil})
      stylist_1.save()
      expect(Stylist.all()).to(eq([stylist_1]))
    end
  end

  describe("#clients") do
    it("returns an array of clients for the specified stylist") do
      stylist_1= Stylist.new({:stylist_name => "Atropos", :id => nil})
      stylist_1.save()
      client_1= Client.new({:client_name => "Rapunzel", :stylist_id => stylist_1.id(), :id => nil})
      client_1.save()
      client_2= Client.new({:client_name => "Medusa", :stylist_id => stylist_1.id(), :id => nil})
      client_2.save()
      expect(stylist_1.clients()).to(eq([client_1, client_2]))
    end
  end

  describe("#==") do
    it("returns true when testing equality of two objects with the same values") do
      stylist_1= Stylist.new({:stylist_name => "Atropos", :id => nil})
      stylist_2= Stylist.new({:stylist_name => "Atropos", :id => nil})
      expect(stylist_1).to(eq(stylist_2))
    end
  end

  describe(".all") do
    it("returns empty at first") do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe(".all") do
    it("returns all stylists once some have been saved") do
      stylist_1= Stylist.new({:stylist_name => "Atropos", :id => nil})
      stylist_1.save()
      stylist_2= Stylist.new({:stylist_name => "Delilah", :id => nil})
      stylist_2.save()
      expect(Stylist.all()).to(eq([stylist_1, stylist_2]))
    end
  end

  describe(".find") do
    it("returns a stylist by their ID number") do
      stylist_1= Stylist.new({:stylist_name => "Atropos", :id => nil})
      stylist_1.save()
      stylist_2= Stylist.new({:stylist_name => "Delilah", :id => nil})
      stylist_2.save()
      expect(Stylist.find(stylist_2.id())).to(eq(stylist_2))
    end
  end
end
