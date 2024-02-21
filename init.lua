local extension = Package("fk_study")

Fk:loadTranslationTable{
	["fk_study"] = "fk学习包",
	["study_sunce"] = "孙伯符",
	["study_jizi"] = "激姿",
	[":study_jizi"] = "摸牌阶段，你可以多摸4张牌。",
	["study_test"] = "测试",
	["study_testskill"] = "测试技能",
	[":study_testskill"] = "摸牌阶段，你可以多摸2张牌。",
	["study_testskill1"] = "测试技能1",
	[":study_testskill1"] = "摸牌阶段，你可以多摸2张牌。",
	["study_testskill2"] = "测试技能2",
	[":study_testskill2"] = "摸牌阶段，你可以多摸2张牌。",
	["study_testskill3"] = "测试技能3",
	[":study_testskill3"] = "摸牌阶段，你可以多摸2张牌。",
	["study_testskill4"] = "测试技能4",
	[":study_testskill4"] = "摸牌阶段，你可以多摸2张牌。",
	["study_test1"] = "测试1",
	["study_test2"] = "测试2",
	["study_test3"] = "测试3",
	["study_test4"] = "测试4"
}


local study_sunce = General(extension, "study_sunce", "wu", 4)
local study_jizi = fk.CreateTriggerSkill{
	name = "study_jizi",
	anim_type = "drawcard",
	events = {fk.DrawNCards},
	on_use = function(self, event, target, player, data)
		data.n = data.n + 4
	end,
}
study_sunce:addSkill(study_jizi)

local study_test = General(extension, "study_test", "wei", 4)
local study_testskill = fk.CreateTriggerSkill{
	name = "study_testskill",
	anim_type = "drawcard",
	events = {fk.DrawNCards},
	on_use = function(self, event, target, player, data)
		data.n = data.n + 2
	end,
}
study_test:addSkill(study_testskill)



local study_test1 = General(extension, "study_test1", "wei", 4)
local study_testskill1 = fk.CreateTriggerSkill{
	name = "study_testskill1",
	anim_type = "drawcard",
	events = {fk.DrawNCards},
	on_use = function(self, event, target, player, data)
		data.n = data.n + 2
	end,
}
local study_test2 = General(extension, "study_test2", "wei", 4)
local study_testskill2 = fk.CreateTriggerSkill{
	name = "study_testskill2",
	anim_type = "drawcard",
	events = {fk.DrawNCards},
	on_use = function(self, event, target, player, data)
		data.n = data.n + 2
	end,
}
local study_test3 = General(extension, "study_test3", "wei", 4)
local study_testskill3 = fk.CreateTriggerSkill{
	name = "study_testskill3",
	anim_type = "drawcard",
	events = {fk.DrawNCards},
	on_use = function(self, event, target, player, data)
		data.n = data.n + 2
	end,
}
local study_test4 = General(extension, "study_test4", "wei", 4)
local study_testskill4 = fk.CreateTriggerSkill{
	name = "study_testskill4",
	anim_type = "drawcard",
	events = {fk.DrawNCards},
	on_use = function(self, event, target, player, data)
		data.n = data.n + 2
	end,
}
study_test1:addSkill(study_testskill1)
study_test2:addSkill(study_testskill2)
study_test3:addSkill(study_testskill3)
study_test4:addSkill(study_testskill4)

return { extension }