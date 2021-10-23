## memo
起動に10分かかる

## command

```
az upgrade
az bicep install
#az bicep version

az login

 az account list \
   --refresh \
   --query "[].id" \
   --output table

az account set --subscription <your subscription id>

group_name=20211027HappyHackLiff

az group create --name ${group_name} --location japaneast

az configure --defaults group=${group_name}

## https://1password.com/jp/password-generator/
az deployment group create --name deployPrj02 --template-file main.bicep \
  --parameters ramdom=<ramdom> \
  --parameters liffid=<liffid> \
  --parameters token=<token>
  
az deployment group show \
  -g ${group_name} \
  -n deployPrj02 \
  --query properties.outputs.siteUrl.value

#az group delete --name ${group_name}
```

##

https://azure.github.io/AppService/2021/07/23/Quickstart-Intro-to-Bicep-with-Web-App-plus-DB.html

https://github.com/Azure/static-web-apps-cli
