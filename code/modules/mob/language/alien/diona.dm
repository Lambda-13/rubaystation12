/datum/language/diona
	name = LANGUAGE_ROOTLOCAL
	desc = "Сложный язык, инстинктивно известный Dionaea, на котором «говорят», излучая модулированные радиоволны. Эта версия использует высокочастотные волны для быстрой связи на коротких дистанциях."
	speech_verb = "creaks and rustles"
	ask_verb = "creaks"
	exclaim_verb = "rustles"
	colour = "soghun"
	key = "q"
	flags = RESTRICTED
	syllables = list("hs","zt","kr","st","sh")
	shorthand = "RT"
	machine_understands = FALSE

/datum/language/diona/get_random_name()
	var/new_name = "[pick(list("To Sleep Beneath","Wind Over","Embrace of","Dreams of","Witnessing","To Walk Beneath","Approaching the"))]"
	new_name += " [pick(list("the Void","the Sky","Encroaching Night","Planetsong","Starsong","the Wandering Star","the Empty Day","Daybreak","Nightfall","the Rain"))]"
	return new_name

/datum/language/diona/global
	name = LANGUAGE_ROOTGLOBAL
	desc = "Сложный язык, инстинктивно известный Dionaea, на котором «говорят», излучая модулированные радиоволны. В этой версии используются низкочастотные волны для медленной связи на больших расстояниях."
	key = "w"
	flags = RESTRICTED | HIVEMIND
	shorthand = "N/A"
