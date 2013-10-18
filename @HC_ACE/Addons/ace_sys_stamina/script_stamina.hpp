#define ACE_STAMINA_LVL_0 0.04 // CIVILIAN //
#define ACE_STAMINA_LVL_1 0.04 // INSURGENT //
#define ACE_STAMINA_LVL_2 0.04 // ARMY // Data is based off regular Army
#define ACE_STAMINA_LVL_3 0.04 // SPECIAL FORCES //

// EQUIPMENT macros

#define ACE_C_WEIGHT(__COMPONENTS) ace_weight = __EVAL(__COMPONENTS);

// calculate dexterity (how fast you can turn) with rifle based on it's total weight
// formula was made to give values close to originals
// __COMPONENTS = sum of parts defined below
// __MODIF = 0 default, 1 for having a grip, 1 for bullpups, -3 for bulky weapons

// formula for rifles, mg, launchers
#define ACE_C_DEXTERITY(__COMPONENTS,__MODIF) dexterity = (0.5 + 3.75/(__COMPONENTS + 0.001) + __MODIF/10);

// handguns have another formula
#define ACE_C_PDEXTERITY(__COMPONENTS) dexterity = (1 + 0.75/(__COMPONENTS + 0.001));

//combined macros - weight and dexterity
#define ACE_C_WEIGHT_DEX(__COMPONENTS,__MODIF) ACE_C_WEIGHT(__COMPONENTS)\
		ACE_C_DEXTERITY(__COMPONENTS,__MODIF)
#define ACE_C_PWEIGHT_DEX(__COMPONENTS) ACE_C_WEIGHT(__COMPONENTS)\
		ACE_C_PDEXTERITY(__COMPONENTS)

// EQUIPMENT weight info

// common
#define ACE_WEIGHT_IR_ 0.2
#define ACE_WEIGHT_BIPOD_ 0.2
#define ACE_WEIGHT_GRIP_ 0.1
#define ACE_WEIGHT_GPOD_ 0.2
#define ACE_WEIGHT_FL_ 0.2
#define ACE_WEIGHT_LLM01_ 0.22
#define ACE_WEIGHT_TLI_ 0.125

// binoculars
#define ACE_WEIGHT_M22_ 1.6
#define ACE_WEIGHT_GLTD2_ 5.6
#define ACE_WEIGHT_PVS7_ 0.68
#define ACE_WEIGHT_VECTOR_ 1.786
#define ACE_WEIGHT_BYAGE450_ 0.21
#define ACE_WEIGHT_MX2A_ 1.2

// batteries
#define ACE_WEIGHT_BA5590_ 1
#define ACE_WEIGHT_2CR5_ 0.045

// underbarrel
#define ACE_WEIGHT_M203_ 1.3
#define ACE_WEIGHT_AG36_ 1.5
#define ACE_WEIGHT_GP25_ 1.5
#define ACE_WEIGHT_EGLM_ 1.3
#define ACE_WEIGHT_GP30_ 1.3

// some of the attachments have +20% weight for mounts, otherwise mounting accessories are included

// scopes
#define ACE_WEIGHT_LEU10X_ 0.72
#define ACE_WEIGHT_PSO1_ 0.6
#define ACE_WEIGHT_PGO7_ 0.57
#define ACE_WEIGHT_PSO3_ 0.8
#define ACE_WEIGHT_SB12X_ 1.02
#define ACE_WEIGHT_SUSAT_ 0.42
#define ACE_WEIGHT_ACOG_ 0.46
#define ACE_WEIGHT_M145_ 0.69
#define ACE_WEIGHT_Mk4CQT_ 0.6
#define ACE_WEIGHT_SPECTERDR_ 0.64
#define ACE_WEIGHT_Mk4MRT_ 0.54
#define ACE_WEIGHT_SBSD_ 0.72
#define ACE_WEIGHT_COLT4X_ 0.4
#define ACE_WEIGHT_1P29_ 0.8
#define ACE_WEIGHT_EOTECH4X_ 0.34
#define ACE_WEIGHT_CSC16X_ 1.08
#define ACE_WEIGHT_LEU14X_ 0.72
#define ACE_WEIGHT_MEOPTA_ 0.6
#define ACE_WEIGHT_1P77_ 0.95
#define ACE_WEIGHT_SB10X_ 0.72
#define ACE_WEIGHT_SB25X_ 1.32
#define ACE_WEIGHT_1P78_ 0.7

// night sights
#define ACE_WEIGHT_NSPU_ 2.2
#define ACE_WEIGHT_PVS4_ 1.8
#define ACE_WEIGHT_SNS_ 2.2
#define ACE_WEIGHT_PVS14_ 0.4
// thermal
#define ACE_WEIGHT_HTWS_ 1.7
#define ACE_WEIGHT_KITE_ 1.2
#define ACE_WEIGHT_MTWS_ 1.3
#define ACE_WEIGHT_GOSHAWK_ 1.6
#define ACE_WEIGHT_LTWS_ 0.9

// close combat sights
#define ACE_WEIGHT_COMPM4_ 0.35
#define ACE_WEIGHT_COMPM2_ 0.264
#define ACE_WEIGHT_HOLO_ 0.35
#define ACE_WEIGHT_REFLEX_ 0.226
#define ACE_WEIGHT_KOBRA_ 0.35
#define ACE_WEIGHT_MCCO_ 0.1
#define ACE_WEIGHT_COMPM3_ 0.264
#define ACE_WEIGHT_RSAS_ 0.1
#define ACE_WEIGHT_DOC_ 0.25
#define ACE_WEIGHT_MRAD_ 0.1
#define ACE_WEIGHT_ZDDOT_ 0.39

// suppressors
#define ACE_WEIGHT_SD_556_ 0.6 // KAC, but most have this same weight
#define ACE_WEIGHT_SD_SCARL_ 0.5
#define ACE_WEIGHT_SD_SCARH_ 0.7
#define ACE_WEIGHT_SD_HKL_ 0.5
#define ACE_WEIGHT_SD_AKSU_ 0.6
#define ACE_WEIGHT_SD_GROZA_ 0.7
#define ACE_WEIGHT_SD_AKM_ 0.7
#define ACE_WEIGHT_SD_UMP45_ 0.38
#define ACE_WEIGHT_SD_Mk12_ 0.6
#define ACE_WEIGHT_SD_M110_ 0.9
#define ACE_WEIGHT_SD_TAC50_ 2.07
#define ACE_WEIGHT_SD_BIZON_ 0.6
#define ACE_WEIGHT_SD_TGP_ 0.7
#define ACE_WEIGHT_SD_EVO_ 0.275

// launchers, rockets, missiles
#define ACE_WEIGHT_M136_ 6.7
#define ACE_WEIGHT_M136CS_ 7.5
#define ACE_WEIGHT_M136_EMPTY_ 4.9
#define ACE_WEIGHT_JAVELIN_TUBE_ 4.1 // disposable
#define ACE_WEIGHT_JAVELIN_MISSILE_ 11.4
#define ACE_WEIGHT_JAVELIN_CLU_ 6.4
#define ACE_WEIGHT_STINGER_MISSILE_ 10.4
#define ACE_WEIGHT_STINGER_LAUNCHTUBE_ 2.3 // disposable
#define ACE_WEIGHT_STINGER_GRIPSTOCK_ 2.3 // reusable
#define ACE_WEIGHT_STINGER_BCU_ 0.9 // need one per shot
#define ACE_WEIGHT_RPG7V_ 6.7
#define ACE_WEIGHT_PG7V_ 2.2
#define ACE_WEIGHT_PG7VL_ 2.6
#define ACE_WEIGHT_PG7VR_ 4.5
#define ACE_WEIGHT_OG7V_ 2
#define ACE_WEIGHT_TBG7V_ 4.5
#define ACE_WEIGHT_STRELA_MISSILE_ 9.8
#define ACE_WEIGHT_STRELA_LAUNCHTUBE_ 3 // "reloadable at depot"
#define ACE_WEIGHT_STRELA_GRIPSTOCK_ 1.95 // reusable
#define ACE_WEIGHT_STRELA_PSU_ 0.66
#define ACE_WEIGHT_IGLA_MISSILE_ 10.8 // found only this and total wt of 17.9
#define ACE_WEIGHT_IGLA_TUBE_ 7.1 // tube + grip + psu
#define ACE_WEIGHT_METIS_MISSILE_ 13.8 // tube with missile
#define ACE_WEIGHT_METIS_CLU_ 9.5
#define ACE_WEIGHT_METIS_TWS_ 6.5
#define ACE_WEIGHT_RPG18_ 2.6
#define ACE_WEIGHT_RPG18_EMPTY_ 1.4
#define ACE_WEIGHT_NLAW_ 12.5
#define ACE_WEIGHT_NLAW_EMPTY_ 2.5
#define ACE_WEIGHT_MGL140_ 6
#define ACE_WEIGHT_M79_ 2.7
#define ACE_WEIGHT_Mk13_ 2.7
#define ACE_WEIGHT_DRAGON_MISSILE_M222_ 11.47
#define ACE_WEIGHT_DRAGON_MISSILE_Mk1mod0_ 12.34
#define ACE_WEIGHT_DRAGON_DAYSIGHT_ 3.1
#define ACE_WEIGHT_DRAGON_NIGHTSIGHT_ 9.82
#define ACE_WEIGHT_MAAWS_ 9.5
#define ACE_WEIGHT_MAAWS_HE_ 3.1
#define ACE_WEIGHT_MAAWS_HEDP_ 3.3
#define ACE_WEIGHT_MAAWS_HEAT_ 4
#define ACE_WEIGHT_M72A2_ 2.3
#define ACE_WEIGHT_M72A2_EMPTY_ 0.5
#define ACE_WEIGHT_RPG29_ 11.5
#define ACE_WEIGHT_RPG29_PG29V_ 6.1
#define ACE_WEIGHT_RPG22_ 2.8
#define ACE_WEIGHT_RPG27_ 8.3
#define ACE_WEIGHT_RShG1_ 8.3
#define ACE_WEIGHT_RPOA_ 12
#define ACE_WEIGHT_RPOM_ 8.8
#define ACE_WEIGHT_RMG_ 8.5
#define ACE_WEIGHT_SMAW_ 7.54

// rifles, mgs etc.
#define ACE_WEIGHT_M16A2_ 3.77
#define ACE_WEIGHT_M24_ 5.4
#define ACE_WEIGHT_M240_ 11.6
#define ACE_WEIGHT_Mk48mod0_ 8.4
#define ACE_WEIGHT_M249_ 7.5
#define ACE_WEIGHT_M4A1_ 2.9
#define ACE_WEIGHT_PKM_ 7.5
#define ACE_WEIGHT_SVD_ 3.7
#define ACE_WEIGHT_G36C_ 2.8
#define ACE_WEIGHT_G36_ 3.6
#define ACE_WEIGHT_G36K_ 3.3
#define ACE_WEIGHT_G36IS_ 3.3
#define ACE_WEIGHT_KSVK_ 12
#define ACE_WEIGHT_M107_ 12.9
#define ACE_WEIGHT_AS50_ 13.8
#define ACE_WEIGHT_LRR_ 6.8
#define ACE_WEIGHT_SA80_ 3.8
#define ACE_WEIGHT_SA80LSW_ 5.4
#define ACE_WEIGHT_M249p_ 7.2
#define ACE_WEIGHT_M60E4_ 9.4
#define ACE_WEIGHT_SA58P_ 2.9
#define ACE_WEIGHT_SA58V_ 3.1
#define ACE_WEIGHT_M4A3_ 2.5
#define ACE_WEIGHT_MP5SD6_ 3.23 // http://www.heckler-koch.com/en/products/submachine-guns/mp5/mp5sd/technical-data.html
#define ACE_WEIGHT_MP5A5_ 2.93 // http://www.heckler-koch.com/en/products/submachine-guns/mp5/mp5/technical-data.html
#define ACE_WEIGHT_MP5A4_ 2.725
#define ACE_WEIGHT_AKM_ 2.85 // 3.1 with empty mag
#define ACE_WEIGHT_AKMS_ 3.05
#define ACE_WEIGHT_AK74_ 2.9
#define ACE_WEIGHT_AKS74U_ 2.6
#define ACE_WEIGHT_RPK74_ 4.7
#define ACE_WEIGHT_FALP_ 3.8
#define ACE_WEIGHT_SMLE_ 4
#define ACE_WEIGHT_M110_ 6 // empty no optics
#define ACE_WEIGHT_M14_ 4.9
#define ACE_WEIGHT_SCARLSTD_ 3.3
#define ACE_WEIGHT_SCARLCQC_ 3
#define ACE_WEIGHT_SCARH_ 3.6
#define ACE_WEIGHT_SCARHCQC_ 3.5
#define ACE_WEIGHT_SCARHLB_ 3.7
#define ACE_WEIGHT_M1014_ 3.8
#define ACE_WEIGHT_SAIGA12K_ 3.5
#define ACE_WEIGHT_AA12_ 4.76
#define ACE_WEIGHT_XM8_ 3.4 // with sight
#define ACE_WEIGHT_XM8C_ 3.2
#define ACE_WEIGHT_XM8DMAR_ 4.6
#define ACE_WEIGHT_XM8TWS_ 4.4
#define ACE_WEIGHT_G36KIS_ 3
#define ACE_WEIGHT_HK416_ 3.5
#define ACE_WEIGHT_HK416C_ 3
#define ACE_WEIGHT_HK417_ 4.15
#define ACE_WEIGHT_HK417C_ 4
#define ACE_WEIGHT_HK417L_ 4.6
#define ACE_WEIGHT_M27_ 3.6
#define ACE_WEIGHT_M16A4_ 3.54
#define ACE_WEIGHT_M4_13_ 2.7
#define ACE_WEIGHT_M4_9_ 2.3
#define ACE_WEIGHT_M240L_ 10.1
#define ACE_WEIGHT_M60_ 10.5
#define ACE_WEIGHT_GROZA9_ 2.7
#define ACE_WEIGHT_GROZA762_ 3.1
#define ACE_WEIGHT_AK74M_ 3.4
#define ACE_WEIGHT_AK105_ 3
#define ACE_WEIGHT_AK103_ 3.3
#define ACE_WEIGHT_AK104_ 2.9
#define ACE_WEIGHT_RPK74M_ 5
#define ACE_WEIGHT_RPK_ 4.8
#define ACE_WEIGHT_ASVAL_ 2.5
#define ACE_WEIGHT_SKS_ 3.9
#define ACE_WEIGHT_G3A3_ 4.4
#define ACE_WEIGHT_G3SG1_ 5.54
#define ACE_WEIGHT_SPAS12_ 4.4
#define ACE_WEIGHT_UMP45_ 2.26
#define ACE_WEIGHT_M3A1_ 3.5
#define ACE_WEIGHT_KACPDW_ 1.8
#define ACE_WEIGHT_MP7_ 1.9
#define ACE_WEIGHT_Mk12_ 4
#define ACE_WEIGHT_M109_ 15.9
#define ACE_WEIGHT_TAC50_ 11.8
#define ACE_WEIGHT_M40A3_ 7.5
#define ACE_WEIGHT_CZ550_ 3.3
#define ACE_WEIGHT_AK107_ 3.45
#define ACE_WEIGHT_PKP_ 8.2
#define ACE_WEIGHT_BIZON_ 2.1
#define ACE_WEIGHT_VSS_ 2.6
#define ACE_WEIGHT_EVO3_ 2.72
#define ACE_WEIGHT_CZ750_ 5.4
#define ACE_WEIGHT_CZ805A1_ 3.58
#define ACE_WEIGHT_CZ805A2_ 3.39
#define ACE_WEIGHT_UK59_ 9.28
