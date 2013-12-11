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
_ammo addweaponcargo ["RH_xm8saw",1];
_ammo addweaponcargo ["RH_mk43elcan",1];
_ammo addweaponcargo ["RH_tec9",2];

//AMMO ONLY
_ammo addmagazinecargo ["30Rnd_556x45_Stanag", 4];
_ammo addmagazinecargo ["100Rnd_762x51_M240", 3];
_ammo addmagazinecargo ["30Rnd_9x19_tec", 4];
_ammo addmagazinecargo ["SmokeShell",2];
_ammo addmagazinecargo ["ACE_Flashbang",2];
_ammo addmagazinecargo ["ACE_RG60A",2];

//ITEMS ONLY
_ammo addweaponcargo ["ItemGPS",2];
_ammo addweaponcargo ["ACE_Kestrel4500", 2];
_ammo addweaponcargo ["ACE_WireCutter", 1];
_ammo addweaponcargo ["ACE_SpottingScope", 1];


//BACKPACKS ONLY
_ammo addweaponcargo ["DZ_Backpack_EP1",1];
sleep 150000;
};