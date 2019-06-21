print("布尔类型，可选值true/false；\n Lua中nil和false为“假”,\n 其他所有值均为‘真’。 \n 比如0和空字符串就'真';\n C或者Perl程序员\n 或许会对此感到惊讶\n")
local a = true
local b = 0 
local c = nil 
if a then 
	print("a")  	--> output:a
else 
	print("not a") 	--> 这个没有执行
end

if b then 
	print("b")  	-->output:b
else 
	print("not b")	--这个没有执行
end

if c then
	print("c")		--这个没有执行
else
	print("not c")	-->output: not c
end

