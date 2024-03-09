local extension = Package("fk_study")

Fk:loadTranslationTable{
	["fk_study"] = "fk学习包",
	["study_sunce"] = "孙伯符",
	["study_jizi"] = "激姿",
	[":study_jizi"] = "摸牌阶段，你可以多摸4张牌。",
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

Fk:loadTranslationTable{
	["study_miku"] = "初音未来",
	["study_furikaeru"] = "振り返る",
	[":study_furikaeru"] = "准备阶段开始时，你可对一名其他角色造成2点伤害。",
  	["#study_furikaeru-choose"] = "振り返る：你可对一名其他角色造成2点伤害",
}
local study_miku = General(extension, "study_miku", "wei", 3)
local study_furikaeru = fk.CreateTriggerSkill{
	name = "study_furikaeru",
	anim_type = "offensive",
	events = {fk.EventPhaseStart},
	can_trigger = function(self, event, target, player, data)
		return target == player and player:hasSkill(self) and
		  player.phase == Player.Start
	  end,
	on_cost = function(self, event, target, player, data)
		local room = player.room
		local to = room:askForChoosePlayers(player, table.map(table.filter(room:getOtherPlayers(player), function(p)
			return 1 end), Util.IdMapper), 1, 1, "#study_furikaeru-choose", self.name, true)
		if #to > 0 then
		  self.cost_data = to[1]
		  return true
		end
	  end,
	on_use = function(self, event, target, player, data)
		local room = player.room
    	room:damage({
      	from = player,
      	to = room:getPlayerById(self.cost_data),
      	damage = 2,
      	skillName = self.name,
    	})
	end,
	
}
study_miku:addSkill(study_furikaeru)





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
