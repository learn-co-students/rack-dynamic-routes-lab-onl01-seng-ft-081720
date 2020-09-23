class Application

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match(/items/)
            item_requested = req.path.split("/items/").last
            if Item.all.any? {|i| i.name == item_requested}
                item_price = Item.all.find { |item| item.name == item_requested }.price
                resp.write item_price
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