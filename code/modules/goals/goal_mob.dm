/mob/proc/has_personal_goal(var/goal_type)
	if(mind) return locate(goal_type) in mind.goals

/mob/proc/update_personal_goal(var/goal_type, var/progress)
	var/datum/goal/goal = has_personal_goal(goal_type)
	if(goal)
		goal.update_progress(progress)

/mob/verb/show_goals_verb()

	set name = "Show Goals"
	set desc = "Показывает цели."
	set category = "IC"

	show_goals(TRUE, TRUE)

/mob/proc/show_goals(var/show_success = FALSE, var/allow_modification = FALSE)

	if(!mind)
		to_chat(src, SPAN_WARNING("Ты слишком туп для целей."))
		return

	var/max_goals = 5
	var/datum/department/dept
	if(mind.assigned_job)
		max_goals = mind.assigned_job.max_goals
		if(mind.assigned_job.department_flag && SSgoals.departments["[mind.assigned_job.department_flag]"])
			dept = SSgoals.departments["[mind.assigned_job.department_flag]"]

	//No goals to display
	if(!(allow_modification || LAZYLEN(mind.goals)) && !(dept && LAZYLEN(dept.goals)))
		return

	var/pref_val = get_preference_value(/datum/client_preference/give_personal_goals)
	var/prefs_no_personal_goals = pref_val == GLOB.PREF_NEVER || (pref_val == GLOB.PREF_NON_ANTAG && player_is_antag(mind))
	to_chat(src, "<hr>")
	if(LAZYLEN(mind.goals))
		to_chat(src, SPAN_NOTICE("<font size = 2><b>Это не цели антагонистов, это личные цели.</b><br>)"))
		to_chat(src, SPAN_NOTICE("<font size = 3><b>В этом раунде у вас есть следующие личные цели:</b></font><br>[jointext(mind.summarize_goals(show_success, allow_modification, mind.current), "<br>")]"))
	else if(prefs_no_personal_goals)
		to_chat(src, SPAN_NOTICE("<font size = 3><b>Ваши предпочтения не позволяют иметь личных целей.</b></font>"))
	else
		to_chat(src, SPAN_NOTICE("<font size = 3><b>У вас нет личных целей в этом раунде.</b></font>"))
	if(allow_modification && !prefs_no_personal_goals && LAZYLEN(mind.goals) < max_goals)
		to_chat(src, SPAN_NOTICE("<a href='?src=\ref[mind];add_goal=1;add_goal_caller=\ref[mind.current]'>Добавить рандомные личные цели</a>"))
	if(dept && get_preference_value(/datum/client_preference/show_department_goals) == GLOB.PREF_SHOW)
		if(LAZYLEN(dept.goals))
			to_chat(src, SPAN_NOTICE("<br><br><font size = 3><b>В эту смену [dept.name_ru_department] поставило следующие цели:</b></font><br>[jointext(dept.summarize_goals(show_success), "<br>")]"))
		else
			to_chat(src, SPAN_NOTICE("<br><br><font size = 3><b>В эту смену [dept.name_ru_department] решило отдохнуть.</b></font>"))

	if(LAZYLEN(mind.goals))
		to_chat(mind.current, SPAN_NOTICE("<br><br>Ты можешь проверить свои личные цели нажав на кнопку <b>Show Goals</b>."))

	to_chat(src, "<hr>")
