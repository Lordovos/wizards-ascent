mob/monster
	icon = 'assets/monsters.dmi'
	pixel_y = 4
	density = FALSE

	var/move_delay
	var/turn_delay
	var/turn_dir

	proc/Cycle()

mob/monster/New()
	src.glide_size = 16 / src.move_delay
	return ..()
