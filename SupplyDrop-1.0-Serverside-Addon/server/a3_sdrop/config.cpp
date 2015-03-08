class CfgPatches {
	class A3_sdrop {
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {};
	};
};

class CfgFunctions {
	class A3_sdrop {
		class sdrop_main {	
			file = "\x\addons\a3_sdrop\init";
			class init {preInit = 1;};
			class postinit {postInit = 1;};
		};
	};
};



class sdropCfg {
	
	SDROP_Debug = 1;					//Set to 0 if you don't want logs added to your RPT - used mostly for testing/diagnosis of issues
	SDROP_MissionTimer = 900;			//mission timer - time taken for new helicopter to arrive / conditional (default: 900, which is 15 minutes real-time)
	SDROP_CrateTimeout = 1800;			//This is the NON-LOOTED crate cleanup timer - (default is 1800 which is half-hour real-time)
	SDROP_SupplyDropFailChance = 0;		//Change probability of supply drop - enter chance as whole number from 1-100 (default 0)
	SDROP_HelicopterCrashChance = 0;	//Change probability of helicopter crashing - enter chance as whole number from 1-100 (default 0)
	SDROP_Blacklist[] = {"DemoCharge_Remote_Mag","SatchelCharge_Remote_Mag","ATMine_Range_Mag","ClaymoreDirectionalMine_Remote_Mag","APERSMine_Range_Mag","APERSBoundingMine_Range_Mag","SLAMDirectionalMine_Wire_Mag","APERSTripMine_Wire_Mag","NVG_EPOCH","NVGoggles_OPFOR","NVGoggles_INDEP","FirstAidKit","Medikit","ToolKit","optic_DMS"};
	
	class Default {
		posArray[]={};coords[]={};magazines[]={};items[]={};backpacks[]={};weapons[]={};
	};

	//fill the crate with WEAPONS and AMMO
	class SDROP_LoadLootWeapons:Default {
		
		weapons[] = {
			{"srifle_DMR_01_F",1},
			{"arifle_Mk20_F",1},
			{"arifle_MX_Black_F",1},
			{"M249_EPOCH",1},
			{"srifle_LRR_SOS_F",1}
		};

		magazines[] = {
			{"20Rnd_762x51_Mag",4},
			{"30Rnd_556x45_Stanag",4},
			{"30Rnd_65x39_caseless_mag_Tracer",4},
			{"200Rnd_556x45_M249",2},
			{"7Rnd_408_Mag",3},
			{"HandGrenade",2},
			{"MiniGrenade",2}
		};		
		
		items[] = {
			{"optic_Arco",1},
			{"optic_SOS",1},
			{"optic_Aco",1},
			{"optic_LRPS",1},
			{"Muzzle_snds_H",1},
			{"Muzzle_snds_M",1},
			{"Muzzle_snds_B",1},
			{"ItemCompass",4},
			{"ItemGPS",4},
			{"EpochRadio0",4},
			{"ItemWatch",4},
			{"V_7_EPOCH",1},
			{"V_10_EPOCH",1},
			{"V_13_EPOCH",1},
			{"V_14_EPOCH",1},
			{"V_15_EPOCH",1},
			{"V_37_EPOCH",1},
			{"V_38_EPOCH",1}
		};
		
		backpacks[] = {
			{"B_FieldPack_ocamo",2}
		};
		
	};
	
	//fill the crate with SUPPLIES
	class SDROP_LoadLootSupplies:Default {
		
		magazines[] = {
		  {"CinderBlocks",8},
		  {"jerrycan_epoch",3},
		  {"CircuitParts",4},
		  {"ItemCorrugatedLg",1},
		  {"ItemCorrugated",4},
		  {"ItemMixOil",2},
		  {"MortarBucket",6},
		  {"PartPlankPack",4},
		  {"ItemLockbox",1},
		  {"FAK",6},
		  {"VehicleRepair",2},
		  {"Towelette",4},
		  {"HeatPack",2},
		  {"ColdPack",2},
		  {"Pelt_EPOCH",2},
		  {"Heal_EPOCH",2},
		  {"Repair_EPOCH",1},
		  {"EnergyPack",4},
		  {"EnergyPackLg",1}
		};
	
		backpacks[] = {
			{"B_Carryall_oucamo",1},
			{"B_FieldPack_cbr",1},
			{"B_TacticalPack_ocamo",1}
		};
		
		weapons[] = {
			{"MultiGun",2}
		};
		
	};
	
	//fill the crate with FOOD & CLOTHING
	class SDROP_LoadLootFood:Default {
		
		magazines[] = {
			{"ItemSodaRbull",2},
			{"ItemSodaOrangeSherbet",2},
			{"ItemSodaOrangeSherbet",2},
			{"ItemSodaPurple",2},
			{"ItemSodaMocha",2},
			{"ItemSodaBurst",2},
			{"FoodMeeps",2},
			{"FootSnooter",2},
			{"FoodWalkNSons",2},
			{"water_epoch",4},
			{"ItemCoolerE",4},
			{"SweetCorn_EPOCH",4},
			{"WhiskeyNoodle",6},
			{"SnakeMeat_EPOCH",1},
			{"CookedRabbit_EPOCH",2},
			{"CookedChicken_EPOCH",2},
			{"CookedGoat_EPOCH",2},
			{"CookedSheep_EPOCH",2}
		};
	
		items[] = {
			{"U_O_CombatUniform_ocamo",1},
			{"U_O_GhillieSuit",1},
			{"U_O_Wetsuit",1},
			{"U_OG_Guerilla1_1",1},
			{"U_OG_Guerilla2_1",1},
			{"U_OG_Guerilla3_1",1},
			{"U_OrestesBody",1},
			{"U_Wetsuit_uniform",1},
			{"U_Ghillie1_uniform",1}
		};
		
		backpacks[] = {
			{"B_Carryall_ocamo",2} 
		};		

	};
	

	class Chernarus:Default {
		posArray[] = {{72.0000,8184.00,200},{15320.0,7816.00,200},{7528.00,15320.0,200},{6888.00,40.0000,200}};
		coords[] = {{7067.50,7798.63},500,5000,30,0,10,0};
	};
	
	
	
	class Altis:Default {
		posArray[] = {{15971.3,25950.5,200},{14727.5,3934.5,200},{26869.5,15454.5,200},{1306.16,14832.8,200}};
		coords[] = {{7720,7671,0},500,10000,30,0,30,0};
	};
	
};