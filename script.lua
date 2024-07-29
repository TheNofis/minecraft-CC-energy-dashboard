--lua 5.3

-- CONFIG
local MainMonitorName = "monitor_7"
local X = 0.4
local database = {
    {name = "OIL", monitor = "monitor_0", buffer = {prefix = "basicEnergyCube_", id = {4,5,6}, volume = 1600000}},
    {name = "BASE", monitor = "monitor_1", buffer = {prefix = "basicEnergyCube_", id = {7,8,9,10,22,12}, volume = 1600000}},
    {name = "REDSTONE", monitor = "monitor_2", buffer = {prefix = "basicEnergyCube_", id = {13,14,15}, volume = 1600000}},
    {name = "ALUMINE", monitor = "monitor_3", buffer = {prefix = "basicEnergyCube_", id = {16,17,18}, volume = 1600000}},
    {name = "COAL", monitor = "monitor_4", buffer = {prefix = "basicEnergyCube_", id = {19,20,21}, volume = 1600000}},
}

-- CODE
function GetEnergy()
    for value1=1, #database do 
        
        Row = database[value1]
        Buffer = Row.buffer
        
        Name = Row.name
        Monitor = Row.monitor
        
        MaxEnergy = 0
        NowEnergy = 0
        
        MaxEnergy = Buffer.volume * #Buffer.id
        for value3=1, #Buffer.id do
            NowEnergy = NowEnergy + peripheral.wrap(Buffer.prefix .. Buffer.id[value3])*X
        end
            
        drawPercent(Monitor, value1, MaxEnergy/NowEnergy)
    end
end

function drawPercent(monitorName, index, percent)
    --monitor.setCursorPos(x, index*2)
    monitor = peripheral.wrap(monitorName)
    width, height = monitor.getSize()

    onePercent = width/100
    
    for x=0, onePercent*percent do
        monitor.blit(" ", "e", "e")
        
    end
end

while true then
    GetEnergy()
end
