print("单个if分支")
x = 10
if x > 0 then 
	print("x is a positive number")
end

print("两个分支if-else")
x = 10
if x > 0 then
	print("x is a positive number")
else
	print("x is a non-positive number")
end

print("多个分支if-elseif-else")
score = 90
if score == 100 then 
	print("Very good!Your score is 100")
elseif score >= 60 then 
	print("Congratulations, you have passed it,your score greater or equal to ")
	print("60")
else
	print("Sorry, you do not pass the exam!")
end

print("与C语言不同之处是else与if是连在一起的，若将else与if写成”else“则相当于")
print("在else里嵌套另一个if语句，如下代码：")
score = 0
if score == 100 then
	print("Very Good~your score is 100")
elseif score >= 60 then
	print("Congratulation,you have passed it,your score greater or equal to 60")
else
	if score > 0 then
		print("Your score is better than 0") 
	else 
		print("My God,your score turned out to be 0")
	end
end


