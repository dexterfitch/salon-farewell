require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/client")
require("./lib/stylist")
require("pry")
require("pg")

DB = PG.connect({:dbname => "salon"})

get("/") do
  @stylists = Stylist.all()
  erb(:index)
end

post("/clients") do
  client_name = params["client_name"]
  stylist_id = params["stylist_id"].to_i()
  client = Client.new({:client_name => client_name, :stylist_id => stylist_id})
  client.save()
  @stylist = Stylist.find(stylist_id)
  erb(:stylist)
end

post("/stylists") do
  stylist_name = params["stylist_name"]
  stylist = Stylist.new({:stylist_name => stylist_name, :id => nil})
  stylist.save()
  @stylists = Stylist.all()
  erb(:index)
end

get("/stylists/:id") do
  @stylist = Stylist.find(params["id"].to_i())
  erb(:stylist)
end
