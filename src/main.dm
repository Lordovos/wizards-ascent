world
	name = "Wizard's Ascent"
	fps = 40
	icon_size = 16
	view = "32x24"
	turf = /turf/default
	mob = /mob/player

atom/movable/Bump(atom/obstacle)
	..()
	obstacle?.Bumped(src)

atom/proc/Bumped(atom/movable/ref)
