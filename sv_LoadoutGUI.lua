local points = 0
local level = 0

util.AddNetworkString( "PickedClass" )
util.AddNetworkString( "GainedPoints" )
util.AddNetworkString( "GainedLevel" )

net.Receive( "PickedClass" , function ( len, ply )
  local ClassNumber = net.ReadUInt( 1 )

  if (ClassNumber == 1) then
    ply:SetModel( "models/Humans/Group03/Male_04.mdl" )
    ply:SetArmor(ply:Armor() + 75)
    ply:Give("arccw_mw2_m4")
  elseif (ClassNumber == 2) then
    ply:SetModel( "models/Humans/Group03m/male_07.mdl" )
    ply:SetArmor(ply:Armor() + 50)
    ply:Give("arccw_mw2_usp")
  elseif (ClassNumber == 3) then
    ply:SetModel( "models/cultist/hl_a/combine_heavy/npc/combine_heavy_trooper.mdl" )
    ply:SetArmor(ply:Armor() + 200)
    ply:Give("arccw_mw2_m240")
  elseif (ClassNumber == 4) then
    ply:SetModel( "models/monk.mdl" )
    ply:SetArmor(ply:Armor() + 75)
    ply:Give("arccw_mw2_fucket")
  end
end )

function HUDPoints( pts, ply )
  net.Start( "GainedPoints" )
  net.WriteUInt( pts,16 )
  net.Send(ply)
end

function HUDLevel( lvl, ply )
  net.Start( "GainedLevel" )
  net.WriteUInt( lvl,4 )
  net.Send(ply)
end

function FOnNPCKilled( victim, killer, weapon )

  points = points + 100

  killer:ChatPrint("You have " .. points .. " points")

  if points == 1000 then
    level = level + 1
    killer:SetArmor(killer:Armor() + 25)
    killer:SendLua("GAMEMODE:AddNotify(\"You passed level :".. level .. "\", NOTIFY_GENERIC, 5)")
  elseif points == 2000 then
    level = level + 1
    killer:SetArmor(killer:Armor() + 25)
    killer:SendLua("GAMEMODE:AddNotify(\"You passed level :".. level .. "\", NOTIFY_GENERIC, 5)")
  elseif points == 3000 then
    level = level + 1
    killer:SetArmor(killer:Armor() + 25)
    killer:SendLua("GAMEMODE:AddNotify(\"You passed level :".. level .. "\", NOTIFY_GENERIC, 5)")
  end

  HUDPoints( points, killer )
  HUDLevel( level, killer )
end
hook.Add("OnNPCKilled", "ScoreXP", FOnNPCKilled)
