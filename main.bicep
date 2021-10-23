//https://docs.microsoft.com/en-us/azure/templates/microsoft.web/staticsites?tabs=bicep

param location string = resourceGroup().location
param ramdom string
param liffid string
param token string

var appInsightsName = 'AppInsights'
var swaName = 'swa-${toLower(ramdom)}'
var repositoryUrl = 'https://github.com/mochan-tk/gitpod-swa.git'


resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: appInsightsName
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    publicNetworkAccessForIngestion: 'Enabled'
    publicNetworkAccessForQuery: 'Enabled'
  }
}

resource staticSites 'Microsoft.Web/staticSites@2021-02-01' = {
  name: swaName
  location: 'eastasia'
  sku: {
    tier: 'Free'
    name: 'Free'
  }
  properties: {
    branch: 'master'
    buildProperties: {
      apiLocation: '/api'
      appLocation: '/public'
      outputLocation: 'build'
    }
    repositoryUrl: repositoryUrl
    repositoryToken: token
  }
}

resource staticSitesConfig 'Microsoft.Web/staticSites/config@2021-02-01' = {
  parent: staticSites
  name: 'functionappsettings'
  properties: {
    APPINSIGHTS_INSTRUMENTATIONKEY: appInsights.properties.InstrumentationKey
    MY_LIFF_ID: liffid
  }
}

// Output
output siteName string = staticSites.name
output siteUrl string = 'https://${staticSites.properties.defaultHostname}' 
