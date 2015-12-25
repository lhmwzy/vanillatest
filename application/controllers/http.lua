local IndexController = {}
local s = require("vanilla.v.libs.http"):new()

function IndexController:test()
	local res = s:get("http://10.68.143.148",'GET','','',0)
	 
	return res.body 
end
return IndexController
