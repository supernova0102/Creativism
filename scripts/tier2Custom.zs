//heavy_engineering block = main tier 2 block
recipes.remove(<item:immersiveengineering:heavy_engineering>);

craftingTable.addShaped("heavy_engineering",<item:immersiveengineering:heavy_engineering>,
[[<item:create:precision_mechanism>,<item:create:precision_mechanism>,<item:create:precision_mechanism>],
[<item:create:precision_mechanism>,<item:immersiveengineering:light_engineering>,<item:create:precision_mechanism>],
[<item:create:precision_mechanism>,<item:create:precision_mechanism>,<item:create:precision_mechanism>]]);



//component_steel
recipes.remove(<item:immersiveengineering:component_steel>);


craftingTable.addShaped("iron_to_steel_component",<item:immersiveengineering:component_steel>,
[[<item:minecraft:air>,<item:create:andesite_alloy>,<item:minecraft:air>],[<item:immersiveengineering:component_iron>,<item:immersiveengineering:component_iron>,<item:immersiveengineering:component_iron>],[<item:minecraft:air>,<tag:items:forge:ingots/steel>,<item:minecraft:air>]]);

craftingTable.addShaped("only_making_steel_component",<item:immersiveengineering:component_steel>,
[[<tag:items:forge:cogwheels>,<item:thermal:copper_gear>,<tag:items:forge:cogwheels>],[<item:create:andesite_alloy>,<tag:items:forge:ingots/steel>,<item:create:andesite_alloy>],[<tag:items:forge:cogwheels>,<item:thermal:iron_gear>,<tag:items:forge:cogwheels>]]);



<recipetype:create:sequenced_assembly>.addRecipe(<recipetype:create:sequenced_assembly>.builder("high_efficiency_steel_component_making1")
	.transitionTo(<item:create_connected_blocks:incomplete_iron_reinforcement>)
	.require(<item:immersiveengineering:component_iron>)
	.loops(1)
	.addOutput(<item:immersiveengineering:component_steel>*2 ,1)
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:create:andesite_alloy>))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:immersiveengineering:component_iron>))	
	.addStep<mods.createtweaker.FillingRecipe>((a) => a.require(<fluid:createbigcannons:molten_steel> * 90))
);

//rose_quartz
recipes.remove(<item:create:rose_quartz>);

<recipetype:create:mixing>.addRecipe("rose_quartz",<constant:create:heat_condition:none>,[<item:create:rose_quartz>%100],[<item:minecraft:amethyst_shard>*2,<tag:items:ae2:all_quartz>*4],[<fluid:thermal:redstone> * 500],250);

//electron_tube
recipes.remove(<item:create:electron_tube>);

craftingTable.addShaped("hand_made_electron",<item:create:electron_tube>,[[<item:create_things_and_misc:rose_quartz_sheet>,<item:create_things_and_misc:rose_quartz_sheet>],[<item:create:andesite_alloy>,<item:create:andesite_alloy>]]);

<recipetype:create:sequenced_assembly>.addRecipe(<recipetype:create:sequenced_assembly>.builder("electron_tube_low_yield")
	.transitionTo(<item:create:polished_rose_quartz>)
	.require(<item:create:polished_rose_quartz>)
	.loops(1)
	.addOutput(<item:create:electron_tube>, 7)
	.addOutput(<item:create:rose_quartz>, 1)
	

	.addStep<mods.createtweaker.CuttingRecipe>((a) => a.duration(50))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:create:andesite_alloy>))

	.addStep<mods.createtweaker.CuttingRecipe>((a) => a.duration(50))

);

<recipetype:create:sequenced_assembly>.addRecipe(<recipetype:create:sequenced_assembly>.builder("electron_tube_high_yield")
	.transitionTo(<item:create:polished_rose_quartz>)
	.require(<item:create:polished_rose_quartz>)
	.loops(1)
	.addOutput(<item:create:electron_tube>, 1)

	.addStep<mods.createtweaker.CuttingRecipe>((a) => a.duration(50))
	.addStep<mods.createtweaker.FillingRecipe>((a) => a.require(<fluid:thermal:glowstone> * 250))


	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:create:andesite_alloy>))
	.addStep<mods.createtweaker.CuttingRecipe>((a) => a.duration(50))
);



//precision_mechanism

<recipetype:create:sequenced_assembly>.remove(<item:create:precision_mechanism>);


<recipetype:create:sequenced_assembly>.addRecipe(<recipetype:create:sequenced_assembly>.builder("precision_mechanism")
	.transitionTo(<item:create:golden_sheet>)
	.require(<item:create:golden_sheet>)
	.loops(1)
	.addOutput(<item:create:precision_mechanism>, 1)
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:immersiveengineering:component_steel>))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:create:electron_tube>))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:createaddition:gold_spool>))
);


//destablized_redstone
<recipetype:create:mixing>.addRecipe("destablized_redstone",<constant:create:heat_condition:heated>,[<fluid:thermal:redstone> * 100],[<item:minecraft:redstone>],[],1000);

<recipetype:create:mixing>.addRecipe("destablized_redstone2",<constant:create:heat_condition:heated>,[<fluid:thermal:redstone> * 900],[<item:minecraft:redstone_block>],[],9000);


//copper, gold spool
<recipetype:create:deploying>.addRecipe("empty_spool",<tag:items:forge:plates/iron>,<tag:items:forge:plates/iron>,[<item:createaddition:spool>*16%100],false);

<recipetype:create:sequenced_assembly>.addRecipe(<recipetype:create:sequenced_assembly>.builder("gold_spool")
	.transitionTo(<item:createaddition:spool>)
	.require(<item:createaddition:spool>)
	.loops(4)
	.addOutput(<item:createaddition:gold_spool> ,1)
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:createaddition:gold_wire>))
);
<recipetype:create:sequenced_assembly>.addRecipe(<recipetype:create:sequenced_assembly>.builder("copper_spool")
	.transitionTo(<item:createaddition:spool>)
	.require(<item:createaddition:spool>)
	.loops(4)
	.addOutput(<item:createaddition:copper_spool> ,1)
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<tag:items:forge:wires/copper>))
);




//tier2 base machines
recipes.remove(<item:storagedrawers:controller_slave>);
recipes.remove(<item:immersiveengineering:generator>);
recipes.remove(<item:create:content_observer>);
recipes.remove(<item:storagedrawers:controller>);
recipes.remove(<item:create:mechanical_arm>);
recipes.remove(<item:create:brass_funnel>);
recipes.remove(<item:create:brass_tunnel>);
recipes.remove(<item:engineersdecor:small_solar_panel>);
<recipetype:create:mechanical_crafting>.remove(<item:create_sa:brass_drone_item>);


recipes.remove(<item:create:mechanical_crafter>);
recipes.remove(<item:create:rotation_speed_controller>);
recipes.remove(<item:engineersdecor:small_solar_panel>);
recipes.remove(<item:buzzydrones:idle_station>);
recipes.remove(<item:immersiveengineering:thermoelectric_generator>);
recipes.remove(<item:immersiveengineering:dynamo>);
<recipetype:create:mechanical_crafting>.remove(<item:createaddition:electric_motor>);
<recipetype:create:mechanical_crafting>.remove(<item:createaddition:alternator>);

craftingTable.addShapeless("motor_to_alternator",<item:createaddition:alternator>,[<item:createaddition:electric_motor>]);
craftingTable.addShapeless("alternator_to_motor",<item:createaddition:electric_motor>,[<item:createaddition:alternator>]);

//stonecutter to make
stoneCutter.addRecipe("controller_slave",<item:storagedrawers:controller_slave>,<item:immersiveengineering:heavy_engineering>);
stoneCutter.addRecipe("drawer_controller",<item:storagedrawers:controller>,<item:immersiveengineering:heavy_engineering>);
stoneCutter.addRecipe("generator_block",<item:immersiveengineering:generator>,<item:immersiveengineering:heavy_engineering>);
stoneCutter.addRecipe("content_observer",<item:create:content_observer>,<item:immersiveengineering:heavy_engineering>);
stoneCutter.addRecipe("mechanical_arm",<item:create:mechanical_arm>,<item:immersiveengineering:heavy_engineering>);
stoneCutter.addRecipe("brass_drone",<item:create_sa:brass_drone_item>,<item:immersiveengineering:heavy_engineering>);

//smithing to make

smithing.addRecipe("mechanical_crafting",<item:create:mechanical_crafter>*5,<item:immersiveengineering:heavy_engineering>,<item:create:crafting_blueprint>);
smithing.addRecipe("speed_controller",<item:create:rotation_speed_controller>,<item:immersiveengineering:heavy_engineering>,<item:create:adjustable_chain_gearshift>);
smithing.addRecipe("solar_panel",<item:engineersdecor:small_solar_panel>,<item:immersiveengineering:heavy_engineering>,<item:minecraft:daylight_detector>);
smithing.addRecipe("kinetic_dynamo",<item:immersiveengineering:dynamo>,<item:immersiveengineering:heavy_engineering>,<item:immersiveengineering:coil_lv>);
smithing.addRecipe("thermionic_generator",<item:immersiveengineering:thermoelectric_generator>,<item:immersiveengineering:heavy_engineering>,<item:immersiveengineering:sheetmetal_constantan>);
smithing.addRecipe("idle_station",<item:buzzydrones:idle_station>,<item:immersiveengineering:heavy_engineering>,<item:minecraft:beehive>);
smithing.addRecipe("electric_motor",<item:createaddition:electric_motor>,<item:immersiveengineering:heavy_engineering>,<item:immersiveengineering:dynamo>);

smithing.addRecipe("brass_tunnel",<item:create:brass_funnel>,<item:create:andesite_funnel>,<item:create:precision_mechanism>);
smithing.addRecipe("brass_funnel",<item:create:brass_tunnel>,<item:create:andesite_tunnel>,<item:create:precision_mechanism>);