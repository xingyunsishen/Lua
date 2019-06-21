print("and --> 逻辑与")
print("or --> 逻辑或")
print("not --> 逻辑非")
print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
print("Lua中的and和or时不同于C语言的。在C语言中，and和or只得到两个值1和0，其中")
print("1表示真，0表示假。而Lua中and的执行过程时这样的:")
print("a and b 如果a为nil，则返回a，否则返回b")
print("a or b 如果a为nil，则返回b,否则返回a")
print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
local c = nil
local d = 0
local e = 100
print(c and d)
print(c and e)
print(d and e)
print(c or d)
print(c or e)
print(not c)
print(not d)

print("注意，所有逻辑操作符false和nil视作假，其他任何值视为真，对于and和or")
print("‘短路求值’，对于not，永远只返回true或者false")

