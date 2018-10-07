(define (problem problem1)
	
  (:domain shakeys_world)

  (:objects
    room1 room2 room3 door1 door2 door3 switch1 switch2 switch3 shakey arm1 arm2 box toy
  )

  (:init
    (adjacent room1 room2 door1)
    (adjacent room2 room1 door1)
    (adjacent room2 room3 door2)
    (adjacent room3 room2 door3)
    (adjacent room2 room3 door2)
    (adjacent room3 room2 door3)
  	
  	(wide door1)
  	(wide door3)
  	
  	(in switch1 room1)
  	(in switch2 room2)
  	(in switch3 room3)
  	
  	(can_be_switched switch1)
	(can_be_switched switch2)
	(can_be_switched switch3)
	
	(in shakey room1)
	(can_move shakey)
	
	(arm arm1)
	(not(used arm1))
	(arm arm2)
	(not(used arm2))

	(in box room1)
	(can_be_pushed box)
	(can_be_climbed box)

	(in toy room3)
	(can_be_carried toy)
  ) 

  (:goal (or 
  	(carry toy arm1)
  	(carry toy arm2))

  )