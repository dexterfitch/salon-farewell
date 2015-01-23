class Stylist
  attr_reader(:stylist_name, :id)

  define_method(:initialize) do |attributes|
    @stylist_name = attributes[:stylist_name]
    @id = attributes[:id]
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO stylists (stylist_name) VALUES ('#{@stylist_name}') RETURNING id;")
    @id = result.first()["id"].to_i()
  end

  define_method(:clients) do
    list_clients = []
    clients = DB.exec("SELECT * FROM clients WHERE stylist_id = #{self.id()} ORDER BY client_name DESC;")
    clients.each() do |client|
      client_name = client["client_name"]
      stylist_id = client["stylist_id"].to_i()
      id = client["id"].to_i()
      list_clients.push(Client.new({:client_name => client_name, :stylist_id => stylist_id, :id => id}))
    end
    list_clients
  end

  define_method(:==) do |another_stylist|
    self.stylist_name() == another_stylist.stylist_name() && self.id() == another_stylist.id()
  end

  define_singleton_method(:all) do
    returned_stylists = DB.exec("SELECT * FROM stylists;")
    stylists = []
    returned_stylists.each() do |stylist|
      stylist_name = stylist["stylist_name"]
      id = stylist["id"].to_i()
      stylists.push(Stylist.new({:stylist_name => stylist_name, :id => id}))
    end
    stylists
  end

  define_singleton_method(:find) do |id|
    Stylist.all().each() do |stylist|
      if(stylist.id == id)
        @found_stylist = stylist
      end
    end
    @found_stylist
  end

end
