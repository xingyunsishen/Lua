--Lua提供了一个名为require的函数用来加载模块.要加载一个模块,只需要简单的调用require "file"就可以了.file之模块所在的文件名.这个调用会返回一个由函数组成的table,并且还会定义一个包含该table的全局变量
--在Lua中创建一个模块最简单的方法是:创建一个table,并将所有需要导出的函数放入其中,最后返回这个table就可以了.相当于将导出的函数最为table的一个字段,在Lua中函数是第一类值,提供了天然的优势.
local _M = {}
local function get_name()
	return "sishen"
end

function _M.greeting()
	print("hello"..get_name())
end

return _M

