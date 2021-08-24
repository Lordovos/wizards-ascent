game
	var/collected_orbs
	var/total_orbs
	var/list/waypoints

	proc/GetWaypointByName(t)
		for (var/turf/waypoint/wp in src.waypoints)
			if (wp.name == t)
				return wp

game/New()
	src.collected_orbs = 0

	for (var/obj/item/green_orb/go in world)
		src.total_orbs++

	src.waypoints = list()

	for (var/turf/waypoint/wp in world)
		src.waypoints += wp

	for (var/mob/monster/m in world)
		m.Cycle()

	for (var/turf/trap/spike/s in world)
		s.Cycle()
