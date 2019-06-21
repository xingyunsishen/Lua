--语句break用来终止while、repeat和for三种循环的执行，并跳出当前循环体，继续执行
--当前循环之后的语句。如下示例所示
print("计算最小的x，使从1到x的所有数相加和大于100")
sum = 0
i = 1
while true do
	sum = sum + i
	if sum > 100 then 
		break
	end
	i = i + 1
end
print("The result is ".. i)
print("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++")
--return主要用于从函数库中返回结果，或者用于简单的结束一个函数的执行。关于函数返回值的细节可以参考函数的返回值(link：https://moonbingbing.gitbooks.io/openresty-best-practices/content/lua/lua/function_result.md)。return只能写在语句块的最后，一旦执行了return语句，该语句之后的所有语句都不会再执行。若要写在函数中间，则只能写在一个显示语句块内，如下
local function add(x, y)
	return x + y
	--print("add: I will return the result"..(x + y))
	--因为前面有个return，若不注释该语句，则会报错
end

local function is_positive(x)
	if x > 0 then
		return x .. "is positive"
	else
		return x .. "is non_positive"
end

--由于return只出现在前面显式的语句块，所以此语句不注释也不会报错
--但是不会被执行，此处不会产生输出
print("function end!")
end

local sum = add(10, 20)
print("The sum is"..sum)
local answer = is_positive(-10)
print(answer)
--有时候，为了调试方便，我们可以想在某个函数的中间提前return,以进行控制流的短路。此时我们可以将return放在一个do...end代码块中，例如：
local function foo()
	print("before")
	do return end
	print("after")  --这一行语句永远不会执行到
end
--goto 
--LuaJIT一开始对标的是Lua5.1但渐渐地也开始加入部分Lua5.2甚至Lua5.3的有用特性。goto就是其中一个不得不提的例子
--有了goto，我们可以实现continue的功能
for i=1, 3 do
	if i <= 2 then 
		print(i, "yes continue")
		goto continue
	end

	print(i, "no continue")
	::continue::
	print([[i'm end]])
end
print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
--goto的另一项用途，就是简化错误处理的流程。有些时候你会发现，直接goto到函数末尾统一的错误处理过程，是更为清晰的写法
local function process(input)
	print("the input is", input)
	if input < 2 then
		goto failed
	end
	--更多处理流程和goto err
	print("processing...")
	do return end
	::failed::
	print("handle error with input", input)
end
process(1)
process(3)
--link:https://moonbingbing.gitbooks.io/openresty-best-practices/content/lua/break.html

