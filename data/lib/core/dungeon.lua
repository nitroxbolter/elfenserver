DUNGEON_SYSTEM = {

	Storages = {
		timerDungeon = 49356,
		timerCooldown = 50203,
		storageReward = 50205,
	},
	
	Modal = {
		IDType = 2049,
		TitleType = "Dungeon System",
		MsgType = "Select this type:",
	
		ID = 2050,
		Title = "Dungeon System",
		Msg = "Select your Dungeon:",
		
		IDDetails = 2051,
		TitleDetails = "Details Dungeon",
	},
	
	Messages = {
		ToEntry = "Welcome to Dungeon",
		ToFail = "You were unable to complete the dungeon in the respective time.\n\nNext time you will do it better!",
		
		WaitFriendsCooldown = "Wait your party: %s",
		ToCooldown = "You're in cooldown to enter in a dungeon again. Cooldown: %s.",
		MsgNeedLevel = "You don't have level required. You need level %s.",
		MsgUniqueNeedParty = "You need party, to entry in dungeon",
		MsgNeedParty = "You need to be at a party to enter the dungeon. You need %s players",
		MsgLeaderParty = "You are not the leader of the Party.",
		
		MsgDistanceLeader = "Your team need to be close to you.",
		
		NeedPzSoloMsg = "You need to be in a safe area [PZ].",
		NeedPzMsg = "Your team needs to go a safe area [PZ].",
	
		PlayerInside = "A team is already inside.",
	},
	
	CooldownTime = 3600,
	
	PzToEntry = true,
	
	SQMsDistanceOfLeader = 20,

	Dungeons = {
		[1] = {
			Name = "Bones Dungeon",
			NeedParty = true,
			AmountParty = 2,
			NeedLevel = true,
			Level = 150,
			DungeonTime = 1800,
			DungeonPos = Position(402, 856, 8),
			FromPos = {x = 379, y = 847, z = 8}, 	
			ToPos = {x = 583, y = 1024, z = 8},
			SpawnMonsters = true,
			Monsters = {
				["Bone archer"] = Position(414, 868, 8),
			},			
		},	
		[2] = {
			Name = "Master of the Elements",
			NeedParty = true,
			AmountParty = 2,
			NeedLevel = true,
			Level = 200,
			DungeonTime = 1800,
			DungeonPos = Position(349, 1124, 8),
			FromPos = {x = 280, y = 1104, z = 8},
			ToPos = {x = 507, y = 1364, z = 8},
			SpawnMonsters = false,
			Monsters = {
			},			
		},
		[3] = {
			Name = "Forbidden Chevalier",
			NeedParty = false,
			AmountParty = 2,
			NeedLevel = true,
			Level = 500,
			DungeonTime = 1800,
			DungeonPos = Position(1081, 1641, 0),
			FromPos = {x = 1020, y = 1581, z = 7},
			ToPos = {x = 1108, y = 1685, z = 7},
			SpawnMonsters = false,
			Monsters = {
			},			
		},
		[4] = {
			Name = "Rootkraken",
			NeedParty = false,
			AmountParty = 2,
			NeedLevel = true,
			Level = 600,
			DungeonTime = 1800,
			DungeonPos = Position(1322, 1708, 8),
			FromPos = {x = 1312, y = 1699, z = 8},
			ToPos = {x = 1331, y = 1707, z = 8},
			SpawnMonsters = false,
			Monsters = {
			},			
		},	
	},
}