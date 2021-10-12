/* 
Reaction speed test
by Drake Dong
Jan 31
This Program tests reaction speed through a random image that appears between 1-7 seconds"
*/

var screen:string:="menu"
var mx,my,button:int
var switch : boolean := false
var count:int:=0
var time1:int:=0
var num:int
var X3:=200
var Y3:=150
var count2 : int :=0

var circlex:int:=maxx div 2
var circley:int:=maxy div 2
var circlesize:int:=100


procedure drawMenu()
    
    var bW:=250
    var bH:=50
    
    var bX1:=225
    var bY1:=250
    
    drawbox(bX1, bY1,bX1+bW,bY1+bH,white)
    Draw.Text("Play", bX1+100, bY1+25, defFontId, white)
    
    var bX2:=225
    var bY2:=175
    
    drawbox(bX2, bY2,bX2+bW,bY2+bH,white)   
    Draw.Text("How To Play", bX2+100, bY2+25, defFontId, white)
    
    var bX3:=225
    var bY3:=100
    
    drawbox(bX3, bY3,bX3+bW,bY3+bH,white)   
    Draw.Text("Quit", bX3+100, bY3+25, defFontId, white)
    
    var bX4:=225
    var bY4:=25
    
    drawbox(bX4, bY4,bX4+bW,bY4+bH,white)   
    Draw.Text("Credits", bX4+100, bY4+25, defFontId, white) 
    
    
    if mx>bX1 and mx<bX1+bW and  my>bY1 and my<bY1+bH and button = 1 then
        screen:="animation"
    elsif mx>bX2 and mx<bX2+bW and  my>bY2 and my<bY2+bH and button = 1 then
        screen:="htp"
    elsif mx>bX3 and mx<bX3+bW and  my>bY3 and my<bY3+bH and button = 1 then
        screen:="quit"
    elsif mx>bX4 and mx<bX4+bW and  my>bY4 and my<bY4+bH and button = 1 then
        screen:="credits"
    end if
    
    
    
end drawMenu


procedure start()
    colour (8)
    switch := false
    cls
    randint(num,1000,7000)
    Draw.Text("Press any key to begin", X3+30, Y3-25, defFontId, white)
    Draw.Text("Click the screen when the circle turns green", X3-40, Y3-70, defFontId, white)
    
    
    Input.Pause
    Draw.FillOval(circlex,circley+80,circlesize+25,circlesize,40)
    loop 
        exit when switch = true or count = num
        mousewhere(mx,my,button)
        if button = 1 then
            switch:=true
        end if
        count := count+1
        delay(1)
        
        
        if count = num then
            Draw.FillOval(circlex,circley+80,circlesize+25,circlesize,49)
            loop
                mousewhere(mx,my,button)
                if button = 1 then
                    switch:=true
                end if
                exit when switch = true
                count2:=count2+1
                delay(1)
            end loop
        end if
    end loop
    
    
    if count2 > 0 then 
        put "You were ", count2, " ms off"
    elsif count2 = 0 then
        put "You were ", num-count, " ms off"
    end if
    delay(1000)
    count:=0
    count2:=0
    Draw.Text("Press enter to return to the main menu", X3-20, Y3-115, defFontId, white)
    
    Input.Pause
    
    
    
end start

procedure debugMouse(x:int, y:int, b:int)
    
    Draw.Text("x: "+intstr(x),maxx-80,maxy-10,defFontId,white)
    Draw.Text("y: "+intstr(y),maxx-80,maxy-20,defFontId,white)
    Draw.Text("b: "+intstr(b),maxx-80,maxy-30,defFontId,white)
    
    
end debugMouse



loop
    Text.ColourBack(7)
    mousewhere(mx,my,button)
    debugMouse(mx,my,button)
    
    if screen="menu" then 
        
        drawMenu()
        
    elsif screen="animation" then
        
        start()
        
        screen:="menu"
        
    elsif screen="quit" then 
        colour (8)
        cls 
        Draw.Text("Thanks for checking out my program", X3-20, Y3+45, defFontId, white)
        delay(1000)
        exit
    elsif screen="htp" then
        colour (8)
        Draw.Text("How to Play", X3+75, Y3+90, defFontId, white)
        Draw.Text("Press any key to continue", X3+32, Y3+45, defFontId, white)
        Input.Pause
        cls
        Draw.Text("You will be given a target number...", X3-20, Y3+180, defFontId, white)
        Input.Pause
        
        Draw.Text("When started, a counter will begin to count upwards...", X3-90, Y3+135, defFontId, white)
        
        Input.Pause
        Draw.Text("You're goal is to click when the counter gets as close as possible to the target number...", X3-200, Y3+90, defFontId, white)
        
        Input.Pause
        Draw.Text("Good Luck!", X3+80, Y3+45, defFontId, white)
        
        
        
        
        Input.Pause 
        screen:="menu"
    elsif screen="credits" then
        Draw.Text("Made by Drake Dong", X3+60, Y3+55, defFontId, white)
        Draw.Text("Submitted Feburary 1st 2021", X3+25, Y3+25, defFontId, white)
    end if
    
    
    delay(100)
    cls
    
    
    
    
    
end loop
