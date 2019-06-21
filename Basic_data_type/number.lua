print("Number类型用于表示实数，\n 和C/C++里面的double类型很类似。\n 可以使用数学函数math.floor（向下取整）\n 和math.ceil（向上取整）进行取整操作 \n")
local order = 3.99
local score = 98.01
print(math.floor(order))	-->output:3
print(math.floor(score))	-->output:99
print("一般地，Lua的number类型就是用\n 双精度浮点数来实现的。\n 值得一提的是，LuaJIT支持所谓的'dualbumber'\n (双数模式),即LuaJIT会根据上下文用整型来存储整数，而双精度浮点数来存放浮点数。另外，LuaJIT还支‘长长整型’的大整数（在x86_64体系结构上则是64位整数）如：")
print(9223372036854775807LL - 1) -->output:9223372036854775806LL

