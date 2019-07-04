--成员私有性
--在动态语言中引入成员私有性并没有太大的必要，反而会显著增加运行时的开销
--毕竟这种检查无法像许多静态语言那样在编译期完成。如下一技巧把对象作为
--各方法的upvalue本身时很巧妙的，会导致构造函数无法被JIT编译。
--在Lua中，成员的私有性，使用类似于函数闭包的形式实现。在我们之前的银行
--账户实例，通过工厂方法对外提供的闭包来暴露对外接口。而不想暴露在外的例
--如balance成员变量，则被很好的隐藏起来。
function newAccount (initialBalance)
	local self = {balance = initialBalance}
	local withdraw = function (v)
		self.balance = self.balance - v
	end

	local deposit = function (v)
		self.balance = self.balance + v
	end
	
	local getBalance = function () return self.balance end
	return {
		withdraw = withdraw,
		deposit = deposit,
		getBalance = getBalance
	}
end

a = newAccount(100)
a.deposit(100)
print(a.getBalance())
print(a.balance)

