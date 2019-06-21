--Lua数学库由一组标准的数学函数构成。数学的引入丰富了Lua编程语言的功能，同时也方
--便了程序的编写。常用数学函数如下：
--  函数名            	   函数功能
--math.rad(x)     	     角度x转换成弧度
--math.deg(x)         	 弧度x转换成角度
--math.max(x, ...)    	 返回参数中值最大的那个数，参数必须是number型
--math.min(x, ...) 	     返回参数中值最小的那个数，参数必须是number型
--math.random([m,n])       不传入参数时，返回一个在区间(0,1)内均匀分布的伪随机实数
--					     ;只使用一个整数参数m时，返回一个在区间[1, m]内均匀分布
--                         的伪随机整数;使用两个整数参数时，返回一个在区间[m, n]内
--						 均匀分布的伪随机整数。
--math.randomseed(x)       为伪随机数生成器设置一个种子x,相同的种子将会生成相同
--						 的数字序列
--math.abs(x)              返回x的绝对值
--math.fmod(x, y)			 返回x对y取余数
--math.pow(x, y)           返回x的y次方
--math.sqrt(x)			 返回x的算术平方根
--math.exp(x)              返回自然数e的x次方
--math.log(x)              返回x的自然对数
--math.log10(x)		     返回以10为底，x的对数 
--math.floor(x)            返回最大且不大于x的整数
--math.ceil(x)             返回最小且不小于x的整数
--math.pi                  圆周率
--math.sin(x)              求弧度x的正弦值
--math.cos(x)              求弧度x的余弦值
--math.tan(x)	             求弧度x的正切值
--math.asin(x)             求x的反正弦值
--math.acos(x)             求x的反余弦值 
--math.atan(x)			 求x的反正切值
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--print(math.pi)
--print(math.rad(180))
--print(math.deg(math.pi))
----output
----3.1415926535898
----3.1415926535898
----180
--
--print(math.sin(1))
--print(math.cos(math.pi))
--print(math.tan(math.pi / 4))
----output
----0.8414709848079
-----1
----1
--print(math.atan(1))
--print(math.asin(0))
----output
----0.78539816339745
----0
--
--print(math.max(-1, 2, 0, 3.6, 9.2))
--print(math.min(-1, 3.6, 0, 2, 9.2))
----output
----9.2
-----1
--
--print(math.fmod(10.1, 3))
--print(math.sqrt(360))
----output
----1.1
----18.97366596101
--
--print(math.exp(1))
--print(math.log(10))
--print(math.log10(10))
----output
----2.718281828459
----2.302585092994
----1
--
--print(math.floor(math.pi))
--print(math.ceil((math.pi)*2))
----output
----3
----7
--
--print(math.floor(3.5))
--print(math.ceil(7.5))
----output
----3
----8
--另外使用math.random()函数获得的伪随机数时，如果不是用math.randomseed()设置伪随
--机数生成种子或者设置相同的伪随机数生成种子，那么得到的伪随机数序列是一样的。
math.randomseed(100)    --把种子设置为100
print(math.random())
print(math.random(100))
print(math.random(100, 360))
--output
--0.042055841965104
--52
--206

--稍等片刻，再次运行上面的代码
math.randomseed(100)     --把种子数设置为100
print(math.random())
print(math.random(100))
print(math.random(100, 360))
--output
--0.042055841965104
--52
--206

--两次运行结果一样，为了避免每次程序启动时得到的都是相同的伪随机数序列，通常时使
--用当前时间作为种子。
--修改后：
math.randomseed(os.time())   --把100换成os.time()
print(math.random())
print(math.random(100))
print(math.random(100, 360))
--output
--0.46484541435012
--82
--251

--稍等片刻再次运行
math.randomseed(os.time())
print(math.random())
print(math.random(100))
print(math.random(100, 360))
--output 
--0.46484541435012
--82
--251

