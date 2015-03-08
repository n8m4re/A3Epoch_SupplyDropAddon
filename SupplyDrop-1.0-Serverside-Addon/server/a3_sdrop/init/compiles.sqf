SDROP_Debug = ( configFile >> "sdropCfg" >> "SDROP_Debug") call BIS_fnc_getCfgDataBool;			
SDROP_MissionTimer = getNumber( configFile >> "sdropCfg" >> "SDROP_MissionTimer");
SDROP_CrateTimeout = getNumber( configFile >> "sdropCfg" >> "SDROP_CrateTimeout");
SDROP_SupplyDropFailChance = getNumber( configFile >> "sdropCfg" >> "SDROP_SupplyDropFailChance");
SDROP_HelicopterCrashChance = getNumber( configFile >> "sdropCfg" >> "SDROP_HelicopterCrashChance");
SDROP_Functions=compileFinal preprocessFileLineNumbers "\x\addons\a3_sdrop\compile\SDROP_Functions.sqf";
SDROP_AI_CleanUp=compileFinal preprocessFileLineNumbers "\x\addons\a3_sdrop\compile\SDROP_AI_CleanUp.sqf";
SDROP_Alert=compileFinal preprocessFileLineNumbers "\x\addons\a3_sdrop\compile\SDROP_Alert.sqf";
SDROP_Crate_CleanUp=compileFinal preprocessFileLineNumbers "\x\addons\a3_sdrop\compile\SDROP_Crate_CleanUp.sqf";
SDROP_SupplyDrop=compileFinal preprocessFileLineNumbers "\x\addons\a3_sdrop\compile\SDROP_SupplyDrop.sqf";


