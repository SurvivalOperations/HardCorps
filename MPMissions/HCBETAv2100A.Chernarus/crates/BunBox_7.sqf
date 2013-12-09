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
_ammo addweaponcargo ["RH_m4sbracog",1];
_ammo addweaponcargo ["RH_sc2aim",1];
_ammo addweaponcargo ["Mk_48",1];
_ammo addweaponcargo ["RH_Deagles",1];

//AMMO ONLY
_ammo addmagazinecargo ["20Rnd_762x51_DMR", 2];
_ammo addmagazinecargo ["30Rnd_556x45_Stanag", 3];
_ammo addmagazinecargo ["100Rnd_762x51_M240", 2];
_ammo addmagazinecargo ["RH_7Rnd_50_AE", 2];
_ammo addmagazinecargo ["SmokeShell",2];
_ammo addmagazinecargo ["ACE_Flashbang",1];
_ammo addmagazinecargo ["ACE_RG60A",1];

//ITEMS ONLY
_ammo addweaponcargo ["ItemGPS",1];
_ammo addweaponcargo ["ACE_Kestrel4500", 1];
_ammo addweaponcargo ["ACE_WireCutter", 1];
_ammo addweaponcargo ["ACE_SpottingScope", 1];


//BACKPACKS ONLY
sleep 150000;
};