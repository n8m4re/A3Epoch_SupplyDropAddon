// PLAYER DEFINED LOOT TABLES - EDIT ITEMS BELOW FOR CRATES
//Defines LOOT types and gets added to the drop crate


SDROPLoadLootFood = {
	private["_crate"];
	_crate = _this select 0;	
	
	//empty crate first
	clearWeaponCargoGlobal _crate;
	clearMagazineCargoGlobal _crate;
	clearBackpackCargoGlobal _crate;
	clearItemCargoGlobal _crate;
	
	_magArr =  getArray(configFile >> "sdropCfg" >> "SDROP_LoadLootFood" >> "magazines");
	_itemArr = getArray(configFile >> "sdropCfg" >> "SDROP_LoadLootFood" >> "items");
	_backArr = getArray(configFile >> "sdropCfg" >> "SDROP_LoadLootFood" >> "backpacks");
	
	{ _crate addMagazineCargoGlobal _x; } forEach (_magArr);
	{ _crate addItemCargoGlobal _x; } forEach (_itemArr);
	{ _crate addBackpackCargoGlobal _x; } forEach (_backArr);

};

SDROPLoadLootSupplies = {
	private["_crate"];
	_crate = _this select 0;
	
	//empty crate first
	clearWeaponCargoGlobal _crate;
	clearMagazineCargoGlobal _crate;
	clearBackpackCargoGlobal _crate;
	clearItemCargoGlobal _crate;
	
	_magArr =  getArray(configFile >> "sdropCfg" >> "SDROP_LoadLootSupplies" >> "magazines");
	_weapArr = getArray(configFile >> "sdropCfg" >> "SDROP_LoadLootSupplies" >> "weapons");
	_backArr = getArray(configFile >> "sdropCfg" >> "SDROP_LoadLootSupplies" >> "backpacks");
	
	{ _crate addMagazineCargoGlobal _x; } forEach (_magArr);
	{ _crate addWeaponCargoGlobal _x; } forEach (_weapArr);
	{ _crate addBackpackCargoGlobal _x; } forEach (_backArr);
};

SDROPLoadLootWeapons = {
	private["_crate"];
	_crate = _this select 0;
	
	//empty crate first
	clearWeaponCargoGlobal _crate;
	clearMagazineCargoGlobal _crate;
	clearBackpackCargoGlobal _crate;
	clearItemCargoGlobal _crate;
	
	_magArr =  getArray(configFile >> "sdropCfg" >> "SDROP_LoadLootWeapons" >> "magazines");
	_itemArr = getArray(configFile >> "sdropCfg" >> "SDROP_LoadLootFood" >> "items");
	_weapArr = getArray(configFile >> "sdropCfg" >> "SDROP_LoadLootWeapons" >> "weapons");
	_backArr = getArray(configFile >> "sdropCfg" >> "SDROP_LoadLootWeapons" >> "backpacks");
	
	{ _crate addMagazineCargoGlobal _x; } forEach (_magArr);
	{ _crate addItemCargoGlobal _x; } forEach (_itemArr);
	{ _crate addWeaponCargoGlobal _x; } forEach (_weapArr);
	{ _crate addBackpackCargoGlobal _x; } forEach (_backArr);
	
};

SDROPLoadLootRandom = {
	[_crate] call SDROPRandomLoot;
};

// Crate Blacklist - These are items that should NOT be in random crate - should eliminate most BE filter issues (may need more testing)
SDROPCrateBlacklist = getArray( configFile >> "sdropCfg" >> "SDROP_Blacklist");


SDROPRandomLoot = {
	private ["_crate","_var","_tmp","_kindOf","_report","_cAmmo"];
	
	_crate = _this select 0;
	
	// Empty Crate
	clearWeaponCargoGlobal _crate;
	clearMagazineCargoGlobal _crate;
	clearBackpackCargoGlobal  _crate;
	clearItemCargoGlobal _crate;
	
	SDROPLootList = [];
		// Generate Loot
		{
			_tmp = (getArray(_x >> 'items'));
			for "_z" from 0 to ((count(_tmp))-1) do {
				SDROPLootList = SDROPLootList + [((_tmp select _z) select 0)];
			};
		} forEach ("configName _x != 'Uniforms' && configName _x != 'Headgear'" configClasses (configFile >> "CfgLootTable"));
	
	_report = [];
	// Load Random Loot Amount
	for "_i" from 1 to ((floor(random 10)) + 10) do {
		_var = (SDROPLootList call BIS_fnc_selectRandom);
		
		if (!(_var in SDROPCrateBlacklist)) then {
			switch (true) do
			{
				case (isClass (configFile >> "CfgWeapons" >> _var)): {
					_kindOf = [(configFile >> "CfgWeapons" >> _var),true] call BIS_fnc_returnParents;
					if ("ItemCore" in _kindOf) then {
						_crate addItemCargoGlobal [_var,1];
					} else {
						_crate addWeaponCargoGlobal [_var,1];
						
						_cAmmo = [] + getArray (configFile >> "cfgWeapons" >> _var >> "magazines");
						{
							if (isClass(configFile >> "CfgPricing" >> _x)) exitWith {
								_crate addMagazineCargoGlobal [_x,2];
							};
						} forEach _cAmmo;
					};
				};
				case (isClass (configFile >> "cfgMagazines" >> _var)): {
					_crate addMagazineCargoGlobal [_var,1];
				};
				case ((getText(configFile >> "cfgVehicles" >> _var >>  "vehicleClass")) == "Backpacks"): {
					_crate addBackpackCargoGlobal [_var,1];
				};
				default {
					_report = _report + [_var];
				};
			};
		};
	};
	
	if ((count _report) > 0) then {
		diag_log text format ["[SDROP]: LoadLoot: <Unknown> %1", str _report];
	};
};

SDROPBroadcast = {
	private ["_title","_subTitle"];
	
	_title = _this select 0;
	_subTitle = _this select 1;
	_alertMsg = "<t align='center' size='2.0' color='#f29420'>"+ _title + "</t><br/><t size='1.25' color='#ffff00'>______________<br/><br/>"+ _subTitle + "</t>";
	[_alertMsg] call SDROP_Alert;
};

true
