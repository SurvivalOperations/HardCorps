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
_ammo addweaponcargo ["ACE_HK416_D14_SD",2];
_ammo addweaponcargo ["ACE_SKS",1];
_ammo addweaponcargo ["ACE_P8",1];

//AMMO ONLY
_ammo addmagazinecargo ["30Rnd_556x45_StanagSD", 6];
_ammo addmagazinecargo ["ACE_10Rnd_762x39_B_SKS", 4];
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