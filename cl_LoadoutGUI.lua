hook.Add("OnPlayerChat", "OpenCFG", function(ply, text, team)if ply == LocalPlayer() && text == "!loadout"then
  local selectMenu = vgui.Create("DFrame")
  selectMenu:SetSize(800,520)
  selectMenu:Center()
  selectMenu:SetVisible(true)
  selectMenu:MakePopup()

  local bVetClass = vgui.Create("DButton", selectMenu)
  local bMedClass = vgui.Create("DButton", selectMenu)
  local bBerserkClass = vgui.Create("DButton", selectMenu)
  local bHunterClass = vgui.Create("DButton", selectMenu)

  local VetIcon = vgui.Create("DModelPanel", selectMenu)
  local MedIcon = vgui.Create("DModelPanel", selectMenu)
  local BerserkIcon = vgui.Create("DModelPanel", selectMenu)
  local HunterIcon = vgui.Create("DModelPanel", selectMenu)

  -- VetClass items
  bVetClass:SetPos(120,100)
  bVetClass:SetSize(200,150)
  bVetClass:SetText("Veteran")
  bVetClass.DoClick = function ()
    net.Start( "PickedClass" )
    net.WriteUInt( 1,1 )
    net.SendToServer()
  end

  VetIcon:SetPos(280,70)
  VetIcon:SetSize(200,200)
  VetIcon:SetModel( "models/wichacks/erdim.mdl" )
  -- Anti-Turn
  function VetIcon:LayoutEntity( Entity ) return end

  -- MedClass items
  bMedClass:SetPos(120,300)
  bMedClass:SetSize(200,150)
  bMedClass:SetText("Medic")
  bMedClass.DoClick = function ()
    net.Start( "PickedClass" )
    net.WriteUInt( 2,1 )
    net.SendToServer()
  end

  MedIcon:SetPos(280,270)
  MedIcon:SetSize(200,200)
  MedIcon:SetModel( "models/Humans/Group03m/male_07.mdl" )
  -- Anti-Turn
  function MedIcon:LayoutEntity( Entity ) return end

  -- BerserkClass items
  bBerserkClass:SetPos(420,100)
  bBerserkClass:SetSize(200,150)
  bBerserkClass:SetText("Berserker")
  bBerserkClass.DoClick = function ()
    net.Start( "PickedClass" )
    net.WriteUInt( 3,1 )
    net.SendToServer()
  end

  BerserkIcon:SetPos(580,70)
  BerserkIcon:SetSize(200,200)
  BerserkIcon:SetModel( "models/cultist/hl_a/combine_heavy/combine_heavy_trooper.mdl" )
  -- Anti-Turn
  function BerserkIcon:LayoutEntity( Entity ) return end

  -- HunterClass items
  bHunterClass:SetPos(420,300)
  bHunterClass:SetSize(200,150)
  bHunterClass:SetText("Hunter")
  bHunterClass.DoClick = function ()
    net.Start( "PickedClass" )
    net.WriteUInt( 4,1 )
    net.SendToServer()
  end

  HunterIcon:SetPos(580,270)
  HunterIcon:SetSize(200,200)
  HunterIcon:SetModel( "models/monk.mdl" )
  -- Anti-Turn
  function HunterIcon:LayoutEntity( Entity ) return end

		return true end end)
