#include "CfgLoot.hpp"

class CfgBuildingLoot {
	class Default {
		zombieChance = 0.2;
		minRoaming = 0;
		maxRoaming = 2;
		zombieClass[] = {"zZombie_Base","z_hunter","z_teacher","z_suit1","z_suit2","z_worker1","z_worker2","z_worker3","z_villager1","z_villager2","z_villager3"};
		lootChance = 0;
		lootPos[] = {};
		lootType[] = {};
		hangPos[] = {};
		vehPos[] = {};
	};
	class Master {
		weapons[] = {"SMAW","Javelin","G36C","Stinger"};
	};
	//New System
	class Church: Default {
		zombieChance = 0.3;
		minRoaming = 1;
		maxRoaming = 3;
		zombieClass[] = {"z_priest","z_priest","z_priest"};
		lootChance = 0.3;
		lootPos[] = {};
		lootType[] = {
		//one spawn
		//tools
			{"ItemMatchbox","generic",0.02},
		//weapons
		//special
		//mags special
			{"ItemBookBible","magazine",0.03},
			//{"8Rnd_9x18_RH_mk2","magazine",0.03}, //this is church! no weapons allowed :)
		//bags
		//multiple spawns	
			{"","Church",0.50},
			{"","trash",0.30},
			{"","generic",0.60}
		};
	};
	class Castle: Default {
		lootChance = 0.2;
		lootPos[] = {};
		lootType[] = {
		//one spawn
		//tools
			{"ItemMatchbox","weapon",0.01},
			{"ItemKnife","weapon",0.01},
			{"ItemMap","generic",0.01},
			{"ItemCompass","weapon",0.01},
			{"ItemFlashlight","weapon",0.01},
		//weapons
			{"WeaponHolder_ItemHatchet","object",0.01},
		//special
			{"WeaponHolder_ItemTent","object",0.01},
		//mags special
			{"PartWoodPile","magazine",0.04},
		//bags
			{"DZ_Patrol_Pack_EP1","object",0.01},
		//Multiple spawns	
			{"","Residential",0.60},
			{"","trash",0.30},
			{"","generic",0.50}
		};
	};	
	class Residential: Default {
		zombieChance = 0.3;
		maxRoaming = 2;
		zombieClass[] = {"zZombie_Base","z_hunter","z_teacher","z_villager1","z_villager2","z_villager3","z_new_villager2","z_new_villager3","z_new_villager4"};
		lootChance = 0.4;
		lootPos[] = {};
		lootType[] = {
		//one spawn
		//tools
			{"ItemWatch","generic",0.03},
			{"ItemFlashlight","generic",0.05},
			{"Skin_Functionary1_EP1_DZ","magazine",0.03},
			//{"ItemFishingPole","generic",0.04}, //move it to boats and boatstations
		//weapons
			{"RH_mk2","weapon",0.02},
			{"RH_mk22","weapons",0.02},
			{"RH_python","weapon",0.01},
			{"MR43","weapon",0.02},
			{"RH_m1911","weapon",0.01},
			{"MeleeBaseBallBat","weapon",0.02},
		//special
			{"WeaponHolder_ItemFuelcan","object",0.03},
		//mags special
			{"ItemPainkiller","magazine",0.04},
			{"ItemBandage","magazine",0.06},
		//bags
			{"DZ_Patrol_Pack_EP1","object",0.05},
			{"DZ_Assault_Pack_EP1","object",0.04},
		//multiple spawns	
			{"","Residential",0.50},
			{"","trash",0.30},
			{"","generic",0.70}
		};
	};
	class Industrial: Default { //254
		zombieChance = 0.4;
		zombieClass[] = {"z_worker1","z_worker2","z_worker3","z_new_worker2","z_new_worker3","z_new_worker4"};
		maxRoaming = 2;
		lootChance = 0.3;
		lootPos[] = {};
		lootType[] = {
		//one spawn
		//tools
			{"ItemKnife","weapon",0.03},
			{"ItemToolbox","weapon",0.06},
			{"ItemFlashlight","weapon",0.02},
			{"ACE_Earplugs","weapon",0.03},
		//weapons
			{"WeaponHolder_ItemCrowbar","object",0.08},
			{"WeaponHolder_ItemHatchet","object",0.05},
		//special
			{"WeaponHolder_PartGeneric","object",0.04},
			{"WeaponHolder_PartWheel","object",0.05},
			{"WeaponHolder_PartFueltank","object",0.02},
			{"WeaponHolder_PartEngine","object",0.02},
			{"WeaponHolder_PartGlass","object",0.04},
			//{"WeaponHolder_PartVRotor","object",0.01}, //move it to helichash and ss_hangar 
			{"WeaponHolder_ItemJerrycan","object",0.04},
			{"WeaponHolder_ItemFuelcan","object",0.03},
		//mags special
			{"ItemWire","magazine",0.01},
			{"ItemTankTrap","magazine",0.04},
		//bags
		//multiple spawns	
			{"","Industrial",0.50},
			{"","trash",0.30},
			{"","generic",0.60}
		};
	};
	class Farm: Default {
		zombieChance = 0.3;
		maxRoaming = 3;
		zombieClass[] = {"zZombie_Base","z_hunter","z_hunter","z_hunter","z_villager1","z_villager2","z_villager3","z_new_villager2","z_new_villager3","z_new_villager4"};
		lootChance = 0.5;
		lootPos[] = {};
		lootType[] = {
		//one spawn
		//tools
			{"ItemMatchbox","weapon",0.05},
			{"ACE_YardAge450","generic",0.01},
			{"ACE_Earplugs","weapon",0.03},
		//weapons
			{"WeaponHolder_ItemHatchet","object",0.05},
			{"huntingrifle","weapon",0.02},
			{"LeeEnfield","weapon",0.03},
			{"ACE_SKS","weapon",0.03},
			{"Winchester1866","weapon",0.03},
			{"Crossbow_DZ","weapon",0.03},
			{"MR43","weapon",0.05},
			{"MeleeMachete","weapon",0.04},
		//special
			{"WeaponHolder_ItemJerrycan","object",0.03},
		//mags special
			{"TrapBear","magazine",0.01},
			{"PartWoodPile","magazine",0.08},
		//bags
		//multiple spawns		
			{"","Farm",0.50},
			{"","trash",0.30},
			{"","generic",0.50}
		};
	};
	class Supermarket: Default {
		lootChance = 0.4;
		minRoaming = 2;
		maxRoaming = 6;
		zombieChance = 0.3;
		zombieClass[] = {"zZombie_Base","zZombie_Base","z_teacher","z_suit1","z_suit2","z_new_villager2","z_new_villager3","z_new_villager4"};
		lootType[] = {
		//one spawn
		//tools
			{"ItemWatch","generic",0.05},
			{"ItemCompass","generic",0.01},
			{"ItemMap","generic",0.06},
			{"ItemFlashlight","generic",0.05},
			{"ItemKnife","generic",0.02},
			{"ItemMatchbox","generic",0.05},
			{"Binocular","weapon",0.03},
			{"ACE_Earplugs","weapon",0.03},
		//weapons
			{"RH_mk2","weapon",0.02},
			{"RH_mk22","weapons",0.02},
			{"LeeEnfield","weapon",0.01},
			{"RH_python","weapon",0.01},
			{"Winchester1866","weapon",0.03},
			{"Crossbow_DZ","weapon",0.01},
			{"MR43","weapon", 0.01},			
		//special
			{"WeaponHolder_ItemTent","object",0.01},
		//mags special
			{"PartWoodPile","magazine",0.04},
		//bags
			{"DZ_Patrol_Pack_EP1","object",0.05}, //12
			{"DZ_ALICE_Pack_EP1","object",0.02}, // 16
			{"DZ_TK_Assault_Pack_EP1","object",0.02}, // 16
		//multiple spawns		
			{"","food",0.05},
			{"","Supermarket",0.50},
			{"","trash",0.30},
			{"","generic",0.80}
		};
	};	
	class Office: Residential {
		maxRoaming = 3;
		lootChance = 0.2;
		zombieClass[] = {"z_suit1","z_suit2"};
		lootType[] = {
		//one spawn
		//tools
			{"ItemWatch","weapon",0.08},
			{"ItemMap","weapon",0.06},
			{"Skin_RU_Policeman_DZ","magazine",0.03},
			{"Skin_Haris_Press_EP1_DZ","magazine",0.03},
		//weapons
		//special
		//mags special
			{"ItemAntibacterialWipe","magazine",0.04},
			{"ItemPainkiller","magazine",0.04},
		//bags
		//multiple spawns
			{"","trash",0.30},
			{"","generic",0.80}
		};
	};
	class InfectedCamps: Default { //5
		lootPos[] = {};
		lootType[] = {
		//one spawn
		//tools
			{"ItemWatch","generic",0.05},
			{"ItemCompass","generic",0.05},
			{"ItemFlashlight","generic",0.06},
			{"ItemKnife","generic",0.07},
			{"ItemMatchbox","generic",0.06},
			{"Binocular","weapon",0.06},
		//weapons
			{"RH_mk2","weapon",0.04},
			{"RH_mk22","weapons",0.02},
			//{"RH_m1911old","weapon",0.04}, //mil/police
			{"LeeEnfield","weapon",0.03},
			{"RH_python","weapon",0.04},
			{"Winchester1866","weapon",0.03},
			{"Crossbow_DZ","weapon",0.01},
			{"MR43","weapon",0.03},
			{"MeleeBaseBallBat","weapon",0.02},
			{"WeaponHolder_ItemCrowbar","object",0.08},
		//special
			{"WeaponHolder_PartGeneric","object",0.04},
			{"WeaponHolder_PartWheel","object",0.02},
			{"WeaponHolder_PartFueltank","object",0.02},
			{"WeaponHolder_PartEngine","object",0.02},
			{"WeaponHolder_ItemFuelcan","object",0.03},
			{"WeaponHolder_ItemTent","object",0.01},
			{"WeaponHolder_ItemFuelcan","object",0.03},
			{"MedBox0","object",0.05},
			{"MedBox1","object",0.05},
			{"FoodBox0","object",0.05},
		//mags special
			{"ItemWire","magazine",0.01},
			{"ItemTankTrap","magazine",0.04},
			{"ItemSodaMdew","magazine",0.01},
			{"PartWoodPile","magazine",0.06},
			{"Skin_Camo1_DZ","magazine",0.01},
			{"ItemBookBible","magazine",0.02},
		//bags
			{"DZ_ALICE_Pack_EP1","object",0.01}, // 16
			{"DZ_TK_Assault_Pack_EP1","object",0.02}, // 16
		//multiple spawns
			{"","medical",0.10},
			{"","trash",0.30},
			{"","generic",0.80}
		};
	};
	class HeliCrashWEST: Default {
		zombieChance = 1;
		maxRoaming = 8;
		zombieClass[] = {"z_soldier_pilot"};
		lootChance = 0.5;
		lootPos[] = {};
		lootType[] = {
		//one spawn
		//tools
			{"NVGoggles","weapon",0.01},
			{"ACE_Battery_Rangefinder","magazine",0.03}, 
			{"ACE_Kestrel4500","weapon",0.01},
			{"Skin_Pilot_EP1_DZ","magazine",0.03},
		//weapons
			{"FN_FAL","weapon",0.04},
			{"FN_FAL_ANPVS4","weapon",0.01},
			{"Mk_48_DZ","weapon",0.03},
			{"M249_DZ","weapon",0.04},
			{"BAF_L85A2_RIS_Holo","weapon",0.03},
			{"G36C","weapon",0.03},
			{"G36C_camo","weapon",0.03},
			{"G36_C_SD_camo","weapon",0.01},
			{"G36A_camo","weapon",0.03},
			{"G36K_camo","weapon",0.03},
			{"M9SD","weapon",0.02},
		//special
			{"MedBox0","object",0.05},
			{"AmmoBoxSmall_556","object",0.05},
			{"WeaponHolder_ItemCamoNet","object",0.01},
		//mags special
			{"Skin_Camo1_DZ","magazine",0.05},
			{"Skin_Sniper1_DZ","magazine",0.05},
		//bags
			{"HC_Ruck_NVG","object",0.01},
		//multiple spawns
		//multiple spawns
			{"","medical",0.25},
			{"","militaryWEST",0.25}
		};
	};
	class HeliCrashEAST: Default {
		zombieChance = 1;
		maxRoaming = 8;
		zombieClass[] = {"z_soldier_pilot"};
		lootChance = 0.5;
		lootPos[] = {};
		lootType[] = {
		//one spawn
		//tools
			{"Binocular","weapon",0.01},
			{"ItemKnife","generic",0.03},
			{"ItemCompass","generic",0.04},
			{"ACE_Battery_Rangefinder","magazine",0.03},
			{"ACE_Rangefinder_OD","weapon",0.01}, 
			{"ACE_Kestrel4500","weapon",0.01},
		//weapons
			{"RH_akm","weapon",0.03}, 
			{"RH_aks47","weapon",0.03}, 
			{"M14_EP1","weapon",0.02},
			{"RH_bizonsdk","weapon",0.04},
			{"DMR_DZ","weapon",0.04},
			{"RH_rpk74","weapon",0.02},
			{"RH_mk2SD","weapon",0.02},
		//special
			{"MedBox0","object",0.05},
			{"AmmoBoxSmall_762","object",0.3},
			{"WeaponHolder_PartVRotor","object",0.02},
			{"WeaponHolder_ItemCamoNet","object",0.01},
		//mags special
			{"100Rnd_762x54_PK","magazine",0.01},
		//bags
			{"HC_Ruck_MTC","object",0.01},
		//multiple spawns
			{"","medical",0.25},
			{"","militaryEAST",0.25}
		};
	};
	class Hospital: Default {
		zombieChance = 0.4;
		minRoaming = 2;
		maxRoaming = 6;
		zombieClass[] = {"z_doctor","z_doctor","z_doctor"};
		lootChance = 0.2;
		lootPos[] = {};
		lootType[] = {
		//one spawn
		//tools
		//weapons
		//special
			{"MedBox0","object",0.05},
			{"MedBox1","object",0.02},
			{"Skin_Doctor_DZ","magazine",0.05},
		//mags special
		//bags
		//multiple spawns
			{"","trash",0.30},
			{"","hospital",0.60}
		};
	};
	class Military: Default {
		zombieChance = 0.3;
		maxRoaming = 6;
		zombieClass[] = {"z_soldier","z_soldier_heavy","z_policeman","z_new_worker2","z_new_worker3","z_new_worker4"};
		lootChance = 0.2;
		lootPos[] = {};
		lootType[] = {
		//one spawn
		//tools
			{"Binocular","weapon",0.05},
			{"ItemFlashlightRed","generic",0.06},
			{"ItemKnife","generic",0.06},
			{"ItemGPS","weapon",0.01},
			{"ItemMap","generic",0.03},
			{"ItemEtool","weapon",0.03},
			{"ACE_GlassesGasMask_RU","weapon",0.03},
			{"ACE_Earplugs","weapon",0.06},
			{"ACE_YardAge450","generic",0.01},
			{"ACE_GlassesBalaklavaOlive","weapon",0.03},
			
		//weapons
			//PISTOL
			{"RH_g17","weapon",0.08},
			{"UZI_EP1","weapon",0.05},
			{"M9SD","weapon",0.01},
			{"RH_mk22sd","weapon",0.01},
			{"RH_m1911old","weapon",0.05},
			{"M9","weapon",0.05},			
			//SHOTGUN
			{"Remington870_lamp","weapon",0.05},
			{"M1014","weapon",0.06},
			//556
			{"M16A2","weapon",0.05},
			{"M16A2GL","weapon",0.02},
			{"M4A1_Aim","weapon",0.03},
			{"ACE_M4","weapon",0.04},
			{"M4A3_CCO_EP1","weapon",0.02},
			//762
			{"AK_74","weapon",0.06},
			{"RH_aks74uptk","weapon",0.03},
			{"RH_aks74u","weapon",0.06},
			{"RH_ak47","weapon",0.03},
			{"RH_ak47gl","weapon",0.03},
			{"RH_ak103","weapon",0.03},
			//SMG
			{"MP5A5","weapon",0.04},
			{"MP5SD","weapon",0.01},
			//MG
			//SNIPER
			{"M14_EP1","weapon",0.03},		
		//special
		//mags special
			{"ItemSandbag","magazine",0.04},
		//bags
			{"DZ_British_ACU","object",0.02}, // 18
			{"DZ_Backpack_EP1","object",0.01}, // 24			
		//multiple spawns
			{"","military",0.60},
			{"","trash",0.30},
			{"","generic",0.50}
		};
	};
	class MilitarySpecial: Default {
		zombieChance = 0.8;
		minRoaming = 2;
		maxRoaming = 6;
		zombieClass[] = {"z_soldier_heavy","z_new_worker2","z_new_worker3","z_new_worker4"};
		lootChance = 0.1;
		lootPos[] = {};
		lootType[] = {
		//one spawn
		//tools
			{"Binocular","weapon",0.03},
			{"ItemFlashlightRed","generic",0.05},
			{"ItemKnife","generic",0.05},
			{"ItemGPS","weapon",0.01},
			{"ItemMap","generic",0.03},
			{"Binocular_Vector","generic",0.01},
			{"ACE_Earplugs","weapon",0.06},
			{"ACE_DAGR", "weapon",0.01},
			{"ACE_Battery_Rangefinder","magazine",0.03},
			{"ACE_Rangefinder_OD","weapon",0.01}, 
			{"ACE_Kestrel4500","weapon",0.01},
			{"ACE_GlassesBalaklavaGray","weapon",0.03},
		//Pistol
			{"RH_usp","weapon",0.04}, 
			{"RH_g18","weapon",0.03},	
			{"M9SD","weapon",0.02},
			{"RH_mk22sd","weapon",0.02},
			{"UZI_EP1","weapon",0.08},
			{"RH_g17","weapon",0.07},

		//weapons
			//shotgun
			{"ACE_SPAS12","weapon",0.07},
			{"Remington870_lamp","weapon",0.06},
			//556
			{"M249_DZ","weapon",0.01},
			{"M16A2","weapon",0.05},
			{"M16A2GL","weapon",0.05},
			{"M4A1_Aim","weapon",0.02},
			{"DMR_DZ","weapon",0.02},
			{"ACE_M4","weapon",0.05},
			{"ACE_M14_ACOG","weapon",0.03},
			{"G36_C_SD_camo","weapon",0.01},
			{"ACE_SOC_M4A1_Aim","weapon",0.02},
			{"ACE_SOC_M4A1_Eotech","weapon",0.02},
			{"M4A3_CCO_EP1","weapon",0.03},
			//762
			{"Sa58V_RCO_EP1","weapon",0.04},
			{"Sa58V_CCO_EP1","weapon",0.04},
			{"AKS_74_kobra","weapon",0.05},
			{"AKS_74_U","weapon",0.05},
			{"AK_47_M","weapon",0.05},
			{"AK_74","weapon",0.05},
			{"Sa58P_EP1","weapon",0.02},
			{"Sa58V_EP1","weapon",0.02},			
			//SNIPER
			{"M24","weapon",0.01},
			{"SVD_CAMO_DZ","weapon",0.01},
			{"SVD_DZ","weapon",0.02},
			{"M40A3","weapon",0.02},
			//Machine Gun
			{"M240_DZ","weapon",0.01},
			{"Mk_48_DZ","weapon",0.01},
		//special
			{"AmmoBoxSmall_556","object",0.04},
			{"AmmoBoxSmall_762","object",0.02},
			{"WeaponHolder_ItemCamoNet","object",0.03},
		//mags special
			{"PipeBomb","magazine",0.01},
			{"100Rnd_762x54_PK","magazine",0.01},
			{"ACE_BBETTY_M","magazine",0.01},
			{"ACE_MON50_M","weapon",0.01},
			{"ACE_CLAYMORE_M","weapon",0.01}, 
		//bags
			{"HC_Ruck_OD","object",0.01}, // 24
			{"HC_Ruck_BLK","object",0.01}, // 24
			{"HC_Ruck_MAR","object",0.01},	
			{"HC_Ruck_WDL","object",0.01},	

		//multiple spawns
			{"","military",0.70},
			{"","trash",0.30},
			{"","generic",0.50}
		};
	};
	class Hunting: Default {
		zombieChance = 0.6;
		minRoaming = 1;
		maxRoaming = 3;
		zombieClass[] = {"z_hunter","z_hunter","z_hunter"};
		lootChance = 0.8;
		lootPos[] = {};
		lootType[] = {
		//one spawn
		//tools
			{"ItemMap","weapon",0.06},
			{"ItemFlashlight","generic",0.06},
			{"ItemKnife","generic",0.05},
			{"ItemMatchbox","generic",0.07},
			{"ACE_YardAge450","generic",0.01},
		//weapons
			{"Crossbow_DZ","weapon",0.04},
			{"MeleeMachete","weapon",0.04},
			{"huntingrifle","weapon",0.05},
			{"MR43","weapon",0.08}, 			
			{"Winchester1866","weapon",0.06},		
		//special
			{"WeaponHolder_ItemTent","object",0.02},
		//mags special
			{"TrapBear","magazine",0.01},
		//bags
		//multiple spawns
			{"","hunter",0.10},
			{"","trash",0.30},
			{"","generic",0.50}
		};
	};
#include "CfgBuildingPos.hpp"

};
