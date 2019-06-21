--在Lua中，函数是一种对语句和表达式进行抽象的主要机制。函数既可以完成某项特定的任务，也可以只做一些计算并返回结果。在第一种情况中，一句函数调用被视为一条语句而在第二种情况中，则将其视为一句表达式
--使用函数的好处：
--1.降低程序的复杂性：把函数作为一个独立的模块，写完函数后，只关心它的功能，而不再考虑函数里面的细节
--2.增加程序的可读性：当我们调用math.max()函数时，很明显函数是用于求最大值的，实现细节就不关心了。
--3.避免重复代码：当程序中有相同的代码部分时，可以把这部分写成一个函数，通过调用函数来实现这部分代码的功能，节约空间，减少代码长度
--4.隐含局部变量：在函数中使用局部变量，变量的作用范围不会超出函数，这样它就不会给外界带来干扰。

--函数的定义
--Lua使用关键字function定义函数，语法如下：
--function function_name(arc)   --arc 表示参数列表，函数的参数列表可以为空
--		body
--end
--上面的语法定义了一个全局函数，名为function_name，全局函数本质上就是函数类型的值赋给了一个全局变量，即上面的语法等价于
--function_name = function(arc)
--	body
--end
--由于全局变量一般会污染全局名字空间，同时也有性能损耗（即查询全局环境的开销），因此我们应当尽量使用“全局函数”，其记法是类似的，只是开头加上的local修饰符：
--local function function_name(arc)
--	body
--end
--由于函数定义本质上就是变量赋值，而变量的定义总是应放置在变量使用之前，所以函数的定义也需要放置在函数调用之前。
--例如：
--local function max(a, b)   --定义函数max，用来求两个数的最大值，并返回
--	local temp = nil	   --使用局部变量temp，保存最大值
--	if(a > b) then
--		temp = a
--	else 
--		temp = b 
--	end
--	return temp			--返回最大值
--end
--
--local m = max(-12, 20)  --调用函数max,找出-12和20中的最大值
--print(m)
--
----如果参数列表为空，必须使用()表明是函数调用。
--local function fun()   --形参为空
--	print("no parameter")
--end
--
--fun()		--函数调用
--
----定义函数需要注意几点
----1.利用名字来解释函数、变量的目的，使人通过名字就能看出函数、变量的作用
----2.每个函数的长度要尽量控制在一个屏幕内，一眼就可以看明白
----3.函数代码尽量清楚明了，不需要注释最好
----由于函数定义等价于变量赋值，也可以把函数名替换为某个Lua表的某个字段
----如下：
----function foo.bar(a, b, c)
----body...
----end
----此时我们是把一个函数类型的值赋给了foo表的bar字段。换言之，上面的定义等价于
----foo.bar = function(a, b, c)
----	print(a, b, c)
----end
----对于此种形式的函数定义，不能再使用local修饰符了，因为不存在定义新的局部变量了。
----Lua函数的参数大部分是按值传递的。值传递就是调用函数时，实参把它的值通过赋值运算传递给形参，然后形参的改变和实参就没有关系了。在这个过程中，实参是通过它在参数表中的位置与形参匹配过来的。
--local function swap(a, b)  --定义函数swap，函数内部进行交换两个变量的值
--	local temp = a
--	a = b 
--	b = temp
--	print(a, b)
--end
--
--local x = "hello"
--local y = 20
--print(x, y)
--swap(x, y)	--调用swap函数
--print(x, y)	--调用swap函数后，x和y的值并没有交换
----在调用函数的时候，若形参个数和实参个数不同时，Lua会自动调整实参个数。图哎这部分规则：若是惨个数大于形参个数，从左向右，多余的实参被忽略；若实参个数小于形参个数，从左向右，没有被实参初始化的形参会被初始化为nil。
--local function fun1(a, b) 	--两个形参，多余的实参被忽略掉
--	print(a, b)
--end
--
--local function fun2(a, b, c, d) 	--四个形参，没有被实参初始化的形参，用nil初始化
--	print(a, b, c, d)
--end
--
--local x = 1
--local y = 2
--local z = 3
--
--fun1(x, y, z)	--z被函数fun1忽略掉了，参数变成x,y
--fun2(x, y, z)	--后面自动加上一个nil，参数变成了x, y, z, nil
----变长参数
----上面函数的参数都是固定的，其实Lua还支持变长参数。若形参为...，表示函数可以接收不同长度的参数。访问参数的时候也要使用...。
--local function func( ... ) 	--形参为...，表示函数采用变长函数
--	local temp = {...}		--访问的时候也要使用...
--	local ans = table.concat(temp, "")	--使用table.concat库函数对数组内容使用
--										--”“拼接成字符串
--	print(ans)
--end
--
--func(1, 2)		--传递了两个参数
--func(1, 2, 3, 4)	--传递了四个参数
----值得一提的是，LuaJIT2尚不能JIT编译这种变长参数的用法，只能解释执行。所以对性能敏感的代码，应当避免使用此种形式
----具名参数
----Lua还支持童工名称来指定实参，这时候要把所有的实参数组织到一个table中，并将这个table作为唯一的实参传递给函数
--local function change(arg)	--change函数，改变长方形的长和宽，使其各增长一倍
--	arg.width = arg.width * 2
--	arg.height = arg.height * 2
--	return arg
--end
--
--local rectangle = { width = 20, height = 15 }
--print("before change:", "width =", rectangle.width,
--	 "height =", rectangle.height)
--rectangle = change(rectangle)
--print("after change:", "width =", rectangle.width,
--	 "height =", rectangle.height)
----当函数参数是table类型时,传递进来得是实际参数得引用,此时在函数内部对该table所做的修改,会直接对调用者所传递的实际参数生效,而无需自己返回结果和让调用者进行赋值.我们把上面改变长方形长和宽的例子稍加修改.
--function change(arg)	--change函数,改变长方形长和宽,使其各增长一倍
--	arg.width = arg.width * 2	--表arg不是表rectangle的拷贝,他们是同一个表
--	arg.height = arg.height * 2
--end						--没有return语句了
--
--local rectangle = { width = 20, height = 15 }
--print("before change:", "width = ", rectangle.width,
--	 "height = ", rectangle.height)
--
--change(rectangle)
--print("after change:", "width = ", rectangle.width,
--	 "height = ", rectangle.height)
----在常用基本类型中,除了table是按址传递类型外,其他的都是按值传递参数.用全局变量来代替函数参数的坏习惯应该被抵制,良好的变成习惯应该是减少全局变量的使用.
----+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
----函数的返回值
----Lua具有一项与众不同的特性,允许函数返回多个值.Lua的库函数中,有一些就是返回多个值.
----如下(使用库函数string.find,在源字符中查找目标字符串,若查找成功,则返回目标字符串在源字符中的起始位置和结束位置的下标)
--local s, e = string.find("hello world", "llo")
--print("llo 在字符串'hello world'中的开始位置是:", s, "结束位置是:", e)
----返回多个值时,值之间使用","隔开
----如下(定义一个函数,实现两个变量的交换值)
--local function swap(a, b)	--定义函数swap,实现两个变量交换值
--	return b, a				--按相反顺序返回变量的值
--end
--
--local x = 1
--local y = 3
--x , y = swap(x, y) 	--调用swap函数
--print(x, y)
----当函数返回值的个数和接收返回值的变量个数不一致时,Lua也会自动调整参数个数.调整规则:若返回值个数大于接收变量的个数,多余的返回值会被忽略掉;若返回值个数小于参数个数,从左向右,没有被返回值初始化的变量会被初始化为nil.
--function init()		--init函数,返回两个值1和"Lua"
--	return 1, "Lua"
--end
--
--x = init()
--print(x)
--
--x, y, z = init()
--print(x, y, z)
----当一个函数有一个以上返回值,且函数调用不是一个列表表达式的最后一个元素,那么函数调用只会产生一个返回值,也就是第一个返回值.
----如下:
--local function init()		--init函数返回两个值1和"lua"
--	return 1, "lua"
--end
--
--local x, y, z = init(), 2 	--init函数的位置不在最后,此时只返回1
--print(x, y, z)	
--
--local a, b, c = 2, init()	--init函数的位置在最后,此时返回1和"lua"
--print(a, b, c)
----函数调用的实参列表也是一个列表表达式.如下:
--local function init()
--	return 1, "lua"
--end
--
--print(init(), 2)
--print(2, init())
----如果你确保只取函数返回值的第一个值,可以使用括号运算符,如下:
--local function init()
--	return 1, "lua"
--end
--
--print((init()), 2)
--print(2, (init()))

--值得一提的是,如果实参列表中某个函数会返回多个值,同时调用者有没有显式地使用括号运算符来筛选和过滤,则这样的表达式是不会被LuaJIT2所JIT编译的,而只能被解释执行.
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--全动态函数调用
--local args = {...} or {}
--method_name(unpack(args, 1, table.maxn(args)))
--使用场景
--method_name(unpack(args))
--你要调用的函数参数是未知的;
--函数的实际参数的类型和数目也都是未知的.
--伪代码表示如下
--add_task(end_time, callback, parms)

--if os.time() >= endTime then
--	callback(unpack(arams, 1, table.maxn(params)))
--end
--值得一提的是,unpack内建函数还不能为LuaJIT所JIT编译,因此这种用法总是会被解释执行.对性能敏感的代码路径应避免这种用法
--牛刀小试
local function run(x, y)
	print('run', x, y)
end

local function attack(targetId)
	print('targetId', targetId)
end

local function do_action(method, ...)
	local args = {...} or {}
	method(unpack(args, 1, table.maxn(args)))
end

do_action(run, 1, 2)
do_action(attack, 111)



































