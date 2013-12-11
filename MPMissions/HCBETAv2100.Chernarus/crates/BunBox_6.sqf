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
_ammo addweaponcargo ["RH_mk18sdaim",1];
_ammo addweaponcargo ["RH_mk18dcacog",1];
_ammo addweaponcargo ["RH_masbsdacog",1];
_ammo addweaponcargo ["ACE_P8",1];

//AMMO ONLY
_ammo addmagazinecargo ["30Rnd_556x45_Stanag", 8];
_ammo addmagazinecargo ["30Rnd_556x45_StanagSD", 4];
_ammo addmagazinecargo ["RH_20Rnd_762_hk417", 4];
_ammo addmagazinecargo ["ACE_15Rnd_9x19_P8", 4];
_ammo addmagazinecargo ["SmokeShell",4];
_ammo addmagazinecargo ["ACE_Flashbang",2];

//ITEMS ONLY
_ammo addweaponcargo ["ItemGPS",2];
_ammo addweaponcargo ["ACE_Kestrel4500", 2];
_ammo addweaponcargo ["ACE_WireCutter", 1];
_ammo addweaponcargo ["ACE_SpottingScope", 1];


//BACKPACKS ONLY
_ammo addBackpackCargo ["DZ_Backpack_EP1",1];
sleep 150000;
};