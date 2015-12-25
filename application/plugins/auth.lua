local auth = require('vanilla.v.plugin'):new()

function auth:routerStartup(request, response)
	local res=ngx.location.capture("/getauth")
	if ngx.re.match(res.body,"1") then
		return
	end
	ngx.header.WWW_Authenticate=[[Basic realm="Top Secret"]]
	ngx.exit(401)
end

function auth:routerShutdown(request, response)
end

function auth:dispatchLoopStartup(request, response)
end

function auth:preDispatch(request, response)
end

function auth:postDispatch(request, response)
end

function auth:dispatchLoopShutdown(request, response)
end

return auth
