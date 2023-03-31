	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* PROC :init: */

	case 3: // STATE 1
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 4: // STATE 2
		;
		((P5 *)_this)->elevator_nr = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 6: // STATE 4
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 7: // STATE 5
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 8: // STATE 6
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 9: // STATE 9
		;
		((P5 *)_this)->elevator_nr = trpt->bup.ovals[2];
		cabin_door_is_open[ Index(((P5 *)_this)->elevator_nr, 2) ] = trpt->bup.ovals[1];
		now.current_floor[ Index(((P5 *)_this)->elevator_nr, 2) ] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;

	case 10: // STATE 15
		;
		((P5 *)_this)->floor_nr = trpt->bup.ovals[1];
	/* 0 */	((P5 *)_this)->elevator_nr = trpt->bup.ovals[0];
		;
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 11: // STATE 15
		;
		((P5 *)_this)->floor_nr = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 13: // STATE 17
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 14: // STATE 18
		;
		((P5 *)_this)->floor_nr = trpt->bup.oval;
		;
		goto R999;

	case 15: // STATE 19
		;
	/* 0 */	((P5 *)_this)->floor_nr = trpt->bup.oval;
		;
		;
		goto R999;

	case 16: // STATE 25
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC req_button */
;
		;
		
	case 18: // STATE 2
		;
		_m = unsend(now.request);
		;
		goto R999;

	case 19: // STATE 3
		;
		now.floor_request_made[ Index(((P4 *)_this)->floor_nr, 4) ] = trpt->bup.oval;
		;
		goto R999;

	case 20: // STATE 8
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC req_handler */

	case 21: // STATE 1
		;
		XX = 1;
		unrecv(now.request, XX-1, 0, ((int)((P3 *)_this)->dest), 1);
		((P3 *)_this)->dest = trpt->bup.oval;
		;
		;
		goto R999;

	case 22: // STATE 3
		;
		((P3 *)_this)->current_elevator = trpt->bup.ovals[1];
	/* 0 */	((P3 *)_this)->current_elevator = trpt->bup.ovals[0];
		;
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 23: // STATE 8
		;
		_m = unsend(now.go[ Index(((int)((P3 *)_this)->current_elevator), 2) ]);
		;
		goto R999;

	case 24: // STATE 9
		;
		XX = 1;
		unrecv(now.served[ Index(((int)((P3 *)_this)->current_elevator), 2) ], XX-1, 0, 1, 1);
		;
		;
		goto R999;

	case 25: // STATE 10
		;
		((P3 *)_this)->current_elevator = trpt->bup.oval;
		;
		goto R999;

	case 26: // STATE 14
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC main_control */

	case 27: // STATE 1
		;
		XX = 1;
		unrecv(now.go[ Index(((int)((P2 *)_this)->elevator_id), 2) ], XX-1, 0, ((int)((P2 *)_this)->dest), 1);
		((P2 *)_this)->dest = trpt->bup.oval;
		;
		;
		goto R999;

	case 28: // STATE 2
		;
		_m = unsend(now.move[ Index(((int)((P2 *)_this)->elevator_id), 2) ]);
		;
		goto R999;

	case 29: // STATE 3
		;
		XX = 1;
		unrecv(now.floor_reached[ Index(((int)((P2 *)_this)->elevator_id), 2) ], XX-1, 0, 1, 1);
		;
		;
		goto R999;
;
		;
		
	case 31: // STATE 5
		;
		_m = unsend(now.move[ Index(((int)((P2 *)_this)->elevator_id), 2) ]);
		;
		goto R999;

	case 32: // STATE 6
		;
		_m = unsend(now.update_cabin_door[ Index(((int)((P2 *)_this)->elevator_id), 2) ]);
		;
		goto R999;

	case 33: // STATE 7
		;
		XX = 1;
		unrecv(now.cabin_door_updated[ Index(((int)((P2 *)_this)->elevator_id), 2) ], XX-1, 0, 1, 1);
		;
		;
		goto R999;

	case 34: // STATE 8
		;
		_m = unsend(now.update_cabin_door[ Index(((int)((P2 *)_this)->elevator_id), 2) ]);
		;
		goto R999;

	case 35: // STATE 11
		;
		XX = 1;
		unrecv(now.cabin_door_updated[ Index(((int)((P2 *)_this)->elevator_id), 2) ], XX-1, 0, 0, 1);
		;
		;
		goto R999;

	case 36: // STATE 12
		;
		now.floor_request_made[ Index(((P2 *)_this)->dest, 4) ] = trpt->bup.oval;
		;
		goto R999;

	case 37: // STATE 13
		;
		_m = unsend(now.served[ Index(((int)((P2 *)_this)->elevator_id), 2) ]);
		;
		goto R999;

	case 38: // STATE 14
		;
		direction[ Index(((P2 *)_this)->elevator_id, 2) ] = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 40: // STATE 19
		;
		now.current_floor[ Index(((P2 *)_this)->elevator_id, 2) ] = trpt->bup.oval;
		;
		goto R999;

	case 41: // STATE 20
		;
		direction[ Index(((P2 *)_this)->elevator_id, 2) ] = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 43: // STATE 22
		;
		now.current_floor[ Index(((P2 *)_this)->elevator_id, 2) ] = trpt->bup.oval;
		;
		goto R999;

	case 44: // STATE 23
		;
		direction[ Index(((P2 *)_this)->elevator_id, 2) ] = trpt->bup.oval;
		;
		goto R999;

	case 45: // STATE 25
		;
		_m = unsend(now.move[ Index(((int)((P2 *)_this)->elevator_id), 2) ]);
		;
		goto R999;

	case 46: // STATE 35
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC elevator_engine */

	case 47: // STATE 1
		;
		XX = 1;
		unrecv(now.move[ Index(((int)((P1 *)_this)->elevator_id), 2) ], XX-1, 0, 1, 1);
		;
		;
		goto R999;

	case 48: // STATE 2
		;
		XX = 1;
		unrecv(now.move[ Index(((int)((P1 *)_this)->elevator_id), 2) ], XX-1, 0, 0, 1);
		;
		;
		goto R999;

	case 49: // STATE 4
		;
		_m = unsend(now.floor_reached[ Index(((int)((P1 *)_this)->elevator_id), 2) ]);
		;
		goto R999;

	case 50: // STATE 11
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC cabin_door */

	case 51: // STATE 1
		;
		XX = 1;
		unrecv(now.update_cabin_door[ Index(((int)((P0 *)_this)->elevator_id), 2) ], XX-1, 0, 1, 1);
		;
		;
		goto R999;

	case 52: // STATE 2
		;
		now.elevator[ Index(((P0 *)_this)->elevator_id, 2) ].door_open[ Index(now.current_floor[ Index(((P0 *)_this)->elevator_id, 2) ], 4) ] = trpt->bup.oval;
		;
		goto R999;

	case 53: // STATE 3
		;
		cabin_door_is_open[ Index(((P0 *)_this)->elevator_id, 2) ] = trpt->bup.oval;
		;
		goto R999;

	case 54: // STATE 4
		;
		_m = unsend(now.cabin_door_updated[ Index(((int)((P0 *)_this)->elevator_id), 2) ]);
		;
		goto R999;

	case 55: // STATE 5
		;
		XX = 1;
		unrecv(now.update_cabin_door[ Index(((int)((P0 *)_this)->elevator_id), 2) ], XX-1, 0, 0, 1);
		;
		;
		goto R999;

	case 56: // STATE 6
		;
		cabin_door_is_open[ Index(((P0 *)_this)->elevator_id, 2) ] = trpt->bup.oval;
		;
		goto R999;

	case 57: // STATE 7
		;
		now.elevator[ Index(((P0 *)_this)->elevator_id, 2) ].door_open[ Index(now.current_floor[ Index(((P0 *)_this)->elevator_id, 2) ], 4) ] = trpt->bup.oval;
		;
		goto R999;

	case 58: // STATE 8
		;
		_m = unsend(now.cabin_door_updated[ Index(((int)((P0 *)_this)->elevator_id), 2) ]);
		;
		goto R999;

	case 59: // STATE 12
		;
		p_restor(II);
		;
		;
		goto R999;
	}

