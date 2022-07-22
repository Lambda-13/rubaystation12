

/datum/department/science
	name = "Science"
	name_ru_department = "РнД"
	flag = SCI
	goals = list(/datum/goal/department/extract_slime_cores)

/datum/goal/department/extract_slime_cores
	var/min_cores

/datum/goal/department/extract_slime_cores/New()
	min_cores = rand(7,20)
	..()

/datum/goal/department/extract_slime_cores/update_strings()
	description = "Извлеките не менее [min_cores] ядер слаймов за смену."

/datum/goal/department/extract_slime_cores/get_summary_value()
	return " (всего [GLOB.extracted_slime_cores_amount] ядер слаймов извлечено)"

/datum/goal/department/extract_slime_cores/check_success()
	return (GLOB.extracted_slime_cores_amount >= min_cores)

// Personal:
	// xenobio: finish a round without being attacked by a slime
	// explorer: name an alien species, plant a flag on an undiscovered world

/datum/goal/achievement/notslimefodder
	success = TRUE
	failable = TRUE
	description = "Сегодня ты особенно осторожен. Не позволяйте слаймам съесть вас."
	failure_message = "Вы чувствуете себя склизким и несчастным."
