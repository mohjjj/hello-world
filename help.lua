-- an scratch


a = 'hello'
io.write('-----------------------------------------------------------sec 1 \n')

io.write('Enter a text : text')
str = 'text' -- io.read()
io.write('\n' .. a .. ' salam ' .. str)

io.write('\n\n')
io.write('Enter a number                    : 456 \n')
local num = 456 -- io.read()

steps = math.floor(num / (2*math.pi))
sync = steps * (2*math.pi)

remain = num - sync
io.write('equal to                          : ')
io.write(remain)
io.write('\n')
sinn = math.sin(num)
sinr = math.sin(remain)



io.write('1st method; sin of your number is : ')
io.write(sinn)
io.write('\n')
io.write('2nd method; sin of your number is : ')
io.write(sinr)
io.write('\n')

io.write('-----------------------------------------------------------sec 2 \n')

function fib(n)
  if n < 2 then return 1 end
  return fib(n - 2) + fib(n - 1)
end
io.write('fib of 4 is : ')
print(fib(4))

io.write('-----------------------------------------------------------sec 3 \n')


function adder(x)
  -- The returned function is created when adder is
  -- called, and remembers the value of x:
  return function (y) return x + y end
end
a1 = adder(9)
a2 = adder(36)
print(a1(16))  --> 25
print(a2(64))  --> 100

print(a1)


io.write('-----------------------------------------------------------sec 4 \n')
-- Tabels :

t = {key1 = 'value1', key2 = false}

-- String keys can use js-like dot notation:
print(t.key1)  -- Prints 'value1'.
t.newKey = 5  -- Adds a new key/value pair.
t.key4 = 'a key 4'
t.ker = 'sdffsdf'
print(t.ker)
t.key2 = nil   -- Removes key2 from the table.
io.write('t.newKey : ')
print(t.newKey)

for i = 1,10 do
	
	t[i] = math.sin(i)

end

print(t)

io.write('-----------------------------------------------------------sec 5 \n')
function h(x) print(x.key1) end
h{key1 = 'Sonmi~451'}  -- Prints 'Sonmi~451'.
h({key1 = 'Sonmi~451'})  -- Prints 'Sonmi~451'.
------------------------
function h(x) print(x) end
h'Sonmi~451'  -- Prints 'Sonmi~451'.
io.write('-----------------------------------------------------------sec 6 \n')

print('inside table : ')
for key, val in pairs(t) do  -- Table iteration.
  print(key, val)
end
io.write('-----------------------------------------------------------sec 7 \n')
--  _G --> key word
-- _G is a special table of all globals.
print(_G .t[45])
print(t[45])

io.write('-----------------------------------------------------------sec 8 \n')
print('Table of tables (Two dimensional array) : ')

tt = {}

jzs = 3
for i =1,jzs do
	tt[i] = {}
	for j = 1,jzs do
		tt[i][j] = i*j
	end
end

for i =1,jzs do
	for j = 1,jzs do
		io.write(tt[i][j])
		io.write('\t')
	end
	print()
	print()
	print()
	print()
	print()
end
io.write('-----------------------------------------------------------sec 9 \n')
io.write('size of tt : ')
print(#tt)
io.write('\neach part : \n')
for i = 1,#tt do
	print(i , #tt[i])
end
io.write('-----------------------------------------------------------sec 10 \n')
f1 = {a = 1, b = 2}  -- Represents the fraction a/b.
f2 = {a = 2, b = 3}

metafraction = {}
function metafraction.__add(f1, f2)
  sum = {}
  sum.b = f1.b * f2.b
  sum.a = f1.a * f2.b + f2.a * f1.b
  return sum
end

setmetatable(f1, metafraction)
setmetatable(f2, metafraction)

s = f1 + f2  -- call __add(f1, f2) on f1's metatable

print(getmetatable(s))

io.write('-----------------------------------------------------------sec 11 \n')
io.write('-----------------------------------------------------------sec 11\n')

tb={}
for i =1,5 do
	tb[i] = i^2;
	
end
tb['tt'] = 'efrvgefv';

for p1 , p2 in pairs(tb) do
	print(p1,p2)
end

print(#_G)
io.write('-----------------------------------------------------------sec 12 \n')

f1 = {a = 1, b = 2}  -- Represents the fraction a/b.
f2 = {a = 2, b = 3}

-- This would fail:
-- s = f1 + f2

metafraction = {}
function metafraction.__add(f11, f2)
  sum = {}
  sum.b = f11.b * f2.b
  sum.a = f11.a * f2.b + f2.a * f11.b
  return sum
end

first_Argument_Of_f1=setmetatable(f1, metafraction)
					 setmetatable(f2, metafraction)
io.write('first Argument Of f1 : ')
print('a = ' .. first_Argument_Of_f1.a .. ' and b = ' .. first_Argument_Of_f1.b)

s = f1 + f2  -- call __add(f1, f2) on f1's metatable
setmetatable(s, metafraction)
-- print(s.a)
-- print(s.b)
t = s + s
print(t.a)
print(t.b)
--ss = getmetatable(s)
--assert(getmetatable(s) == metafraction)
print(getmetatable(s)== metafraction)
io.write('-----------------------------------------------------------sec 13 \n')
Dog = {}                                   -- 1.

function Dog:new()                         -- 2.
  newObj = {sound = 'woof'}                -- 3.
  self.__index = self                      -- 4.
  return setmetatable(newObj, self)        -- 5.
end

function Dog:makeSound()                   -- 6.
  print('I say ' .. self.sound)
end

mrDog = Dog:new()                          -- 7.
mrDog:makeSound()  -- 'I say woof'         -- 8.

-----------------------------------------------------

LoudDog = Dog:new()                           -- 1.

function LoudDog:makeSound()
  s = self.sound .. ' '                       -- 2.
  print(s .. s .. s)
end

seymour = LoudDog:new()                       -- 3.
seymour:makeSound()  -- 'woof woof woof'      -- 4.
--------------------------------------------------------------
--------------------------------------------------------------

Dog = {}                                   -- 1.

function Dog.new(yyyy)                         -- 2.
  newObj = {sound = 'woof'}                -- 3.
  yyyy.__index = yyyy                      -- 4.
  setmetatable(newObj, yyyy)
  return newObj        -- 5.
end

function Dog.makeSound(self)                   -- 6.
  print('I say ' .. self.sound)
end

mrDog = Dog.new(Dog)                          -- 7.
mrDog.makeSound(mrDog)  -- 'I say woof'         -- 8.


io.write('-----------------------------------------------------------sec 14 \n')

-- local and global variables:
-- [[
a = 2 -- io.read()
a = math.sqrt(a)
a=a^2
if a<2 then
	print('a is less than 2')
elseif a >= 1.99999999 and a<=2.000000001 then
	print("a is 2")
	local pps = 33;
else
	print("a bigger than 2")
end
print(pps)
--]]
io.write('-----------------------------------------------------------sec 15 \n')

if 0 then
	print("0 is true")
else
	print("0 is not true")
end
----------------------------
if nil then
	print("nil is true")
else
	print("nil is not true")
end
----------------------------
if 'sdfvf' then
	print("text is true")
else
	print("text is not true")
end
----------------------------
ans = aBoolValue and 'yes' or 'no'
print(ans)

io.write('-----------------------------------------------------------sec 16 \n')
for key, val in pairs(_G) do  -- Table iteration.
  print(key,'->', val)
end
