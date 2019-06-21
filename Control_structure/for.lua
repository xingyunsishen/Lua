print("Lua提供了一组传统的、小巧的控制结构，包括用于条件判断的if用于迭代的")
print("while、repeat和for")
print("for数字型")
print("for语句有两种形式:数字for(numberic for)和for(generic for)")
print("for var = begin, finish, step do") 
print("	--body")
print("end")

print("关于数字for需要关注以下几点:1.var 从begin变化到finish，每次变化都以step")
print("作为步长递增var 2.begin、finish、step三个表达式只会在循环开始时执行一次")
print("3.第三个表达式step是可选的，默认为1 4.控制变量var的作用域仅在for循环内")
print(",需要在外面控制，则需将值赋给一个新的变量。5.循环过程中不要更改控制变量")
print("的值，那样会带来不可预知的影响")
print("例如：")
for i = 1, 5 do
	print(i)
end
print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
for i = 1, 10, 2 do
	print(i)
end
print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
for i = 10, 1, -1 do
	print(i)
end
print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
print("for泛型，泛型for循环通过一个迭代器(iterator)函数来遍历所有值:")
local a = {"a", "b", "c", "d"}
for i, v in ipairs(a) do
	print("index:", i, "value:", v)
end
print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
print("Lua的基础库提供了ipairs，这是一个用于遍历数组的迭代器函数。在每次循环中")
print("i会被赋予一个索引值，同时v被赋予一个对应于该索引的数组元素值。")
--for k in pairs(t) do
--	print(k)
--end
print("从外观上看泛型for循环比较简单，但其实它是非常强大的。通过不同的迭代器，")print("几乎可以遍历所有的东西，而且写出的代码极具可读性。标准库提供了集中迭代")
print("器，包括用于迭代文件中每行(io.lines)、迭代table元素的(pairs)、迭代数组")
print("元素的(ipairs)、迭代字符串中单词的(string.gmatch)等")
print("泛型for循环于数字型for循环有两个相同点：")
print("1.循环变量是循环体的局部变量")
print("2.绝不应该对循环体变量作任何赋值")
print("对于泛型for的使用，看如下一个例子：")
local days = {
	"Sunday", "Monday", "Tuesday", "Wednesday",
	"Thursday", "Friday", "Saturday"
}
print("现在要将一个名称转换成它在一周中的位置。为此，需要根据给定的名称来搜索")
print("这个table。然而在Lua中，通常更有效的方法是创建一个'逆向table'。例如这个")
print("逆向table叫revDays,它以一周中每天的名称作为索引，位置数字作为值：")
local revDays = {
	["Sunday"] = 1,
	["Monday"] = 2,
	["Tuesday"] = 3,
	["Wednesday"] = 4,
	["Thursday"]  = 5,
	["Friday"] = 6,
	["Saturday"] = 7
}
print("接下来，要找出一个名称所对应的需要，只需用名字来索引这个reverse table")
print("即可")
local x = "Tuesday"
print(revDays[x]) -->3
print("当然，不必手动声明这个逆向table，而是通过原来的table自动地构造出这个逆")
print("向table")
local days = {
	"Monday", "Tuesday", "Wednesday", "Thursday",
	"Friday", "Saturday", "Sunday"
}
local revDays = {}
for k, v in pairs(days) do
	revDays[v] = k
end
print("print value")
for k, v in pairs(revDays) do
	print("k:", k, "v:", v)
end
print("这个循环会为每个元素进行赋值，其中变量k为key(1,2...),变量v为value")
print("为'Sunday'、'Monday'、...")
print("值得一提的是，在LuaJIT2.1中，ipairs()内建函数是可以被JIT编译的，而")
print("pairs()则只能被解释执行。因此在性能敏感的场景，应当合理安排数据结构，")
print("避免对哈希表进行遍历。事实上，即使未来pairs可以被JIT编译，哈希表的遍历")
print("本身也不会有数组遍历那么高效，毕竟哈希表就不是为遍历而设计的数据结构")

--link:https://moonbingbing.gitbooks.io/openresty-best-practices/content/lua/for.html
