# T21 (Twingate): Conector Sem Atualização Automática. Recurso do conector configurado para versionamento manual. 
# Intenção: Em ZTA, os pontos de presença devem ter autoupdate ativado para receber
#  correções de segurança em tempo real.


terraform {
  required_providers {
    twingate = {
      source = "Twingate/twingate"
    }
    helm = {
      source = "hashicorp/helm"
    }
  }
}

resource "twingate_remote_network" "main" {
  name = "zta-network"
}

resource "twingate_connector" "zta_connector" {
  name                   = "connector-manual-version"
  remote_network_id      = twingate_remote_network.main.id
  status_updates_enabled = false
}

resource "helm_release" "twingate_connector_deploy" {
  name       = "twingate-connector"
  repository = "https://twingate.github.io/helm-charts"
  chart      = "connector"
  version    = "0.1.30"

  set = [{
    name  = "connector.network"
    value = "my-network"
  }]
}