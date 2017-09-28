require("sinatra")
  require("sinatra/reloader")
  also_reload("lib/**/*.rb")
  require("./lib/client")
  require("./lib/stylist")
  require("pg")

  DB = PG.connect({:dbname => "hair_salon"})

  get("/") do
    @stylists = Stylist.all()
    erb(:index)
  end

  post("/stylists") do
    stylist_name = params.fetch("stylist_name")
    stylist = Stylist.new({:stylist_name => stylist_name, :id => nil})
    stylist.save()
    @stylists = Stylist.all()
    erb(:index)
  end

  get("/stylists/:id") do
    @stylist = Stylist.find(params.fetch("id").to_i())
    erb(:stylist)
  end

  post("/clients") do
    client_name = params.fetch("client_name")
    contact = params.fetch("contact")
    stylist_id = params.fetch("stylist_id").to_i()
    client = Client.new({:client_name => client_name, :contact => contact, :stylist_id => stylist_id})
    client.save()
    @stylist = Stylist.find(stylist_id)
    erb(:stylist)
  end

  get("/stylists/:id/edit") do
    @stylist = Stylist.find(params.fetch("id").to_i())
    erb(:stylist_edit)
  end

  patch("/stylists/:id") do
    stylist_name = params.fetch("stylist_name")
    @stylist = Stylist.find(params.fetch("id").to_i())
    @stylist.update({:stylist_name => stylist_name})
    erb(:stylist)
  end

  delete("/stylists/:id") do
    @stylist = Stylist.find(params.fetch("id").to_i())
    @stylist.delete()
    @stylists = Stylist.all()
    erb(:index)
  end


  delete("/clients/:id") do
    @client = Client.find(params.fetch("id").to_i())
    @client.delete()
    @clients = Client.all()
    @stylist = Stylist.find(params.fetch('id').to_i)
    redirect('/')
  end
