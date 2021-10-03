local gesture = require("gesture")

gesture.register({
	name = "create vertical split",
	inputs = { gesture.down(), gesture.right(), gesture.up() },
	action = "vsplit",
})

gesture.register({
	name = "create horizontal split",
	inputs = { gesture.up(), gesture.right(), gesture.down() },
	action = "split",
})

gesture.register({
	name = "close the current window",
	inputs = { gesture.left(), gesture.down(), gesture.right() },
	action = "q",
})

gesture.register({
	name = "scroll to the top",
	inputs = { gesture.up() },
	action = "normal! gg",
})

gesture.register({
	name = "scroll to the bottom",
	inputs = { gesture.down() },
	action = "normal! G",
})
