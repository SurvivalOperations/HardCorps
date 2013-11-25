//singles
	//explosives
	class AmmoBox_GrenadeEast : UNAmmoHolder {
		scope = public;
		displayName = "Grenade & Smoke Box";
		
		class transportmagazines {
			class _xx_HandGrenade_west {
				magazine = "HandGrenade_east";
				count = 8;
			};
			class _xx_SmokeShell {
				magazine = "ACE_RDG2";
				count = 16;
			};
		};
	};

	class AmmoBox_545_300rnds : UNAmmoHolder {
		scope = public;
		displayName = "300 Rnds of 5.45";
		
		class transportmagazines {
			class _xx_30Rnd_545x39_AK {
				magazine = "30Rnd_545x39_AK";
				count = 10;
			};
		};
	};

	class AmmoBox_545_900rnds : UNAmmoHolder {
		scope = public;
		displayName = "900 Rnds of 5.45";
		
		class transportmagazines {
			class _xx_30Rnd_545x39_AK {
				magazine = "30Rnd_545x39_AK";
				count = 30;
			};
		};
	};