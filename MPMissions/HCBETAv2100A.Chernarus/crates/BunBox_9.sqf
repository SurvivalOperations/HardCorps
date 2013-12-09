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
_ammo addweaponcargo ["RH_asvalk",1];
_ammo addweaponcargo ["RH_mk18dcsdeot",1];
_ammo addweaponcargo ["RH_ScarAkacog",1];
_ammo addweaponcargo ["ACE_P8",1];

//AMMO ONLY
_ammo addmagazinecargo ["RH_20Rnd_9x39_val_mag", 3];
_ammo addmagazinecargo ["30Rnd_762x39_AK47", 3];
_ammo addmagazinecargo ["30Rnd_556x45_Stanag", 3];
_ammo addmagazinecargo ["ACE_15Rnd_9x19_P8", 3];
_ammo addmagazinecargo ["SmokeShell",2];
_ammo addmagazinecargo ["ACE_Flashbang",2];

//ITEMS ONLY
_ammo addweaponcargo ["ItemGPS",1];
_ammo addweaponcargo ["ACE_Kestrel4500", 1];
_ammo addweaponcargo ["ACE_WireCutter", 1];
_ammo addweaponcargo ["ACE_SpottingScope", 1];


//BACKPACKS ONLY
sleep 150000;
};