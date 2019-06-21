print("Table类型实现了一种抽象的‘关联数组’。‘关联数组’是一种具有特殊索引方式的数组")
print("索引通常时字符串(string)或者number类型，但也可以是除nil以外的任意类型的值")
print("在内部实现上，table通常实现为一个哈希表、数组、或者两者的混合")
print("具体的实现为何种形式，动态依赖于具体的table的键分布特点")
local corp = {
	web = "www.ustc.com",    --索引为字符串，key = 'web'
	telphone = "13123456987", -- value =  ‘www.ustc.com’
	staff = {"Jack", "Scott", "Gary"}, -- 索引为字符串。值也是一个表
	100867,    				 --相当于 [1] = 100867，此时索引为数字
	100191,					 --key = 1,value = 100867 
						 --相当于 [2] = 100191，此时索引为数字
	[10] = 360, 	  	 --直接把数字索引给出	
	["city"] = "Beijing" -- 索引为字符串  
}

print(corp.web)		--output:www.ustc.com
print(corp['telphone']) -- output:13123456987
print(corp[2])		--output:100191
print(corp["city"]) --output:Beijing
print(corp.staff[1]) --output:Jack
print(corp[10])		--output:360

