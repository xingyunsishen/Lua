print("优先级由高到低")
print(" ^ ")
print(" not # -")
print(" * / % ")
print(" + - ")
print(" .. ")
print(" < > <= >= == ~= ")
print(" and ")
print(" or ")

local a, b = 1, 2
local x, y = 3, 4
local i = 10
local res = 0
res = a + i < b/2 + 1		--等价于 res = (a+i) < ((b/2) + 1)
res = 5 + x^2*8				--等价于 res = 5 + ((x^2) * 8)
res = a < y and y <= x		--等价于 res = (a < y) and (y <= x)

print("若确定某些操作符的优先级，就应显示地用括号来指定运算顺序。这样做还可")
print("以提高代码的可读性")

