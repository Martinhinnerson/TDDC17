;Domain Definition


(define (domain shakeys_world)
	(:requirements :strips)


	;Define how objects are connected and how you can interract with them
	;Also define what shakey can do
	(:predicates

		;defines world
		(adjacent ?room1 ?room2 ?door)
		(wide ?door)
		(can_move ?object)
		(can_be_switched ?object)
		(can_be_pushed ?item)
		(can_be_climbed ?item)
		(can_be_carried ?item)
                (turned_on ?light)
                
		;defines shakey
		(arm ?arm)
		(used ?arm)
		(carry ?item ?arm)
		(on_floor ?who)
		(in ?something ?room)
         )

	;Define actions

        
	(:action move
	  :parameters (?who ?from ?to ?door)
	  :precondition (and 
	  	(adjacent ?from ?to ?door)
	  	(in ?who ?from)
	  	(can_move ?who)
<<<<<<< HEAD
	  	(on_floor ?who)
	  	(in ?item ?from)
	  	(can_be_pushed ?item)
	  	(wide ?door))
	  :effect (and(in ?who ?to)
	  	(not(in ?who ?from))
	  	(in ?item ?to)
	  	(not(in ?item ?from)))
=======
	  	(on_floor ?who))
	  :effect (and
                (in ?who ?to)
	  	(not(in ?who ?from)))
>>>>>>> f59b7d127af2aa9c8fc7a372c279f01200cbcdc1
	  )

	(:action climb_up
	  :parameters (?box ?who ?room)
	  :precondition (and 
	  	(in ?who ?room)
	  	(in ?box ?room)
	  	(can_move ?who)
	  	(can_be_climbed ?box)
	  	(on_floor ?who))
	  :effect (not(on_floor ?who))
	  )

	(:action climb_down
	  :parameters (?who)
	  :precondition (and 
	  	(not(on_floor ?who)) 
	  	(can_move ?who))
	  :effect (on_floor ?who)
	  )

	(:action switch_on
	  :parameters (?light ?who ?room)
	  :precondition (and 
	  	(in ?who ?room)
	  	(in ?light ?room)
                (can_move ?who)
	  	(can_be_switched ?light)
	  	(not(turned_on ?light))
	  	(not(on_floor ?who)))
	  :effect (turned_on ?light)
	  )

	(:action push
	  :parameters (?who ?from ?to ?door ?item)
	  :precondition (and 
	  	(adjacent ?from ?to ?door)
	  	(wide ?door)
	  	(can_be_pushed ?item)
	  	(can_move ?who)
	  	(on_floor ?who)
	  	(in ?who ?from)
	  	(in ?item ?from))
	  :effect (and (in ?who ?to)
	  	(in ?item ?to)
	  	(not(in ?who ?from))
	  	(not(in ?item ?from)))
	  )

	(:action lift
	  :parameters (?who ?room ?arm ?item ?light)
	  :precondition (and 
	  	(in ?who ?room)
	  	(in ?item ?room)
	  	(in ?light ?room)
	  	(on_floor ?who)
	  	(turned_on ?light)
	  	(can_be_carried ?item)
	  	(can_move ?who)
	  	(arm ?arm)
	  	(not(used ?arm)))
	  :effect (and 
	  	(not (in ?item ?room))
	  	(carry ?item ?arm)
	  	(used ?arm))
	  )

	(:action drop
	  :parameters (?who ?room ?item ?arm)
	  :precondition (and 
	  	(in ?who ?room)
	  	(arm ?arm)
	  	(carry ?item ?arm)
	  	(on_floor ?who)
	  	(can_move ?who))
	  :effect (and 
	  	(not(carry ?item ?arm))
	  	(not(used ?arm))
	  	(in ?item ?room))
	  )

	)