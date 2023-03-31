#define rand	pan_rand
#define pthread_equal(a,b)	((a)==(b))
#if defined(HAS_CODE) && defined(VERBOSE)
	#ifdef BFS_PAR
		bfs_printf("Pr: %d Tr: %d\n", II, t->forw);
	#else
		cpu_printf("Pr: %d Tr: %d\n", II, t->forw);
	#endif
#endif
	switch (t->forw) {
	default: Uerror("bad forward move");
	case 0:	/* if without executable clauses */
		continue;
	case 1: /* generic 'goto' or 'skip' */
		IfNotBlocked
		_m = 3; goto P999;
	case 2: /* generic 'else' */
		IfNotBlocked
		if (trpt->o_pm&1) continue;
		_m = 3; goto P999;

		 /* PROC :init: */
	case 3: // STATE 1 - multi-j.pml:153 - [(run req_handler())] (0:0:0 - 1)
		IfNotBlocked
		reached[5][1] = 1;
		if (!(addproc(II, 1, 3, 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 4: // STATE 2 - multi-j.pml:154 - [elevator_nr = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[5][2] = 1;
		(trpt+1)->bup.oval = ((int)((P5 *)_this)->elevator_nr);
		((P5 *)_this)->elevator_nr = 0;
#ifdef VAR_RANGES
		logval(":init::elevator_nr", ((int)((P5 *)_this)->elevator_nr));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 5: // STATE 3 - multi-j.pml:157 - [((elevator_nr<5))] (0:0:0 - 1)
		IfNotBlocked
		reached[5][3] = 1;
		if (!((((int)((P5 *)_this)->elevator_nr)<5)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 6: // STATE 4 - multi-j.pml:158 - [(run cabin_door(elevator_nr))] (0:0:0 - 1)
		IfNotBlocked
		reached[5][4] = 1;
		if (!(addproc(II, 1, 0, ((int)((P5 *)_this)->elevator_nr))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 7: // STATE 5 - multi-j.pml:159 - [(run elevator_engine(elevator_nr))] (0:0:0 - 1)
		IfNotBlocked
		reached[5][5] = 1;
		if (!(addproc(II, 1, 1, ((int)((P5 *)_this)->elevator_nr))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 8: // STATE 6 - multi-j.pml:160 - [(run main_control(elevator_nr))] (0:0:0 - 1)
		IfNotBlocked
		reached[5][6] = 1;
		if (!(addproc(II, 1, 2, ((int)((P5 *)_this)->elevator_nr))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 9: // STATE 7 - multi-j.pml:161 - [current_floor[elevator_nr] = 0] (0:12:3 - 1)
		IfNotBlocked
		reached[5][7] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)now.current_floor[ Index(((int)((P5 *)_this)->elevator_nr), 5) ]);
		now.current_floor[ Index(((P5 *)_this)->elevator_nr, 5) ] = 0;
#ifdef VAR_RANGES
		logval("current_floor[:init::elevator_nr]", ((int)now.current_floor[ Index(((int)((P5 *)_this)->elevator_nr), 5) ]));
#endif
		;
		/* merge: cabin_door_is_open[elevator_nr] = 0(12, 8, 12) */
		reached[5][8] = 1;
		(trpt+1)->bup.ovals[1] = ((int)cabin_door_is_open[ Index(((int)((P5 *)_this)->elevator_nr), 5) ]);
		cabin_door_is_open[ Index(((P5 *)_this)->elevator_nr, 5) ] = 0;
#ifdef VAR_RANGES
		logval("cabin_door_is_open[:init::elevator_nr]", ((int)cabin_door_is_open[ Index(((int)((P5 *)_this)->elevator_nr), 5) ]));
#endif
		;
		/* merge: elevator_nr = (elevator_nr+1)(12, 9, 12) */
		reached[5][9] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P5 *)_this)->elevator_nr);
		((P5 *)_this)->elevator_nr = (((int)((P5 *)_this)->elevator_nr)+1);
#ifdef VAR_RANGES
		logval(":init::elevator_nr", ((int)((P5 *)_this)->elevator_nr));
#endif
		;
		/* merge: .(goto)(0, 13, 12) */
		reached[5][13] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 10: // STATE 10 - multi-j.pml:165 - [((elevator_nr==5))] (21:0:2 - 1)
		IfNotBlocked
		reached[5][10] = 1;
		if (!((((int)((P5 *)_this)->elevator_nr)==5)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: elevator_nr */  (trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P5 *)_this)->elevator_nr;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P5 *)_this)->elevator_nr = 0;
		/* merge: goto :b7(21, 11, 21) */
		reached[5][11] = 1;
		;
		/* merge: floor_nr = 0(21, 15, 21) */
		reached[5][15] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P5 *)_this)->floor_nr);
		((P5 *)_this)->floor_nr = 0;
#ifdef VAR_RANGES
		logval(":init::floor_nr", ((int)((P5 *)_this)->floor_nr));
#endif
		;
		/* merge: .(goto)(0, 22, 21) */
		reached[5][22] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 11: // STATE 15 - multi-j.pml:167 - [floor_nr = 0] (0:21:1 - 3)
		IfNotBlocked
		reached[5][15] = 1;
		(trpt+1)->bup.oval = ((int)((P5 *)_this)->floor_nr);
		((P5 *)_this)->floor_nr = 0;
#ifdef VAR_RANGES
		logval(":init::floor_nr", ((int)((P5 *)_this)->floor_nr));
#endif
		;
		/* merge: .(goto)(0, 22, 21) */
		reached[5][22] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 12: // STATE 16 - multi-j.pml:170 - [((floor_nr<2))] (0:0:0 - 1)
		IfNotBlocked
		reached[5][16] = 1;
		if (!((((int)((P5 *)_this)->floor_nr)<2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 13: // STATE 17 - multi-j.pml:171 - [(run req_button(floor_nr))] (0:0:0 - 1)
		IfNotBlocked
		reached[5][17] = 1;
		if (!(addproc(II, 1, 4, ((int)((P5 *)_this)->floor_nr))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 14: // STATE 18 - multi-j.pml:172 - [floor_nr = (floor_nr+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[5][18] = 1;
		(trpt+1)->bup.oval = ((int)((P5 *)_this)->floor_nr);
		((P5 *)_this)->floor_nr = (((int)((P5 *)_this)->floor_nr)+1);
#ifdef VAR_RANGES
		logval(":init::floor_nr", ((int)((P5 *)_this)->floor_nr));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 15: // STATE 19 - multi-j.pml:173 - [((floor_nr==2))] (23:0:1 - 1)
		IfNotBlocked
		reached[5][19] = 1;
		if (!((((int)((P5 *)_this)->floor_nr)==2)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: floor_nr */  (trpt+1)->bup.oval = ((P5 *)_this)->floor_nr;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P5 *)_this)->floor_nr = 0;
		/* merge: goto :b8(0, 20, 23) */
		reached[5][20] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 16: // STATE 25 - multi-j.pml:176 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[5][25] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC req_button */
	case 17: // STATE 1 - multi-j.pml:142 - [(!(floor_request_made[floor_nr]))] (0:0:0 - 1)
		IfNotBlocked
		reached[4][1] = 1;
		if (!( !(((int)now.floor_request_made[ Index(((int)((P4 *)_this)->floor_nr), 2) ]))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 18: // STATE 2 - multi-j.pml:144 - [request!floor_nr] (0:0:0 - 1)
		IfNotBlocked
		reached[4][2] = 1;
		if (q_full(now.request))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.request);
		sprintf(simtmp, "%d", ((int)((P4 *)_this)->floor_nr)); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.request, 0, ((int)((P4 *)_this)->floor_nr), 1);
		if (q_zero(now.request)) { boq = now.request; };
		_m = 2; goto P999; /* 0 */
	case 19: // STATE 3 - multi-j.pml:145 - [floor_request_made[floor_nr] = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[4][3] = 1;
		(trpt+1)->bup.oval = ((int)now.floor_request_made[ Index(((int)((P4 *)_this)->floor_nr), 2) ]);
		now.floor_request_made[ Index(((P4 *)_this)->floor_nr, 2) ] = 1;
#ifdef VAR_RANGES
		logval("floor_request_made[req_button:floor_nr]", ((int)now.floor_request_made[ Index(((int)((P4 *)_this)->floor_nr), 2) ]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 20: // STATE 8 - multi-j.pml:148 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[4][8] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC req_handler */
	case 21: // STATE 1 - multi-j.pml:127 - [request?dest] (0:0:1 - 1)
		reached[3][1] = 1;
		if (q_zero(now.request))
		{	if (boq != now.request) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.request) == 0) continue;

		XX=1;
		(trpt+1)->bup.oval = ((int)((P3 *)_this)->dest);
		;
		((P3 *)_this)->dest = qrecv(now.request, XX-1, 0, 1);
#ifdef VAR_RANGES
		logval("req_handler:dest", ((int)((P3 *)_this)->dest));
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.request);
			sprintf(simtmp, "%d", ((int)((P3 *)_this)->dest)); strcat(simvals, simtmp);
		}
#endif
		if (q_zero(now.request))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 22: // STATE 2 - multi-j.pml:129 - [((current_elevator==5))] (8:0:2 - 1)
		IfNotBlocked
		reached[3][2] = 1;
		if (!((((int)((P3 *)_this)->current_elevator)==5)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: current_elevator */  (trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P3 *)_this)->current_elevator;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P3 *)_this)->current_elevator = 0;
		/* merge: current_elevator = 0(0, 3, 8) */
		reached[3][3] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P3 *)_this)->current_elevator);
		((P3 *)_this)->current_elevator = 0;
#ifdef VAR_RANGES
		logval("req_handler:current_elevator", ((int)((P3 *)_this)->current_elevator));
#endif
		;
		/* merge: .(goto)(0, 7, 8) */
		reached[3][7] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 23: // STATE 8 - multi-j.pml:133 - [go[current_elevator]!dest] (0:0:0 - 3)
		IfNotBlocked
		reached[3][8] = 1;
		if (q_full(now.go[ Index(((int)((P3 *)_this)->current_elevator), 5) ]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.go[ Index(((int)((P3 *)_this)->current_elevator), 5) ]);
		sprintf(simtmp, "%d", ((int)((P3 *)_this)->dest)); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.go[ Index(((int)((P3 *)_this)->current_elevator), 5) ], 0, ((int)((P3 *)_this)->dest), 1);
		if (q_zero(now.go[ Index(((int)((P3 *)_this)->current_elevator), 5) ])) { boq = now.go[ Index(((int)((P3 *)_this)->current_elevator), 5) ]; };
		_m = 2; goto P999; /* 0 */
	case 24: // STATE 9 - multi-j.pml:134 - [served[current_elevator]?1] (0:0:0 - 1)
		reached[3][9] = 1;
		if (q_zero(now.served[ Index(((int)((P3 *)_this)->current_elevator), 5) ]))
		{	if (boq != now.served[ Index(((int)((P3 *)_this)->current_elevator), 5) ]) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.served[ Index(((int)((P3 *)_this)->current_elevator), 5) ]) == 0) continue;

		XX=1;
		if (1 != qrecv(now.served[ Index(((int)((P3 *)_this)->current_elevator), 5) ], 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.served[ Index(((int)((P3 *)_this)->current_elevator), 5) ]-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.served[ Index(((int)((P3 *)_this)->current_elevator), 5) ], XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.served[ Index(((int)((P3 *)_this)->current_elevator), 5) ]);
			sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);
		}
#endif
		if (q_zero(now.served[ Index(((int)((P3 *)_this)->current_elevator), 5) ]))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 25: // STATE 10 - multi-j.pml:135 - [current_elevator = (current_elevator+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[3][10] = 1;
		(trpt+1)->bup.oval = ((int)((P3 *)_this)->current_elevator);
		((P3 *)_this)->current_elevator = (((int)((P3 *)_this)->current_elevator)+1);
#ifdef VAR_RANGES
		logval("req_handler:current_elevator", ((int)((P3 *)_this)->current_elevator));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 26: // STATE 14 - multi-j.pml:137 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[3][14] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC main_control */
	case 27: // STATE 1 - multi-j.pml:86 - [go[elevator_id]?dest] (0:0:1 - 1)
		reached[2][1] = 1;
		if (q_zero(now.go[ Index(((int)((P2 *)_this)->elevator_id), 5) ]))
		{	if (boq != now.go[ Index(((int)((P2 *)_this)->elevator_id), 5) ]) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.go[ Index(((int)((P2 *)_this)->elevator_id), 5) ]) == 0) continue;

		XX=1;
		(trpt+1)->bup.oval = ((int)((P2 *)_this)->dest);
		;
		((P2 *)_this)->dest = qrecv(now.go[ Index(((int)((P2 *)_this)->elevator_id), 5) ], XX-1, 0, 1);
#ifdef VAR_RANGES
		logval("main_control:dest", ((int)((P2 *)_this)->dest));
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.go[ Index(((int)((P2 *)_this)->elevator_id), 5) ]);
			sprintf(simtmp, "%d", ((int)((P2 *)_this)->dest)); strcat(simvals, simtmp);
		}
#endif
		if (q_zero(now.go[ Index(((int)((P2 *)_this)->elevator_id), 5) ]))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 28: // STATE 2 - multi-j.pml:87 - [move[elevator_id]!1] (0:0:0 - 1)
		IfNotBlocked
		reached[2][2] = 1;
		if (q_full(now.move[ Index(((int)((P2 *)_this)->elevator_id), 5) ]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.move[ Index(((int)((P2 *)_this)->elevator_id), 5) ]);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.move[ Index(((int)((P2 *)_this)->elevator_id), 5) ], 0, 1, 1);
		if (q_zero(now.move[ Index(((int)((P2 *)_this)->elevator_id), 5) ])) { boq = now.move[ Index(((int)((P2 *)_this)->elevator_id), 5) ]; };
		_m = 2; goto P999; /* 0 */
	case 29: // STATE 3 - multi-j.pml:90 - [floor_reached[elevator_id]?1] (0:0:0 - 1)
		reached[2][3] = 1;
		if (q_zero(now.floor_reached[ Index(((int)((P2 *)_this)->elevator_id), 5) ]))
		{	if (boq != now.floor_reached[ Index(((int)((P2 *)_this)->elevator_id), 5) ]) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.floor_reached[ Index(((int)((P2 *)_this)->elevator_id), 5) ]) == 0) continue;

		XX=1;
		if (1 != qrecv(now.floor_reached[ Index(((int)((P2 *)_this)->elevator_id), 5) ], 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.floor_reached[ Index(((int)((P2 *)_this)->elevator_id), 5) ]-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.floor_reached[ Index(((int)((P2 *)_this)->elevator_id), 5) ], XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.floor_reached[ Index(((int)((P2 *)_this)->elevator_id), 5) ]);
			sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);
		}
#endif
		if (q_zero(now.floor_reached[ Index(((int)((P2 *)_this)->elevator_id), 5) ]))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 30: // STATE 4 - multi-j.pml:92 - [((current_floor[elevator_id]==dest))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][4] = 1;
		if (!((((int)now.current_floor[ Index(((int)((P2 *)_this)->elevator_id), 5) ])==((int)((P2 *)_this)->dest))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 31: // STATE 5 - multi-j.pml:93 - [move[elevator_id]!0] (0:0:0 - 1)
		IfNotBlocked
		reached[2][5] = 1;
		if (q_full(now.move[ Index(((int)((P2 *)_this)->elevator_id), 5) ]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.move[ Index(((int)((P2 *)_this)->elevator_id), 5) ]);
		sprintf(simtmp, "%d", 0); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.move[ Index(((int)((P2 *)_this)->elevator_id), 5) ], 0, 0, 1);
		if (q_zero(now.move[ Index(((int)((P2 *)_this)->elevator_id), 5) ])) { boq = now.move[ Index(((int)((P2 *)_this)->elevator_id), 5) ]; };
		_m = 2; goto P999; /* 0 */
	case 32: // STATE 6 - multi-j.pml:94 - [update_cabin_door[elevator_id]!1] (0:0:0 - 1)
		IfNotBlocked
		reached[2][6] = 1;
		if (q_full(now.update_cabin_door[ Index(((int)((P2 *)_this)->elevator_id), 5) ]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.update_cabin_door[ Index(((int)((P2 *)_this)->elevator_id), 5) ]);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.update_cabin_door[ Index(((int)((P2 *)_this)->elevator_id), 5) ], 0, 1, 1);
		if (q_zero(now.update_cabin_door[ Index(((int)((P2 *)_this)->elevator_id), 5) ])) { boq = now.update_cabin_door[ Index(((int)((P2 *)_this)->elevator_id), 5) ]; };
		_m = 2; goto P999; /* 0 */
	case 33: // STATE 7 - multi-j.pml:96 - [cabin_door_updated[elevator_id]?1] (0:0:0 - 1)
		reached[2][7] = 1;
		if (q_zero(now.cabin_door_updated[ Index(((int)((P2 *)_this)->elevator_id), 5) ]))
		{	if (boq != now.cabin_door_updated[ Index(((int)((P2 *)_this)->elevator_id), 5) ]) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.cabin_door_updated[ Index(((int)((P2 *)_this)->elevator_id), 5) ]) == 0) continue;

		XX=1;
		if (1 != qrecv(now.cabin_door_updated[ Index(((int)((P2 *)_this)->elevator_id), 5) ], 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.cabin_door_updated[ Index(((int)((P2 *)_this)->elevator_id), 5) ]-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.cabin_door_updated[ Index(((int)((P2 *)_this)->elevator_id), 5) ], XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.cabin_door_updated[ Index(((int)((P2 *)_this)->elevator_id), 5) ]);
			sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);
		}
#endif
		if (q_zero(now.cabin_door_updated[ Index(((int)((P2 *)_this)->elevator_id), 5) ]))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 34: // STATE 8 - multi-j.pml:97 - [update_cabin_door[elevator_id]!0] (0:0:0 - 1)
		IfNotBlocked
		reached[2][8] = 1;
		if (q_full(now.update_cabin_door[ Index(((int)((P2 *)_this)->elevator_id), 5) ]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.update_cabin_door[ Index(((int)((P2 *)_this)->elevator_id), 5) ]);
		sprintf(simtmp, "%d", 0); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.update_cabin_door[ Index(((int)((P2 *)_this)->elevator_id), 5) ], 0, 0, 1);
		if (q_zero(now.update_cabin_door[ Index(((int)((P2 *)_this)->elevator_id), 5) ])) { boq = now.update_cabin_door[ Index(((int)((P2 *)_this)->elevator_id), 5) ]; };
		_m = 2; goto P999; /* 0 */
	case 35: // STATE 11 - multi-j.pml:100 - [cabin_door_updated[elevator_id]?0] (0:0:0 - 1)
		reached[2][11] = 1;
		if (q_zero(now.cabin_door_updated[ Index(((int)((P2 *)_this)->elevator_id), 5) ]))
		{	if (boq != now.cabin_door_updated[ Index(((int)((P2 *)_this)->elevator_id), 5) ]) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.cabin_door_updated[ Index(((int)((P2 *)_this)->elevator_id), 5) ]) == 0) continue;

		XX=1;
		if (0 != qrecv(now.cabin_door_updated[ Index(((int)((P2 *)_this)->elevator_id), 5) ], 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.cabin_door_updated[ Index(((int)((P2 *)_this)->elevator_id), 5) ]-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.cabin_door_updated[ Index(((int)((P2 *)_this)->elevator_id), 5) ], XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.cabin_door_updated[ Index(((int)((P2 *)_this)->elevator_id), 5) ]);
			sprintf(simtmp, "%d", 0); strcat(simvals, simtmp);
		}
#endif
		if (q_zero(now.cabin_door_updated[ Index(((int)((P2 *)_this)->elevator_id), 5) ]))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 36: // STATE 12 - multi-j.pml:101 - [floor_request_made[dest] = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[2][12] = 1;
		(trpt+1)->bup.oval = ((int)now.floor_request_made[ Index(((int)((P2 *)_this)->dest), 2) ]);
		now.floor_request_made[ Index(((P2 *)_this)->dest, 2) ] = 0;
#ifdef VAR_RANGES
		logval("floor_request_made[main_control:dest]", ((int)now.floor_request_made[ Index(((int)((P2 *)_this)->dest), 2) ]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 37: // STATE 13 - multi-j.pml:102 - [served[elevator_id]!1] (0:0:0 - 1)
		IfNotBlocked
		reached[2][13] = 1;
		if (q_full(now.served[ Index(((int)((P2 *)_this)->elevator_id), 5) ]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.served[ Index(((int)((P2 *)_this)->elevator_id), 5) ]);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.served[ Index(((int)((P2 *)_this)->elevator_id), 5) ], 0, 1, 1);
		if (q_zero(now.served[ Index(((int)((P2 *)_this)->elevator_id), 5) ])) { boq = now.served[ Index(((int)((P2 *)_this)->elevator_id), 5) ]; };
		_m = 2; goto P999; /* 0 */
	case 38: // STATE 14 - multi-j.pml:104 - [direction[elevator_id] = none] (0:0:1 - 1)
		IfNotBlocked
		reached[2][14] = 1;
		(trpt+1)->bup.oval = direction[ Index(((int)((P2 *)_this)->elevator_id), 5) ];
		direction[ Index(((P2 *)_this)->elevator_id, 5) ] = 1;
#ifdef VAR_RANGES
		logval("direction[main_control:elevator_id]", direction[ Index(((int)((P2 *)_this)->elevator_id), 5) ]);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 39: // STATE 18 - multi-j.pml:107 - [((dest>current_floor[elevator_id]))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][18] = 1;
		if (!((((int)((P2 *)_this)->dest)>((int)now.current_floor[ Index(((int)((P2 *)_this)->elevator_id), 5) ]))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 40: // STATE 19 - multi-j.pml:108 - [current_floor[elevator_id] = (current_floor[elevator_id]+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[2][19] = 1;
		(trpt+1)->bup.oval = ((int)now.current_floor[ Index(((int)((P2 *)_this)->elevator_id), 5) ]);
		now.current_floor[ Index(((P2 *)_this)->elevator_id, 5) ] = (((int)now.current_floor[ Index(((int)((P2 *)_this)->elevator_id), 5) ])+1);
#ifdef VAR_RANGES
		logval("current_floor[main_control:elevator_id]", ((int)now.current_floor[ Index(((int)((P2 *)_this)->elevator_id), 5) ]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 41: // STATE 20 - multi-j.pml:109 - [direction[elevator_id] = up] (0:0:1 - 1)
		IfNotBlocked
		reached[2][20] = 1;
		(trpt+1)->bup.oval = direction[ Index(((int)((P2 *)_this)->elevator_id), 5) ];
		direction[ Index(((P2 *)_this)->elevator_id, 5) ] = 2;
#ifdef VAR_RANGES
		logval("direction[main_control:elevator_id]", direction[ Index(((int)((P2 *)_this)->elevator_id), 5) ]);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 42: // STATE 21 - multi-j.pml:110 - [((dest<current_floor[elevator_id]))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][21] = 1;
		if (!((((int)((P2 *)_this)->dest)<((int)now.current_floor[ Index(((int)((P2 *)_this)->elevator_id), 5) ]))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 43: // STATE 22 - multi-j.pml:111 - [current_floor[elevator_id] = (current_floor[elevator_id]-1)] (0:0:1 - 1)
		IfNotBlocked
		reached[2][22] = 1;
		(trpt+1)->bup.oval = ((int)now.current_floor[ Index(((int)((P2 *)_this)->elevator_id), 5) ]);
		now.current_floor[ Index(((P2 *)_this)->elevator_id, 5) ] = (((int)now.current_floor[ Index(((int)((P2 *)_this)->elevator_id), 5) ])-1);
#ifdef VAR_RANGES
		logval("current_floor[main_control:elevator_id]", ((int)now.current_floor[ Index(((int)((P2 *)_this)->elevator_id), 5) ]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 44: // STATE 23 - multi-j.pml:112 - [direction[elevator_id] = down] (0:0:1 - 1)
		IfNotBlocked
		reached[2][23] = 1;
		(trpt+1)->bup.oval = direction[ Index(((int)((P2 *)_this)->elevator_id), 5) ];
		direction[ Index(((P2 *)_this)->elevator_id, 5) ] = 3;
#ifdef VAR_RANGES
		logval("direction[main_control:elevator_id]", direction[ Index(((int)((P2 *)_this)->elevator_id), 5) ]);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 45: // STATE 25 - multi-j.pml:115 - [move[elevator_id]!0] (0:0:0 - 1)
		IfNotBlocked
		reached[2][25] = 1;
		if (q_full(now.move[ Index(((int)((P2 *)_this)->elevator_id), 5) ]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.move[ Index(((int)((P2 *)_this)->elevator_id), 5) ]);
		sprintf(simtmp, "%d", 0); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.move[ Index(((int)((P2 *)_this)->elevator_id), 5) ], 0, 0, 1);
		if (q_zero(now.move[ Index(((int)((P2 *)_this)->elevator_id), 5) ])) { boq = now.move[ Index(((int)((P2 *)_this)->elevator_id), 5) ]; };
		_m = 2; goto P999; /* 0 */
	case 46: // STATE 35 - multi-j.pml:120 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[2][35] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC elevator_engine */
	case 47: // STATE 1 - multi-j.pml:74 - [move[elevator_id]?1] (0:0:0 - 1)
		reached[1][1] = 1;
		if (q_zero(now.move[ Index(((int)((P1 *)_this)->elevator_id), 5) ]))
		{	if (boq != now.move[ Index(((int)((P1 *)_this)->elevator_id), 5) ]) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.move[ Index(((int)((P1 *)_this)->elevator_id), 5) ]) == 0) continue;

		XX=1;
		if (1 != qrecv(now.move[ Index(((int)((P1 *)_this)->elevator_id), 5) ], 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.move[ Index(((int)((P1 *)_this)->elevator_id), 5) ]-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.move[ Index(((int)((P1 *)_this)->elevator_id), 5) ], XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.move[ Index(((int)((P1 *)_this)->elevator_id), 5) ]);
			sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);
		}
#endif
		if (q_zero(now.move[ Index(((int)((P1 *)_this)->elevator_id), 5) ]))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 48: // STATE 2 - multi-j.pml:76 - [move[elevator_id]?0] (0:0:0 - 1)
		reached[1][2] = 1;
		if (q_zero(now.move[ Index(((int)((P1 *)_this)->elevator_id), 5) ]))
		{	if (boq != now.move[ Index(((int)((P1 *)_this)->elevator_id), 5) ]) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.move[ Index(((int)((P1 *)_this)->elevator_id), 5) ]) == 0) continue;

		XX=1;
		if (0 != qrecv(now.move[ Index(((int)((P1 *)_this)->elevator_id), 5) ], 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.move[ Index(((int)((P1 *)_this)->elevator_id), 5) ]-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.move[ Index(((int)((P1 *)_this)->elevator_id), 5) ], XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.move[ Index(((int)((P1 *)_this)->elevator_id), 5) ]);
			sprintf(simtmp, "%d", 0); strcat(simvals, simtmp);
		}
#endif
		if (q_zero(now.move[ Index(((int)((P1 *)_this)->elevator_id), 5) ]))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 49: // STATE 4 - multi-j.pml:77 - [floor_reached[elevator_id]!1] (0:0:0 - 1)
		IfNotBlocked
		reached[1][4] = 1;
		if (q_full(now.floor_reached[ Index(((int)((P1 *)_this)->elevator_id), 5) ]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.floor_reached[ Index(((int)((P1 *)_this)->elevator_id), 5) ]);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.floor_reached[ Index(((int)((P1 *)_this)->elevator_id), 5) ], 0, 1, 1);
		if (q_zero(now.floor_reached[ Index(((int)((P1 *)_this)->elevator_id), 5) ])) { boq = now.floor_reached[ Index(((int)((P1 *)_this)->elevator_id), 5) ]; };
		_m = 2; goto P999; /* 0 */
	case 50: // STATE 11 - multi-j.pml:80 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][11] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC cabin_door */
	case 51: // STATE 1 - multi-j.pml:60 - [update_cabin_door[elevator_id]?1] (0:0:0 - 1)
		reached[0][1] = 1;
		if (q_zero(now.update_cabin_door[ Index(((int)((P0 *)_this)->elevator_id), 5) ]))
		{	if (boq != now.update_cabin_door[ Index(((int)((P0 *)_this)->elevator_id), 5) ]) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.update_cabin_door[ Index(((int)((P0 *)_this)->elevator_id), 5) ]) == 0) continue;

		XX=1;
		if (1 != qrecv(now.update_cabin_door[ Index(((int)((P0 *)_this)->elevator_id), 5) ], 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.update_cabin_door[ Index(((int)((P0 *)_this)->elevator_id), 5) ]-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.update_cabin_door[ Index(((int)((P0 *)_this)->elevator_id), 5) ], XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.update_cabin_door[ Index(((int)((P0 *)_this)->elevator_id), 5) ]);
			sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);
		}
#endif
		if (q_zero(now.update_cabin_door[ Index(((int)((P0 *)_this)->elevator_id), 5) ]))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 52: // STATE 2 - multi-j.pml:61 - [elevator[elevator_id].door_open[current_floor[elevator_id]] = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[0][2] = 1;
		(trpt+1)->bup.oval = ((int)now.elevator[ Index(((int)((P0 *)_this)->elevator_id), 5) ].door_open[ Index(((int)now.current_floor[ Index(((int)((P0 *)_this)->elevator_id), 5) ]), 2) ]);
		now.elevator[ Index(((P0 *)_this)->elevator_id, 5) ].door_open[ Index(now.current_floor[ Index(((P0 *)_this)->elevator_id, 5) ], 2) ] = 1;
#ifdef VAR_RANGES
		logval("elevator[cabin_door:elevator_id].door_open[current_floor[cabin_door:elevator_id]]", ((int)now.elevator[ Index(((int)((P0 *)_this)->elevator_id), 5) ].door_open[ Index(((int)now.current_floor[ Index(((int)((P0 *)_this)->elevator_id), 5) ]), 2) ]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 53: // STATE 3 - multi-j.pml:62 - [cabin_door_is_open[elevator_id] = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[0][3] = 1;
		(trpt+1)->bup.oval = ((int)cabin_door_is_open[ Index(((int)((P0 *)_this)->elevator_id), 5) ]);
		cabin_door_is_open[ Index(((P0 *)_this)->elevator_id, 5) ] = 1;
#ifdef VAR_RANGES
		logval("cabin_door_is_open[cabin_door:elevator_id]", ((int)cabin_door_is_open[ Index(((int)((P0 *)_this)->elevator_id), 5) ]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 54: // STATE 4 - multi-j.pml:63 - [cabin_door_updated[elevator_id]!1] (0:0:0 - 1)
		IfNotBlocked
		reached[0][4] = 1;
		if (q_full(now.cabin_door_updated[ Index(((int)((P0 *)_this)->elevator_id), 5) ]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.cabin_door_updated[ Index(((int)((P0 *)_this)->elevator_id), 5) ]);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.cabin_door_updated[ Index(((int)((P0 *)_this)->elevator_id), 5) ], 0, 1, 1);
		if (q_zero(now.cabin_door_updated[ Index(((int)((P0 *)_this)->elevator_id), 5) ])) { boq = now.cabin_door_updated[ Index(((int)((P0 *)_this)->elevator_id), 5) ]; };
		_m = 2; goto P999; /* 0 */
	case 55: // STATE 5 - multi-j.pml:64 - [update_cabin_door[elevator_id]?0] (0:0:0 - 1)
		reached[0][5] = 1;
		if (q_zero(now.update_cabin_door[ Index(((int)((P0 *)_this)->elevator_id), 5) ]))
		{	if (boq != now.update_cabin_door[ Index(((int)((P0 *)_this)->elevator_id), 5) ]) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.update_cabin_door[ Index(((int)((P0 *)_this)->elevator_id), 5) ]) == 0) continue;

		XX=1;
		if (0 != qrecv(now.update_cabin_door[ Index(((int)((P0 *)_this)->elevator_id), 5) ], 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.update_cabin_door[ Index(((int)((P0 *)_this)->elevator_id), 5) ]-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.update_cabin_door[ Index(((int)((P0 *)_this)->elevator_id), 5) ], XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.update_cabin_door[ Index(((int)((P0 *)_this)->elevator_id), 5) ]);
			sprintf(simtmp, "%d", 0); strcat(simvals, simtmp);
		}
#endif
		if (q_zero(now.update_cabin_door[ Index(((int)((P0 *)_this)->elevator_id), 5) ]))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 56: // STATE 6 - multi-j.pml:65 - [cabin_door_is_open[elevator_id] = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[0][6] = 1;
		(trpt+1)->bup.oval = ((int)cabin_door_is_open[ Index(((int)((P0 *)_this)->elevator_id), 5) ]);
		cabin_door_is_open[ Index(((P0 *)_this)->elevator_id, 5) ] = 0;
#ifdef VAR_RANGES
		logval("cabin_door_is_open[cabin_door:elevator_id]", ((int)cabin_door_is_open[ Index(((int)((P0 *)_this)->elevator_id), 5) ]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 57: // STATE 7 - multi-j.pml:66 - [elevator[elevator_id].door_open[current_floor[elevator_id]] = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[0][7] = 1;
		(trpt+1)->bup.oval = ((int)now.elevator[ Index(((int)((P0 *)_this)->elevator_id), 5) ].door_open[ Index(((int)now.current_floor[ Index(((int)((P0 *)_this)->elevator_id), 5) ]), 2) ]);
		now.elevator[ Index(((P0 *)_this)->elevator_id, 5) ].door_open[ Index(now.current_floor[ Index(((P0 *)_this)->elevator_id, 5) ], 2) ] = 0;
#ifdef VAR_RANGES
		logval("elevator[cabin_door:elevator_id].door_open[current_floor[cabin_door:elevator_id]]", ((int)now.elevator[ Index(((int)((P0 *)_this)->elevator_id), 5) ].door_open[ Index(((int)now.current_floor[ Index(((int)((P0 *)_this)->elevator_id), 5) ]), 2) ]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 58: // STATE 8 - multi-j.pml:67 - [cabin_door_updated[elevator_id]!0] (0:0:0 - 1)
		IfNotBlocked
		reached[0][8] = 1;
		if (q_full(now.cabin_door_updated[ Index(((int)((P0 *)_this)->elevator_id), 5) ]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.cabin_door_updated[ Index(((int)((P0 *)_this)->elevator_id), 5) ]);
		sprintf(simtmp, "%d", 0); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.cabin_door_updated[ Index(((int)((P0 *)_this)->elevator_id), 5) ], 0, 0, 1);
		if (q_zero(now.cabin_door_updated[ Index(((int)((P0 *)_this)->elevator_id), 5) ])) { boq = now.cabin_door_updated[ Index(((int)((P0 *)_this)->elevator_id), 5) ]; };
		_m = 2; goto P999; /* 0 */
	case 59: // STATE 12 - multi-j.pml:69 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][12] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */
	case  _T5:	/* np_ */
		if (!((!(trpt->o_pm&4) && !(trpt->tau&128))))
			continue;
		/* else fall through */
	case  _T2:	/* true */
		_m = 3; goto P999;
#undef rand
	}

