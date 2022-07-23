/datum/design/circuit
	build_type = IMPRINTER
	req_tech = list(TECH_DATA = 2)
	materials = list(MATERIAL_PLASTIC = 1000, MATERIAL_ALUMINIUM = 1000)
	chemicals = list(/datum/reagent/acid = 20)
	time = 5

/datum/design/circuit/AssembleDesignName()
	..()
	if(build_path)
		var/obj/item/stock_parts/circuitboard/C = build_path
		if(initial(C.board_type) == "machine")
			name = "Схемоплата машины ([item_name])"
		else if(initial(C.board_type) == "computer")
			name = "Схемоплата консоли ([item_name])"
		else
			name = "Схемоплата ([item_name])"

/datum/design/circuit/AssembleDesignDesc()
	if(!desc)
		desc = "Нужна для сборки [skloname(item_name, RODITELNI)]."

/datum/design/circuit/arcademachine
	name = "аркадный автомат"
	id = "arcademachine"
	req_tech = list(TECH_DATA = 1)
	build_path = /obj/item/stock_parts/circuitboard/arcade/battle
	sort_string = "MAAAA"

/datum/design/circuit/oriontrail
	name = "игровой автомат"
	id = "oriontrail"
	req_tech = list(TECH_DATA = 1)
	build_path = /obj/item/stock_parts/circuitboard/arcade/orion_trail
	sort_string = "MABAA"

/datum/design/circuit/prisonmanage
	name = "консоль управления заключёнными"
	id = "prisonmanage"
	build_path = /obj/item/stock_parts/circuitboard/prisoner
	sort_string = "DACAA"

/datum/design/circuit/operating
	name = "консоль мониторинга пациента"
	id = "operating"
	build_path = /obj/item/stock_parts/circuitboard/operating
	sort_string = "FACAA"

/datum/design/circuit/optable
	name = "операционный стол"
	id = "optable"
	req_tech = list(TECH_ENGINEERING = 1, TECH_BIO = 3, TECH_DATA = 3)
	build_path = /obj/item/stock_parts/circuitboard/optable
	sort_string = "FACAB"

/datum/design/circuit/bodyscanner
	name = "сканер тела"
	id = "bodyscanner"
	req_tech = list(TECH_ENGINEERING = 2, TECH_BIO = 4, TECH_DATA = 4)
	build_path = /obj/item/stock_parts/circuitboard/bodyscanner
	sort_string = "FACAC"

/datum/design/circuit/body_scanconsole
	name = "консоль сканера тела"
	id = "bodyscannerconsole"
	req_tech = list(TECH_ENGINEERING = 2, TECH_BIO = 4, TECH_DATA = 4)
	build_path = /obj/item/stock_parts/circuitboard/body_scanconsole
	sort_string = "FACAD"

/datum/design/circuit/sleeper
	name = "слипер"
	id = "sleeper"
	req_tech = list(TECH_ENGINEERING = 3, TECH_BIO = 5, TECH_DATA = 3)
	build_path = /obj/item/stock_parts/circuitboard/sleeper
	sort_string = "FACAE"

/datum/design/circuit/cryo_cell
	name = "крио камера"
	id = "cryo_cell"
	req_tech = list(TECH_ENGINEERING = 3, TECH_BIO = 5, TECH_DATA = 3)
	build_path = /obj/item/stock_parts/circuitboard/cryo_cell
	sort_string = "FACAF"

/datum/design/circuit/crewconsole
	name = "консоль мониторинга за экипажем"
	id = "crewconsole"
	req_tech = list(TECH_DATA = 3, TECH_MAGNET = 2, TECH_BIO = 2)
	build_path = /obj/item/stock_parts/circuitboard/crew
	sort_string = "FAGAI"

/datum/design/circuit/body_scan_display
	name = "монитор сканера тела"
	id = "bodyscannerdisplay"
	req_tech = list(TECH_BIO = 2, TECH_DATA = 2)
	build_path = /obj/item/stock_parts/circuitboard/body_scanconsole/display
	sort_string = "FACAJ"

/datum/design/circuit/bioprinter
	name = "биопринтер"
	id = "bioprinter"
	req_tech = list(TECH_ENGINEERING = 1, TECH_BIO = 3, TECH_DATA = 3)
	build_path = /obj/item/stock_parts/circuitboard/bioprinter
	sort_string = "FAGAK"

/datum/design/circuit/roboprinter
	name = "фабрикатор протезов"
	id = "roboprinter"
	req_tech = list(TECH_ENGINEERING = 2, TECH_DATA = 3)
	build_path = /obj/item/stock_parts/circuitboard/roboprinter
	sort_string = "FAGAM"

/datum/design/circuit/teleconsole
	name = "консоль телепорта"
	id = "teleconsole"
	req_tech = list(TECH_DATA = 3, TECH_BLUESPACE = 5)
	build_path = /obj/item/stock_parts/circuitboard/teleporter
	sort_string = "HAAAA"

/datum/design/circuit/robocontrol
	name = "консоль контроля за киборгами"
	id = "robocontrol"
	req_tech = list(TECH_DATA = 4)
	build_path = /obj/item/stock_parts/circuitboard/robotics
	sort_string = "HAAAB"

/datum/design/circuit/rdconsole
	name = "консоль РнД"
	id = "rdconsole"
	req_tech = list(TECH_DATA = 4)
	build_path = /obj/item/stock_parts/circuitboard/rdconsole
	sort_string = "HAAAE"

/datum/design/circuit/comm_monitor
	name = "консоль телекоммуникационного монитора"
	id = "comm_monitor"
	req_tech = list(TECH_DATA = 3)
	build_path = /obj/item/stock_parts/circuitboard/comm_monitor
	sort_string = "HAACA"

/datum/design/circuit/comm_server
	name = "консоль телекомунакационного сервера"
	id = "comm_server"
	req_tech = list(TECH_DATA = 3)
	build_path = /obj/item/stock_parts/circuitboard/comm_server
	sort_string = "HAACB"

/datum/design/circuit/message_monitor
	name = "консоль управления сообщениями"
	id = "message_monitor"
	req_tech = list(TECH_DATA = 5)
	build_path = /obj/item/stock_parts/circuitboard/message_monitor
	sort_string = "HAACD"

/datum/design/circuit/guestpass
	name = "консоль гостевых пропусков"
	id = "guestpass"
	build_path = /obj/item/stock_parts/circuitboard/guestpass
	sort_string = "HAACE"

/datum/design/circuit/accounts
	name = "терминал аккаунтов"
	id = "accounts"
	build_path = /obj/item/stock_parts/circuitboard/account_database
	sort_string = "HAACF"

/datum/design/circuit/holo
	name = "консоль управления голополем"
	id = "holo"
	build_path = /obj/item/stock_parts/circuitboard/holodeckcontrol
	req_tech = list(TECH_DATA = 2, TECH_BLUESPACE = 2)
	sort_string = "HAACG"

/datum/design/circuit/aiupload
	name = "консоль обновления ИИ"
	id = "aiupload"
	req_tech = list(TECH_DATA = 4)
	build_path = /obj/item/stock_parts/circuitboard/aiupload
	sort_string = "HAABA"

/datum/design/circuit/borgupload
	name = "консоль обновления киборгов"
	id = "borgupload"
	req_tech = list(TECH_DATA = 4)
	build_path = /obj/item/stock_parts/circuitboard/borgupload
	sort_string = "HAABB"

/datum/design/circuit/cryopodcontrol
	name = "консоль криокапсул"
	id = "cryo_console"
	req_tech = list(TECH_DATA = 3)
	build_path = /obj/item/stock_parts/circuitboard/cryopodcontrol
	sort_string = "HAABC"

/datum/design/circuit/robot_storage
	name = "панель управления робохранилищем"
	id = "cryo_console_borg"
	req_tech = list(TECH_DATA = 3)
	build_path = /obj/item/stock_parts/circuitboard/robotstoragecontrol
	sort_string = "HAABD"

/datum/design/circuit/destructive_analyzer
	name = "деструктивный анализатор"
	id = "destructive_analyzer"
	req_tech = list(TECH_DATA = 2, TECH_MAGNET = 2, TECH_ENGINEERING = 2)
	build_path = /obj/item/stock_parts/circuitboard/destructive_analyzer
	sort_string = "HABAA"

/datum/design/circuit/protolathe
	name = "протолат"
	id = "protolathe"
	req_tech = list(TECH_DATA = 2, TECH_ENGINEERING = 2)
	build_path = /obj/item/stock_parts/circuitboard/protolathe
	sort_string = "HABAB"

/datum/design/circuit/circuit_imprinter
	name = "схемопринтер"
	id = "circuit_imprinter"
	req_tech = list(TECH_DATA = 2, TECH_ENGINEERING = 2)
	build_path = /obj/item/stock_parts/circuitboard/circuit_imprinter
	sort_string = "HABAC"

/datum/design/circuit/autolathe
	name = "автолат"
	id = "autolathe"
	req_tech = list(TECH_DATA = 2, TECH_ENGINEERING = 2)
	build_path = /obj/item/stock_parts/circuitboard/autolathe
	sort_string = "HABAD"

/datum/design/circuit/replicator
	name = "репликатор"
	id = "replicator"
	req_tech = list(TECH_DATA = 2, TECH_ENGINEERING = 3, TECH_BIO = 3)
	build_path = /obj/item/stock_parts/circuitboard/replicator
	sort_string = "HABAE"

/datum/design/circuit/microlathe
	name = "микролат"
	id = "microlathe"
	req_tech = list(TECH_DATA = 1, TECH_ENGINEERING = 1)
	build_path = /obj/item/stock_parts/circuitboard/autolathe/micro
	sort_string = "HABAF"

/datum/design/circuit/mining_console
	name = "консоль шахтёрского шаттла"
	id = "mining_console"
	req_tech = list(TECH_DATA = 2, TECH_ENGINEERING = 2)
	build_path = /obj/item/stock_parts/circuitboard/mineral_processing
	sort_string = "HABAG"

/datum/design/circuit/mining_processor
	name = "шахтёрский обработчик"
	id = "mining_processor"
	req_tech = list(TECH_DATA = 2, TECH_ENGINEERING = 2)
	build_path = /obj/item/stock_parts/circuitboard/mining_processor
	sort_string = "HABAH"

/datum/design/circuit/mining_unloader
	name = "выгрузчик руды"
	id = "mining_unloader"
	req_tech = list(TECH_DATA = 2, TECH_ENGINEERING = 2)
	build_path = /obj/item/stock_parts/circuitboard/mining_unloader
	sort_string = "HABAI"

/datum/design/circuit/mining_stacker
	name = "стек материалов"
	id = "mining_stacker"
	req_tech = list(TECH_DATA = 2, TECH_ENGINEERING = 2)
	build_path = /obj/item/stock_parts/circuitboard/mining_stacker
	sort_string = "HABAJ"

/datum/design/circuit/suspension_gen
	name = "suspension generator"
	id = "suspension_gen"
	req_tech = list(TECH_DATA = 4, TECH_ENGINEERING = 3, TECH_MAGNET = 4)
	build_path = /obj/item/stock_parts/circuitboard/suspension_gen
	sort_string = "HABAK"

/datum/design/circuit/rdservercontrol
	name = "консоль контроля серверов"
	id = "rdservercontrol"
	req_tech = list(TECH_DATA = 3)
	build_path = /obj/item/stock_parts/circuitboard/rdservercontrol
	sort_string = "HABBA"

/datum/design/circuit/rdserver
	name = "РнД сервер"
	id = "rdserver"
	req_tech = list(TECH_DATA = 3)
	build_path = /obj/item/stock_parts/circuitboard/rdserver
	sort_string = "HABBB"

/datum/design/circuit/mechfab
	name = "фабрикатор экзокостюмов"
	id = "mechfab"
	req_tech = list(TECH_DATA = 3, TECH_ENGINEERING = 3)
	build_path = /obj/item/stock_parts/circuitboard/mechfab
	sort_string = "HABAE"

/datum/design/circuit/mech_recharger
	name = "зарядник мехов"
	id = "mech_recharger"
	req_tech = list(TECH_DATA = 2, TECH_POWER = 2, TECH_ENGINEERING = 2)
	build_path = /obj/item/stock_parts/circuitboard/mech_recharger
	sort_string = "HACAA"

/datum/design/circuit/recharge_station
	name = "станция перезарядки киборгов"
	id = "recharge_station"
	req_tech = list(TECH_DATA = 3, TECH_ENGINEERING = 2)
	build_path = /obj/item/stock_parts/circuitboard/recharge_station
	sort_string = "HACAC"

/datum/design/circuit/atmosalerts
	name = "консоль атмосферных тревог"
	id = "atmosalerts"
	build_path = /obj/item/stock_parts/circuitboard/atmos_alert
	sort_string = "JAAAA"

/datum/design/circuit/air_management
	name = "консоль мониторинга атмосферы"
	id = "air_management"
	build_path = /obj/item/stock_parts/circuitboard/air_management
	sort_string = "JAAAB"

/datum/design/circuit/rcon_console
	name = "консоль управления RCON"
	id = "rcon_console"
	req_tech = list(TECH_DATA = 4, TECH_ENGINEERING = 3, TECH_POWER = 5)
	build_path = /obj/item/stock_parts/circuitboard/rcon_console
	sort_string = "JAAAC"

/datum/design/circuit/dronecontrol
	name = "консоль управления дронами"
	id = "dronecontrol"
	req_tech = list(TECH_DATA = 4)
	build_path = /obj/item/stock_parts/circuitboard/drone_control
	sort_string = "JAAAD"

/datum/design/circuit/powermonitor
	name = "консоль мониторинга энергии"
	id = "powermonitor"
	build_path = /obj/item/stock_parts/circuitboard/powermonitor
	sort_string = "JAAAE"

/datum/design/circuit/solarcontrol
	name = "консоль управления солнечными панелями"
	id = "solarcontrol"
	build_path = /obj/item/stock_parts/circuitboard/solar_control
	sort_string = "JAAAF"

/datum/design/circuit/supermatter_control
	name = "консоль мониторинга суперматерии"
	id = "supermatter_control"
	build_path = /obj/item/stock_parts/circuitboard/air_management/supermatter_core
	sort_string = "JAAAG"

/datum/design/circuit/injector
	name = "консоль воздушного иньектора"
	id = "injector"
	build_path = /obj/item/stock_parts/circuitboard/air_management/injector_control
	sort_string = "JAAAH"

/datum/design/circuit/pacman
	name = "генератор ПАКМАН"
	id = "pacman"
	req_tech = list(TECH_DATA = 3, TECH_PHORON = 3, TECH_POWER = 3, TECH_ENGINEERING = 3)
	build_path = /obj/item/stock_parts/circuitboard/pacman
	sort_string = "JBAAA"

/datum/design/circuit/superpacman
	name = "генератор СУПЕРПАКМАН"
	id = "superpacman"
	req_tech = list(TECH_DATA = 3, TECH_POWER = 4, TECH_ENGINEERING = 4)
	build_path = /obj/item/stock_parts/circuitboard/pacman/super
	sort_string = "JBAAB"

/datum/design/circuit/mrspacman
	name = "генератор МРПАКМАН"
	id = "mrspacman"
	req_tech = list(TECH_DATA = 3, TECH_POWER = 5, TECH_ENGINEERING = 5)
	build_path = /obj/item/stock_parts/circuitboard/pacman/mrs
	sort_string = "JBAAC"

/datum/design/circuit/pacmanpotato
	name = "ядерный генератор БЕЛ-3"
	id = "pacmanpotato"
	req_tech = list(TECH_DATA = 3, TECH_POWER = 5, TECH_ENGINEERING = 4, TECH_ESOTERIC = 4)
	build_path = /obj/item/stock_parts/circuitboard/pacman/super/potato
	sort_string = "JBAAD"

/datum/design/circuit/pacmanreactor
	name = "ядерный реактор ИКАР"
	id = "pacmanreactor"
	req_tech = list(TECH_DATA = 4, TECH_POWER = 5, TECH_ENGINEERING = 5)
	build_path = /obj/item/stock_parts/circuitboard/pacman/super/potato/reactor
	sort_string = "JBAAE"

/datum/design/circuit/batteryrack
	name = "полка батарей PSU"
	id = "batteryrack"
	req_tech = list(TECH_POWER = 3, TECH_ENGINEERING = 2)
	build_path = /obj/item/stock_parts/circuitboard/batteryrack
	sort_string = "JBABA"

/datum/design/circuit/smes_cell
	name = "'СМЭК' супер магнетический энерго комплекс"
	desc = "Позволяет создавать печатные платы, используемые для построения СМЭК."
	id = "smes_cell"
	req_tech = list(TECH_POWER = 7, TECH_ENGINEERING = 5)
	build_path = /obj/item/stock_parts/circuitboard/smes
	sort_string = "JBABB"

/datum/design/circuit/alerts
	name = "консоль тревог"
	id = "alerts"
	build_path = /obj/item/stock_parts/circuitboard/stationalert
	sort_string = "JBACA"

/datum/design/circuit/gas_heater
	name = "система нагрева газа"
	id = "gasheater"
	req_tech = list(TECH_POWER = 2, TECH_ENGINEERING = 1)
	build_path = /obj/item/stock_parts/circuitboard/unary_atmos/heater
	sort_string = "JCAAA"

/datum/design/circuit/gas_cooler
	name = "система охлаждения газа"
	id = "gascooler"
	req_tech = list(TECH_MAGNET = 2, TECH_ENGINEERING = 2)
	build_path = /obj/item/stock_parts/circuitboard/unary_atmos/cooler
	sort_string = "JCAAB"

/datum/design/circuit/oxyregenerator
	name = "генератор кислорода"
	id = "oxyregen"
	req_tech = list(TECH_MAGNET = 2, TECH_ENGINEERING = 2)
	build_path = /obj/item/stock_parts/circuitboard/oxyregenerator
	sort_string = "JCAAC"

/datum/design/circuit/reagent_heater
	name = "система нагрева вещевств"
	id = "chemheater"
	req_tech = list(TECH_POWER = 2, TECH_ENGINEERING = 1)
	build_path = /obj/item/stock_parts/circuitboard/reagent_heater
	sort_string = "JCAAD"

/datum/design/circuit/reagent_cooler
	name = "система охлаждения вещевств"
	id = "chemcooler"
	req_tech = list(TECH_POWER = 2, TECH_ENGINEERING = 1)
	build_path = /obj/item/stock_parts/circuitboard/reagent_heater/cooler
	sort_string = "JCAAE"

/datum/design/circuit/atmos_control
	name = "консоль атмосферной тревоги"
	id = "atmos_control"
	req_tech = list(TECH_DATA = 2, TECH_ENGINEERING = 3)
	build_path = /obj/item/stock_parts/circuitboard/atmoscontrol
	sort_string = "JCAAF"

/datum/design/circuit/pipe_dispenser
	name = "раздатчик труб"
	id = "pipe_dispenser"
	req_tech = list(TECH_ENGINEERING = 6, TECH_MATERIAL = 5)
	build_path = /obj/item/stock_parts/circuitboard/pipedispensor
	sort_string = "JCAAG"

/datum/design/circuit/pipe_dispenser/disposal
	name = "раздатчик мусорных труб"
	id = "pipe_disposal"
	build_path = /obj/item/stock_parts/circuitboard/pipedispensor/disposal
	sort_string = "JCAAH"

/datum/design/circuit/secure_airlock
	name = "защищёная плата шлюза"
	desc =  "Позволяет построить защищенную от несанкционированного доступа шлюз."
	id = "securedoor"
	req_tech = list(TECH_DATA = 3)
	build_path = /obj/item/airlock_electronics/secure
	sort_string = "JDAAA"

/datum/design/circuit/portable_scrubber
	name = "портативный скуббер"
	id = "portascrubber"
	req_tech = list(TECH_ENGINEERING = 4, TECH_POWER = 4)
	build_path = /obj/item/stock_parts/circuitboard/portable_scrubber
	sort_string = "JEAAA"

/datum/design/circuit/portable_pump
	name = "портативный насос"
	id = "portapump"
	req_tech = list(TECH_ENGINEERING = 4, TECH_POWER = 4)
	build_path = /obj/item/stock_parts/circuitboard/portable_scrubber/pump
	sort_string = "JEAAB"

/datum/design/circuit/portable_scrubber_huge
	name = "большой портативный скуббер"
	id = "portascrubberhuge"
	req_tech = list(TECH_ENGINEERING = 5, TECH_POWER = 5, TECH_MATERIAL = 5)
	build_path = /obj/item/stock_parts/circuitboard/portable_scrubber/huge
	sort_string = "JEAAC"

/datum/design/circuit/portable_scrubber_stat
	name = "большой стационарный портативный скуббер"
	id = "portascrubberstat"
	req_tech = list(TECH_ENGINEERING = 5, TECH_POWER = 5, TECH_MATERIAL = 5)
	build_path = /obj/item/stock_parts/circuitboard/portable_scrubber/huge/stationary
	sort_string = "JEAAD"

/datum/design/circuit/thruster
	name = "газовый двигатель"
	id = "thruster"
	req_tech = list(TECH_POWER = 1, TECH_ENGINEERING = 2)
	build_path = /obj/item/stock_parts/circuitboard/unary_atmos/engine
	sort_string = "JFAAA"

/datum/design/circuit/helms
	name = "консоль управления полётами"
	id = "helms"
	req_tech = list(TECH_DATA = 4, TECH_ENGINEERING = 3)
	build_path = /obj/item/stock_parts/circuitboard/helm
	sort_string = "JFAAB"

/datum/design/circuit/nav
	name = "консоль навигатора"
	id = "nav"
	req_tech = list(TECH_DATA = 2, TECH_ENGINEERING = 1)
	build_path = /obj/item/stock_parts/circuitboard/nav
	sort_string = "JFAAC"

/datum/design/circuit/nav/tele
	name = "экран навигатора"
	id = "nav_tele"
	build_path = /obj/item/stock_parts/circuitboard/nav/tele
	sort_string = "JFAAD"

/datum/design/circuit/sensors
	name = "консоль корабельных сенсоров"
	id = "sensors"
	req_tech = list(TECH_DATA = 4)
	build_path = /obj/item/stock_parts/circuitboard/sensors
	sort_string = "JFAAE"

/datum/design/circuit/engine
	name = "консоль управления двигателями судна"
	id = "shipengine"
	req_tech = list(TECH_DATA = 2, TECH_POWER = 2, TECH_ENGINEERING = 2)
	build_path = /obj/item/stock_parts/circuitboard/engine
	sort_string = "JFAAF"

/datum/design/circuit/shuttle
	name = "консоль шаттла"
	id = "shuttle"
	req_tech = list(TECH_DATA = 3)
	build_path = /obj/item/stock_parts/circuitboard/shuttle_console
	sort_string = "JFAAG"

/datum/design/circuit/shuttle_long
	name = "консоль шаттла большого радиуса"
	id = "shuttle_long"
	req_tech = list(TECH_DATA = 3)
	build_path = /obj/item/stock_parts/circuitboard/shuttle_console/explore
	sort_string = "JFAAH"

/datum/design/circuit/biogenerator
	name = "биогенератор"
	id = "biogenerator"
	req_tech = list(TECH_DATA = 2)
	build_path = /obj/item/stock_parts/circuitboard/biogenerator
	sort_string = "KBAAA"

/datum/design/circuit/hydro_tray
	name = "лоток"
	id = "hydrotray"
	req_tech = list(TECH_BIO = 3, TECH_MATERIAL = 2, TECH_DATA = 1)
	build_path = /obj/item/stock_parts/circuitboard/tray
	sort_string = "KBAAB"

/datum/design/circuit/miningdrill
	name = "головка бура"
	id = "mining drill head"
	req_tech = list(TECH_DATA = 1, TECH_ENGINEERING = 1)
	build_path = /obj/item/stock_parts/circuitboard/miningdrill
	sort_string = "KCAAA"

/datum/design/circuit/miningdrillbrace
	name = "корпус бура"
	id = "mining drill brace"
	req_tech = list(TECH_DATA = 1, TECH_ENGINEERING = 1)
	build_path = /obj/item/stock_parts/circuitboard/miningdrillbrace
	sort_string = "KCAAB"

/datum/design/circuit/floodlight
	name = "прожектор"
	id = "floodlight"
	req_tech = list(TECH_POWER = 1, TECH_ENGINEERING = 1)
	build_path = /obj/item/stock_parts/circuitboard/floodlight
	sort_string = "KCAAC"

/datum/design/circuit/disperserfront
	name = "obstruction field disperser beam generator"
	id = "disperserfront"
	req_tech = list(TECH_ENGINEERING = 2, TECH_COMBAT = 2, TECH_BLUESPACE = 2)
	build_path = /obj/item/stock_parts/circuitboard/disperserfront
	sort_string = "KCAAD"

/datum/design/circuit/dispersermiddle
	name = "obstruction field disperser fusor"
	id = "dispersermiddle"
	req_tech = list(TECH_ENGINEERING = 2, TECH_COMBAT = 2, TECH_BLUESPACE = 2)
	build_path = /obj/item/stock_parts/circuitboard/dispersermiddle
	sort_string = "KCAAE"

/datum/design/circuit/disperserback
	name = "obstruction field disperser material deconstructor"
	id = "bsaback"
	req_tech = list(TECH_ENGINEERING = 2, TECH_COMBAT = 2, TECH_BLUESPACE = 2)
	build_path = /obj/item/stock_parts/circuitboard/disperserback
	sort_string = "KCAAF"

/datum/design/circuit/disperser_console
	name = "obstruction field disperser control console"
	id = "disperser_console"
	req_tech = list(TECH_DATA = 2, TECH_COMBAT = 5, TECH_BLUESPACE = 5)
	build_path = /obj/item/stock_parts/circuitboard/disperser
	sort_string = "KCAAG"

/datum/design/circuit/tcom
	req_tech = list(TECH_DATA = 4, TECH_ENGINEERING = 4)

/datum/design/circuit/tcom/AssembleDesignName()
	name = "телекоммуникационное оборудование ([name])"
/datum/design/circuit/tcom/AssembleDesignDesc()
	desc = "Эта плата позволяет собрать [name]."

/datum/design/circuit/tcom/server
	name = "серверный меинфрейм"
	id = "tcom-server"
	build_path = /obj/item/stock_parts/circuitboard/telecomms/server
	sort_string = "PAAAA"

/datum/design/circuit/tcom/processor
	name = "процессор"
	id = "tcom-processor"
	build_path = /obj/item/stock_parts/circuitboard/telecomms/processor
	sort_string = "PAAAB"

/datum/design/circuit/tcom/bus
	name = "шина мэинфрейма"
	id = "tcom-bus"
	build_path = /obj/item/stock_parts/circuitboard/telecomms/bus
	sort_string = "PAAAC"

/datum/design/circuit/tcom/hub
	name = "хаб мэинфрейма"
	id = "tcom-hub"
	build_path = /obj/item/stock_parts/circuitboard/telecomms/hub
	sort_string = "PAAAD"

/datum/design/circuit/tcom/broadcaster
	name = "субсветовой передатчик"
	id = "tcom-broadcaster"
	req_tech = list(TECH_DATA = 4, TECH_ENGINEERING = 4, TECH_BLUESPACE = 2)
	build_path = /obj/item/stock_parts/circuitboard/telecomms/broadcaster
	sort_string = "PAAAF"

/datum/design/circuit/tcom/receiver
	name = "субсветовой приёмник"
	id = "tcom-receiver"
	req_tech = list(TECH_DATA = 4, TECH_ENGINEERING = 3, TECH_BLUESPACE = 2)
	build_path = /obj/item/stock_parts/circuitboard/telecomms/receiver
	sort_string = "PAAAG"

/datum/design/circuit/bluespace_relay
	name = "световое реле"
	id = "bluespacerelay"
	req_tech = list(TECH_DATA = 5, TECH_BLUESPACE = 5, TECH_PHORON = 5)
	build_path = /obj/item/stock_parts/circuitboard/bluespacerelay
	sort_string = "PAAAH"

/datum/design/circuit/shield_generator
	name = "Shield Generator"
	desc = "Allows for the construction of a shield generator circuit board."
	id = "shield_generator"
	req_tech = list(TECH_MAGNET = 3, TECH_POWER = 4)
	build_path = /obj/item/stock_parts/circuitboard/shield_generator
	sort_string = "VAAAC"

/datum/design/circuit/shield_diffuser
	name = "Shield Diffuser"
	desc = "Allows for the construction of a shield generator circuit board."
	id = "shield_diffuser"
	req_tech = list(TECH_MAGNET = 3, TECH_POWER = 4)
	build_path = /obj/item/stock_parts/circuitboard/shield_diffuser
	sort_string = "VAAAB"

/datum/design/circuit/pointdefense
	name = "Point defense battery"
	desc = "Allows for the construction of a point defense battery circuit board."
	id = "pointdefense"
	req_tech = list(TECH_COMBAT = 2, TECH_ENGINEERING = 2)
	build_path = /obj/item/stock_parts/circuitboard/pointdefense
	sort_string = "VAAAC"

/datum/design/circuit/pointdefense_control
	name = "Fire Assist Mainframe"
	desc = "Allows for the construction of a fire assist mainframe circuit board."
	id = "pointdefense_control"
	req_tech = list(TECH_COMBAT = 2, TECH_ENGINEERING = 2)
	build_path = /obj/item/stock_parts/circuitboard/pointdefense_control
	sort_string = "VAAAD"

/datum/design/circuit/ntnet_relay
	name = "квантовое реле НТнет"
	id = "ntnet_relay"
	req_tech = list(TECH_DATA = 4)
	build_path = /obj/item/stock_parts/circuitboard/ntnet_relay
	sort_string = "WAAAA"

/datum/design/circuit/washer
	name = "стиральная машина"
	id = "washer"
	req_tech = list(TECH_ENGINEERING = 1)
	build_path = /obj/item/stock_parts/circuitboard/washer
	sort_string = "WAAAS"

/datum/design/circuit/microwave
	name = "микроволновка"
	id = "microwave"
	req_tech = list(TECH_BIO = 2, TECH_ENGINEERING = 2)
	build_path = /obj/item/stock_parts/circuitboard/microwave
	sort_string = "WAAAT"

/datum/design/circuit/gibber
	name = "мясорубка"
	id = "gibber"
	req_tech = list(TECH_BIO = 2, TECH_ENGINEERING = 2)
	build_path = /obj/item/stock_parts/circuitboard/gibber
	sort_string = "WAAAU"

/datum/design/circuit/cooker
	name = "кухонный прибор (ассорти)"
	desc = "Позволяет построить сменную печатную плату кухонного прибора. Используйте мультитул для перепрограмирования."
	id = "cooker"
	req_tech = list(TECH_BIO = 1, TECH_MATERIAL = 1)
	build_path = /obj/item/stock_parts/circuitboard/cooker
	sort_string = "WAAAV"

/datum/design/circuit/honey_extractor
	name = "экстрактор мёда"
	id = "honey_extractor"
	req_tech = list(TECH_BIO = 2, TECH_ENGINEERING = 1)
	build_path = /obj/item/stock_parts/circuitboard/honey
	sort_string = "WAAAW"

/datum/design/circuit/seed_extractor
	name = "экстрактор семян"
	id = "seed_extractor"
	req_tech = list(TECH_BIO = 2, TECH_ENGINEERING = 1)
	build_path = /obj/item/stock_parts/circuitboard/honey/seed
	sort_string = "WAAAX"

/datum/design/circuit/vending
	name = "вендомат"
	id = "vending"
	req_tech = list(TECH_ENGINEERING = 2)
	build_path = /obj/item/stock_parts/circuitboard/vending
	sort_string = "WAABA"

/datum/design/circuit/reagentgrinder
	name = "измельчитель"
	id = "reagent_grinder"
	req_tech = list(TECH_BIO = 2, TECH_MATERIAL = 2, TECH_ENGINEERING = 2)
	build_path = /obj/item/stock_parts/circuitboard/reagentgrinder
	sort_string = "WAABB"

/datum/design/circuit/juicer
	name = "блендер"
	id = "blender"
	req_tech = list(TECH_BIO = 1, TECH_MATERIAL = 2, TECH_ENGINEERING = 1)
	build_path = /obj/item/stock_parts/circuitboard/juicer
	sort_string = "WAABC"

/datum/design/circuit/aicore
	name = "ядро ИИ"
	id = "aicore"
	req_tech = list(TECH_DATA = 4, TECH_BIO = 3)
	build_path = /obj/item/stock_parts/circuitboard/aicore
	sort_string = "XAAAA"

/datum/design/circuit/ionengine
	name = "система ионных трастеров"
	id = "ionengine"
	req_tech = list(TECH_BLUESPACE = 4, TECH_MATERIAL = 6)
	materials = list(MATERIAL_GOLD = 250, MATERIAL_DIAMOND = 250, MATERIAL_URANIUM = 250, MATERIAL_PLASTIC = 1000, MATERIAL_ALUMINIUM = 1000)
	build_path = /obj/item/stock_parts/circuitboard/engine/ion
	sort_string = "XAAAB"

/datum/design/circuit/sublimator/sauna
	name = "печка сауны"
	id = "sauna"
	req_tech = list(TECH_POWER = 2, TECH_ENGINEERING = 1)
	build_path = /obj/item/stock_parts/circuitboard/sublimator/sauna
	sort_string = "XAAAC"

/datum/design/circuit/vitals
	name = "монитор жизненно важных функций"
	id = "vitals"
	req_tech = list(TECH_BIO = 2, TECH_ENGINEERING = 1)
	build_path = /obj/item/stock_parts/circuitboard/vitals_monitor
	sort_string = "XAAAD"

/datum/design/circuit/sublimator/modular_computer
	name = "компьютер общего назначения"
	id = "pc_motherboard"
	req_tech = list(TECH_POWER = 1, TECH_ENGINEERING = 1)
	build_path = /obj/item/stock_parts/circuitboard/modular_computer
	sort_string = "XAAAD"

/datum/design/circuit/tele_beacon
	name = "телепортационный маяк"
	id = "tele_beacon"
	req_tech = list(
		TECH_BLUESPACE = 1
	)
	build_path = /obj/item/stock_parts/circuitboard/tele_beacon
	sort_string = "XAAAF"

/datum/design/circuit/bluespacedrive
	name = "гипердвигатель Наофора"
	id = "bluespacedrive"
	req_tech = list(TECH_BLUESPACE = 12, TECH_POWER = 12, TECH_ENGINEERING = 12) // You are not supposed to get this
	build_path = /obj/item/stock_parts/circuitboard/bluespacedrive
	sort_string = "XAAAF"

/datum/design/circuit/shipmap
	name = "голокарта"
	id = "shipmap"
	req_tech = list(TECH_ENGINEERING = 1)
	build_path = /obj/item/stock_parts/circuitboard/shipmap
	sort_string = "SAAAT"
