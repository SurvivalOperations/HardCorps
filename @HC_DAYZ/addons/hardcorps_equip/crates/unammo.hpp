//Single Ammo Crates
//Pistol
class AmmoBox_9mm_15rnd : SmallAmmoHolder {
	scope = public;
	displayName = "9x19 Ammunition";
	
	class transportmagazines {
		class _xx_15Rnd_9x19_M9 {
			magazine = "15Rnd_9x19_M9";
			count = 20;
		};
	};
};

class AmmoBox_45cal_8rnd : SmallAmmoHolder {
	scope = public;
	displayName = ".45 Ammunition";
	
	class transportmagazines {
		class _xx_RH_8Rnd_45cal_m1911 {
			magazine = "RH_8Rnd_45cal_m1911";
			count = 20;
		};
	};
};
//Rifle
class AmmoBox_556_300rnd : SmallAmmoHolder {
	scope = public;
	displayName = "300rnds of 5.56";
	
	class transportmagazines {
		class _xx_30Rnd_556x45_Stanag {
			magazine = "30Rnd_556x45_Stanag";
			count = 10;
		};
	};
};
class AmmoBox_556_900rnd : UNAmmoHolder {
	scope = public;
	displayName = "900rnds of 5.56";
	
	class transportmagazines {
		class _xx_30Rnd_556x45_Stanag {
			magazine = "30Rnd_556x45_Stanag";
			count = 30;
		};
	};
};
//Battle Rifle
class AmmoBox_DMR : SmallAmmoHolder {
	scope = public;
	displayName = "DMR 7.62 Ammounition";
	
	class transportmagazines {
		class _xx_20Rnd_762x51_DMR {
			magazine = "20Rnd_762x51_DMR";
			count = 10;
		};
	};
};

//MG
class AmmoBox_762_belted : UNAmmoHolder {
	scope = public;
	displayName = "Belted 7.62";
	
	class transportmagazines {
		class _xx_100Rnd_762x51_M240 {
			magazine = "100Rnd_762x51_M240";
			count = 6;
		};
	};
};
class AmmoBox_556_belted : UNAmmoHolder {
	scope = public;
	displayName = "Belted 5.56";
	
	class transportmagazines {
		class _xx_200Rnd_556x45_M249 {
			magazine = "200Rnd_556x45_M249";
			count = 6;
		};
	};
};
//Shotgun
class AmmoBox_BBeneli : SmallAmmoHolder {
	scope = public;
	displayName = "Beneli Ammunition";
	
	class transportmagazines {
		class _xx_8Rnd_B_Beneli_74Slug {
			magazine = "8Rnd_B_Beneli_74Slug";
			count = 12;
		};
		class _xx_8Rnd_B_Beneli_Pellets {
			magazine = "8Rnd_B_Beneli_Pellets";
			count = 12;
		};
	};
};
//Explosives
class AmmoBox_203_HE : UNAmmoHolder {
	scope = public;
	displayName = "M203 HE";
	
	class transportmagazines {
		class _xx_1Rnd_HE_M203 {
			magazine = "1Rnd_HE_M203";
			count = 20;
		};
	};
};
class AmmoBox_GrenadeWest : UNAmmoHolder {
	scope = public;
	displayName = "Grenade & Smoke Box";
	
	class transportmagazines {
		class _xx_HandGrenade_west {
			magazine = "HandGrenade_west";
			count = 8;
		};
		class _xx_SmokeShell {
			magazine = "SmokeShell";
			count = 8;
		};
		class _xx_SmokeShellRed {
			magazine = "SmokeShellRed";
			count = 8;
		};
		class _xx_SmokeShellGreen {
			magazine = "SmokeShellGreen";
			count = 8;
		};
	};
};
//Misc
class AmmoBox_203_Flare : UNAmmoHolder {
	scope = public;
	displayName = "M203 Flares";
	
	class transportmagazines {
		class _xx_FlareWhite_M203 {
			magazine = "FlareWhite_M203";
			count = 20;
		};
	};
};
class AmmoBox_203_Smoke : UNAmmoHolder {
	scope = public;
	displayName = "M203 Smoke";
	
	class transportmagazines {
		class _xx_1Rnd_Smoke_M203 {
			magazine = "1Rnd_Smoke_M203";
			count = 20;
		};
	};
};








