/datum/map/torch
	name = "\improper Torch"
	full_name = "\improper SEV Torch"
	path = "torch"
	flags = MAP_HAS_BRANCH | MAP_HAS_RANK
	config_path = "config/torch_config.txt"

	admin_levels  = list(7)
	escape_levels = list(8)
	empty_levels  = list(9)
	accessible_z_levels = list("1"=1,"2"=3,"3"=1,"4"=1,"5"=1,"6"=1,"9"=30)
	overmap_size = 35
	overmap_event_areas = 34
	usable_email_tlds = list("torch.ec.scg", "torch.fleet.mil", "freemail.net", "torch.scg")

	allowed_spawns = list("Cryogenic Storage", "Cyborg Storage")
	default_spawn = "Cryogenic Storage"

	station_name  = "\improper СЭВ Факел"
	station_short = "\improper Факел"
	dock_name     = "ТБД"
	boss_name     = "Экспедиционное Коммандование"
	boss_short    = "Коммандование"
	company_name  = "Правительство Солнечной Системы"
	company_short = "СолГов"

	map_admin_faxes = list(
		"Expeditionary Corps Command",
		"Expeditionary Corps Logistics",
		"EXO Head Office",
		"EXO Internal Affairs",
		"SFP Territory Support",
		"SFP Special Investigations",
		"SFP Fugitive Recovery",
		"Sol Fleet Mars Commmand",
		"Bureau of Diplomatic Affairs",
		"Emergency Management Bureau",
		"Secure Routing Service"
	)

	//These should probably be moved into the evac controller...
	shuttle_docked_message = "Внимание персоналу: двигатель для светового прыжка заряжен, прыжок будет совершён через %ETD%."
	shuttle_leaving_dock = "Внимание персоналу: прыжок начат, приблизительное время выхода из подпространства %ETA%."
	shuttle_called_message = "Внимание персоналу: двигатель начал подготовку для прыжка, приблизительное время зарядки двигателя %ETA%."
	shuttle_recall_message = "Внимание персоналу: двигатель остановил подготовку для прыжка."

	evac_controller_type = /datum/evacuation_controller/starship

	default_law_type = /datum/ai_laws/solgov
	use_overmap = 1
	num_exoplanets = 1

	away_site_budget = 3
	min_offmap_players = 12

	id_hud_icons = 'maps/torch/icons/assignment_hud.dmi'
