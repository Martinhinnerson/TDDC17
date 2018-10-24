;Domain Definition


(define (domain shakeys_world)
	(:requirements :strips)


	;Define how objects are connected and how you can interract with them
	;Also define what shakey can do
	(:predicates

		;defines world
		(adjacent ?room1 ?room2 ?door)	; defines connections between rooms
		(wide ?door)					; a door can be wide or not wide
		(can_move ?item)				; is it a movable item
		(can_be_switched ?item)			; only a light switch has this property in our case
		(can_be_pushed ?item)			; only a box can be pushed in our case
		(can_be_climbed ?item)			; only boxes can be climbed
		(can_be_carried ?item)			; can an item be carried by shakey?
        (turned_on ?light)				; is a light on or off
                
		;defines shakey
		(arm ?arm) 						; defines the arm of shakey to keep track of if it can pick up items
		(used ?arm)						; defines if the arm is holding an object
		(carry ?item ?arm)				; if an item is carried by a specific arm
		(on_floor ?who)					; used to see if shakey is on the floor or on a box
		(in ?something ?room)			; if an item or object is in a room or not
    )

	;Define actions

    ;Function used to move shakey between the different rooms
	(:action move
	  :parameters (?who ?from ?to ?door)
	  :precondition (and 
	  	(adjacent ?from ?to ?door)
	  	(in ?who ?from)
	  	(can_move ?who)
	  	(on_floor ?who)
	  	(in ?item ?from)
	  	(can_be_pushed ?item)
	  	(wide ?door))
	  :effect (and(in ?who ?to)
	  	(not(in ?who ?from))
	  	(in ?item ?to)
	  	(not(in ?item ?from)))
	  )
	;Functon used to climb up boxes
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
	;Function used to climb down from boxes
	(:action climb_down
	  :parameters (?who)
	  :precondition (and 
	  	(not(on_floor ?who)) 
	  	(can_move ?who))
	  :effect (on_floor ?who)
	  )
	;Function used to switch on light switches
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
	;Function used to push a box from one room to another
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
	;Function used to lift and item such as the toy with an arm
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
	;Function used to drop an item form an arm
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