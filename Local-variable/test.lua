--作用域
--局部变量的生命周期时有限的，他的作用于仅限于声明它的块(block)。一个块是
--一个控制结构的执行体、或者是一个函数的执行体再或者是一个程序块(chunk)
--.我们可以通过以下一段代码来理解下局部变量作用于的问题
x = 10
local i = 1        --程序快中的局部变量i

while i <= x do
	local x = i * 2  --while 循环体中的局部变量x
	print(x)
	i = i + 1
end

if i > 20 then 
	local x			--then中的局部变量x
	x = 20
	print(x + 2)    --如果i>20将会打印22，此处x是局部变量
else
	print(x)        --打印10，这里的x是全局变量
end

print(x)

