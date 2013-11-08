//HardCorps AMMO CRATE filler
//ONLY SPAWNS UPON RESTART
// _refill = [cratename] execVM "ammo.sqf"

_ammo = _this select 0;
while {true} do
{
_ammo setdamage 0;

clearmagazinecargo _ammo;
clearweaponcargo _ammo;

//WEAPONS ONLY
_ammo addweaponcargo ["CZ_750_S1_ACR",1];
_ammo addweaponcargo ["ACE_M27_IAR_ACOG",1];
_ammo addweaponcargo ["ACE_P8",1];

//AMMO ONLY
_ammo addmagazinecargo ["ACE_5Rnd_762x51_T_M24", 2];
_ammo addmagazinecargo ["5Rnd_762x51_M24", 4];
_ammo addmagazinecargo ["20Rnd_556x45_Stanag", 4];
_ammo addmagazinecargo ["ACE_15Rnd_9x19_P8", 4];
_ammo addmagazinecargo ["SmokeShell",4];
_ammo addmagazinecargo ["HandGrenade_West",2];

//ITEMS ONLY
_ammo addweaponcargo ["ItemGPS",1];
_ammo addweaponcargo ["ACE_KeyCuffs", 2];
_ammo addweaponcargo ["ACE_Earplugs", 6];

//BACKPACKS ONLY
_ammo addweaponcargo ["ACE_BackPack",1];
sleep 150000;
};