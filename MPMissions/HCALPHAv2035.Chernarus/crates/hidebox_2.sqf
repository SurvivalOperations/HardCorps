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
_ammo addweaponcargo ["ACE_gr1sd",1];
_ammo addweaponcargo ["ACE_G36K_EOTech",1];
_ammo addweaponcargo ["ACE_USPSD",2];

//AMMO ONLY
_ammo addmagazinecargo ["ACE_30Rnd_762x39_SD_AK47", 4];
_ammo addmagazinecargo ["30Rnd_556x45_G36", 2];
_ammo addmagazinecargo ["ACE_12Rnd_45ACP_USPSD", 4];
_ammo addmagazinecargo ["SmokeShell",4];
_ammo addmagazinecargo ["HandGrenade_West",2];

//ITEMS ONLY
_ammo addweaponcargo ["ACE_GlassesBalaklava",2];

//BACKPACKS ONLY
_ammo addweaponcargo ["ACE_AssaultPack_BAF",1];
sleep 150000;
};