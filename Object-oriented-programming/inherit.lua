--继承可以用元表实现，它提供了在父类中查找存在的方法和变量机制。在Lua中
--是不推荐使用继承方式完成构造的，这样做 引入的问题可能比解决的问题要多
--如下：
-----------------  s_base.lua
local _M = {}

local mt = { __index = _M }

function _M.upper (s)
	return string.upper(s)
end

return _M

--------------- s_more.lua
local s_base = require("s_base")

local _M = {}
_M = setmetatable(_M, { __index = s_base })

function _M.lower (s)
	return string.lower(s)
end

return _M

---------------  test.lua
local s_more = require=("s_more)

print(s_more.upper("Hello"))
print(s_more.lower("Hello"))


