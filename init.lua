local extension = Package("fk_study")

Fk:loadTranslationTable{
	["fk_study"] = "fk学习包",
	["study_sunce"] = "孙伯符",
	["study_jizi"] = "激姿"，
	[":study_jizi"] = "摸牌阶段，你可以多摸4张牌。",
}


local study_sunce = General(extension, "study_sunce", "wu", 4)
study_sunce:addSkill("zhiheng")

local study_jizi = fk.CreateTriggerSkill{
	name = "study_jizi",
	anim_type = "drawcard",
	events = {fk.DrawNCards},
	on_use = function(self, event, target, player, data)
		data.n = data.n + 4
	end,
}
local study_sunce = General(extension, "study_sunce", "wu", 4)
study_sunce:addSkill("zhiheng")
study_sunce:addSkill(study_jizi)

return { extension }