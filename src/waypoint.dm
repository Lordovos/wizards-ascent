turf/waypoint
	icon_state = "waypoint"

turf/waypoint/Entered(atom/movable/ref)
	if (isplayer(ref))
		var/mob/player/p = ref
		var/turf/waypoint/previous_waypoint = game?.GetWaypointByName(p.last_waypoint)
		p.last_waypoint = src.name
		p.visited_waypoints |= src.name
		src.icon_state = "waypointactive"
		previous_waypoint.icon_state = "waypoint"
