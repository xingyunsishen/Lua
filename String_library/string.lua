--Lua字符串库包含很多强大的字符操作函数。字符串库中的所有函数都导出在模块string中。在Lua5.1中，它还将这些函数导出作为string类型的方法。这样假设要返回一个字符串转的大写形式，可以写成ans = string.upper(s),也能写成ans = s:upper().为了避免与之前版本不兼容，此处使用前者。
--Lua字符串总是由字节构成的。Lua核心并不尝试理解具体的字符集编码（比如GBK和UTF-8这样的多字节字符编码）。
--需要特别注意的一点是，Lua字符串内部用来标识各个组成字节的下标是从1开始的，这不同于C和Perl这样的编程语言。这样数字符串位置的时候再也不用调整，对于非专业的开发者来说可能也是一个好事情，string.sub(str, 3, 7)直接表示冲第三个字符开始到第七个字符（含）为止的子串。
--string.byte(s[, i [, j ]])
--返回字符s[i]、s[i + 1]、s[i + 2]、....、s[j]所对应的ASCII码。i的默认值为1，即第一个字节，j的默认值为1
--如下：
print(string.byte("abcd", 1, 3))
print(string.byte("abc", 3))		--缺少第三个参数，第三个参数默认域第二个相同，此时为3
print(string.byte("abc"))	--缺少第二个和第三个参数，此时这两个参数都默认为1
--由于string.byte只返回整数，而并不像string.sub等函数那样(尝试)创建新的Lua字符串，因此使用string.byte来进行字符串相关的扫面和分析是最为高效的，尤其是在被LuaJIT2所JIT编译之后。
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--string.char(...)
--接收0个或更多的整数（整数范围:0～255），返回这些整数所对应的ASCII码字符组成的字符串。当参数为空时，默认是一个0
--如下：
print(string.char(96, 97, 98))
print(string.char()) 	--参数为空，默认是一个0
print(string.byte(string.char()))
print(string.char(65, 66))
--output
--`ab
--
--
--AB
--此函数特别适合从具体的字节构造出二进制字符串。这经常比使用table.concat函数和...连接运算符更加高效
--string.upper(s) 
--接收一个字符串s,返回一个把所有小写字母变成大写字母的字符串。
print(string.upper("Hello Lua")) --output HELLO LUA
--string.lower(s)
--接收一个字符串s,返回一个把所有大写字母变成小写字母的字符串。
print(string.lower("Hello Lua")) --output hello lua
--string.len(s)
--接收一个字符串，返回它的长度
print(string.len("hello lua"))  --output 9
--使用此函数是不推荐的。应当总是使用#运算符来获取Lua字符串的长度。
--由于使用Lua字符串的长度是专门存放的，并不需要像C字符串那样即时计算，因此获取字符串长度的操作总是0(1)的时间爱你复杂度
--string.find(s, p [, init[, plain]])
--在s字符串中第一次匹配p字符串。若匹配成功，则返回p字符串在s字符串中出现的开始位置和结束位置；若匹配失败，则返回nuil。第三个参数init默认为1，并且可以为负整数，当init为负数时，表示从s字符串的string.len(s) + init + 1索引处开始向后匹配字符串p。第四个参数默认为false，当其为true时，只会把p看成一个字符串对待。
local find = string.find
print(find("abc cba", "ab"))
print(find("abc cba", "ab", 2))  --从索引为2的位置开始匹配字符串：ab
print(find("abc cba", "ba", -1))  --从索引为7的位置开始匹配字符串：ba
print(find("abc cba", "ba", -3)) --从索引为5的位置开始匹配字符串ba
print(find("abc cba", "(%a+)", 1))  --从索引为1出开始匹配最长连续且只含字母的字符串
print(find("abc cba", "(%a+)", 1, true))  --从索引为1的位置开始匹配字符串(%a+)
--output
--1  2
--nil
--nil
--6  7
--1  3  abc
--nil
--对于LuaJIT这里有个性能优化点，对于string.find方法，当只有字符串查找匹配时，是可以被JIT编译器优化的，有关JIT可以编译优化清单，大家可以参考http://wiki.luajit.org/NYI，性能提升是非常明显的，通常是100倍量级。这里有个例子：https://groups.google.com/forum/m/#!topic/openresty-en/rwS88FGRsUI。
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--string.format(formatstring, ...)
--按照格式化参数formatstring,返回后面...内容的格式化版本。编写格式化字符串的规则与标准C语言中的printf函数的规则基本相同：它由常规文本和指示组成，这些指示控制了每个参数对应放到格式化结果的什么位置，及如何放入他们。一个指示由字符%加上一个字母组成，这些字母指定了如何格式化参数，例如d用于十进制数、x用于十六进制数、o用于八进制数、f用于浮点数、s用于字符串等等。在字符%和字母之间可以再指定一些其他选项，用于控制格式的细节。
print(string.format("%.4f", 3.1415926))	--保留4为小数
print(string.format("%d %x %o", 31, 31, 31))	--十进制31转换成十六进制、八进制
d = 29; m = 7; y = 2015;	--一行包含多个语句，用;隔开
print(string.format("%s %02d/%02d/%02d", "today is:", d, m, y))
--output
--3.1416
--31 1f 37
--today is: 29/07/2015
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--string.match(s, p[, init])
--在字符串s中匹配(模式)字符串p,若匹配成功，则返回字符串中与模式匹配的子串；否则返回nil。第三个参数init默认为1，并且可以为负整数，当init为负数时，表示从s字符串的string.len(s) + init + 1索引处开始向后匹配字符串p.
print(string.match("hello lua", "lua"))
print(string.match("lua lua", "lua", 2))    --匹配后面那个lua
print(string.match("lua lua", "hello"))
print(string.match("today is 27/7/2015", "%d+%d+%d+"))
--output
--lua
--lua
--nil
--27/7/2015
--string.match目前并不能被JIT编译，应尽量使用ngx_lua模块提供的ngx.re.match等接口
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--string.gmatch(s, p)
--返回一个迭代器函数，通过这个迭代器函数可以遍历到在字符串s中出现模式串p的所有地方。
s = "hello world from lua"
for w in string.gmatch(s, "%a+") do  --匹配最长连续且只含字母的字符串
	print(w)
end 
--output 
--hello
--world
--from 
--lua
t = {}
s = "from=world, to=lua"
for k, v in string.gmatch(s, "(%a+)=(%a+)") do		--匹配两个最长连续且只含字母
													--的字符串，他们之间用等号链
													--接
	t[k] = v
end
for k, v in pairs(t) do
print(k, v)
end
--output
--to	lua
--from	world
--此函数目前并不能被LuaJIT所JIT编译，而只能被解释执行。应尽量使用ngx_lua模块提供的ngx.re.gmatch等接口。
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--string.rep(s, n)
--返回字符串s的n次拷贝
print(string.rep("abc", 3))  --拷贝3次“abc”
--output
--abcabcabc
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--string.sub(s, i [, j])
--返回字符串s中，索引i到索引j之间的子字符串。当j缺省时，默认为-1，也就是字符串s
--的最后位置。i可以为负数。当索引i在字符串s的位置在索引j的后面时，将返回一个空
--字符串。
print(string.sub("Hello Lua", 4, 7))
print(string.sub("Hello Lua", 2))
print(string.sub("Hello Lua", 2, 1))		--注意看返回什么
print(string.sub("Hello Lua", -3, -1))
--output
--lo L
--ello Lua
--
--Lua
--如果只是想对字符串中的单个字节进行检查，使用string.char函数通常会更为高效
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--string.gsub(s, p, r[, n])
--将目标字符串s中所有的子串p替换成字符串r.可选参数n,表示限制替换次数。返回值有两个，第一个是被替换后的字符产，第二个是替换了多少次。
print(string.gsub("Lua Lua Lua", "Lua", "hello"))
print(string.gsub("Lua Lua Lua", "Lua", "hello", 2))
--output
--hello hello hello  3
--hello hello Lua    2
--此函数不能为LuaJIT所JIT编译，而只能被解释执行。一般我们推荐使用ngx_lua模块提供的ngx.re.gsub函数
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--string.reverse(s)
--接收一个字符串s,返回这个字符串的反转
print(string.reverse("Hello Lua"))		--output  auL olleH




