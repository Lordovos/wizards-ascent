obj/block
	icon = 'assets/tileset.dmi'
	icon_state = "block"
	density = TRUE

obj/block/Bumped(atom/movable/ref)
	if (isplayer(ref))
		step(src, ref.dir)
