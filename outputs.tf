output "er_gw_id" {
  description = "ExpressRoute Gateway ID"
  value       = var.expressroute_gateways != null ? [for gw in azurerm_express_route_gateway.express_route_gateway : gw.id] : null
}

output "fw" {
  description = "Firewall Name"
  value       = var.firewalls != null ? [for firewall in azurerm_firewall.fw : firewall.name] : null
}

output "p2s_vpn_gw_id" {
  description = "P2S VPN Gateway ID"
  value       = var.p2s_gateways != null ? [for gw in azurerm_vpn_gateway.vpn_gateway : gw.id] : null
}

output "resource_group_name" {
  description = "Resource Group Name"
  value       = local.resource_group_name
}

output "s2s_vpn_gw" {
  description = "S2S VPN Gateway Objects"
  value       = var.vpn_gateways != null ? [for gw in azurerm_vpn_gateway.vpn_gateway : gw] : null
}

output "s2s_vpn_gw_id" {
  description = "S2S VPN Gateway ID"
  value       = var.vpn_gateways != null ? [for gw in azurerm_vpn_gateway.vpn_gateway : gw.id] : null
}

output "virtual_hub_id" {
  description = "Virtual Hub ID"
  value       = var.virtual_hubs != null ? [for hub in azurerm_virtual_hub.virtual_hub : hub.id] : null
}

output "virtual_wan_id" {
  description = "Virtual WAN ID"
  value       = azurerm_virtual_wan.virtual_wan != null ? azurerm_virtual_wan.virtual_wan.id : null
}

# New code to fix inconsistencies
output "virtual_wan" {
  description = "Virtual WAN"
  value       = azurerm_virtual_wan.virtual_wan != null ? azurerm_virtual_wan.virtual_wan : null
}

output "firewalls" {
  description = "Firewall Objects"
  #value       = var.firewalls != null ? [for firewall in azurerm_firewall.fw : firewall] : null

  value = {
    for firewall in var.firewalls :
    firewall.name => {
      id = firewall.id
      firewall = firewall
      # ip_configuration = firewall.ip_configuration
      # public_ip = firewall.public_ip
    }
  }
}

output "virtual_hubs" {
  description = "Virtual Hub Resource Objects"
  #value       = var.virtual_hubs != null ? [for hub in azurerm_virtual_hub.virtual_hub : hub] : null
  value = {
    for hub in var.virtual_hubs :
    hub.name => {
      id = hub.id
      hub = hub
    }
  }
}

output "p2s_vpn_gws" {
  description = "P2S VPN Gateway Resource Objects"
  # value       = var.p2s_gateways != null ? [for gw in azurerm_vpn_gateway.vpn_gateway : gw] : null
  value = {
    for gw in var.p2s_gateways :
    gw.name => {
      id = gw.id
      gw = gw
    }
  }
}

output "s2s_vpn_gws" {
  description = "S2S VPN Gateway Resource Objects"
  value = {
    for gw in var.vpn_gateways :
    gw.name => {
      id = gw.id
      gw = gw
    }
  }
}