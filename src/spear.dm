turf/trap/spear
	icon_state = "spear"
	delay = 8

turf/trap/spear/Entered(atom/movable/ref)
	if (isplayer(ref))
		var/mob/player/p = ref

		src.Activate()
		p.TakeDamage(1, src)
		sleep (src.delay)
		src.Deactivate()

turf/trap/spear/Activate()
	flick("spearactivating", src)
	src.icon_state = "spearactive"

turf/trap/spear/Deactivate()
	flick("speardeactivating", src)
	src.icon_state = "spear"
