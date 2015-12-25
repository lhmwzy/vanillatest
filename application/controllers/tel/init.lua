local tel = require "models.service.tel"

local IndexController = {}

function IndexController:index()
	local view = self:getView()
	return view:display()
end

function IndexController:search()
	ngx.req.read_body()
	local args = ngx.req.get_post_args()
	local n = tel.my_dosearch(args)
	return n
end
function IndexController:mod()
	local view = self:getView()
	return view:display()
end
function IndexController:getcontent()
	ngx.req.read_body()
	local args = ngx.req.get_post_args()
	local name=tel.getcontent(args.name)
	return name
end
function IndexController:getdep()
	ngx.req.read_body()
	local args = ngx.req.get_post_args()
	local depname=tel.getdepname(args.query)
	return depname
end
function IndexController:domod()
	ngx.req.read_body()
	local args = ngx.req.get_post_args()
	local n = tel.domodtel(args)
	return ''
end
function IndexController:add()
	local view = self:getView()
	return view:display()
end
function IndexController:doadd()
	ngx.req.read_body()
	local args = ngx.req.get_post_args()
	local n = tel.my_doaddtel(args)
	return ''
end
return IndexController
