local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ENERGYHIT)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGYBALL)
combat:setParameter(COMBAT_PARAM_CREATEITEM, ITEM_ENERGYFIELD_PVP)
combat:setArea(createCombatArea(AREA_SQUARE1X1))

function onCastSpell(creature, variant, isHotkey)
	playSound(creature, "bomb_rune.ogg")
	return combat:execute(creature, variant)
end
