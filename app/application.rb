require 'pry'
class Application
    # @@items
    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

    #     if req.path == '/items'
    #         resp.write "Zee price iz 3.2!"
    #         resp.status = 200
    #     else
    #         resp.write "Route not found"
    #         resp.status = 404
    #     end
    # end

        if req.path.match(/items/)
            x = req.path.split("/items/").last
            fruit = Item.items.select{|obj| obj.name == x} [0]

            if fruit
                resp.write "Zee price iz #{fruit.price}!"
                resp.status = 200
            else 
                resp.status = 400
                resp.write "Item not found"
            end
        else
            resp.status = 404
            resp.write "Route not found"
        end
        resp.finish
    end
end