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

data "twingate_security_policy" "strict_policy" {
  name = "MFA and Device Posture Policy"
}

resource "twingate_resource" "t22_resource" {
  name               = "t22-vulnerable-resource"
  address            = "10.0.0.50"
  remote_network_id  = twingate_remote_network.t22_network.id
  security_policy_id = data.twingate_security_policy.strict_policy.id
}