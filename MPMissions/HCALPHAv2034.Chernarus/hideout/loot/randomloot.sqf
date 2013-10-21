_randomLoot = switch (floor random(10)) do {
	// M4sbr lootspawn
	case 0: {"hideout\loot\m4sbrloot.sqf"};
	// M4sbr lootspawn
	case 1: {"hideout\loot\m4sbrloot.sqf"};
	// M4sbr lootspawn
	case 2: {"hideout\loot\m4sbrloot.sqf"};
	// M4sbr lootspawn
	case 3: {"hideout\loot\m4sbrloot.sqf"};
	// HK416 lootspawn
	case 4: {"hideout\loot\hk416loot.sqf"};
	// HK416 lootspawn
	case 5: {"hideout\loot\hk416loot.sqf"};
	// HK416 lootspawn
	case 6: {"hideout\loot\hk416loot.sqf"};
	// HK416 lootspawn
	case 7: {"hideout\loot\hk416loot.sqf"};
	// MK48mod1elcan lootspawn
	case 8: {"hideout\loot\mk48mod1elcanloot.sqf"};
	// MK14ebr lootspawn
	case 9: {"hideout\loot\mk14ebrloot.sqf"};
};

_nul = [] execVM _randomLoot;