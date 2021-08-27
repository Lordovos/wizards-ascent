obj/door
	icon = 'assets/tileset.dmi'
	icon_state = "door"
	density = TRUE

obj/door/Bumped(atom/movable/ref)
	if (isplayer(ref))
		var/mob/player/p = ref

		if (locate(/obj/item/key) in p)
			src.loc = null
