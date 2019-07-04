local account = require("account")

local a = account:new()
a:deposit(100)

local b = account:new()
b:deposit(50)

print(a.balance)
print(b.balance)
--上面这段代码"setmetatable({balance = balance, mt})",其中mt代表
--{ __index = _M},这句花值得注意。根据我们在元表这一章学到的知识、我们
--明白，setmetatable将_M作为新建表的原型，所以在自己的表内找不到'deposit'
--、'withdraw'这些方法和变量的时候，便会到__index所指定的_M类型中取寻找。

