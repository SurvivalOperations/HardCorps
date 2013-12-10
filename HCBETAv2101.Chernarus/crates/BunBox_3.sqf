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
_ammo addweaponcargo ["MG36",1];
_ammo addweaponcargo ["M40A3",1];
_ammo addweaponcargo ["RH_pp2000p",1];

//AMMO ONLY
_ammo addmagazinecargo ["6Rnd_HE_M203", 1];
_ammo addmagazinecargo ["6Rnd_FlareGreen_M203", 1];
_ammo addmagazinecargo ["6Rnd_FlareWhite_M203", 1];
_ammo addmagazinecargo ["6Rnd_SmokeRed_M203", 1];
_ammo addmagazinecargo ["ACE_100Rnd_556x45_S_BetaCMag", 2];
_ammo addmagazinecargo ["30Rnd_9x19_MP5p", 3];
_ammo addmagazinecargo ["5Rnd_762x51_M24", 2];
_ammo addmagazinecargo ["SmokeShell",2];
_ammo addmagazinecargo ["HandGrenade_West",1];

//ITEMS ONLY
_ammo addweaponcargo ["ItemGPS",1];
_ammo addweaponcargo ["ACE_KeyCuffs", 1];
_ammo addweaponcargo ["ACE_Earplugs", 2];

//BACKPACKS ONLY
sleep 150000;
};