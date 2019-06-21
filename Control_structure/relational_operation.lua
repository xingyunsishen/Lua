print("\n")
print("**********************************")
print("< --> 小于")
print("> --> 大于")
print(">= --> 小于等于")
print("<= --> 大于等于")
print("~= --> 不等于")
print("***********************************")

print(1 < 2) 	--打印true
print(1 == 2)	--打印false
print(1 ~= 2) 	--打印true
local a, b = true, false
print(a == b) 	--打印 false

print("在使用‘==’做等于判断时，要注意对于table，userdate和函数，Lua时作引用比")
print("较的。也就是说，只有当两个变量引用同一个对象时，才认为它们相等。可以看")
print("例子")

local a = { x = 1, y = 0}
local b = { x = 1, y = 0}
if a ==b then 
	print("a==b")
else
	print("a~=b")
end

print("由于Lua字符串总是会被‘内化’，即相同内容的字符串只会被保存一份，因此Lua")
print("字符串之间的相等性比较可以简化为其内部存储地址的比较。这意味着Lua字符串")print("的相等性比较总是为O(1).而其他编程语言中，字符串的相等性比较则通常为O(n)")
print("即需要逐个字节（或按若干个连续字节）进行比较")


