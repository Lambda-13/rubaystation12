/obj/item/book/manual/solgov_law
	name = "Sol Central Government Law"
	desc = "A brief overview of SolGov Law."
	icon_state = "bookSolGovLaw"
	author = "The Sol Central Government"
	title = "Sol Central Government Law"

/obj/item/book/manual/solgov_law/Initialize()
	. = ..()
	dat = {"<meta charset='utf-8'>

		<html><meta charset='utf-8'><head>
		</head>

		<body>
		<iframe width='100%' height='97%' src="[config.wiki_url]Sol_Central_Government_Law&printable=yes&remove_links=1" frameborder="0" id="main_frame"></iframe>
		</body>

		</html>

		"}


/obj/item/book/manual/military_law
	name = "The Sol Code of Military Justice"
	desc = "A brief overview of military law."
	icon_state = "bookSolGovLaw"
	author = "The Sol Central Government"
	title = "The Sol Code of Military Justice"

/obj/item/book/manual/military_law/Initialize()
	. = ..()
	dat = {"<meta charset='utf-8'>

		<html><meta charset='utf-8'><head>
		</head>

		<body>
		<iframe width='100%' height='97%' src="[config.wiki_url]Sol_Gov_Military_Justice&printable=yes&remove_links=1" frameborder="0" id="main_frame"></iframe>
		</body>

		</html>

		"}

/obj/item/book/manual/sol_sop
	name = "Standard Operating Procedure"
	desc = "SOP aboard the SEV Torch."
	icon_state = "booksolregs"
	author = "The Sol Central Government"
	title = "Standard Operating Procedure"

/obj/item/book/manual/sol_sop/Initialize()
	. = ..()
	dat = {"<meta charset='utf-8'>

		<html><meta charset='utf-8'><head>
		</head>

		<body>
		<iframe width='100%' height='97%' src="[config.wiki_url]Standard_Operating_Procedure&printable=yes&remove_links=1" frameborder="0" id="main_frame"></iframe>
		</body>

		</html>

		"}

/obj/item/folder/nt/rd

/obj/item/folder/envelope/captain
	desc = "A thick envelope. The SCG crest is stamped in the corner, along with 'TOP SECRET - TORCH UMBRA'."

/obj/item/folder/envelope/captain/Initialize()
	..()
	return INITIALIZE_HINT_LATELOAD

/obj/item/folder/envelope/captain/LateInitialize()
	..()
	var/obj/effect/overmap/visitable/torch = map_sectors["[z]"]
	var/memo = {"
	<meta charset='utf-8'><tt><center><b><font color='red'>СЕКРЕТНО - КОДОВОЕ СЛОВО: ФАКЕЛ</font></b>
	<h3>ЭКСПЕДИЦИОННОЕ КОМАНДОВАНИЕ ЦЕНТРАЛЬНОГО ПРАВИТЕЛЬСТВА СОЛНЦА</h3>
	<img src = sollogo.png>
	</center>
	<b>ОТ:</b> Адмирал Уильям Лау<br>
	<b>КОМУ:</b> Командованию СЭВ Факел<br>
	<b>ОБЬЕКТ:</b> Регламент<br>
	<hr>
	Капитан.<br>
	Вам приказано посетить следующие звездные системы. Имейте в виду, что ваши запасы ограничены; соответственно распределите время исследования.
	<li>[generate_system_name()]</li>
	<li>[generate_system_name()]</li>
	<li>[generate_system_name()]</li>
	<li>[generate_system_name()]</li>
	<li>[generate_system_name()]</li>
	<li>[GLOB.using_map.system_name]</li>
	<li>[generate_system_name()]</li>
	<li>[generate_system_name()]</li>
	<li>[generate_system_name()]</li>
	<br>
	Приоритетными целями являются артефакты неконтактных инопланетных видов и источники сигналов неизвестного происхождения.<br>
	Ни на одну из этих систем не претендует какое-либо лицо, признанное SCG, так что вы имеете полное право на спасение любых обнаруженных заброшенных объектов.<br>
	Исследуйте и отметьте любые предполагаемые миры-колонии в соответствии с обычными процедурами.<br>
	В этом районе нет SCG. В случае сигнала бедствия вы будете единственным доступным судном; не игнорируйте их. Мы не можем позволить себе больше пиар-реакции.<br>
	Текущий код стыковки: [torch.docking_codes]<br>
	Сообщайте обо всех находках через коммуникационные буи Bluespace во время межсистемных прыжков.<br>

	<i>Адмирал Лау.</i></tt>
	<i>This paper has been stamped with the stamp of SCG Expeditionary Command.</i>
	"}
	new/obj/item/paper(src, memo, "Standing Orders")
	new/obj/item/paper/umbra(src)

/obj/item/folder/envelope/rep
	desc = "A thick envelope. The SCG crest is stamped in the corner, along with 'TOP SECRET - TORCH UMBRA'."

/obj/item/folder/envelope/rep/Initialize()
	. = ..()
	new/obj/item/paper/umbra(src)

/obj/item/paper/umbra
	name = "UMBRA Protocol"
	info = {"
	<meta charset='utf-8'><tt><center><b><font color='red'>СОВЕРШЕННО СЕКРЕТНО: КОДОВОЕ СЛОВО - ФАКЕЛ УМБРА</font></b>
	<h3>КАБИНЕТ ГЕНЕРАЛЬНОГО СЕКРЕТАРЯ ЦЕНТРАЛЬНОГО ПРАВИТЕЛЬСТВА СОЛНЦА</h3>
	<img src = sollogo.png>
	</center>
	<b>ОТ:</b> Джонатан Смитерсон, Особая сторона Генерального секретаря<br>
	<b>КОМУ:</b> Командованию СЭВ Факел<br>
	<b>НАЗНАЧЕНИЕ:</b> Специальный представитель на борту SEV Torch<br>
	<b>ОБЬЕКТ:</b> Протокол УМБРА<br>
	<hr>
	Это небольшое дополнение к обычным операционным процедурам. В отличие от остальных СОП, это не оставлено на усмотрение командира и является обязательным. Каким бы нетрадиционным это ни было, мы чувствовали, что это необходимо для бесперебойной работы этой миссии.<br>
	Процедура может быть инициирована только передачей от Экспедиционного командования SCG по защищенному каналу. Отправитель может не представляться, но я полагаю, у вас не должно возникнуть проблем с подтверждением источника передачи.<br>
	Сигналом к началу процедуры являются кодовые слова 'Спокойной ночи, мир'(GOOD NIGHT WORLD), используемые в этом порядке как одна фраза. Вам не нужно отправлять подтверждение.
	<li>Информация о находках этой экспедиции считается секретной и жизненно важной для национальной безопасности SCG и защищена кодовым словом UMBRA. Только государственные служащие SCG и граждане Skrell на борту SEV Torch имеют доступ к этой информации по мере необходимости.</li>
	<li>Секретность этой информации применяется задним числом. Любой не прошедший допуск персонал, получивший доступ к такой информации, должен быть обеспечен и передан в DIA по прибытии в порт приписки.</li>
	<li>Любые устройства, способные передавать или получать данные в межзвездном диапазоне, должны быть конфискованы из частной собственности.</li>
	<li>Не обращайте внимания на любые системы, оставшиеся в вашем плане полета, и держите курс на Солнце, орбиту Нептуна. С вами свяжутся по прибытии. Не делайте остановок в портах по пути без крайней необходимости.</li>
	<br>
	Хотя это радикально, я уверяю вас, что это простая мера предосторожности, чтобы не возникло никаких проблем. Просто оставьте эту опцию открытой и продолжайте выполнять свои обычные обязанности.
	<i>С уважением, Джон.</i></tt>
	<i>This paper has been stamped with the stamp of Office of the General Secretary of SCG.</i>
	"}
