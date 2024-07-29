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
            NowEnergy = NowEnergy + peripheral.wrap(Buffer.prefix .. Buffer.id[value3]).getEnergy()*X
        end
            
        drawPercent(Monitor, Name, value1, NowEnergy/MaxEnergy)
    end
end

function drawPercent(monitorName, generatorName, index, percent)
    monitor = peripheral.wrap(monitorName)
    width, height = monitor.getSize()
    
    onePercent = width/100
    displayPercent = onePercent*percent*100

    monitor.setCursorPos(1, index*2-1)
    monitor.write(string.format("Generator: %s %s", generatorName, displayPercent))
    
    for x=0, displayPercent do
        monitor.setCursorPos(x, index*2)
        monitor.blit(" ", "e", "e")
    end
end

while true do
    GetEnergy()
    Sleep(0.1)
end
