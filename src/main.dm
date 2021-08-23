world
	name = "Wizard's Ascent"
	fps = 40
	icon_size = 16
	view = "32x24"
	turf = /turf/default
	mob = /mob/player

world/New()
	for (var/mob/monster/m in world)
		m.Cycle()

	for (var/turf/trap/spike/s in world)
		s.Cycle()

atom/movable/Bump(atom/obstacle)
	..()
	obstacle?.Bumped(src)

atom/proc/Bumped(atom/movable/ref)

proc/isplayer(atom/ref)
	return istype(ref, /mob/player)

proc/ismonster(atom/ref)
	return istype(ref, /mob/monster)

proc/istrap(atom/ref)
	return istype(ref, /turf/trap)
