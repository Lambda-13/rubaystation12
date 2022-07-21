/*//////////////////////////////////////////////////////////////////////////////////////////////////////
	Syllable list compiled in this file based on work by Stefan Trost, available at the following URLs
						https://www.sttmedia.com/syllablefrequency-english
						https://www.sttmedia.com/syllablefrequency-french
						https://www.sttmedia.com/syllablefrequency-german
*///////////////////////////////////////////////////////////////////////////////////////////////////////

/datum/language/human/euro
	name = LANGUAGE_HUMAN_EURO
	desc = "Искусственный язык, учрежденный конференцией европейских и африканских исследовательских университетов, созванной в Цюрихе, Швейцария, начиная с 2119 года, \
			позже принятый без особых разногласий в качестве лингва-франка всего Солнечного пространства после создания SCG."
	speech_verb = "говорит"
	whisper_verb = "шепчет"
	colour = ""
	key = "1"
	flags = WHITELISTED
	shorthand = "ZAC"
	partial_understanding = list(
		LANGUAGE_HUMAN_CHINESE = 5,
		LANGUAGE_HUMAN_ARABIC = 5,
		LANGUAGE_HUMAN_INDIAN = 5,
		LANGUAGE_HUMAN_IBERIAN = 30,
		LANGUAGE_HUMAN_RUSSIAN = 5,
		LANGUAGE_HUMAN_SELENIAN = 85,
		LANGUAGE_SPACER = 20
	)
	syllables = list("инг", "ти", "рo", "тле", "фa", "ли", "эрн", "эр", "ри", "сиoн", "даy", "фе", "лo", "еве", "a", "бе", "ви", "нy", "гэн", "мэн", "лy", "рэр", "эл", "рэн", "мин", "иэс", "ед", "тo", "эст", "рре", "ланд", "и", "ррo", "лa", "тиве", "лигхт", "эс", "лар", "cар", "oют", "маин", "ре", "ад", "ра", "oф", "тиoн", "ар", "тюре", "мo", "рос", "рo", "ин", "эрс", "фор", "ан", "тaин", "мy", "е", "мэнт", "ис", "сиде", "нал", "сон", "ингс", "нэсс", "y", "тиoнс", "ре", "се", "нинг", "мэнтс", "тиэс", "сo", "тор", "сет", "виард" , "энcе", "юр")
	has_written_form = TRUE
