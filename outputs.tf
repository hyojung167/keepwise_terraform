output "subnet_ids"{
    description = "서브넷 id"
    value = module.network.subnet_ids
}

output "vnet_id" {
    description = "vnet_id"
    value = module.network.vnet_id  
}

output "vm_public_ip_id" {
  value       = module.vm.public_ip_id
  description = "VM public IP (null if not created)"
}