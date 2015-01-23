require('spec_helper')

describe(Client) do
  describe("#client_name") do
    it("lets you read the client's name out") do
      client_1= Client.new({:client_name => "Rapunzel", :stylist_id => 1, :id => nil})
      expect(client_1.client_name()).to(eq("Rapunzel"))
    end
  end

  describe("#stylist_id") do
    it("lets you read the stylist's ID out") do
      client_1= Client.new({:client_name => "Rapunzel", :stylist_id => 1, :id => nil})
      expect(client_1.stylist_id()).to(eq(1))
    end
  end

  describe("#save") do
    it("lets you save a new client") do
      client_1= Client.new({:client_name => "Rapunzel", :stylist_id => 1, :id => nil})
      client_1.save()
      expect(Client.all()).to(eq([client_1]))
    end
  end

  describe("#==") do
    it("returns true when testing equality of two objects with the same values") do
      client_1= Client.new({:client_name => "Rapunzel", :stylist_id => 1, :id => nil})
      client_2= Client.new({:client_name => "Rapunzel", :stylist_id => 1, :id => nil})
      expect(client_1).to(eq(client_2))
    end
  end

  describe(".all") do
    it("returns empty at first") do
      expect(Client.all()).to(eq([]))
    end
  end

  describe(".all") do
    it("returns all clients once some have been saved") do
      client_1= Client.new({:client_name => "Rapunzel", :stylist_id => 1, :id => nil})
      client_1.save()
      client_2= Client.new({:client_name => "Medusa", :stylist_id => 1, :id => nil})
      client_2.save()
      expect(Client.all()).to(eq([client_1, client_2]))
    end
  end

end
