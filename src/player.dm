mob/player
	icon = 'assets/player.dmi'
	icon_state = "default"
	pixel_y = 4

	var/health
	var/max_health
	var/tmp/is_invulnerable = FALSE
	var/last_waypoint
	var/list/visited_waypoints
	var/tmp/can_move = TRUE
	var/move_delay = 2.72 / 2
	var/tmp/last_step = -1#INF
	var/tmp/next_step = -1#INF

	proc/Heal(n)
	proc/TakeDamage(n, atom/ref)
	proc/Death(atom/ref)
	proc/Step(d)

mob/player/Stat()
	stat("health / max_health", "[src.health] / [src.max_health]")

mob/player/Login()
	..()
	world << "Hello, world!"
	winshow(src, "debug", TRUE)
	src.max_health = 3
	src.health = src.max_health
	src.last_waypoint = "start"
	src.visited_waypoints = list()

mob/player/Move(newloc, d)
	if (!src.can_move)
		return FALSE

	if (d & (d - 1))
		return FALSE

	return ..()

mob/player/Crossed(atom/movable/ref)
	if (ismonster(ref))
		var/mob/monster/m = ref

		src.TakeDamage(1, m)

mob/player/Heal(n)
	src.health = clamp(src.health + n, 0, src.max_health)

mob/player/TakeDamage(n, atom/ref)
	src.health = clamp(src.health - n, 0, src.max_health)

	if (src.health <= 0)
		src.Death(ref)

mob/player/Death(atom/ref)
	world << "player was killed by [ref.name]"

mob/player/Step(d)
	if (src.next_step - world.time >= world.tick_lag / 10)
		return FALSE

	src.glide_size = 16 / src.move_delay * world.tick_lag

	if (step(src, d))
		src.last_step = world.time
		src.next_step = src.last_step + src.move_delay
		return TRUE

	return FALSE
