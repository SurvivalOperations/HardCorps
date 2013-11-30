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
_ammo addweaponcargo ["M32_EP1",1];
_ammo addweaponcargo ["ACE_SKS",1];
_ammo addweaponcargo ["M40A3",1];
_ammo addweaponcargo ["ACE_P8",1];

//AMMO ONLY
_ammo addmagazinecargo ["6Rnd_HE_M203", 4];
_ammo addmagazinecargo ["6Rnd_FlareGreen_M203", 2];
_ammo addmagazinecargo ["6Rnd_FlareWhite_M203", 2];
_ammo addmagazinecargo ["6Rnd_SmokeRed_M203", 2];
_ammo addmagazinecargo ["ACE_10Rnd_762x39_B_SKS", 4];
_ammo addmagazinecargo ["5Rnd_762x51_M24", 4];
_ammo addmagazinecargo ["ACE_15Rnd_9x19_P8", 4];
_ammo addmagazinecargo ["SmokeShell",4];
_ammo addmagazinecargo ["HandGrenade_West",2];

//ITEMS ONLY
_ammo addweaponcargo ["ItemGPS",1];
_ammo addweaponcargo ["ACE_KeyCuffs", 2];
_ammo addweaponcargo ["ACE_Earplugs", 6];

//BACKPACKS ONLY
_ammo addweaponcargo ["DZ_Backpack_EP1",1];
sleep 150000;
};