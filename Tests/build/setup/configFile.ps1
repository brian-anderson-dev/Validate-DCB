$AllNodes = @()
$NonNodeData = @()

$Nodes = 'localhost'

$Nodes | ForEach-Object {
    $AllNodes += @{
        NodeName = $_

        VMSwitch = @(
            @{
                Name                   = 'VMSTest'
                EmbeddedTeamingEnabled = $True
                LoadBalancingAlgorithm = 'HyperVPort'

                RDMAEnabledAdapters    = @(
                    @{
                        Name             = (Get-NetAdapter | Where-Object InterfaceDescription -like 'Microsoft Hyper-V Network Adapter*').Name
                        VMNetworkAdapter = 'SMB01'
                        VLANID           = 10
                        JumboPacket      = 1514
                    }
                )
            }
        )
    }
}

$NonNodeData = @{
    NetQoS = @(
        @{ Name = 'Cluster' ; PriorityValue8021Action = 7 ; Template = 'Cluster' ; BandwidthPercentage = 1 ; Algorithm = 'ETS' }
        @{ Name = 'SMBDirect' ; PriorityValue8021Action = 3 ; NetDirectPortMatchCondition = 445 ; BandwidthPercentage = 50 ; Algorithm = 'ETS' }
        @{ Name = 'Default' ; PriorityValue8021Action = 0 ; Template = 'Default' ; BandwidthPercentage = 49 ; Algorithm = 'ETS' }
    )
}

$Global:configData = @{
    AllNodes    = $AllNodes
    NonNodeData = $NonNodeData
}
