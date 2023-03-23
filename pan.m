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

		 /* PROC req_button */
	case 3: // STATE 1 - sec_env.pml:142 - [(!(floor_request_made[(_pid-4)]))] (0:0:0 - 1)
		IfNotBlocked
		reached[4][1] = 1;
		if (!( !(((int)now.floor_request_made[ Index((((int)((P4 *)_this)->_pid)-4), 4) ]))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 4: // STATE 2 - sec_env.pml:144 - [request!(_pid-4)] (0:0:0 - 1)
		IfNotBlocked
		reached[4][2] = 1;
		if (q_full(now.request))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.request);
		sprintf(simtmp, "%d", (((int)((P4 *)_this)->_pid)-4)); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.request, 0, (((int)((P4 *)_this)->_pid)-4), 1);
		if (q_zero(now.request)) { boq = now.request; };
		_m = 2; goto P999; /* 0 */
	case 5: // STATE 3 - sec_env.pml:145 - [floor_request_made[(_pid-4)] = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[4][3] = 1;
		(trpt+1)->bup.oval = ((int)now.floor_request_made[ Index((((int)((P4 *)_this)->_pid)-4), 4) ]);
		now.floor_request_made[ Index((((P4 *)_this)->_pid-4), 4) ] = 1;
#ifdef VAR_RANGES
		logval("floor_request_made[(_pid-4)]", ((int)now.floor_request_made[ Index((((int)((P4 *)_this)->_pid)-4), 4) ]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 6: // STATE 8 - sec_env.pml:148 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[4][8] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC req_handler */
	case 7: // STATE 1 - sec_env.pml:133 - [request?dest] (0:0:1 - 1)
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
	case 8: // STATE 2 - sec_env.pml:134 - [go!dest] (0:0:0 - 1)
		IfNotBlocked
		reached[3][2] = 1;
		if (q_full(now.go))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.go);
		sprintf(simtmp, "%d", ((int)((P3 *)_this)->dest)); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.go, 0, ((int)((P3 *)_this)->dest), 1);
		if (q_zero(now.go)) { boq = now.go; };
		_m = 2; goto P999; /* 0 */
	case 9: // STATE 3 - sec_env.pml:135 - [served?1] (0:0:0 - 1)
		reached[3][3] = 1;
		if (q_zero(now.served))
		{	if (boq != now.served) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.served) == 0) continue;

		XX=1;
		if (1 != qrecv(now.served, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.served-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.served, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.served);
			sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);
		}
#endif
		if (q_zero(now.served))
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
	case 10: // STATE 7 - sec_env.pml:137 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[3][7] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC main_control */
	case 11: // STATE 1 - sec_env.pml:69 - [go?dest] (0:0:1 - 1)
		reached[2][1] = 1;
		if (q_zero(now.go))
		{	if (boq != now.go) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.go) == 0) continue;

		XX=1;
		(trpt+1)->bup.oval = ((int)((P2 *)_this)->dest);
		;
		((P2 *)_this)->dest = qrecv(now.go, XX-1, 0, 1);
#ifdef VAR_RANGES
		logval("main_control:dest", ((int)((P2 *)_this)->dest));
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.go);
			sprintf(simtmp, "%d", ((int)((P2 *)_this)->dest)); strcat(simvals, simtmp);
		}
#endif
		if (q_zero(now.go))
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
	case 12: // STATE 2 - sec_env.pml:70 - [move!1] (0:0:0 - 1)
		IfNotBlocked
		reached[2][2] = 1;
		if (q_full(now.move))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.move);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.move, 0, 1, 1);
		if (q_zero(now.move)) { boq = now.move; };
		_m = 2; goto P999; /* 0 */
	case 13: // STATE 3 - sec_env.pml:73 - [((dest>current_floor))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][3] = 1;
		if (!((((int)((P2 *)_this)->dest)>((int)now.current_floor))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 14: // STATE 4 - sec_env.pml:76 - [floor_reached?1] (0:0:0 - 1)
		reached[2][4] = 1;
		if (q_zero(now.floor_reached))
		{	if (boq != now.floor_reached) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.floor_reached) == 0) continue;

		XX=1;
		if (1 != qrecv(now.floor_reached, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.floor_reached-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.floor_reached, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.floor_reached);
			sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);
		}
#endif
		if (q_zero(now.floor_reached))
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
	case 15: // STATE 5 - sec_env.pml:77 - [current_floor = (current_floor+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[2][5] = 1;
		(trpt+1)->bup.oval = ((int)now.current_floor);
		now.current_floor = (((int)now.current_floor)+1);
#ifdef VAR_RANGES
		logval("current_floor", ((int)now.current_floor));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 16: // STATE 6 - sec_env.pml:80 - [((current_floor==dest))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][6] = 1;
		if (!((((int)now.current_floor)==((int)((P2 *)_this)->dest))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 17: // STATE 7 - sec_env.pml:81 - [move!0] (0:0:0 - 1)
		IfNotBlocked
		reached[2][7] = 1;
		if (q_full(now.move))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.move);
		sprintf(simtmp, "%d", 0); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.move, 0, 0, 1);
		if (q_zero(now.move)) { boq = now.move; };
		_m = 2; goto P999; /* 0 */
	case 18: // STATE 8 - sec_env.pml:82 - [update_cabin_door!1] (0:0:0 - 1)
		IfNotBlocked
		reached[2][8] = 1;
		if (q_full(now.update_cabin_door))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.update_cabin_door);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.update_cabin_door, 0, 1, 1);
		if (q_zero(now.update_cabin_door)) { boq = now.update_cabin_door; };
		_m = 2; goto P999; /* 0 */
	case 19: // STATE 9 - sec_env.pml:84 - [cabin_door_updated?1] (0:0:0 - 1)
		reached[2][9] = 1;
		if (q_zero(now.cabin_door_updated))
		{	if (boq != now.cabin_door_updated) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.cabin_door_updated) == 0) continue;

		XX=1;
		if (1 != qrecv(now.cabin_door_updated, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.cabin_door_updated-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.cabin_door_updated, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.cabin_door_updated);
			sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);
		}
#endif
		if (q_zero(now.cabin_door_updated))
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
	case 20: // STATE 10 - sec_env.pml:85 - [update_cabin_door!0] (0:0:0 - 1)
		IfNotBlocked
		reached[2][10] = 1;
		if (q_full(now.update_cabin_door))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.update_cabin_door);
		sprintf(simtmp, "%d", 0); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.update_cabin_door, 0, 0, 1);
		if (q_zero(now.update_cabin_door)) { boq = now.update_cabin_door; };
		_m = 2; goto P999; /* 0 */
	case 21: // STATE 13 - sec_env.pml:88 - [cabin_door_updated?0] (0:0:0 - 1)
		reached[2][13] = 1;
		if (q_zero(now.cabin_door_updated))
		{	if (boq != now.cabin_door_updated) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.cabin_door_updated) == 0) continue;

		XX=1;
		if (0 != qrecv(now.cabin_door_updated, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.cabin_door_updated-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.cabin_door_updated, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.cabin_door_updated);
			sprintf(simtmp, "%d", 0); strcat(simvals, simtmp);
		}
#endif
		if (q_zero(now.cabin_door_updated))
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
	case 22: // STATE 14 - sec_env.pml:89 - [floor_request_made[dest] = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[2][14] = 1;
		(trpt+1)->bup.oval = ((int)now.floor_request_made[ Index(((int)((P2 *)_this)->dest), 4) ]);
		now.floor_request_made[ Index(((P2 *)_this)->dest, 4) ] = 0;
#ifdef VAR_RANGES
		logval("floor_request_made[main_control:dest]", ((int)now.floor_request_made[ Index(((int)((P2 *)_this)->dest), 4) ]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 23: // STATE 15 - sec_env.pml:90 - [served!1] (0:0:0 - 1)
		IfNotBlocked
		reached[2][15] = 1;
		if (q_full(now.served))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.served);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.served, 0, 1, 1);
		if (q_zero(now.served)) { boq = now.served; };
		_m = 2; goto P999; /* 0 */
	case 24: // STATE 26 - sec_env.pml:97 - [((dest<current_floor))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][26] = 1;
		if (!((((int)((P2 *)_this)->dest)<((int)now.current_floor))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 25: // STATE 27 - sec_env.pml:99 - [floor_reached?1] (0:0:0 - 1)
		reached[2][27] = 1;
		if (q_zero(now.floor_reached))
		{	if (boq != now.floor_reached) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.floor_reached) == 0) continue;

		XX=1;
		if (1 != qrecv(now.floor_reached, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.floor_reached-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.floor_reached, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.floor_reached);
			sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);
		}
#endif
		if (q_zero(now.floor_reached))
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
	case 26: // STATE 28 - sec_env.pml:100 - [current_floor = (current_floor-1)] (0:0:1 - 1)
		IfNotBlocked
		reached[2][28] = 1;
		(trpt+1)->bup.oval = ((int)now.current_floor);
		now.current_floor = (((int)now.current_floor)-1);
#ifdef VAR_RANGES
		logval("current_floor", ((int)now.current_floor));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 27: // STATE 29 - sec_env.pml:103 - [((current_floor==dest))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][29] = 1;
		if (!((((int)now.current_floor)==((int)((P2 *)_this)->dest))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 28: // STATE 30 - sec_env.pml:104 - [move!0] (0:0:0 - 1)
		IfNotBlocked
		reached[2][30] = 1;
		if (q_full(now.move))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.move);
		sprintf(simtmp, "%d", 0); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.move, 0, 0, 1);
		if (q_zero(now.move)) { boq = now.move; };
		_m = 2; goto P999; /* 0 */
	case 29: // STATE 31 - sec_env.pml:105 - [update_cabin_door!1] (0:0:0 - 1)
		IfNotBlocked
		reached[2][31] = 1;
		if (q_full(now.update_cabin_door))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.update_cabin_door);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.update_cabin_door, 0, 1, 1);
		if (q_zero(now.update_cabin_door)) { boq = now.update_cabin_door; };
		_m = 2; goto P999; /* 0 */
	case 30: // STATE 32 - sec_env.pml:107 - [cabin_door_updated?1] (0:0:0 - 1)
		reached[2][32] = 1;
		if (q_zero(now.cabin_door_updated))
		{	if (boq != now.cabin_door_updated) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.cabin_door_updated) == 0) continue;

		XX=1;
		if (1 != qrecv(now.cabin_door_updated, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.cabin_door_updated-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.cabin_door_updated, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.cabin_door_updated);
			sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);
		}
#endif
		if (q_zero(now.cabin_door_updated))
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
	case 31: // STATE 33 - sec_env.pml:108 - [update_cabin_door!0] (0:0:0 - 1)
		IfNotBlocked
		reached[2][33] = 1;
		if (q_full(now.update_cabin_door))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.update_cabin_door);
		sprintf(simtmp, "%d", 0); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.update_cabin_door, 0, 0, 1);
		if (q_zero(now.update_cabin_door)) { boq = now.update_cabin_door; };
		_m = 2; goto P999; /* 0 */
	case 32: // STATE 36 - sec_env.pml:111 - [cabin_door_updated?0] (0:0:0 - 1)
		reached[2][36] = 1;
		if (q_zero(now.cabin_door_updated))
		{	if (boq != now.cabin_door_updated) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.cabin_door_updated) == 0) continue;

		XX=1;
		if (0 != qrecv(now.cabin_door_updated, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.cabin_door_updated-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.cabin_door_updated, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.cabin_door_updated);
			sprintf(simtmp, "%d", 0); strcat(simvals, simtmp);
		}
#endif
		if (q_zero(now.cabin_door_updated))
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
	case 33: // STATE 37 - sec_env.pml:112 - [floor_request_made[dest] = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[2][37] = 1;
		(trpt+1)->bup.oval = ((int)now.floor_request_made[ Index(((int)((P2 *)_this)->dest), 4) ]);
		now.floor_request_made[ Index(((P2 *)_this)->dest, 4) ] = 0;
#ifdef VAR_RANGES
		logval("floor_request_made[main_control:dest]", ((int)now.floor_request_made[ Index(((int)((P2 *)_this)->dest), 4) ]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 34: // STATE 38 - sec_env.pml:113 - [served!1] (0:0:0 - 1)
		IfNotBlocked
		reached[2][38] = 1;
		if (q_full(now.served))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.served);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.served, 0, 1, 1);
		if (q_zero(now.served)) { boq = now.served; };
		_m = 2; goto P999; /* 0 */
	case 35: // STATE 54 - sec_env.pml:127 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[2][54] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC elevator_engine */
	case 36: // STATE 1 - sec_env.pml:56 - [move?1] (0:0:0 - 1)
		reached[1][1] = 1;
		if (q_zero(now.move))
		{	if (boq != now.move) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.move) == 0) continue;

		XX=1;
		if (1 != qrecv(now.move, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.move-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.move, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.move);
			sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);
		}
#endif
		if (q_zero(now.move))
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
	case 37: // STATE 2 - sec_env.pml:58 - [move?0] (0:0:0 - 1)
		reached[1][2] = 1;
		if (q_zero(now.move))
		{	if (boq != now.move) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.move) == 0) continue;

		XX=1;
		if (0 != qrecv(now.move, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.move-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.move, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.move);
			sprintf(simtmp, "%d", 0); strcat(simvals, simtmp);
		}
#endif
		if (q_zero(now.move))
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
	case 38: // STATE 4 - sec_env.pml:59 - [floor_reached!1] (0:0:0 - 1)
		IfNotBlocked
		reached[1][4] = 1;
		if (q_full(now.floor_reached))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.floor_reached);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.floor_reached, 0, 1, 1);
		if (q_zero(now.floor_reached)) { boq = now.floor_reached; };
		_m = 2; goto P999; /* 0 */
	case 39: // STATE 11 - sec_env.pml:62 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][11] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC cabin_door */
	case 40: // STATE 1 - sec_env.pml:42 - [update_cabin_door?1] (0:0:0 - 1)
		reached[0][1] = 1;
		if (q_zero(now.update_cabin_door))
		{	if (boq != now.update_cabin_door) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.update_cabin_door) == 0) continue;

		XX=1;
		if (1 != qrecv(now.update_cabin_door, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.update_cabin_door-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.update_cabin_door, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.update_cabin_door);
			sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);
		}
#endif
		if (q_zero(now.update_cabin_door))
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
	case 41: // STATE 2 - sec_env.pml:43 - [floor_door_is_open[current_floor] = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[0][2] = 1;
		(trpt+1)->bup.oval = ((int)floor_door_is_open[ Index(((int)now.current_floor), 4) ]);
		floor_door_is_open[ Index(now.current_floor, 4) ] = 1;
#ifdef VAR_RANGES
		logval("floor_door_is_open[current_floor]", ((int)floor_door_is_open[ Index(((int)now.current_floor), 4) ]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 42: // STATE 3 - sec_env.pml:44 - [cabin_door_is_open = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[0][3] = 1;
		(trpt+1)->bup.oval = ((int)cabin_door_is_open);
		cabin_door_is_open = 1;
#ifdef VAR_RANGES
		logval("cabin_door_is_open", ((int)cabin_door_is_open));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 43: // STATE 4 - sec_env.pml:45 - [cabin_door_updated!1] (0:0:0 - 1)
		IfNotBlocked
		reached[0][4] = 1;
		if (q_full(now.cabin_door_updated))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.cabin_door_updated);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.cabin_door_updated, 0, 1, 1);
		if (q_zero(now.cabin_door_updated)) { boq = now.cabin_door_updated; };
		_m = 2; goto P999; /* 0 */
	case 44: // STATE 5 - sec_env.pml:46 - [update_cabin_door?0] (0:0:0 - 1)
		reached[0][5] = 1;
		if (q_zero(now.update_cabin_door))
		{	if (boq != now.update_cabin_door) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.update_cabin_door) == 0) continue;

		XX=1;
		if (0 != qrecv(now.update_cabin_door, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.update_cabin_door-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.update_cabin_door, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.update_cabin_door);
			sprintf(simtmp, "%d", 0); strcat(simvals, simtmp);
		}
#endif
		if (q_zero(now.update_cabin_door))
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
	case 45: // STATE 6 - sec_env.pml:47 - [cabin_door_is_open = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[0][6] = 1;
		(trpt+1)->bup.oval = ((int)cabin_door_is_open);
		cabin_door_is_open = 0;
#ifdef VAR_RANGES
		logval("cabin_door_is_open", ((int)cabin_door_is_open));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 46: // STATE 7 - sec_env.pml:48 - [floor_door_is_open[current_floor] = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[0][7] = 1;
		(trpt+1)->bup.oval = ((int)floor_door_is_open[ Index(((int)now.current_floor), 4) ]);
		floor_door_is_open[ Index(now.current_floor, 4) ] = 0;
#ifdef VAR_RANGES
		logval("floor_door_is_open[current_floor]", ((int)floor_door_is_open[ Index(((int)now.current_floor), 4) ]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 47: // STATE 8 - sec_env.pml:49 - [cabin_door_updated!0] (0:0:0 - 1)
		IfNotBlocked
		reached[0][8] = 1;
		if (q_full(now.cabin_door_updated))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.cabin_door_updated);
		sprintf(simtmp, "%d", 0); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.cabin_door_updated, 0, 0, 1);
		if (q_zero(now.cabin_door_updated)) { boq = now.cabin_door_updated; };
		_m = 2; goto P999; /* 0 */
	case 48: // STATE 12 - sec_env.pml:51 - [-end-] (0:0:0 - 1)
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

