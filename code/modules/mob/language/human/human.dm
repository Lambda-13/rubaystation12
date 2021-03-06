//base human language
/datum/language/human
	name = "proto-sapien"
	desc = "Древний язык кодеров."
	speech_verb = "говорит"
	whisper_verb = "шепчет"
	colour = "solcom"
	flags = WHITELISTED
	shorthand = "???"
	space_chance = 40
	category = /datum/language/human

/datum/language/human/get_spoken_verb(var/msg_end)
	switch(msg_end)
		if("!")
			return pick("восклицает","кричит","орёт")
		if("?")
			return ask_verb
	return speech_verb

/datum/language/human/get_random_name(var/gender)
	if (prob(80))
		if(gender==FEMALE)
			return capitalize(pick(GLOB.first_names_female)) + " " + capitalize(pick(GLOB.last_names))
		else
			return capitalize(pick(GLOB.first_names_male)) + " " + capitalize(pick(GLOB.last_names))
	else
		return ..()
