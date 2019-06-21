--日期时间函数
--在Lua中，函数time、date和difftime提供了所有的日期和时间功能
--在OpenResty的世界里，不推荐使用这里的标准时间函数，因为这些函数通常会引发不止
--一个昂贵的系统调用，同时无法为LuaJIT JIT编译，对性能造成较大影响。推荐使用ngx_
--lua模块提供的带缓存的时间接口，如ngx.today,ngx.time,ngx.utctime,ngx.localtime,--ngx.now,ngx.http_time,以及ngx.cookie_time等
--所以下面的部分函数简单了解一下即可。
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--os.time([table])
--如果不使用参数table调用time函数，他会返回当前的时间和日期(它表示从某一时刻到现
--在的秒数)。如果用table参数，他会返回一个数字，表示该table中所描述的日期和时间(
--它表示从某一时刻到table中描述日期和时间的秒数)。table的字段如下：
--字段名称          取值范围
--  year            四位数字       
--  month           1--12
--  day             1--31
--  hour            0--23
--  min             0--59
--  sec             0--61
-- isdst      boolean(true表示夏令时)
--对于time函数，如果参数为table那么table中必须含有year、month、day字段。其他字段
--缺省时段默认为中午(12:00:00)
print(os.time())	
a = { year = 1970, month = 1, day = 1, hour = 8, min = 1 }
print(os.time(a)) 
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--os.difftime(t2, t1)
--返回t1到t2的时间差，单位为秒。
local day1 = { year = 2015, month = 7, day = 30 }
local t1 = os.time(day1)

local day2 = { year = 2015, month = 7, day = 31 }
local t2 = os.time(day2)
print(os.difftime(t2, t1)) 		
--output
--86400
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--os.date([format [, time]])
--把一个表示日期和时间的数值，转换成更高级的表现形式。其第一个参数format是一个
--格式化字符串，描述了要返回的时间形式。第二个参数time就是日期和时间的数字表示
--，缺省时默认为当前的时间。使用格式字符"*t",创建一个时间表。
local tab1 = os.date("*t")		--返回一个描述当前日期和时间的表
local ans1 = "{"
for k, v in pairs(tab1) do		--把tab1转换成一个字符串
	ans1 = string.format("%s %s = %s, ", ans1, k, tostring(v))
end

ans1 = ans1 .. "}"
print("tab1 = ", ans1)

local tab2 = os.date("*t", 360)  --返回一个描述日期和时间数为360秒的表
local ans2 = "{"
for k, v in pairs(tab2) do  	--把tab2转换成一个字符串
	ans2 = string.format("%s %s = %s ,", ans2, k, tostring(v))
end

ans2 = ans2 .."}"
print("tab2 = ", ans2)

--output
--tab1 = 	{ sec = 4,  min = 42,  day = 20,  isdst = false,  wday = 5,  yday = 171,  year = 2019,  month = 6,  hour = 19, }
--tab2 = 	{ sec = 0 , min = 6 , day = 1 , isdst = false , wday = 5 , yday = 1 , year = 1970 , month = 1 , hour = 8 ,}
--该表中除了使用到了time函数参数table的字段外，这还提供了星期(wday,星期天为1)和
--一年中的第几天(yday,一月一日为1).除了使用"*t"格式字符串外，如果使用带标记(见下
--表)的特殊字符串，os.date函数回将响应的标记位以时间信息进行补充，得到一个包含时
--间的字符串。表如下：
--格式字符        含义
--%a             一星期中天数的简写(例如Wed)
--%A             一星期中天数的全程(Wednesday)
--%b             月份简写(Sep)
--%B             月份全称(September)
--%c             日期和时间(例如：07/30/15 16:57:24)
--%d             一个月中的第几天[01~31]
--%H             24小时制中的小时数[00 ~ 23]
--%l			   12小时制中的小时数[01 ~ 12]
--%j             一年中的第几天[001 ~ 366]
--%M             分钟数[00 ~ 59]
--%m             月份数[01 ~ 12]
--%p             "上午(am)" 或 "下午(pm)"
--%S             秒数[00 ~ 59]
--%w             一星期中的第几天[1 ~ 7 = 星期天 ~ 星期六]
--%x             日期(例如:07/30/15)
--%X             时间(例如:16:57:24)
--%y             两位数的年份[00 ~ 99]
--%Y             完整的年份(例如:2015)
--%%             字符'%'
print(os.date("today is %A, in %B"))
print(os.date("now is %x %X"))
--output
--today is Friday, in June
--now is 06/21/19 11:23:48




