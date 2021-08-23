mob/monster/blade
	icon_state = "blade"
	move_delay = 8
	turn_delay = 40
	turn_dir = 180

mob/monster/blade/Crossed(atom/movable/ref)
	if (isplayer(ref))
		var/mob/player/p = ref
		p.TakeDamage(1, src)

mob/monster/blade/Cycle()
	set waitfor = FALSE

	while (src)
		var/obj/path/p = locate() in get_step(src, src.dir)

		if (p)
			step(src, src.dir)

		else
			sleep (world.tick_lag * src.turn_delay)
			src.dir = turn(src.dir, src.turn_dir)

		sleep (world.tick_lag * src.move_delay)
