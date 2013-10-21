class CfgLoot {

	#include "BuildingLoot\Supermarket.hpp"
	#include "BuildingLoot\Farm.hpp"
	#include "BuildingLoot\Industrial.hpp"
	#include "BuildingLoot\Residential.hpp"
	#include "BuildingLoot\Church.hpp"
	#include "BuildingLoot\militaryEASTcrash.hpp"
	#include "BuildingLoot\militaryWESTcrash.hpp"
	#include "BuildingLoot\Hospital.hpp"
	#include "BuildingLoot\Hunter.hpp"
	
	//Zed Loot
	policeman[] = {
	//med
		{"ItemBandage",0.10},
	//ammo
		{"RH_8Rnd_45cal_m1911",0.03},
		{"RH_6Rnd_357_Mag",0.03},
		{"15Rnd_W1866_Slug",0.03},
		{"8Rnd_B_Beneli_74Slug",0.03},
		{"HandRoadFlare",0.05},
	//drinks
		{"ItemWaterbottleUnfilled",0.01}
	//food
	//special
	//trash
	};
	civilian[] = {
	//med
		{"ItemBandage",0.06},
		{"ItemPainkiller",0.03},
	//ammo
		{"RH_8Rnd_9x19_Mk",0.04},
		//{"RH_8Rnd_45cal_m1911",0.04}, //mil/police
		{"RH_6Rnd_357_Mag",0.04},
		//{"2Rnd_shotgun_74Slug",0.04}, //pellets preferred for m43
		{"2Rnd_shotgun_74Pellets",0.08},
	//drinks
		{"ItemSodaCoke",0.02},
		{"ItemSodaPepsi",0.02},
	//food
		{"FoodCanBakedBeans",0.03},
		{"FoodCanPasta",0.03}
	//special
	//trash
	};
	viralloot[] = {
	//med
		{"ItemBandage",0.02},
	//ammo
		{"RH_8Rnd_9x19_Mk",0.04},
		//{"RH_8Rnd_45cal_m1911",0.04}, //mil/police
		{"RH_6Rnd_357_Mag",0.04},
		//{"2Rnd_shotgun_74Slug",0.04}, //pellets preferred for m43
		{"2Rnd_shotgun_74Pellets",0.08},
		//{"20Rnd_762x51_FNFAL",0.02}, //really (one of the best ammo)?
	//drinks
		{"ItemSodaPepsi",0.02},
	//food
		{"FoodCanFrankBeans",0.05},
		{"FoodCanPasta",0.05},
		{"FoodCanSardines",0.05}
	//special
	//trash
	};
	food[] = {
	//med
	//ammo
	//drinks
	//food
		{"FoodCakeCremeCakeClean",0.01},
		{"ItemSodaMtngreen",0.01}
	//special
	//trash
	};
	generic[] = {
	//med
		{"ItemBandage",0.03},
		{"ItemAntibacterialWipe",0.03},
		{"ItemHeatPack",0.04},
	//ammo
		{"RH_8Rnd_9x19_Mk",0.09},
		//{"RH_8Rnd_45cal_m1911",0.04}, //mil/police
		{"RH_6Rnd_357_Mag",0.04},
		//{"2Rnd_shotgun_74Slug",0.04}, //pellets preferred for m43
		{"2Rnd_shotgun_74Pellets",0.08},
		{"5x_22_LR_17_HMR",0.01},
		{"10x_303",0.04},
		{"15Rnd_W1866_Slug",0.06},
		//{"20Rnd_762x51_FNFAL",0.02}, //really (one of the best ammo)?
		{"WoodenArrow",0.04},
		{"HandRoadFlare",0.07},
		{"ItemPainkiller",0.02},
		{"HandChemGreen",0.01},
		{"HandChemBlue",0.03},
		{"HandChemRed",0.03},
	//drinks
		{"ItemWaterbottleUnfilled",0.06},
		{"ItemWaterbottle",0.02},
		{"ItemSodaCoke",0.01},
		{"ItemSodaPepsi",0.01},	
	//food
		{"FoodCanBakedBeans",0.05},
		{"FoodCanSardines",0.05},
		{"FoodCanFrankBeans",0.05},
		{"FoodCanPasta",0.05},
		{"FoodCanUnlabeled",0.04},
		{"FoodCanRusUnlabeled",0.05},
		{"FoodCanRusStew",0.05},
		{"FoodCanRusPork",0.05},
		{"FoodCanRusPeas",0.05},
		{"FoodCanRusMilk",0.04},
		{"FoodCanRusCorn",0.05},
		{"FoodPistachio",0.03},
		{"FoodNutmix",0.04},
	//special
	//trash
		{"ItemSodaCokeEmpty",0.05},
		{"ItemSodaPepsiEmpty",0.03},
		{"FoodCanUnlabeledEmpty",0.05},
		{"FoodCanRusUnlabeledEmpty",0.02},
		{"FoodCanRusPorkEmpty",0.02},
		{"FoodCanRusPeasEmpty",0.03},
		{"FoodCanRusMilkEmpty",0.02},
		{"FoodCanRusCornEmpty",0.05},
		{"FoodCanRusStewEmpty",0.03},
		{"TrashTinCan",0.05},
		{"TrashJackDaniels",0.02},
		{"ItemSodaEmpty",0.03},
		{"ItemTrashToiletpaper",0.01},
		{"ItemTrashRazor",0.01},
		{"ItemCards",0.02}
	};
	medical[] = {
	//med
		{"ItemBandage",0.08},
		{"ItemPainkiller",0.05},
		{"ItemMorphine",0.05},
		{"ItemEpinephrine",0.03},
		{"ItemAntibiotic",0.01},
		{"ItemAntibacterialWipe",0.04},
		{"ItemHeatPack",0.03}
	//ammo
	//drinks
	//food
	//special
	//trash
	};
	militaryEast[] = {
	//med
		{"ItemBandage",0.04},
		{"ItemPainkiller",0.02},
		{"ItemMorphine",0.01},
		{"ItemHeatPack",0.04},
	//ammo\
		{"RH_20Rnd_9x39_SP6_mag",0.03},
		{"RH_20Rnd_9x39_val_mag",0.01},
		{"RH_20Rnd_9x18_aps",0.02},
		{"RH_45Rnd_545x39_mag",0.02},
		{"RH_75Rnd_762x39_mag",0.02},
		{"64Rnd_9x19_Bizon",0.04},
		{"20Rnd_762x51_FNFAL",0.04},
		{"RH_8Rnd_9x19_Mksd",0.01},
		{"30Rnd_762x39_AK47",0.02},
		{"30Rnd_545x39_AK",0.02},
		{"8Rnd_B_Beneli_74Slug",0.04},
		{"HandGrenade_east",0.01},
		{"SmokeShell",0.04},
		{"SmokeShellRed",0.04},
		{"SmokeShellGreen",0.04},
		{"8Rnd_B_Beneli_Pellets",0.04},
		{"30Rnd_9x19_MP5",0.02},
		{"30Rnd_9x19_MP5SD",0.01},
		{"HandChemGreen",0.04},
		{"HandChemBlue",0.04},
		{"HandChemRed",0.04},
		{"RH_30Rnd_6x35_PDW",0.02},
	//drinks
		{"ItemSodaEmpty",0.06},
		{"ItemSodaCoke",0.01},
		{"ItemSodaPepsi",0.01},
	//food
		{"FoodCanBakedBeans",0.01},
		{"FoodCanSardines",0.01},
		{"FoodCanFrankBeans",0.01},
		{"FoodCanPasta",0.01},
		{"FoodCanUnlabeled",0.01},
		{"FoodPistachio",0.01},
		{"FoodNutmix",0.01},
		{"FoodCanRusUnlabeled",0.01},
		{"FoodCanRusStew",0.01},
		{"FoodCanRusPork",0.01},
		{"FoodCanRusPeas",0.01},
		{"FoodCanRusMilk",0.01},
		{"FoodCanRusCorn",0.01},
		{"FoodMRE",0.03},
	//special
		{"ACE_RDG2",0.03},
		{"ACE_ANM14",0.01},
	//trash
		{"ItemSodaCokeEmpty",0.05},
		{"ItemSodaPepsiEmpty",0.03},
		{"FoodCanUnlabeledEmpty",0.05},
		{"FoodCanRusUnlabeledEmpty",0.02},
		{"FoodCanRusPorkEmpty",0.02},
		{"FoodCanRusPeasEmpty",0.03},
		{"FoodCanRusMilkEmpty",0.02},
		{"FoodCanRusCornEmpty",0.05},
		{"FoodCanRusStewEmpty",0.03},
		{"TrashTinCan",0.05},
		{"TrashJackDaniels",0.02},
		{"ItemSodaEmpty",0.03},
		{"ItemTrashToiletpaper",0.01},
		{"ItemTrashRazor",0.01},
		{"ItemCards",0.02}
	};
	militaryWest[] = {
	//med
		{"ItemBandage",0.04},
		{"ItemPainkiller",0.02},
		{"ItemMorphine",0.01},
		{"ItemHeatPack",0.04},
	//ammo
		{"RH_8Rnd_45cal_m1911",0.04},
		{"RH_20Rnd_762x51_hk417",0.02},
		{"30Rnd_556x45_Stanag",0.02},
		{"20Rnd_762x51_DMR",0.02},
		{"RH_20Rnd_762x51_SD_SCAR",0.02},
		{"RH_17Rnd_9x19_g17",0.05},
		{"15Rnd_9x19_M9SD",0.01},
		{"15Rnd_9x19_M9",0.03},
		{"5Rnd_762x51_M24",0.01},
		{"8Rnd_B_Beneli_74Slug",0.04},
		{"1Rnd_HE_M203",0.01},
		{"FlareWhite_M203",0.02},
		{"FlareGreen_M203",0.02},
		{"1Rnd_Smoke_M203",0.01},		
		{"200Rnd_556x45_M249",0.01},
		{"HandGrenade_west",0.01},
		{"SmokeShell",0.04},
		{"SmokeShellRed",0.04},
		{"SmokeShellGreen",0.04},
		{"8Rnd_B_Beneli_Pellets",0.04},
		{"30Rnd_556x45_StanagSD",0.01},
		{"30Rnd_9x19_MP5",0.02},
		{"30Rnd_9x19_MP5SD",0.01},
		{"100Rnd_762x51_M240",0.01},
		{"HandChemGreen",0.04},
		{"HandChemBlue",0.04},
		{"HandChemRed",0.04},
		{"RH_30Rnd_6x35_PDW",0.02},
	//drinks
		{"ItemSodaEmpty",0.06},
		{"ItemSodaCoke",0.01},
		{"ItemSodaPepsi",0.01},
	//food
		{"FoodCanBakedBeans",0.01},
		{"FoodCanSardines",0.01},
		{"FoodCanFrankBeans",0.01},
		{"FoodCanPasta",0.01},
		{"FoodCanUnlabeled",0.01},
		{"FoodPistachio",0.01},
		{"FoodNutmix",0.01},
		{"FoodCanRusUnlabeled",0.01},
		{"FoodCanRusStew",0.01},
		{"FoodCanRusPork",0.01},
		{"FoodCanRusPeas",0.01},
		{"FoodCanRusMilk",0.01},
		{"FoodCanRusCorn",0.01},
		{"FoodMRE",0.03},
	//special
		{"ACE_M84",0.02},
		{"ACE_ANM14",0.01},
		{"ACE_TRIPFLARE_M",0.03},
	//trash
		{"ItemSodaCokeEmpty",0.05},
		{"ItemSodaPepsiEmpty",0.03},
		{"FoodCanUnlabeledEmpty",0.05},
		{"FoodCanRusUnlabeledEmpty",0.02},
		{"FoodCanRusPorkEmpty",0.02},
		{"FoodCanRusPeasEmpty",0.03},
		{"FoodCanRusMilkEmpty",0.02},
		{"FoodCanRusCornEmpty",0.05},
		{"FoodCanRusStewEmpty",0.03},
		{"TrashTinCan",0.05},
		{"TrashJackDaniels",0.02},
		{"ItemSodaEmpty",0.03},
		{"ItemTrashToiletpaper",0.01},
		{"ItemTrashRazor",0.01},
		{"ItemCards",0.02}
	};
	explosives[] = {
		{"ItemCards",0.02}
	};
	trash[] = {
		{"ItemSodaCokeEmpty",0.05},
		{"ItemSodaPepsiEmpty",0.03},
		{"FoodCanUnlabeledEmpty",0.05},
		{"FoodCanRusUnlabeledEmpty",0.02},
		{"FoodCanRusPorkEmpty",0.02},
		{"FoodCanRusPeasEmpty",0.03},
		{"FoodCanRusMilkEmpty",0.02},
		{"FoodCanRusCornEmpty",0.05},
		{"FoodCanRusStewEmpty",0.03},
		{"TrashTinCan",0.05},
		{"TrashJackDaniels",0.02},
		{"ItemSodaEmpty",0.03},
		{"ItemTrashToiletpaper",0.01},
		{"ItemTrashRazor",0.01},
		{"ItemCards",0.02}		
	};

};
