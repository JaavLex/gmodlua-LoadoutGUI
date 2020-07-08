surface.CreateFont( "TheDefaultSettings", {
  font = "Arial", --  Use the font-name which is shown to you by your operating system Font Viewer, not the file name
  extended = false,
  size = 60,
  weight = 500,
  blursize = 0,
  scanlines = 0,
  antialias = true,
  underline = false,
  italic = false,
  strikeout = false,
  symbol = false,
  rotary = false,
  shadow = false,
  additive = false,
  outline = false,
})

net.Receive( "GainedPoints" , function ( len, ply )
  local points = net.ReadUInt( 16 )

  function DrawScore()
    draw.SimpleText("Score: " .. points .. "", "TheDefaultSettings", 10, 10, Color(255,120,120), 0, 0)
  end
  hook.Add("HUDPaint" , "PTHUD", DrawScore)
end )

net.Receive( "GainedLevel" , function ( len, ply )
  local level = net.ReadUInt( 4 )

  function DrawScore()
    draw.SimpleText("Level: " .. level .. "", "TheDefaultSettings", 10, 100, Color(255,120,120), 0, 0)
  end
  hook.Add("HUDPaint" , "LVLHUD", DrawScore)
end )
