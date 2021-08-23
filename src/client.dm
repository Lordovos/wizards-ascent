client
	var/move_dir = 0
	var/mob/player/player

	proc/MoveLoop()

	verb/OnMoveKey(d as num, state as num)

client/New()
	. = ..()

	if (.)
		src.player = src.mob
		src.MoveLoop()

client/Move(newloc, d)
	walk(src.player, 0)
	return src.player.Step(d)

client/MoveLoop()
	set waitfor = FALSE

	while (src)
		if (src.move_dir)
			src.Move(null, src.move_dir)

		sleep (world.tick_lag)

client/OnMoveKey(d as num, state as num)
	set instant = TRUE
	set hidden = TRUE

	if (state)
		src.move_dir = d

	else if (src.move_dir == d)
		src.move_dir = 0
