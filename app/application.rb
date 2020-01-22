class Application 
  
  @@items = [Item.new("Oranges", 4.50)]
  
  def call(env)
    resp = Rack::Response.new 
    req = Rack::Request.new(env) 
    
    if req.path.match(/items/)
      item_requested = req.path.split("/items/").last
      
      if item =@@items.find{|i| i.name ==item_requested}
        resp.write item.price 
      else 
        resp.write "Item not found"
        resp.status = 400
      end 
    else 
      resp.write "Route not found"
      resp.status = 404
    end 
    resp.finish
  end 
  
end 