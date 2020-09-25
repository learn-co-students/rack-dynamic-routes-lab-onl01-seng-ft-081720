
class Application
     
        def call(env)
            resp = Rack::Response.new
            req = Rack::Request.new(env)
        
        


            if !req.path.match(/items/)
                resp.write "Route not found"
                resp.status = 404
            else

                item_title = req.path.split("/items/").last #turn /songs/Sorry into Sorry
                item = @@items.find{|i| i.name == item_title}
                if item.nil?
                    resp.write "Item not found"
                    resp.status = 400
                else
                    resp.write item.price
                end
            end

            resp.finish
          end

end
