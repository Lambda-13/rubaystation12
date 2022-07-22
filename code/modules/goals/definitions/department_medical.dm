/datum/department/medbay
	name = "Medbay"
	name_ru_department = "Мед Отсек"
	flag = MED
	goals = list(
		/datum/goal/department/medical_fatalities
	)

/datum/goal/department/medical_fatalities
	var/max_fatalities

/datum/goal/department/medical_fatalities/New()
	max_fatalities = rand(3,5)
	..()

/datum/goal/department/medical_fatalities/update_strings()
	description = "Не допустите смерть более [max_fatalities] [max_fatalities == 1 ? "члена" : "членов"] экипажа."

/datum/goal/department/medical_fatalities/get_summary_value()
	return " (всего [GLOB.crew_death_count] смертей)"

/datum/goal/department/medical_fatalities/check_success()
	return GLOB.crew_death_count <= max_fatalities




// End the shift with % suit sensors set to at least trackers
// Perform an autopsy
