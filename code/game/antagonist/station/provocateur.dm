GLOBAL_DATUM_INIT(provocateurs, /datum/antagonist/provocateur, new)

/datum/antagonist/provocateur
	id = MODE_MISC_AGITATOR
	role_text = "дейтерантагонист"
	role_text_plural = "Deuteragonists"
	antaghud_indicator = "hud_traitor"
	flags = ANTAG_RANDOM_EXCEPTED
	antag_text = "Эта роль означает, что вы должны свободно преследовать свои цели, даже если они противоречат %WORLD_NAME%, но вы не антагонист и не должны вести себя так. Постарайтесь быть разумным и не убивать и не взрывать вещи!"
	welcome_text = "Друг и злодей в одном лице..."
	blacklisted_jobs = list()
	skill_setter = null
	min_player_age = 0

	var/antag_text_updated

/datum/antagonist/provocateur/get_antag_text(mob/recipient)
	if (!antag_text_updated)
		antag_text = replacetext(antag_text, "%WORLD_NAME%", station_name())
		antag_text_updated = TRUE
	return antag_text
