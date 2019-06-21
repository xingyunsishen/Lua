print("在Lua中连接两个字符串，可以使用操作符'..'(两个点)。如果其任意一个操作")
print("数是数字的话，Lua会将这个数字转换成字符串。注意，连接操作符只会创建一")
print("个新字符串，而不会改变原操作数。也可以使用string库函数string.format连")
print("接字符串")
print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
print("hello".."world")
print(0 .. 1)
str1 = string.format("%s-%s","hello","world")
print(str1)

str2 = string.format("%d-%s-%.2f",123,"world",1.21)
print(str2)
print("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++")
print("由于Lua字符串本质上是只读的，因此字符串连接运算符几乎总会创建一个新的")
print("(更大的)字符串。这意味着如果有很多这样的连接操作(比如在循环中使用..来")
print("拼接最终结果),则性能损耗会非常大。在这种情况下，推荐使用table和")
print("table.concat()来进行很多字符串的拼接，如：")
--local pieces = {}
--for i, elem in ipairs(my_list) do
--	pieces[i] = my_process(elem)
--end
--local res = table.concat(pieces)
print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
print("当然，上面的例子还可以使用LuaJIT独有的table.new来恰当的初始化pieces表的")
print("空间，以避免该表的动态生长。这个特性我们在后面还会详细讨论")


