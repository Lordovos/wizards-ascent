turf/trap/spike
	icon_state = "spike"
	delay = list(10, 40)

turf/trap/spike/Entered(atom/movable/ref)
	if (src.is_active && isplayer(ref))
		var/mob/player/p = ref
		p.TakeDamage(1, src)

turf/trap/spike/Cycle()
	set waitfor = FALSE

	while (src)
		src.Activate()
		sleep (src.delay[1])
		src.Deactivate()
		sleep (src.delay[2])

turf/trap/spike/Activate()
	flick("spikeactivating", src)
	src.icon_state = "spikeactive"
	src.is_active = TRUE

	var/mob/player/p = locate() in src

	if (p)
		p.TakeDamage(1, src)

turf/trap/spike/Deactivate()
	flick("spikedeactivating", src)
	src.icon_state = "spike"
	src.is_active = FALSE
