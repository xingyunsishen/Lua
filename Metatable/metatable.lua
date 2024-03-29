--在Lua 5.1语言中，元表(metatable)的表现行为类似于C++语言中的操作符重载，例如
--我们可以重载"__add"元方法(metamethod),来计算连个Lua数组的并集；或者重载
--"__index"方法，来定义我们自己的Hash函数。Lua提供了两个十分重要的用来处理元表的
--方法，如下：
--1. setmetatable(table. metatable):此方法用于为一个表设置元表。
--2. getmetatable(table):此方法用于获取表的元表对象

--设置元表的方法很简单，如下：
--local mytable = {}
--local mymetatable = {}
--setmetatable(mytable, mymetatable)
--上述代码也可以简写为
--local mytable = setmetatable({}, {})
--修改表的操作符行为
--同坐重载"__add"元方法来计算集合的并集实例：
--local set1 = {10, 20, 30}    --集合
--local set2 = {20, 40, 50}    --集合
--
----将用于重载__add的函数，注意第一个参数是self
--local union = function (self, another)
--	local set = {}
--	local result = {}
--	
--	--利用数组来确保集合的互异性
--	for i, j in pairs(self) do set[j] = true end
--    for i, j in pairs(another) do set[j] = true end
--	
--	--加入结果集合
--	for i, j in pairs(set) do table.insert(result, i) end
--	return result
--end
--setmetatable(set1, {__add = union})    --重载set1表的__add元方法
--
--local set3 = set1 + set2
--for _, j in pairs(set3) do
--	io.write(j.." ") 
--end
--
--output
--20 10 30 40 50

--除了加法可以被重载之外，Lua提供的所有操作符都可以被重载：
--  元方法       含义
--"__add"        +操作
--"__sub"       -操作，其行为类似于"add"操作
--"__mul"       *操作，其行为类似于"add"操作
--"__div"       /操作，其行为类似于"add"操作
--"__mod"       %操作，其行为类似于"add"操作
--"__pow"       ^(幂)操作，其行为类似于"add"操作
--"__unm"       一元-操作
--"__concat"    (字符串连接)操作
--"__len"       #操作
--"__eq"        ==操作，函数getcomphandler定义了Lua怎样选择一个处理来做比较操作
--              仅在两个对象类型相同且有对应操作相同的元方法时才起效
--"__lt"        <操作
--"__le"        <=操作
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--除了操作符之外，如下元方法也可以被重载，下面会一次解释使用法
--  元方法        含义
-- "__index"     取下标操作用于访问table[key]
-- "__newidnex"  赋值给指定下标table[key] = value
-- "__tostring"  转换成字符串
-- "__call"      当Lua调用一个值时掉哟哦那个
-- "__mode"      用于弱表(week table)
-- "metatable"   用于保护metatable不被访问

----index元方法
----如下例子中实现了在表中查找键不存在时转而在元表中查找该键的功能
--mytable = setmetatable({key1 = "value1"}, --原始表
--	{__index = function(self, key)     --重载函数
--    if key == "key2" then
--		return "metatablevalue"
--	end
--end
--}) 
--
--print(mytable.key1, mytable.key2)
----output
----value1	metatablevalue
----关于__index元方法，有很多比较高阶的技巧，例如:__index的元方法不需要非是一个
----函数，他也可以是一个表。
--t = setmetatable({[1] = "hello"}, {__index ={ [2] = "world"}})
--print(t[1], t[2])
----第一句代码有点绕，解释：先是把{__index = {}}作为元表，但__index接受一个表，而
----不是函数，这个表中包含[2] = "world"这个键值对。所以当t[2]去在自身的表中找不到
----时，在__index的表中去寻找，然后找到了[2] = "world"这个键值对。
----__index元方法还可以实现给表中每一个值赋上默认值；和__newindex元方法联合监控对
----表的读取、修改等比较高阶的功能，后续再研究琢磨。。。
----++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
----__tostring元方法
----与Java中的tostring()函数类似，可以实现自定义的字符串转换
--arr = {1, 2, 3, 4}
--arr = setmetatable(arr, {__tostring = function (self)
--	local result = '{'
--	local sep = ''
--	for _, i in pairs(self) do
--		result = result ..sep.. i
--		sep = ','
--	end
--	result = result.. '}'
--	return result
--end})
--
--print(arr)
----__call元方法
----__call元方法的功能类似于C++中的仿函数，使得普通的表也可以被调用
--functor = {} 
--function func1(self, arg)
--	print ("called from", arg)
--end
--
--setmetatable(functor, {__call = func1})
--
--functor("functor")     --called from functor
--print(functor)
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--__metatable元方法
--假如我们想保护我们的对象使其使用者既看不到也不能修改metatables。我们可以对
--metatable设置__metatable的值，getmetatable将返回这个域的值，而调用setmetatable
--将会报错
Object = setnetatable({}, {__metatable = "You cannot access here"})

print(getmetatable(Object)) 
setmetatable(Object,{})

