local my_module = require("module")  --调用module.lua
my_module.greeting()

--注:对于需要到处给外部使用的公共模块,出于安全考虑,是要避免全局变量的出现.我们可以使用lj-releng或luacheck工具完成全局变量的检测.
--另外,由于在LuaJIT中,require函数内不能进行上下文切换,所以不能够再模块的顶级上下文中调用cosocket一类的API.否则会报attempt to yield across C-cakk boundary错误

