class SkinBase : CA_Magazine {
		scope = public;
		count = 1;
		type = 256;
		displayName = $STR_EQUIP_NAME_CLOTHES;
		descriptionShort = $STR_EQUIP_DESC_CLOTHES;
		model = "\dayz_equip\models\cloth_parcel.p3d";
		picture = "\dayz_equip\textures\equip_cloth_parcel_ca.paa";
		class ItemActions {
			class Use {
				text = $STR_EQUIP_TEXT_CLOTHES;
				script = "spawn player_wearClothes;";
			};
		};
	};
	class Skin_Sniper1_DZ : SkinBase {
		displayName = $STR_EQUIP_NAME_GHILLIE;
		descriptionShort = $STR_EQUIP_DESC_GHILLIE;
	};
	
	class Skin_Camo1_DZ : SkinBase {
		displayName = $STR_EQUIP_NAME_CAMO;
		descriptionShort = $STR_EQUIP_DESC_CAMO;
	};
	
	class Skin_Survivor2_DZ : SkinBase {
		displayName = $STR_EQUIP_NAME_CIV;
		descriptionShort = $STR_EQUIP_DESC_CIV;
	};
	
	class Skin_Soldier1_DZ : SkinBase {
		displayName = $STR_EQUIP_NAME_SOLDIER;
		descriptionShort = $STR_EQUIP_DESC_SOLDIER;
	}; 

// SKins

	class Skin_SO_Officer_DZ : SkinBase {
		displayName = "Officer";
		descriptionShort = "Uniform only for the officers of 'Survival Operations'.";
	}; 
	class Skin_Doctor_DZ : SkinBase {
		displayName = "Doctor";
		descriptionShort = "Doctor Uniform";
	}; 

// Epoch SKins


	class Skin_RU_Policeman_DZ: SkinBase
	{
		scope = 2;
		displayName = "Sergei";
		descriptionShort = "Police Officer Uniform";
	};
	class Skin_Pilot_EP1_DZ: SkinBase
	{
		scope = 2;
		displayName = "Ethan";
		descriptionShort = "Pilot Uniform";
	};
	class Skin_Haris_Press_EP1_DZ: SkinBase
	{
		scope = 2;
		displayName = "Harry";
		descriptionShort = "Press Uniform";
	};
	class Skin_Ins_Soldier_GL_DZ: SkinBase
	{
		scope = 2;
		displayName = "Terrorist Uniform";
		descriptionShort = "Terrorist Uniform";
	};
	class Skin_GUE_Commander_DZ: SkinBase
	{
		scope = 2;
		displayName = "Rebel Uniform";
		descriptionShort = "Rebel Uniform";
	};
	class Skin_Functionary1_EP1_DZ: SkinBase
	{
		scope = 2;
		displayName = "Donald";
		descriptionShort = "Business Suit";
	};
	class Skin_Priest_DZ: SkinBase
	{
		scope = 2;
		displayName = "James";
		descriptionShort = "Priest Outfit";
	};
	class Skin_Rocker1_DZ: SkinBase
	{
		scope = 2;
		displayName = "Duane";
		descriptionShort = "Rocker (black)";
	};	
	class Skin_Rocker2_DZ: SkinBase
	{
		scope = 2;
		displayName = "Rod";
		descriptionShort = "Rocker (brown)";
	};
	class Skin_Rocker3_DZ: SkinBase
	{
		scope = 2;
		displayName = "Van";
		descriptionShort = "Rocker (blue)";
	};
	class Skin_Rocker4_DZ: SkinBase
	{
		scope = 2;
		displayName = "Bruce";
		descriptionShort = "Rocker (green)";
	};
	class Skin_Bandit1_DZ: SkinBase
	{
		scope = 2;
		displayName = "Bandit Outfit";
		descriptionShort = "Bandit Outfit";
	};	
	class Skin_Bandit2_DZ: SkinBase
	{
		scope = 2;
		displayName = "Bandit Camo";
		descriptionShort = "Bandit Camo Outfit";
	};
	class Skin_GUE_Soldier_Sniper_DZ: SkinBase
	{
		scope = 2;
		displayName = "Bandit Sniper";
		descriptionShort = "Bandit Sniper Outfit";
	};
	class Skin_GUE_Soldier_Crew_DZ: SkinBase
	{
		scope = 2;
		displayName = "Bandit Baklava";
		descriptionShort = "Bandit Baklava Outfit";
	};
	class Skin_GUE_Soldier_CO_DZ: SkinBase
	{
		scope = 2;
		displayName = "Bandit Mask";
		descriptionShort = "Bandit Mask Outfit";
	};
	class Skin_BanditW1_DZ: SkinBase
	{
		scope = 2;
		displayName = "Bandit Annie";
		descriptionShort = "Bandit wrap blue top with brown pants.";
	};
	class Skin_BanditW2_DZ: SkinBase
	{
		scope = 2;
		displayName = "Bandit Jane";
		descriptionShort = "Bandit wrap grey top with brown camo pants.";
	};
	class Skin_SurvivorW3_DZ: SkinBase
	{
		scope = 2;
		displayName = "Jane";
		descriptionShort = "Grey top with brown camo pants.";
	};
	class Skin_SurvivorW2_DZ: SkinBase
	{
		scope = 2;
		displayName = "Annie";
		descriptionShort = "Civilian (female)";
	};
	class Skin_SurvivorWpink_DZ: SkinBase
	{
		scope = 2;
		displayName = "Melly (female)";
		descriptionShort = "Purple top with blue pants.";
	};
	class Skin_SurvivorWsequisha_DZ: SkinBase
	{
		scope = 2;
		displayName = "Maria (female)";
		descriptionShort = "Maria Clothes (female)";
	};
	class Skin_SurvivorWsequishaD_DZ: SkinBase
	{
		scope = 2;
		displayName = "Sequisha (female)";
		descriptionShort = "Sequisha Clothes (female)";
	};
	class Skin_SurvivorWcombat_DZ: SkinBase
	{
		scope = 2;
		displayName = "Alejandria";
		descriptionShort = "Blue camo top with brown camo pants.";
	};
	class Skin_SurvivorWdesert_DZ: SkinBase
	{
		scope = 2;
		displayName = "Savannah";
		descriptionShort = "White top with brown pants.";
	};
	class Skin_SurvivorWurban_DZ: SkinBase
	{
		scope = 2;
		displayName = "Sophia";
		descriptionShort = "Maroon top with grey pants.";
	};
	class Skin_TK_INS_Warlord_EP1_DZ: SkinBase
	{
		scope = 2;
		displayName = "Takistani Warlord";
		descriptionShort = "Takistani Warlord";
	};
	class Skin_TK_INS_Soldier_EP1_DZ: SkinBase
	{
		scope = 2;
		displayName = "Takistani Soldier";
		descriptionShort = "Takistani Soldier";
	};
	class Skin_CZ_Special_Forces_GL_DES_EP1_DZ: SkinBase
	{
		scope = 2;
		displayName = "Special Forces";
		descriptionShort = "Special Forces";
	};
	class Skin_Drake_Light_DZ: SkinBase
	{
		scope = 2;
		displayName = "Desert Camo";
		descriptionShort = "Desert Camo";
	};
	class Skin_Soldier_Bodyguard_AA12_PMC_DZ: SkinBase
	{
		scope = 2;
		displayName = "Bodyguard";
		descriptionShort = "Bodyguard";
	};
	class Skin_FR_OHara_DZ: SkinBase
	{
		scope = 2;
		displayName = "Jungle Camo";
		descriptionShort = "Jungle Camo";
	};
	class Skin_FR_Rodriguez_DZ: SkinBase
	{
		scope = 2;
		displayName = "Gunner Outfit";
		descriptionShort = "Gunner Outfit";
	};
	class Skin_CZ_Soldier_Sniper_EP1_DZ: SkinBase
	{
		scope = 2;
		displayName = "Desert Ghillie";
		descriptionShort = "Desert Ghillie";
	};
	class Skin_Graves_Light_DZ: SkinBase
	{
		scope = 2;
		displayName = "Urban Camo";
		descriptionShort = "Urban Camo";
	};
	class Skin_Soldier_Sniper_PMC_DZ: SkinBase
	{
		scope = 2;
		displayName = "Marksman";
		descriptionShort = "Marksman";
	};
	class Skin_Soldier_TL_PMC_DZ: SkinBase
	{
		scope = 2;
		displayName = "Team Leader";
		descriptionShort = "Team Leader";
	};