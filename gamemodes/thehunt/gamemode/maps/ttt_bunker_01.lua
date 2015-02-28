---------------------- THE HUNT CONFIGURATION FILE ----------------------
include( 'basewaves.lua' )
CombineFirstWave = 7
CombineSecondWave = 10
CombineThirdWave = 13
CombineFourthWave = 15
CombineFifthWave = 20
CombineInfiniteWave = 20
MAP_PROPS = {'models/props/cs_militia/wood_table.mdl'}
ITEMPLACES = {Vector(519.106995, -76.723297, -1464.873169), Vector(-234.937424, 953.224060, -1476.260620), Vector(-238.311935, 1397.090698, -1474.879395), Vector(-96.756195, 1290.811523, -1476.170410), Vector(-85.962906, 1154.029175, -1474.874512), Vector(-90.598808, 1009.142334, -1474.866577), Vector(-92.610199, 864.149414, -1474.917603), Vector(-241.479492, 1096.697876, -1474.867065), Vector(-242.172058, 1242.249268, -1474.870483), Vector(-645.993652, 949.676392, -1474.874756), Vector(-474.541748, 861.450439, -1474.868774), Vector(-637.344727, 1089.827026, -1474.870483), Vector(-475.810486, 1011.549133, -1474.872070), Vector(-642.982666, 1245.597778, -1474.875610), Vector(-480.651459, 1162.585815, -1476.189697), Vector(-475.004883, 1308.909546, -1476.186401), Vector(-645.468262, 1410.695313, -1475.046875), Vector(135.731628, 1394.145020, -1476.175781), Vector(313.556122, 1304.890503, -1475.696777), Vector(315.227325, 1161.197388, -1474.912720), Vector(136.552826, 1242.073975, -1474.873169), Vector(138.881302, 1092.355469, -1474.878418), Vector(319.031281, 862.974182, -1475.699463), Vector(138.461761, 951.658997, -1474.873901), Vector(723.624023, 851.589478, -1475.078613), Vector(547.722900, 948.612488, -1476.144531), Vector(535.729431, 1098.069702, -1474.867676), Vector(709.920227, 1008.764771, -1476.165161), Vector(720.997192, 1162.706421, -1476.139771), Vector(720.025818, 1301.897339, -1474.923096), Vector(540.640259, 1388.862061, -1474.866211), Vector(-1489.820923, 145.221573, -1483.682129), Vector(-1317.019897, 164.375916, -1482.368042), Vector(-1144.052368, 158.226364, -1482.269653), Vector(-1230.379761, -155.907272, -1482.287231), Vector(-1398.554199, -148.383942, -1482.312744), Vector(-1567.453003, -155.230179, -1482.306641), Vector(-987.399231, 153.976730, -1482.291504), Vector(-819.956238, 151.651825, -1482.304688), Vector(-762.291321, 805.569031, -275.144348), Vector(-773.601318, 39.233120, -660.137512)}
combinespawnzones = {Vector(1.822100, -1276.160522, 1.454559), Vector(-69.655685, -1259.030518, 1.473816), Vector(-126.773926, -1307.787598, 64.031250), Vector(124.300911, -994.787659, 64.031250)}
zonescovered = {Vector(12.158383, -436.600830, -15.598460), Vector(-1302.585938, -29.482618, 0.401537), Vector(-17.266071, 723.883057, 0.401537), Vector(-694.832153, -4.234618, -727.598450), Vector(-422.499481, -10.812902, -743.598450), Vector(-33.430588, -430.658875, -743.598450), Vector(422.560822, -19.110079, -743.598450), Vector(25.059830, 429.400482, -743.598450), Vector(6.606225, 2473.878906, -727.639893), Vector(1442.484619, 9.540286, -727.598450)}
function GM:PlayerInitialSpawn(ply)
timer.Simple(2, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Protection team alert, evidence of anticivil activity in this community.') end )
timer.Simple(4, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Code: assemble, plan, contain.') end )
timer.Simple(10, function()ply:PrintMessage(HUD_PRINTTALK, 'Type !help to see the game mechanics.') end )
end

function MapSetup()
for k, v in pairs(ents.FindByClass('func_door_rotating')) do print(v:GetClass()) v:SetKeyValue( 'spawnflags', '32' ) v:Fire('Open','',0) end
table.foreach(SPAWNPOINTS_TO_DELETE, function(key,value) for k, v in pairs(ents.FindByClass(value)) do print(v:GetClass()) v:Remove() end end)
SpawnItem('info_player_start', Vector(-1313.284912, -218.748611, 26.143988),Angle(-0.000, 90.000, -0.000))
SpawnItem('info_player_start', Vector(-1569.913696, 165.406204, 88.722725),Angle(-0.000, 0.000, 0.000))
SpawnItem('info_player_start', Vector(-1501.081787, 230.285248, 88.059540),Angle(0.000, -90.000, 0.000))
SpawnItem('info_player_start', Vector(1117.916504, 154.580704, 25.183977),Angle(-0.000, -90.000, 0.000))
SpawnItem('info_player_start', Vector(-865.651428, -182.190384, -1486.191284),Angle(0.000, 90.000, 0.000))
SpawnItem('info_player_start', Vector(-1031.656738, -165.368759, -1484.066772),Angle(-0.000, 90.001, -0.000))
SpawnItem('info_player_start', Vector(-1526.980713, 195.365784, -1485.316650),Angle(0.000, -90.000, 0.000))
SpawnItem('info_player_start', Vector(-1520.629883, -190.083359, -1486.371460),Angle(0.000, 90.000, 0.000))
SpawnItem('item_healthkit',Vector(84.379768, -654.799988, 64.335304),Angle(0.051, 0.001, 0.075))
SpawnItem('item_healthkit',Vector(76.801071, -736.180054, 64.351944),Angle(0.098, 0.001, 0.132))
SpawnItem('item_healthkit',Vector(-67.362144, -921.560486, 64.345032),Angle(0.075, 0.001, 0.104))
SpawnItem('item_healthkit',Vector(-1442.987915, 15.537797, 0.408201),Angle(0.426, 0.002, 0.532))
SpawnItem('item_healthvial',Vector(228.242142, 738.141846, 2.828217),Angle(49.339, -175.819, 89.995))
SpawnItem('item_healthvial',Vector(222.521210, 724.699402, 2.884285),Angle(1.214, 5.537, 90.214))
SpawnItem('item_healthvial',Vector(223.473724, 736.679077, 2.830714),Angle(-1.713, -152.156, 89.999))
SpawnItem('item_healthkit',Vector(-342.428711, 1206.402710, -1479.628906),Angle(0.182, 0.001, 0.233))
SpawnItem('item_healthkit',Vector(813.909729, 897.503052, -1479.584595),Angle(0.482, 0.002, 0.600))
SpawnTurret(Vector(621.357910, 1386.434692, -1511.243408),Angle(0.343, -92.359, 0.738))
SpawnTurret(Vector(226.885956, 1392.392700, -1511.251099),Angle(0.323, -89.566, 0.738))
SpawnTurret(Vector(-175.047546, 1391.452515, -1511.240356),Angle(0.296, -89.489, 0.617))
SpawnTurret(Vector(-560.996521, 1391.409058, -1511.241699),Angle(0.299, -90.631, 0.633))
SpawnTurret(Vector(-782.916382, -724.520874, -1111.235962),Angle(0.320, 45.794, 0.644))
SpawnTurret(Vector(-714.361816, 740.830444, -343.226318),Angle(0.289, -49.035, 0.522))
SpawnTurret(Vector(180.711182, 742.399048, 0.766346),Angle(0.312, -178.041, 0.615))
SpawnItem('item_healthcharger', Vector(-802.923462, -104.031250, -1456.361450),Angle(0.000, -90.000, 0.000))
SpawnSuitCharger(Vector(924.869568, 1497.968750, -1458.171997),Angle(0.000, -90.000, 0.000))
end
---------------------- END OF CONFIGURATION FILE ----------------------

