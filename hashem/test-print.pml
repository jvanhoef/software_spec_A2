
// ltl p1 { []<> (floor_request_made[0] -> current_floor == 0 ) }; // holds
// ltl p2 { []<> (floor_request_made[2] -> current_floor == 2) }; // holds
// ltl p3 { []<>cabin_door_is_open}; // doesnt hold
// ltl p4 { []<>!cabin_door_is_open}; // holds





// the number of floors
#define N	255

// IDs of req_button processes
#define reqid _pid-4

// type for direction of elevator
mtype { down, up, none };

// asynchronous channel to handle passenger requests
chan request = [N] of { byte };
// status of requests per floor
bool floor_request_made[N];

// status of floor doors of the shaft of the single elevator
bool floor_door_is_open[N];

// status and synchronous channels for elevator cabin and engine
byte current_floor;
bool cabin_door_is_open;
chan update_cabin_door = [0] of { bool };
chan cabin_door_updated = [0] of { bool };
chan move = [0] of { bool };
chan floor_reached = [0] of { bool };

// synchronous channels for communication between request handler and main control
chan go = [0] of { byte };
chan served = [0] of { bool };


// cabin door process
active proctype cabin_door() {
    printf("Cabin door started\n");
    do
        :: update_cabin_door?true ->
            floor_door_is_open[current_floor] = true;
            cabin_door_is_open = true;
            cabin_door_updated!true;
            printf("Cabin door: Opened\n");
        :: update_cabin_door?false ->
            cabin_door_is_open = false;
            floor_door_is_open[current_floor] = false;
            cabin_door_updated!false;
            printf("Cabin door: Closed\n");
    od;
}

// process combining the elevator engine and sensors
active proctype elevator_engine() {
    printf("Elevator engine started\n");
    do
        :: move?true ->
            printf("Elevator engine: Started moving\n");
            do
                :: move?false ->
                    printf("Elevator engine: Stopped moving\n");
                    break;
                :: floor_reached!true;
                    printf("Elevator engine: Reached floor\n");
            od;
    od;
}

// DUMMY main control process. Remodel it to control the doors and the engine!
active proctype main_control() {
    byte dest;
    printf("Main control started\n");
    do
        :: go?dest ->
            printf("Main control: Received request to go to floor %d\n", dest);
            move!true;
            printf("Main control: Started moving\n");

            // move in the direction of the destination floor
            do
                :: floor_reached?true ->
                    if
                        :: current_floor == dest ->
                            printf("Main control: Reached floor %d\n", dest);
                            move!false;
                            update_cabin_door!true;
                            if
                                :: cabin_door_updated?true ->
                                    assert (cabin_door_is_open && floor_door_is_open[current_floor])
                                    update_cabin_door!false;
                            fi;
                            if
                                :: cabin_door_updated?false ->
                                    floor_request_made[dest] = false;
                                    served!true;
                                    printf("Main control: Request for floor %d served %d\n", dest, current_floor);
                            fi;
                            break;
                        :: dest > current_floor ->
                            current_floor = current_floor + 1;
                            printf("Main control: Going up to floor %d\n", current_floor);
                        :: dest < current_floor ->
                            current_floor = current_floor - 1;
                            printf("Main control: Going down to floor %d\n", current_floor);
                        :: else ->
                            // stop moving if direction is none
                            move!false;
                            break;
                    fi;
            od;
    od;
}




// request handler process. Remodel this process to serve M elevators!
active proctype req_handler() {
    byte dest;
    printf("Request handler started\n");
    do
        :: request?dest ->
            printf("Request handler: Received request for floor %d\n", dest);
            go!dest;
            printf("Request handler: Sent request for floor %d to main control\n", dest);
            served?true;
            printf("Request handler: Request for floor %d served\n", dest);
    od;
}



// request button associated to a floor i to request an elevator
active [N] proctype req_button() {
    printf("Request button for floor %d started\n", reqid);
    do
        :: !floor_request_made[reqid] ->
            atomic {
                assert(reqid >= 0 && reqid < N);
                printf("Request button for floor %d: Requesting elevator\n", reqid);
                request!reqid;
                floor_request_made[reqid] = true;
                printf("Request button for floor %d: Elevator requested\n", reqid);
            }
    od;
}

