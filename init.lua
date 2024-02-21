local extension = Package("fk_study")

Fk:loadTranslationTable{
	["fk_study"] = "fk学习包",
}

return { extension }

local study_sunce = General(extension, "study_sunce", "wu", 4)
Fk:loadTranslationTable{
	["study_sunce"] = "孙伯符",
}