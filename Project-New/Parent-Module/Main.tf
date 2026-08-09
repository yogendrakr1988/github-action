module "rgs" {
  source = "../Child Module/RG"
  rgs    = var.rgs
}

module "vnets" {
depends_on = [ module.rgs ]
  source = "../Child Module/VNET"
  vnets  = var.vnets
}

module "peering" {
  depends_on = [ module.vnets ]
  source = "../Child Module/vnet_peering"
peering = var.peering
  
}

module "subnets" {
  depends_on = [ module.vnets]
  source  = "../Child Module/Subnet"
  subnets = var.subnets
}

module "nics" {
  depends_on = [ module.subnets, module.pips ]
 source = "../Child Module/NIC"
  nics = var.nics
}

module "pips" {
  depends_on = [ module.rgs ]
  source = "../Child Module/PIP"
  pips = var.pips
 }

module "nsgs" {
  depends_on = [ module.subnets ]
  source = "../Child Module/NSG"
  nsgs = var.nsgs
}

module "keyvault" {
  depends_on = [ module.rgs ]
  source = "../Child Module/key-vault"
  kv  = var.kv
  vms = var.vms
}

module "vms" {
  depends_on = [ module.nics, module.keyvault ]
source = "../Child Module/Linux-vm"
vms = var.vms
}