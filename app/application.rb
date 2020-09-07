class Application

    @@items = [Item.new("Apples",5.23), Item.new("Oranges",2.43)]

    def call(environment)
        response = Rack::Response.new
        request = Rack::Request.new(environment)

        if request.path.match(/items/)
            item_from_path = request.path.split("/items/").last
            if item =@@items.find{|i| i.name == item_from_path}
                response.write item.price
            else
                response.status =400
                response.write "Item not found"
            end
        else
            response.status = 404
            response.write "Route not found"
        end
        response.finish
    end

end