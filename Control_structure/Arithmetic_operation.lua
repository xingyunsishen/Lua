print("+ --> 加法")
print("- --> 减法")
print("* --> 乘法")
print("/ --> 除法")
print("^ --> 指数")
print("% --> 取模")
print("~~~~~~~~~~~~~~~~~")

print(1 + 2)  --output:3
print(5 / 10) --output:0.5 这是Lua不同于C语言的
print(5.0 / 10) --output: 0.5 浮点数相除的结果时浮点数
print(10 / 0) --除数不能为0，计算结果会出错
print(2 ^ 10) --output:1024 计算2的10次方

local num = 1357
print(num % 2)  --output:1
print((num % 2) == 1)  	--output:true 判断num是否为奇数
print((num % 5) == 0)	--output:false 判断num是否能被5整除

