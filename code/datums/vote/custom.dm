/datum/vote/custom
	name = "custom vote"
	var/abort = 0 // Lets us exit the vote setup due to bad input, etc.

/datum/vote/custom/can_run(mob/creator, automatic)
	if(automatic)
		return FALSE
	if(!isadmin(creator))
		return FALSE
	if(abort)
		return FALSE
	return ..()

/datum/vote/custom/setup_vote(mob/creator, automatic)
	question = sanitizeSafe(input(creator,"За что голосуем?") as text|null)
	if(!question)
		abort = 1
		return
	for(var/i=1,i<=10,i++)
		var/option = capitalize(sanitizeSafe(input(creator,"Выбери вариант ответа или оставь строку пустой для начала голосования") as text|null))
		if(!option || !creator.client)
			break
		choices += option
	if(!length(choices))
		abort = 1
		return
	result_length = length(choices)
	..()
