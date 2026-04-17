# T22 (Twingate): Política de Autenticação Fraca. 
# Rede ou aplicação associada a um twingate_security_policy sem exigência de MFA ou aprovação de dispositivo.
#  Intenção: Forçar verificação de postura do dispositivo e MFA a cada sessão.

terraform {
  required_providers {
    twingate = {
      source = "twingate/twingate"
    }
  }
}

provider "twingate" {
  api_token = "dummy_token_for_validation"
  network   = "dummy_network_for_validation"
}

resource "twingate_remote_network" "t22_network" {
  name = "t22-network"
}

resource "twingate_resource" "t22_resource" {
  name               = "t22-vulnerable-resource"
  address            = "10.0.0.50"
  remote_network_id  = twingate_remote_network.t22_network.id
  security_policy_id = "cG9saWN5OjE="
}