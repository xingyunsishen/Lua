print("在Lua中，函数也是一种数据类型，函数可以存储在变量中，可以通过参数传递给")
print("其他函数，还可以作为其他函数的返回值")
print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")

local function foo()
	print("in the function") --dosometing()
	local x = 10
	local y = 20 
	return x + y 

end 

local a = foo	--把函数赋给变量

print(a())

--output:
--in the function
--30

--有名函数的定义本质上时匿名函数对变量的赋值。为了说明这一点，考虑
--function foo()
--end
--等价于
--foo = function ()
--end

--类似地
--local function foo()
--等价于
--lcoal foo = function ()
--end 


