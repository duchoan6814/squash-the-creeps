extends Label

var score = 0;

func on_mob_squashed():
	score += 1
	text = "Score: %s" % score
