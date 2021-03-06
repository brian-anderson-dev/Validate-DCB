# What's New in v2.2

## New Features

- This feature branch is intended to
  - Move Validate-DCB into a PowerShell Gallery capable module
  - Integrate with the cluster health service
- Adding Build and Downloads badges

- GUI for creating the configuration!
  - LaunchUI is in the default parameter set
  - Alternatively use -LaunchUI
- Added Deployment Option
  - Requires new params (deploy) in the config file (or selection in the UI)
  - Added new example file .\Examples\Deploy.ps1

## Testing Changes

- Added SMB Tests for:
  - SMB Multichannel
  - Disabling SMB Signing
  - Disabling SMB Encryption
  - Verifying SMB Server and Client Network Interfaces are RDMA capable
  - Verified SMB Live Migration limits are configured appropriately
- Added SDN tests for EncapOverhead
- Added adapter checks to verify appropriate adapter bindings

- Added test to verify IEEE Priority tags are maintain for vNIC traffic
- Added test deployment verification for Azure Automation requirements
- Added test to validate recommended FW is used with Mellanox drivers on Win-OF2 adapters (CX4 and higher)

- Incremented Recommended driver for Mellanox and Chelsio adapters
- Modified example configurations to set cluster heartbeat policy to priority 7

## Structural Changes

- Separated module prerequisites into its own Global unit test inside global.unit.tests.ps1
  - This will be run at the beginning of the initiate when the Launch or Deploy parameters are specified
- Separated driver requirements into their own file
- Separate Global and Modal test files for easier review of test code
