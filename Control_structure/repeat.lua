print("Lua中的repeat控制结构类似于其他语言(如:C++)中的do-while,但是控制方式")
print("刚好相反。即执行repeat循环体后，直到until的条件为真时才结束；而其他语言")
print("(如:C++)的do-while则是当条件为假时就结束循环")

print("下面是死循环实例")
x = 10
repeat 
	print(x)
until false

