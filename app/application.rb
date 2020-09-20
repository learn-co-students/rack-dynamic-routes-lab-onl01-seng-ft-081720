class Application
  @@items = [Item.new("apple", "$1.94")]
  
	  def call(env)
	    resp = Rack::Response.new
	    req = Rack::Request.new(env)
	 
	   if req.path.match(/items/)
 
      item_info = req.path.split("/songs/").last #turn /songs/Sorry into Sorry
      item = @@items.find{|s| s.name == item_info}
 
      resp.write item.price 
      
    else 
       resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end
end

