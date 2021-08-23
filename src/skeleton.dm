mob/monster/skeleton
	icon_state = "skeleton"
	move_delay = 16
	turn_delay = 20

mob/monster/skeleton/Crossed(atom/movable/ref)
	if (isplayer(ref))
		var/mob/player/p = ref
		p.TakeDamage(1, src)
