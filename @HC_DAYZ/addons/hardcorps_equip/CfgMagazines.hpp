class CfgMagazines {
	class CA_Magazine;

	class ItemChloroform : CA_Magazine {
		scope = public;
		count = 1;
		type = 256;
		displayName = "Chloroform";
		picture = "\hardcorps_equip\textures\equip_chloroform_CA.paa";
		descriptionShort = "Its vapor depresses the central nervous system of a patient, allowing a doctor to perform various otherwise painful procedures.";
	};	

	class ItemTrophyEar : CA_Magazine {
		scope = public;
		count = 1;
		type = 256;
		picture = "\hardcorps_equip\textures\equip_eartrophy_CA.paa";
		displayName = $HC_STR_EQUIP_NAME_2;
		descriptionShort = $HC_STR_EQUIP_DESC_2;
	};
};