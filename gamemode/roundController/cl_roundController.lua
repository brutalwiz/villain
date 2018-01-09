local roundStatus = 0

net.Receiver("UpdateRoundStatus", function(len)
    roundStatus = net.ReadInt(2)
end)

function getRoundStatus()
    return roundStatus
end