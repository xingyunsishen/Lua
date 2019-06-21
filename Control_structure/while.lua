print("Lua跟其他语言一样，提供了while控制结构，语法上并没有什么特别之处。但是")
print("没有提供do-while型的控制结构，但是提供了功能相当于repeat")
print("while型控制结构语法如下，当表达式值为假(false或nil)时结束循环。也可以使")
print("break提前跳出循环")
print(" while 表达式 do")
print("--body--")
print("end")

x = 1 
sum = 0
while x <= 5 do
	sum = sum + x
	x = x + 1  
end
print(sum) 

print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
print("值得一提的是，Lua并没有像其他语言那样提供类似continue这样的控制语句用")
print("来立即进入下一个循环迭代(如果有的话)。因此，我们需要仔细地安排循环体里")
print("的分支，以避免这样的需求。")
print("没有提供continue，却也提供了另外一个标准控制语句break，可以跳出当前循环")
print("例如遍历table,查找为11的数组下标索引")
local t = {1, 3, 5, 8, 11, 18, 21}
local i
for i, v in ipairs(t) do
	if 11 == v then
		print("index[" ..i.. "] have right value[11]")
	break
	end
end

