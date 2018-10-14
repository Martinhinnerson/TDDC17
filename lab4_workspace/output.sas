begin_version
3
end_version
begin_metric
0
end_metric
9
begin_variable
var0
-1
2
Atom on_floor(shakey)
NegatedAtom on_floor(shakey)
end_variable
begin_variable
var1
-1
3
Atom in(box, room1)
Atom in(box, room2)
Atom in(box, room3)
end_variable
begin_variable
var2
-1
3
Atom in(shakey, room1)
Atom in(shakey, room2)
Atom in(shakey, room3)
end_variable
begin_variable
var3
-1
2
Atom turned_on(switch3)
NegatedAtom turned_on(switch3)
end_variable
begin_variable
var4
-1
2
Atom turned_on(switch2)
NegatedAtom turned_on(switch2)
end_variable
begin_variable
var5
-1
2
Atom turned_on(switch1)
NegatedAtom turned_on(switch1)
end_variable
begin_variable
var6
-1
2
Atom used(arm1)
NegatedAtom used(arm1)
end_variable
begin_variable
var7
-1
2
Atom used(arm2)
NegatedAtom used(arm2)
end_variable
begin_variable
var8
-1
5
Atom carry(toy, arm1)
Atom carry(toy, arm2)
Atom in(toy, room1)
Atom in(toy, room2)
Atom in(toy, room3)
end_variable
0
begin_state
0
2
0
1
1
1
1
1
2
end_state
begin_goal
1
8 4
end_goal
29
begin_operator
climb_down shakey
0
1
0 0 1 0
1
end_operator
begin_operator
climb_up box shakey room1
2
1 0
2 0
1
0 0 0 1
1
end_operator
begin_operator
climb_up box shakey room2
2
1 1
2 1
1
0 0 0 1
1
end_operator
begin_operator
climb_up box shakey room3
2
1 2
2 2
1
0 0 0 1
1
end_operator
begin_operator
drop shakey room1 toy arm1
2
2 0
0 0
2
0 8 0 2
0 6 -1 1
1
end_operator
begin_operator
drop shakey room1 toy arm2
2
2 0
0 0
2
0 8 1 2
0 7 -1 1
1
end_operator
begin_operator
drop shakey room2 toy arm1
2
2 1
0 0
2
0 8 0 3
0 6 -1 1
1
end_operator
begin_operator
drop shakey room2 toy arm2
2
2 1
0 0
2
0 8 1 3
0 7 -1 1
1
end_operator
begin_operator
drop shakey room3 toy arm1
2
2 2
0 0
2
0 8 0 4
0 6 -1 1
1
end_operator
begin_operator
drop shakey room3 toy arm2
2
2 2
0 0
2
0 8 1 4
0 7 -1 1
1
end_operator
begin_operator
lift shakey room1 arm1 toy switch1
3
2 0
0 0
5 0
2
0 8 2 0
0 6 1 0
1
end_operator
begin_operator
lift shakey room1 arm2 toy switch1
3
2 0
0 0
5 0
2
0 8 2 1
0 7 1 0
1
end_operator
begin_operator
lift shakey room2 arm1 toy switch2
3
2 1
0 0
4 0
2
0 8 3 0
0 6 1 0
1
end_operator
begin_operator
lift shakey room2 arm2 toy switch2
3
2 1
0 0
4 0
2
0 8 3 1
0 7 1 0
1
end_operator
begin_operator
lift shakey room3 arm1 toy switch3
3
2 2
0 0
3 0
2
0 8 4 0
0 6 1 0
1
end_operator
begin_operator
lift shakey room3 arm2 toy switch3
3
2 2
0 0
3 0
2
0 8 4 1
0 7 1 0
1
end_operator
begin_operator
move shakey room1 room2 door1
1
0 0
1
0 2 0 1
1
end_operator
begin_operator
move shakey room2 room1 door1
1
0 0
1
0 2 1 0
1
end_operator
begin_operator
move shakey room2 room3 door2
1
0 0
1
0 2 1 2
1
end_operator
begin_operator
move shakey room2 room3 door3
1
0 0
1
0 2 1 2
1
end_operator
begin_operator
move shakey room3 room2 door2
1
0 0
1
0 2 2 1
1
end_operator
begin_operator
move shakey room3 room2 door3
1
0 0
1
0 2 2 1
1
end_operator
begin_operator
push shakey room1 room2 door1 box
1
0 0
2
0 1 0 1
0 2 0 1
1
end_operator
begin_operator
push shakey room2 room1 door1 box
1
0 0
2
0 1 1 0
0 2 1 0
1
end_operator
begin_operator
push shakey room2 room3 door3 box
1
0 0
2
0 1 1 2
0 2 1 2
1
end_operator
begin_operator
push shakey room3 room2 door3 box
1
0 0
2
0 1 2 1
0 2 2 1
1
end_operator
begin_operator
switch_on switch1 shakey room1
2
2 0
0 1
1
0 5 1 0
1
end_operator
begin_operator
switch_on switch2 shakey room2
2
2 1
0 1
1
0 4 1 0
1
end_operator
begin_operator
switch_on switch3 shakey room3
2
2 2
0 1
1
0 3 1 0
1
end_operator
0
