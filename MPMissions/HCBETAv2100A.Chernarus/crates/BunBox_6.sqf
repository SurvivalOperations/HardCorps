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
_ammo addweaponcargo ["ACE_SOC_M4A1_RCO_GL_UP_F",1];
_ammo addweaponcargo ["RH_mk18dcacog",1];
_ammo addweaponcargo ["ACE_AK74M_SD_1P78_F",1];
_ammo addweaponcargo ["ACE_M72A2",1];

//AMMO ONLY
_ammo addmagazinecargo ["ACE_45Rnd_545x39_AP_AK", 3];
_ammo addmagazinecargo ["30Rnd_556x45_StanagSD", 4];
_ammo addmagazinecargo ["ACE_15Rnd_9x19_P8", 3];
_ammo addmagazinecargo ["ACE_40mm_Buck_M79", 2];
_ammo addmagazinecargo ["ACE_1Rnd_HE_M203", 2];
_ammo addmagazinecargo ["ACE_M576", 2];
_ammo addmagazinecargo ["SmokeShell",2];
_ammo addmagazinecargo ["ACE_Flashbang",2];

//ITEMS ONLY
_ammo addweaponcargo ["ItemGPS",2];
_ammo addweaponcargo ["ACE_Kestrel4500", 1];
_ammo addweaponcargo ["ACE_WireCutter", 1];
_ammo addweaponcargo ["ACE_SpottingScope", 1];


//BACKPACKS ONLY
_ammo addBackpackCargo ["DZ_Backpack_EP1",1];
sleep 150000;
};