--在Lua中，我们可以使用表和函数实现面向对象。将函数和相关的数据放置于同一个表中
--就形成了一个对象
--如:（account.lua）
local _M = {}
local mt = { __index = _M}
function _M.deposit (self, v)
	self.balance = self.balance + v
end

function  _M.withdraw (self, v)
	if self.balance >  v then 
		self.balance = self.balance -v 
	else
		error("insufficient funds")
	end
end

function _M.new (self, balance)
	balance = balance or 0
	return setmetatable({balance = balance}, mt)
end

return _M

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
