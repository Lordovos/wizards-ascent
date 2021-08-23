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

mob/monster/skeleton
	icon_state = "skeleton"
	move_delay = 16
	turn_delay = 20

mob/monster/blade
	icon_state = "blade"
	move_delay = 8
	turn_delay = 40
	turn_dir = 180
