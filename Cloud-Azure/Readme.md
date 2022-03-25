
## Secure network connectivity on Azure

<https://docs.microsoft.com/en-us/learn/modules/secure-network-connectivity-azure/6-configure-access-network-security-group?source=learn>

#### Configure network access to a VM using a network security group

##### Create a Linux VM

```
az vm create \
  --resource-group [sandbox resource group name] \
  --name my-vm \
  --image UbuntuLTS \
  --admin-username azureuser \
  --generate-ssh-keys
```


##### Configure NGINX

```
az vm extension set \
  --resource-group [sandbox resource group name] \
  --vm-name my-vm \
  --name customScript \
  --publisher Microsoft.Azure.Extensions \
  --version 2.1 \
  --settings '{"fileUris":["https://raw.githubusercontent.com/MicrosoftDocs/mslearn-welcome-to-azure/master/configure-nginx.sh"]}' \
  --protected-settings '{"commandToExecute": "./configure-nginx.sh"}'
  ```
  
  
  ##### Access the web server
  
  ```
  IPADDRESS="$(az vm list-ip-addresses \
  --resource-group [sandbox resource group name] \
  --name my-vm \
  --query "[].virtualMachine.network.publicIpAddresses[*].ipAddress" \
  --output tsv)"
```  
  
#Download the home page  
  curl --connect-timeout 5 http://$IPADDRESS
  
#From the browser, tiping the ip:
echo $IPADDRESS


##### List the current Network security group
```
az network nsg list \
  --resource-group [sandbox resource group name] \
  --query '[].name' \
  --output tsv
```  
  
  #Every VM on Azure is associated with at least one network security group
  
 #####  to list the rules associated with the NSG named my-vmNSG
 ``` 
  az network nsg rule list \
  --resource-group [sandbox resource group name] \
  --nsg-name my-vmNSG
  
  #making the output easier to read with:
  
  az network nsg rule list \
  --resource-group [sandbox resource group name] \
  --nsg-name my-vmNSG \
  --query '[].{Name:name, Priority:priority, Port:destinationPortRange, Access:access}' \
  --output table
```

  ##### Creating the network security group
  
  ```
  az network nsg rule create \
  --resource-group [sandbox resource group name] \
  --nsg-name my-vmNSG \
  --name allow-http \
  --protocol tcp \
  --priority 100 \
  --destination-port-ranges 80 \
  --access Allow
```
