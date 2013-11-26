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
_ammo addweaponcargo ["ACE_M110",1];
_ammo addweaponcargo ["AA12_PMC",1];
_ammo addweaponcargo ["Sa61_EP1",2];
_ammo addweaponcargo ["ACE_HK417_Eotech_4x",1];

//AMMO ONLY
_ammo addmagazinecargo ["20Rnd_762x51_B_SCAR", 4];
_ammo addmagazinecargo ["20Rnd_B_AA12_74Slug", 4];
_ammo addmagazinecargo ["20Rnd_B_AA12_HE", 4];
_ammo addmagazinecargo ["ACE_20Rnd_762x51_B_HK417",4];
_ammo addmagazinecargo ["ACE_20Rnd_762x51_T_HK417",4];
_ammo addmagazinecargo ["10Rnd_B_765x17_Ball", 4];
_ammo addmagazinecargo ["SmokeShell",4];
_ammo addmagazinecargo ["HandGrenade_West",2];

//ITEMS ONLY
_ammo addweaponcargo ["ACE_GlassesBalaklava",2];
_ammo addweaponcargo ["ACE_GlassesGasMask2_US", 2];
_ammo addweaponcargo ["ACE_Kestrel4500", 1];

//BACKPACKS ONLY
_ammo addweaponcargo ["DZ_Backpack_EP1",1];
sleep 150000;
};