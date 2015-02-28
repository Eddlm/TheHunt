	table.foreach(MainEnemiesCoop, function(key,enemy)
		for k, npc in pairs(ents.FindByClass(enemy)) do
			if npc:Health() > 0 then
				if npc:GetEnemy() then
					if npc:IsCurrentSchedule(SCHED_FORCED_GO) or npc:IsCurrentSchedule(SCHED_IDLE_WANDER) or npc:IsCurrentSchedule(SCHED_FORCED_GO_RUN)	then
						npc:ClearSchedule()
					end		
						if table.HasValue(MainEnemiesCoop, npc:GetClass()) then
							if npc:HasCondition(10) then
								npc:SetKeyValue("squadname", ""..npc:GetEnemy():GetClass.."")
								if timer.Exists("npcforgettimer") then
									timer.Destroy( "npcforgettimer")
								end
									if npc:GetEnemy().spotted != 1 then
									if npc:GetEnemy():IsPlayer() or npc:GetEnemy():GetClass() == "npc_citizen" then LastEnemyWasPlayer=1
											npc:EmitSound(table.Random(ContactConfirmed), 100, 100)
											if GetConVarNumber("h_combine_chat") == 1 then
											PrintMessage(HUD_PRINTTALK, ""..npc:GetName()..": "..table.Random(ChatEnemySpotted).."") end
											ClearPatrolzones()			
											table.insert(zonescovered, npc:GetEnemy():GetPos()+Vector(0,0,30)) print("Patrol zone added (Player spotted)")
											net.Start("Spotted")
											net.Send(npc:GetEnemy())
											npc:GetEnemy().spotted = 1
										end
									end
								for num, ThisEnt in pairs(ents.FindInSphere(npc:GetPos(),500)) do 						
									if table.HasValue(MainEnemiesCoop, ThisEnt:GetClass()) and !ThisEnt:IsCurrentSchedule(SCHED_FORCED_GO_RUN) then
										if ThisEnt:GetEnemy() == nil  then 
											ThisEnt:SetLastPosition(npc:GetEnemy():GetPos())
											ThisEnt:SetSchedule(SCHED_FORCED_GO_RUN)
										end
									end
								end
								
								for num, ThisEnt in pairs(ents.FindInSphere(npc:GetPos(),9000)) do 
									if table.HasValue(MainEnemiesCoop, ThisEnt:GetClass()) and !ThisEnt:IsCurrentSchedule(SCHED_FORCED_GO_RUN) then
											if ThisEnt:GetEnemy() == nil  then 
												if CombineAssisting < GetConVarNumber("h_maxhelp") then
												--print(ThisEnt:GetName().." is helping "..npc:GetName().."")
												ThisEnt:SetLastPosition(npc:GetEnemy():GetPos())
												ThisEnt:SetSchedule(SCHED_FORCED_GO_RUN)
												CombineAssisting = CombineAssisting+1
												--print("[The Hunt]: Combines helping: "..CombineAssisting.." of "..GetConVarNumber("h_maxhelp").."")
												end
											end
									end
								end
							else
								if !timer.Exists("npcforgettimer") then
									timer.Create( "npcforgettimer", GetConVarNumber("h_lostplayertimeout"), 1, npcforget ) 
								end
							end		
						end
				end
			end
		end
	end)