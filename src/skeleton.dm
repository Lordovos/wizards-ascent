mob/monster/skeleton
	icon_state = "skeleton"
	move_delay = 16
	turn_delay = 20

mob/monster/skeleton/Crossed(atom/movable/ref)
	if (isplayer(ref))
		var/mob/player/p = ref
		p.TakeDamage(1, src)

mob/monster/skeleton/Cycle()
	set waitfor = FALSE

	while (src)
		var/obj/path/p = locate() in get_step(src, src.dir)

		if (p)
			step(src, src.dir)

		else
			sleep (world.tick_lag * src.turn_delay)
			var/list/possible_paths = list()
			var/turf/t = get_step(src, turn(src.dir, 90))

			if ((p = locate() in t))
				possible_paths += t

			t = get_step(src, turn(src.dir, -90))

			if ((p = locate() in t))
				possible_paths += t

			if (possible_paths.len > 0)
				t = pick(possible_paths)
				p = locate() in t

				if (p)
					src.dir = get_dir(src, p)

			else
				t = get_step(src, turn(src.dir, 180))
				p = locate() in t

				if (t)
					src.dir = get_dir(src, p)

		sleep (world.tick_lag * src.move_delay)
