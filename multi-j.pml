/*
	Elevator template model for Assignment 2 of 2IX20 - Software Specification.
	Set up for one elevator and two floors.
*/

// LTL formulas to be verified
//ltl p1 { []<> (floor_request_made[1]==true) } /* this property does not hold, as a request for floor 1 can be indefinitely postponed. */
//ltl p2 { []<> (cabin_door_is_open==true) } /* this property should hold, but does not yet; at any moment during an execution, the opening of the cabin door will happen at some later point. */

// ltl p1 { []<> (floor_request_made[0] -> current_floor == 0 ) }; // holds
// ltl p2 { []<> (floor_request_made[2] -> current_floor == 2) }; // holds
// ltl p3 { []<>cabin_door_is_open}; // doesnt hold
// ltl p4 { []<>!cabin_door_is_open	};	// holds


// the number of floors
#define N	4
// the number of elevators
#define M 2
// type for direction of elevator
mtype { down, up, none };
mtype direction[M];
// asynchronous channel to handle passenger requests
chan request = [N] of { byte };
// status of requests per floor
bool floor_request_made[N];
//global byte to make sure every process has a correct elevator number
byte elevator_counter = 0;

// status of floor doors of the shaft of the M elevator using 2D array 
typedef elevs {
  bool door_open[N];
};
elevs elevator[M];

// status and synchronous channels for elevator cabin and engine
byte current_floor[M];
bool cabin_door_is_open[M];
chan update_cabin_door[M] = [0] of { bool };
chan cabin_door_updated[M] = [0] of { bool };
chan move[M] = [0] of { bool };
chan floor_reached[M] = [0] of { bool };

// synchronous channels for communication between request handler and main control
chan go[M] = [0] of { byte };
chan served[M] = [0] of { bool };

// cabin door process
proctype cabin_door(byte elevator_id) {
	do
	:: update_cabin_door[elevator_id]?true ->
		elevator[elevator_id].door_open[current_floor[elevator_id]] = true;
		cabin_door_is_open[elevator_id] = true;
		cabin_door_updated[elevator_id]!true;
	:: update_cabin_door[elevator_id]?false ->
		cabin_door_is_open[elevator_id] = false;
		elevator[elevator_id].door_open[current_floor[elevator_id]] = false;
		cabin_door_updated[elevator_id]!false;
	od;
}

// process combining the elevator engine and sensors
proctype elevator_engine(byte elevator_id) {
	do
	:: move[elevator_id]?true ->
		do
		:: move[elevator_id]?false -> break;
		:: floor_reached[elevator_id]!true;
		od;
	od;
}

// main control process
proctype main_control(byte elevator_id) {
	byte dest;
	do
	:: go[elevator_id]?dest ->
		move[elevator_id]!true;
		// move in the direction of the destination floor
		do
		:: floor_reached[elevator_id]?true ->
			if
			:: current_floor[elevator_id] == dest ->
				move[elevator_id]!false;
				update_cabin_door[elevator_id]!true;
				if
				:: cabin_door_updated[elevator_id]?true ->
					//assert (cabin_door_is_open[elevator_id] && elevator[elevator_id].door_open[current_floor[elevator_id]])
					update_cabin_door[elevator_id]!false;
				fi;
				if
				:: cabin_door_updated[elevator_id]?false ->
					floor_request_made[dest] = false;
					served[elevator_id]!true;
					direction[elevator_id] = none;
				fi;
				break;
			:: dest > current_floor[elevator_id] ->
				current_floor[elevator_id]++;
				direction[elevator_id] = up;
			:: dest < current_floor[elevator_id] ->
				current_floor[elevator_id]--;
				direction[elevator_id] = down;
			:: else ->
				// stop moving if direction is none
				move[elevator_id]!false;
				break;
			fi;
		od;
	od;
}

// request handler process TODO
proctype req_handler() {
	byte dest;
	byte current_elevator = 0;
	do
	:: request?dest -> 
		if
		:: current_elevator == M ->
			current_elevator = 0;
		:: else -> skip;
		fi;
		go[current_elevator]!dest; 
		served[current_elevator]?true;
		current_elevator++;
	od;
}

// request button associated to a floor i to request an elevator
proctype req_button(byte floor_nr) {
	do
	:: !floor_request_made[floor_nr] ->
	   atomic {
		request!floor_nr;
		floor_request_made[floor_nr] = true;
	   }
	od;
}
init {
	byte elevator_nr;
	byte floor_nr;
	atomic {
		run req_handler();
		elevator_nr = 0;
		//create all the processes and give them an elevator number
		do
		:: elevator_nr < M ->
			run cabin_door(elevator_nr);
			run elevator_engine(elevator_nr);
			run main_control(elevator_nr);
			current_floor[elevator_nr] = 0;
			cabin_door_is_open[elevator_nr] = false;

			elevator_nr++;
		:: elevator_nr == M -> break;
		od;
		floor_nr = 0;
		do
		//create a request process per floor
		:: floor_nr < N ->
			run req_button(floor_nr);
			floor_nr++;
		:: floor_nr == N -> break;
		od;
	}
}
