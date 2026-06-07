@secure()
param vulnerabilityAssessments_Default_storageContainerPath string
param servers_azure_sql_server_v2_name string = 'azure-sql-server-v2'
param storageAccounts_adlspart2v2_name string = 'adlspart2v2'

resource servers_azure_sql_server_v2_name_resource 'Microsoft.Sql/servers@2025-02-01-preview' = {
  name: servers_azure_sql_server_v2_name
  location: 'centralindia'
  kind: 'v12.0'
  properties: {
    administratorLogin: 'CloudSA0452d8c9'
    version: '12.0'
    minimalTlsVersion: '1.2'
    publicNetworkAccess: 'Enabled'
    administrators: {
      administratorType: 'ActiveDirectory'
      principalType: 'User'
      login: 'dhawleyashpal_live.com#EXT#@dhawleyashpallive.onmicrosoft.com'
      sid: 'e301e13a-405f-4933-9f45-d51cc7da4661'
      tenantId: '09dc2fc1-c9ac-4318-b3ee-152650ed6e63'
      azureADOnlyAuthentication: false
    }
    restrictOutboundNetworkAccess: 'Disabled'
    retentionDays: -1
  }
}

resource storageAccounts_adlspart2v2_name_resource 'Microsoft.Storage/storageAccounts@2026-04-01' = {
  name: storageAccounts_adlspart2v2_name
  location: 'centralindia'
  sku: {
    name: 'Standard_GRS'
    tier: 'Standard'
  }
  kind: 'StorageV2'
  properties: {
    dualStackEndpointPreference: {
      publishIpv6Endpoint: false
    }
    dnsEndpointType: 'Standard'
    defaultToOAuthAuthentication: false
    publicNetworkAccess: 'Enabled'
    allowCrossTenantReplication: false
    isLocalUserEnabled: true
    isSftpEnabled: true
    minimumTlsVersion: 'TLS1_2'
    allowBlobPublicAccess: false
    allowSharedKeyAccess: true
    isHnsEnabled: true
    networkAcls: {
      ipv6Rules: []
      bypass: 'AzureServices'
      virtualNetworkRules: []
      ipRules: []
      defaultAction: 'Allow'
    }
    supportsHttpsTrafficOnly: true
    encryption: {
      requireInfrastructureEncryption: false
      services: {
        file: {
          keyType: 'Account'
          enabled: true
        }
        blob: {
          keyType: 'Account'
          enabled: true
        }
      }
      keySource: 'Microsoft.Storage'
    }
    accessTier: 'Cool'
  }
}

resource servers_azure_sql_server_v2_name_ActiveDirectory 'Microsoft.Sql/servers/administrators@2025-02-01-preview' = {
  parent: servers_azure_sql_server_v2_name_resource
  name: 'ActiveDirectory'
  properties: {
    administratorType: 'ActiveDirectory'
    login: 'dhawleyashpal_live.com#EXT#@dhawleyashpallive.onmicrosoft.com'
    sid: 'e301e13a-405f-4933-9f45-d51cc7da4661'
    tenantId: '09dc2fc1-c9ac-4318-b3ee-152650ed6e63'
  }
}

resource servers_azure_sql_server_v2_name_Default 'Microsoft.Sql/servers/advancedThreatProtectionSettings@2025-02-01-preview' = {
  parent: servers_azure_sql_server_v2_name_resource
  name: 'Default'
  properties: {
    state: 'Disabled'
  }
}

resource servers_azure_sql_server_v2_name_CreateIndex 'Microsoft.Sql/servers/advisors@2014-04-01' = {
  parent: servers_azure_sql_server_v2_name_resource
  name: 'CreateIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
}

resource servers_azure_sql_server_v2_name_DbParameterization 'Microsoft.Sql/servers/advisors@2014-04-01' = {
  parent: servers_azure_sql_server_v2_name_resource
  name: 'DbParameterization'
  properties: {
    autoExecuteValue: 'Disabled'
  }
}

resource servers_azure_sql_server_v2_name_DefragmentIndex 'Microsoft.Sql/servers/advisors@2014-04-01' = {
  parent: servers_azure_sql_server_v2_name_resource
  name: 'DefragmentIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
}

resource servers_azure_sql_server_v2_name_DropIndex 'Microsoft.Sql/servers/advisors@2014-04-01' = {
  parent: servers_azure_sql_server_v2_name_resource
  name: 'DropIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
}

resource servers_azure_sql_server_v2_name_ForceLastGoodPlan 'Microsoft.Sql/servers/advisors@2014-04-01' = {
  parent: servers_azure_sql_server_v2_name_resource
  name: 'ForceLastGoodPlan'
  properties: {
    autoExecuteValue: 'Enabled'
  }
}

resource Microsoft_Sql_servers_auditingPolicies_servers_azure_sql_server_v2_name_Default 'Microsoft.Sql/servers/auditingPolicies@2014-04-01' = {
  parent: servers_azure_sql_server_v2_name_resource
  name: 'Default'
  location: 'Central India'
  properties: {
    auditingState: 'Disabled'
  }
}

resource Microsoft_Sql_servers_auditingSettings_servers_azure_sql_server_v2_name_Default 'Microsoft.Sql/servers/auditingSettings@2025-02-01-preview' = {
  parent: servers_azure_sql_server_v2_name_resource
  name: 'Default'
  properties: {
    retentionDays: 0
    auditActionsAndGroups: []
    isStorageSecondaryKeyInUse: false
    isAzureMonitorTargetEnabled: false
    isManagedIdentityInUse: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
}

resource Microsoft_Sql_servers_azureADOnlyAuthentications_servers_azure_sql_server_v2_name_Default 'Microsoft.Sql/servers/azureADOnlyAuthentications@2025-02-01-preview' = {
  parent: servers_azure_sql_server_v2_name_resource
  name: 'Default'
  properties: {
    azureADOnlyAuthentication: false
  }
}

resource Microsoft_Sql_servers_connectionPolicies_servers_azure_sql_server_v2_name_default 'Microsoft.Sql/servers/connectionPolicies@2025-02-01-preview' = {
  parent: servers_azure_sql_server_v2_name_resource
  name: 'default'
  location: 'centralindia'
  properties: {
    connectionType: 'Default'
  }
}

resource servers_azure_sql_server_v2_name_free_sql_db_part2_v2 'Microsoft.Sql/servers/databases@2025-02-01-preview' = {
  parent: servers_azure_sql_server_v2_name_resource
  name: 'free-sql-db-part2_v2'
  location: 'centralindia'
  sku: {
    name: 'GP_S_Gen5_2'
    tier: 'GeneralPurpose'
    family: 'Gen5'
    capacity: 2
  }
  kind: 'v12.0,user,vcore,serverless,freelimit'
  properties: {
    collation: 'SQL_Latin1_General_CP1_CI_AS'
    maxSizeBytes: 34359738368
    catalogCollation: 'SQL_Latin1_General_CP1_CI_AS'
    zoneRedundant: false
    readScale: 'Disabled'
    autoPauseDelay: 60
    requestedBackupStorageRedundancy: 'Local'
    minCapacity: json('0.5')
    maintenanceConfigurationId: '/subscriptions/c8a7238d-5a6d-412f-b9db-a337a2a05efc/providers/Microsoft.Maintenance/publicMaintenanceConfigurations/SQL_Default'
    isLedgerOn: false
    useFreeLimit: true
    freeLimitExhaustionBehavior: 'AutoPause'
    availabilityZone: 'NoPreference'
  }
}

resource servers_azure_sql_server_v2_name_master_Default 'Microsoft.Sql/servers/databases/advancedThreatProtectionSettings@2025-02-01-preview' = {
  name: '${servers_azure_sql_server_v2_name}/master/Default'
  properties: {
    state: 'Disabled'
  }
  dependsOn: [
    servers_azure_sql_server_v2_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_auditingPolicies_servers_azure_sql_server_v2_name_master_Default 'Microsoft.Sql/servers/databases/auditingPolicies@2014-04-01' = {
  name: '${servers_azure_sql_server_v2_name}/master/Default'
  location: 'Central India'
  properties: {
    auditingState: 'Disabled'
  }
  dependsOn: [
    servers_azure_sql_server_v2_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_auditingSettings_servers_azure_sql_server_v2_name_master_Default 'Microsoft.Sql/servers/databases/auditingSettings@2025-02-01-preview' = {
  name: '${servers_azure_sql_server_v2_name}/master/Default'
  properties: {
    retentionDays: 0
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
  dependsOn: [
    servers_azure_sql_server_v2_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_extendedAuditingSettings_servers_azure_sql_server_v2_name_master_Default 'Microsoft.Sql/servers/databases/extendedAuditingSettings@2025-02-01-preview' = {
  name: '${servers_azure_sql_server_v2_name}/master/Default'
  properties: {
    retentionDays: 0
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
  dependsOn: [
    servers_azure_sql_server_v2_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_geoBackupPolicies_servers_azure_sql_server_v2_name_master_Default 'Microsoft.Sql/servers/databases/geoBackupPolicies@2025-02-01-preview' = {
  name: '${servers_azure_sql_server_v2_name}/master/Default'
  properties: {
    state: 'Disabled'
  }
  dependsOn: [
    servers_azure_sql_server_v2_name_resource
  ]
}

resource servers_azure_sql_server_v2_name_master_Current 'Microsoft.Sql/servers/databases/ledgerDigestUploads@2025-02-01-preview' = {
  name: '${servers_azure_sql_server_v2_name}/master/Current'
  properties: {}
  dependsOn: [
    servers_azure_sql_server_v2_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_securityAlertPolicies_servers_azure_sql_server_v2_name_master_Default 'Microsoft.Sql/servers/databases/securityAlertPolicies@2025-02-01-preview' = {
  name: '${servers_azure_sql_server_v2_name}/master/Default'
  properties: {
    state: 'Disabled'
    disabledAlerts: [
      ''
    ]
    emailAddresses: [
      ''
    ]
    emailAccountAdmins: false
    retentionDays: 0
  }
  dependsOn: [
    servers_azure_sql_server_v2_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_transparentDataEncryption_servers_azure_sql_server_v2_name_master_Current 'Microsoft.Sql/servers/databases/transparentDataEncryption@2025-02-01-preview' = {
  name: '${servers_azure_sql_server_v2_name}/master/Current'
  properties: {
    state: 'Disabled'
  }
  dependsOn: [
    servers_azure_sql_server_v2_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_vulnerabilityAssessments_servers_azure_sql_server_v2_name_master_Default 'Microsoft.Sql/servers/databases/vulnerabilityAssessments@2025-02-01-preview' = {
  name: '${servers_azure_sql_server_v2_name}/master/Default'
  properties: {
    recurringScans: {
      isEnabled: false
      emailSubscriptionAdmins: true
    }
  }
  dependsOn: [
    servers_azure_sql_server_v2_name_resource
  ]
}

resource Microsoft_Sql_servers_devOpsAuditingSettings_servers_azure_sql_server_v2_name_Default 'Microsoft.Sql/servers/devOpsAuditingSettings@2025-02-01-preview' = {
  parent: servers_azure_sql_server_v2_name_resource
  name: 'Default'
  properties: {
    isAzureMonitorTargetEnabled: false
    isManagedIdentityInUse: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
}

resource servers_azure_sql_server_v2_name_current 'Microsoft.Sql/servers/encryptionProtector@2025-02-01-preview' = {
  parent: servers_azure_sql_server_v2_name_resource
  name: 'current'
  kind: 'servicemanaged'
  properties: {
    serverKeyName: 'ServiceManaged'
    serverKeyType: 'ServiceManaged'
    autoRotationEnabled: false
  }
}

resource Microsoft_Sql_servers_extendedAuditingSettings_servers_azure_sql_server_v2_name_Default 'Microsoft.Sql/servers/extendedAuditingSettings@2025-02-01-preview' = {
  parent: servers_azure_sql_server_v2_name_resource
  name: 'Default'
  properties: {
    retentionDays: 0
    auditActionsAndGroups: []
    isStorageSecondaryKeyInUse: false
    isAzureMonitorTargetEnabled: false
    isManagedIdentityInUse: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
}

resource servers_azure_sql_server_v2_name_AllowAllWindowsAzureIps 'Microsoft.Sql/servers/firewallRules@2025-02-01-preview' = {
  parent: servers_azure_sql_server_v2_name_resource
  name: 'AllowAllWindowsAzureIps'
  properties: {
    startIpAddress: '0.0.0.0'
    endIpAddress: '0.0.0.0'
  }
}

resource servers_azure_sql_server_v2_name_ClientIPAddress_2026_5_2_18_22_13 'Microsoft.Sql/servers/firewallRules@2025-02-01-preview' = {
  parent: servers_azure_sql_server_v2_name_resource
  name: 'ClientIPAddress_2026-5-2_18-22-13'
  properties: {
    startIpAddress: '157.35.4.179'
    endIpAddress: '157.35.4.179'
  }
}

resource servers_azure_sql_server_v2_name_ServiceManaged 'Microsoft.Sql/servers/keys@2025-02-01-preview' = {
  parent: servers_azure_sql_server_v2_name_resource
  name: 'ServiceManaged'
  kind: 'servicemanaged'
  properties: {
    serverKeyType: 'ServiceManaged'
  }
}

resource Microsoft_Sql_servers_securityAlertPolicies_servers_azure_sql_server_v2_name_Default 'Microsoft.Sql/servers/securityAlertPolicies@2025-02-01-preview' = {
  parent: servers_azure_sql_server_v2_name_resource
  name: 'Default'
  properties: {
    state: 'Disabled'
    disabledAlerts: [
      ''
    ]
    emailAddresses: [
      ''
    ]
    emailAccountAdmins: false
    retentionDays: 0
  }
}

resource Microsoft_Sql_servers_sqlVulnerabilityAssessments_servers_azure_sql_server_v2_name_Default 'Microsoft.Sql/servers/sqlVulnerabilityAssessments@2025-02-01-preview' = {
  parent: servers_azure_sql_server_v2_name_resource
  name: 'Default'
  properties: {
    state: 'Disabled'
  }
}

resource Microsoft_Sql_servers_vulnerabilityAssessments_servers_azure_sql_server_v2_name_Default 'Microsoft.Sql/servers/vulnerabilityAssessments@2025-02-01-preview' = {
  parent: servers_azure_sql_server_v2_name_resource
  name: 'Default'
  properties: {
    recurringScans: {
      isEnabled: false
      emailSubscriptionAdmins: true
    }
    storageContainerPath: vulnerabilityAssessments_Default_storageContainerPath
  }
}

resource storageAccounts_adlspart2v2_name_default 'Microsoft.Storage/storageAccounts/blobServices@2026-04-01' = {
  parent: storageAccounts_adlspart2v2_name_resource
  name: 'default'
  sku: {
    name: 'Standard_GRS'
    tier: 'Standard'
  }
  properties: {
    staticWebsite: {
      enabled: false
    }
    containerDeleteRetentionPolicy: {
      enabled: true
      days: 7
    }
    cors: {
      corsRules: []
    }
    deleteRetentionPolicy: {
      allowPermanentDelete: false
      enabled: true
      days: 7
    }
  }
}

resource Microsoft_Storage_storageAccounts_fileServices_storageAccounts_adlspart2v2_name_default 'Microsoft.Storage/storageAccounts/fileServices@2026-04-01' = {
  parent: storageAccounts_adlspart2v2_name_resource
  name: 'default'
  sku: {
    name: 'Standard_GRS'
    tier: 'Standard'
  }
  properties: {
    protocolSettings: {
      smb: {}
    }
    cors: {
      corsRules: []
    }
    shareDeleteRetentionPolicy: {
      enabled: true
      days: 7
    }
  }
}

resource storageAccounts_adlspart2v2_name_usersftppart2v2 'Microsoft.Storage/storageAccounts/localusers@2026-04-01' = {
  parent: storageAccounts_adlspart2v2_name_resource
  name: 'usersftppart2v2'
  properties: {
    allowAclAuthorization: false
    hasSshPassword: true
    permissionScopes: [
      {
        permissions: 'rcwdlop'
        service: 'blob'
        resourceName: 'blob'
      }
    ]
    homeDirectory: 'blob'
    hasSharedKey: false
    hasSshKey: false
  }
}

resource Microsoft_Storage_storageAccounts_queueServices_storageAccounts_adlspart2v2_name_default 'Microsoft.Storage/storageAccounts/queueServices@2026-04-01' = {
  parent: storageAccounts_adlspart2v2_name_resource
  name: 'default'
  properties: {
    cors: {
      corsRules: []
    }
  }
}

resource Microsoft_Storage_storageAccounts_tableServices_storageAccounts_adlspart2v2_name_default 'Microsoft.Storage/storageAccounts/tableServices@2026-04-01' = {
  parent: storageAccounts_adlspart2v2_name_resource
  name: 'default'
  properties: {
    cors: {
      corsRules: []
    }
  }
}

resource servers_azure_sql_server_v2_name_free_sql_db_part2_v2_Default 'Microsoft.Sql/servers/databases/advancedThreatProtectionSettings@2025-02-01-preview' = {
  parent: servers_azure_sql_server_v2_name_free_sql_db_part2_v2
  name: 'Default'
  properties: {
    state: 'Disabled'
  }
  dependsOn: [
    servers_azure_sql_server_v2_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_auditingPolicies_servers_azure_sql_server_v2_name_free_sql_db_part2_v2_Default 'Microsoft.Sql/servers/databases/auditingPolicies@2014-04-01' = {
  parent: servers_azure_sql_server_v2_name_free_sql_db_part2_v2
  name: 'Default'
  location: 'Central India'
  properties: {
    auditingState: 'Disabled'
  }
  dependsOn: [
    servers_azure_sql_server_v2_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_auditingSettings_servers_azure_sql_server_v2_name_free_sql_db_part2_v2_Default 'Microsoft.Sql/servers/databases/auditingSettings@2025-02-01-preview' = {
  parent: servers_azure_sql_server_v2_name_free_sql_db_part2_v2
  name: 'Default'
  properties: {
    retentionDays: 0
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
  dependsOn: [
    servers_azure_sql_server_v2_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_backupLongTermRetentionPolicies_servers_azure_sql_server_v2_name_free_sql_db_part2_v2_default 'Microsoft.Sql/servers/databases/backupLongTermRetentionPolicies@2025-02-01-preview' = {
  parent: servers_azure_sql_server_v2_name_free_sql_db_part2_v2
  name: 'default'
  properties: {
    timeBasedImmutability: 'Disabled'
    weeklyRetention: 'PT0S'
    monthlyRetention: 'PT0S'
    yearlyRetention: 'PT0S'
    weekOfYear: 0
  }
  dependsOn: [
    servers_azure_sql_server_v2_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_backupShortTermRetentionPolicies_servers_azure_sql_server_v2_name_free_sql_db_part2_v2_default 'Microsoft.Sql/servers/databases/backupShortTermRetentionPolicies@2025-02-01-preview' = {
  parent: servers_azure_sql_server_v2_name_free_sql_db_part2_v2
  name: 'default'
  properties: {
    retentionDays: 7
    diffBackupIntervalInHours: 12
  }
  dependsOn: [
    servers_azure_sql_server_v2_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_extendedAuditingSettings_servers_azure_sql_server_v2_name_free_sql_db_part2_v2_Default 'Microsoft.Sql/servers/databases/extendedAuditingSettings@2025-02-01-preview' = {
  parent: servers_azure_sql_server_v2_name_free_sql_db_part2_v2
  name: 'Default'
  properties: {
    retentionDays: 0
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
  dependsOn: [
    servers_azure_sql_server_v2_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_geoBackupPolicies_servers_azure_sql_server_v2_name_free_sql_db_part2_v2_Default 'Microsoft.Sql/servers/databases/geoBackupPolicies@2025-02-01-preview' = {
  parent: servers_azure_sql_server_v2_name_free_sql_db_part2_v2
  name: 'Default'
  properties: {
    state: 'Disabled'
  }
  dependsOn: [
    servers_azure_sql_server_v2_name_resource
  ]
}

resource servers_azure_sql_server_v2_name_free_sql_db_part2_v2_Current 'Microsoft.Sql/servers/databases/ledgerDigestUploads@2025-02-01-preview' = {
  parent: servers_azure_sql_server_v2_name_free_sql_db_part2_v2
  name: 'Current'
  properties: {}
  dependsOn: [
    servers_azure_sql_server_v2_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_securityAlertPolicies_servers_azure_sql_server_v2_name_free_sql_db_part2_v2_Default 'Microsoft.Sql/servers/databases/securityAlertPolicies@2025-02-01-preview' = {
  parent: servers_azure_sql_server_v2_name_free_sql_db_part2_v2
  name: 'Default'
  properties: {
    state: 'Disabled'
    disabledAlerts: [
      ''
    ]
    emailAddresses: [
      ''
    ]
    emailAccountAdmins: false
    retentionDays: 0
  }
  dependsOn: [
    servers_azure_sql_server_v2_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_transparentDataEncryption_servers_azure_sql_server_v2_name_free_sql_db_part2_v2_Current 'Microsoft.Sql/servers/databases/transparentDataEncryption@2025-02-01-preview' = {
  parent: servers_azure_sql_server_v2_name_free_sql_db_part2_v2
  name: 'Current'
  properties: {
    state: 'Enabled'
  }
  dependsOn: [
    servers_azure_sql_server_v2_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_vulnerabilityAssessments_servers_azure_sql_server_v2_name_free_sql_db_part2_v2_Default 'Microsoft.Sql/servers/databases/vulnerabilityAssessments@2025-02-01-preview' = {
  parent: servers_azure_sql_server_v2_name_free_sql_db_part2_v2
  name: 'Default'
  properties: {
    recurringScans: {
      isEnabled: false
      emailSubscriptionAdmins: true
    }
  }
  dependsOn: [
    servers_azure_sql_server_v2_name_resource
  ]
}

resource storageAccounts_adlspart2v2_name_default_blob 'Microsoft.Storage/storageAccounts/blobServices/containers@2026-04-01' = {
  parent: storageAccounts_adlspart2v2_name_default
  name: 'blob'
  properties: {
    immutableStorageWithVersioning: {
      enabled: false
    }
    defaultEncryptionScope: '$account-encryption-key'
    denyEncryptionScopeOverride: false
    publicAccess: 'None'
  }
  dependsOn: [
    storageAccounts_adlspart2v2_name_resource
  ]
}
