class Client
  attr_reader(:client_name, :stylist_id, :id)

  define_method(:initialize) do |attributes|
    @client_name = attributes[:client_name]
    @stylist_id = attributes[:stylist_id].to_i()
    @id = attributes[:id]
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO clients (client_name, stylist_id) VALUES ('#{@client_name}', #{@stylist_id}) RETURNING id;")
    @id = result.first()["id"].to_i()
  end

  define_method(:==) do |another_client|
    self.client_name() == another_client.client_name() && self.stylist_id() == another_client.stylist_id() && self.id() == another_client.id()
  end

  define_singleton_method(:all) do
    returned_clients = DB.exec("SELECT * FROM clients;")
    clients = []
    returned_clients.each() do |client|
      client_name = client["client_name"]
      stylist_id = client["stylist_id"]
      id = client["id"].to_i()
      clients.push(Client.new({:client_name => client_name, :stylist_id => stylist_id, :id => id}))
    end
    clients
  end

end
