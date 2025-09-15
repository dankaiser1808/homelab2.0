# Homelab

This is the second version of my homelab, now running on enterprise-grade hardware instead of Raspberry Pi 5's.

## Hardware Specifications

| Component | Model | CPU | Memory | Storage |
|-----------|-------|-----|--------|---------|
| Master Node | Intel NUC NUC12WSKi5 | Intel Core i5-1240P | 32GB DDR4 | 1TB SSD |
| Worker Node 1 | Lenovo ThinkCentre M700 | Intel Core i5-6500T | 16GB DDR4 | 512GB SSD |
| Worker Node 2 | Lenovo ThinkCentre M700 | Intel Core i5-6500T | 16GB DDR4 | 512GB SSD |


## Architecture Overview

My homelab is built on [**K3S**](https://docs.k3s.io/) (Kubernetes minimal distribution) and follows [Flux GitOps best practices with a monorepo structure](https://fluxcd.io/flux/guides/repository-structure/#repository-structure). The infrastructure is organized into three main categories: applications, infrastructure, and monitoring components.


The setup utilizes **Kustomize** to create a hierarchy between the production environment and base manifests, enabling easy management of multiple environments while maintaining consistency across the base layer.

## Why I Migrated from ArgoCD

### ArgoCD → Flux

**ArgoCD** is an excellent solution for enterprise-grade developer platforms with an application-centric approach and beautiful UI. However, it felt somewhat clunky compared to **Flux**. Flux is minimalistic, closely aligned with Kubernetes-native resources, and comes with comprehensive best practices—all manageable from the CLI. This approach perfectly suits my primarily infrastructure-based deployments.

## Currently Hosted Services

### Applications

<table>
    <tr>
        <th>Logo</th>
        <th>Name</th>
        <th>Description</th>
    </tr>
        <td><img width="32" src="https://raw.githubusercontent.com/sissbruecker/linkding/357c2d139999431f3b3278436065016ae990b460/docs/src/assets/logo.svg"></td>
        <td><a href="https://linkding.link/">Linkding</a></td>
        <td>Open-Source bookmark manager</td>
    </tr>
    <tr>
        <td><img width="32" src="https://www.audiobookshelf.org/Logo.png"></td>
        <td><a href="https://www.audiobookshelf.org/">Audiobookshelf</a></td>
        <td>Open-Source self hosted audio books and podcasts</td>
    </tr>
</table>

### Infrastructure

Everything needed to run my cluster & deploy my applications
<table>
    <tr>
        <th>Logo</th>
        <th>Name</th>
        <th>Description</th>
    </tr>
    <tr>
        <td><img width="32" src="https://cdn.jsdelivr.net/gh/walkxcode/dashboard-icons/png/cloudflare-zero-trust.png"></td>
        <td><a href="https://developers.cloudflare.com/cloudflare-one/">Cloudflare Zero Trust</a></td>
        <td>DNS tunnel solution for local DNS and public domain mapping</td>
    </tr>
    <tr>
        <td><img width="32" src="https://cdn.jsdelivr.net/gh/traefik/traefik/docs/content/assets/img/traefikproxy-icon-color.png"></td>
        <td><a href="https://traefik.io/traefik">Traefik</a></td>
        <td>Cloud native application proxy</td>
    </tr>
    <tr>
        <td><img width="32" src="https://raw.githubusercontent.com/age-sops/age/a6f31cc254a8e1b56881f6f245cd0857238bd5bd/logo/logo.svg"></td>
        <td><a href="https://fluxcd.io/flux/guides/mozilla-sops/">SOPS AGE</a></td>
        <td>Fully encrypted Kubernetes secrets</td>
    </tr>
    <tr>
        <td><img width="32" src="https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/svg/flux-cd.svg"></td>
        <td><a href="https://fluxcd.io/">Flux CD</a></td>
        <td>Minimalistic GitOps Operator</td>
    </tr>
    <tr>
        <td><img width="32" src="https://cdn.jsdelivr.net/gh/walkxcode/dashboard-icons/svg/grafana.svg"></td>
        <td><a href="https://grafana.com/">Grafana</a></td>
        <td>Observability solution for Real time Dashboards</td>
    </tr>
    <tr>
        <td><img width="32" src="https://cdn.jsdelivr.net/gh/walkxcode/dashboard-icons/svg/prometheus.svg"></td>
        <td><a href="https://prometheus.io/">Prometheus</a></td>
        <td>Open-Source metric collection service with alerting and query capabilities</td>
    </tr>
    <tr>
        <td><img width="32" src="https://www.svgrepo.com/download/374041/renovate.svg"></td>
        <td><a href="https://github.com/renovatebot/renovate">Renovate</a></td>
        <td>Automated merge request dependency updates</td>
    </tr>
    <tr>
        <td><img width="32" src="https://cdn.jsdelivr.net/gh/walkxcode/dashboard-icons/svg/cert-manager.svg"></td>
        <td><a href="https://cert-manager.io">Cert-Manager</a></td>
        <td>X.509 certificate controller with automated certificate renewal</td>
    </tr>
</table>
