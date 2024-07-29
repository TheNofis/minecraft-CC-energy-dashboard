--lua 5.3
local database = {
    {name = "OIL", monitor = "monitor_0", buffer = {prefix = "basicEnergyCube_", id = {4,5,6}, volume = 1600000}},
    {name = "BASE", monitor = "monitor_1", buffer = {prefix = "basicEnergyCube_", id = {4,5,6,7,8,9}, volume = 1600000}},
    {name = "REDSTONE", monitor = "monitor_2", buffer = {prefix = "basicEnergyCube_", id = {13,14,15}, volume = 1600000}},
    {name = "ALUMINE", monitor = "monitor_3", buffer = {prefix = "basicEnergyCube_", id = {16,17,18}, volume = 1600000}},
    {name = "COAL", monitor = "monitor_4", buffer = {prefix = "basicEnergyCube_", id = {19,20,21}, volume = 1600000}},
}

function Reader() 
        for value1=1, #database do 
            Row = database[value1]
        
            Name = Row.name
            Monitor = Row.monitor
        
            MaxEnergy = 0
            NowEnergy = 0
            for value2=1, #Row.buffer do
                Buffer = Row.buffer
                MaxEnergy = MaxEnergy + Data.volume
                for value3=1, #Buffer.id do
                    NowEnergy = NowEnergy + peripheral.wrap(Buffer.prefix+Buffer.id.value3)
                end
            end
            
            print(MaxEnergy/NowEnergy)
        end
end

Reader()
This paste expires in <1 hour. Public IP access. Share whatever you see with others in seconds with Context.Terms of ServiceReport this
