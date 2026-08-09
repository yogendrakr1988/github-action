rgs = {
  rg1 = {
    rg-name  = "sandeep1010-rg"
    rg-location = "central india"
  }
}

vnets = {
  vnet1 = {
    vnet-name     = "frontend-vnet"
    address_space = ["10.0.0.0/16"]
    vnet-location = "central india"
    rg-name       = "sandeep1010-rg"
  }

  vnet2 = {
    vnet-name     = "backend-vnet"
    address_space = ["10.1.0.0/16"]
    vnet-location = "central india"
    rg-name       = "sandeep1010-rg"
  }

}

peering = {
  peer = {
    peering_a_b = "vnet1-to-vnet2"
    peering_b_a = "vnet2-to-vnet1"

    rg_name = "sandeep1010-rg"
    vnet_a = "frontend-vnet"
    vnet_b = "backend-vnet"
  }
}

nsgs = {

  nsg1 = {
    nsg_name = "frontend_nsg"
    rg_location = "central india"
    rg_name = "sandeep1010-rg"
    subnet_name = "frontend-subnet"
    vnet_name = "frontend-vnet"
  }
 nsg2 = {
    nsg_name = "backend_nsg"
    rg_location = "central india"
    rg_name = "sandeep1010-rg"
    subnet_name = "backend-subnet"
    vnet_name = "backend-vnet"
  }
}

subnets = {
  subnet1 = {
    subnet-name      = "frontend-subnet"
    rg-name          = "sandeep1010-rg"
    vnet-name        = "frontend-vnet"
    address_prefixes = ["10.0.0.0/24"]
  }
    subnet2 = {
    subnet-name      = "backend-subnet"
    rg-name          = "sandeep1010-rg"
    vnet-name        = "backend-vnet"
    address_prefixes = ["10.1.0.0/24"]
  }

}

pips = {
  pip1 =  {
    pip-name = "frontend-pip"
    rg-name = "sandeep1010-rg"
    rg-location = "central india"
    allocation_method = "Static"
  }
    pip2 =  {
    pip-name = "backend-pip"
    rg-name = "sandeep1010-rg"
    rg-location = "central india"
    allocation_method = "Static"
  }
 }

kv = {
  kv1 = {
    kv-name     = "sandeepkvdev710241125"
    kv-location = "central india"
    rg-name     = "sandeep1010-rg"
  }
}

nics = {
  vm1 = {
    nic_name = "frontend-nic"
    rg-location = "central india"
    rg-name = "sandeep1010-rg"
    ip_name = "sandeep-ip"
    subnet-name = "frontend-subnet"
     pip-name = "frontend-pip"
    vnet-name = "frontend-vnet"
      ip_allocation = "Dynamic"
  }
  vm2 = {
    nic_name = "backend-nic"
    rg-location = "central india"
    rg-name = "sandeep1010-rg"
    ip_name = "yogi-ip"
    subnet-name = "backend-subnet"
     pip-name = "backend-pip"
    vnet-name = "backend-vnet"
      ip_allocation = "Dynamic"
  }
 }

vms = {

  vm1 = {
    vm-name = "frontend-vm01"
    rg-name = "sandeep1010-rg"
    rg-location = "central india"
    vm-size = "Standard_D2_v3"
      caching = "ReadWrite"
    stg_type = "Standard_LRS"
    publisher = "Canonical"
    offer = "UbuntuServer"
    sku = "16.04-LTS"
    version = "latest"
    nic_name = "frontend-nic"
     }

     
vm2 = {
    vm-name = "backend-vm01"
    rg-name = "sandeep1010-rg"
    rg-location = "central india"
    vm-size = "Standard_D2_v3"
    caching = "ReadWrite"
    stg_type = "Standard_LRS"
    publisher = "Canonical"
    offer = "UbuntuServer"
    sku = "16.04-LTS"
    version = "latest"
    nic_name = "backend-nic"
  }
}