# Devops & Cloud Computing — projectrepository

Dit is jouw persoonlijke projectrepository voor **Devops & Cloud Computing** (VIVES, 3SD).
Je werkt hier **PE1 (Docker Compose)** en **PE2 (Minikube)** uit; de volledige opdrachten staan op de cursussite.

> ⚠️ Werk in **deze** repository (`VivesMDima/2627-devops-ti-project-<jouw-username>`), die je via je eigen accept-link kreeg — niet in de template-repository waarop ze gebaseerd is.

## Snel starten

1. Vul `project.yaml` in (ook `dockerhub` en `frontend_port`).
2. PE1: code + `Dockerfile` in `frontend/` en `backend/`, `compose.yaml` in de root, voorbeeldwaarden in `.env.example`.
3. PE2: Kubernetes manifests in `k8s/`.
4. Documenteer in `docs/pe1-compose.md` en `docs/pe2-minikube.md`, screenshots in `docs/images/`.
5. Dien in: `./scripts/submit.sh` (Windows: in **Git Bash**). Je resultaat verschijnt onder **Releases**.
   Voor elke PE telt je laatste indiening vóór de deadline van die PE.

## Mappen

```
project.yaml           ← jouw gegevens
frontend/  backend/    ← PE1: code + Dockerfile
compose.yaml           ← PE1
.env.example           ← PE1: voorbeeldwaarden, géén echte wachtwoorden
k8s/                   ← PE2: Kubernetes manifests
docs/                  ← documentatie + images/
scripts/submit.sh      ← indienen
```

## Automatische controles

Elke indiening wordt automatisch gecontroleerd. Op de Releases-pagina zie je per controle PASS/FAIL met uitleg.
Zolang je aan PE1 werkt, falen de PE2-controles; dat is normaal.

### PE1-R0: project.yaml ingevuld

`naam`, `studentennummer`, `github`, `dockerhub` en `frontend_port` zijn ingevuld. Vereist voor de andere controles (0 punten).

### PE1-R1: Structuur en geldige compose

`frontend/Dockerfile`, `backend/Dockerfile` en een `compose.yaml` in de root; `docker compose config` geeft geen fouten.

### PE1-R2: Dockerfiles volgens best practices

`hadolint` vindt geen errors in je Dockerfiles (warnings mogen).

### PE1-R3: Images publiek op Docker Hub

`compose.yaml` gebruikt je eigen images van Docker Hub (geen `build:`); ze zijn publiek en bestaan voor `linux/amd64`.

### PE1-R4: Veilige compose-configuratie

Enkel de frontend publiceert een poort (`frontend_port`); geen letterlijke wachtwoorden in `compose.yaml`; `.env` staat niet in Git, `.env.example` wel.

### PE1-R5: Applicatie start volledig automatisch

`cp .env.example .env && docker compose up -d --wait` start alles; `http://localhost:<frontend_port>` antwoordt met HTTP 200.

### PE1-R6: Documentatie volledig

`docs/pe1-compose.md` heeft alle verplichte koppen en minstens 3 screenshots die in de repository staan.

### PE2-R1: Geldige manifests

Alle YAML in `k8s/` is geldig volgens `kubeconform -strict`; elke service heeft een Deployment en een Service.

### PE2-R2: ConfigMap en Secret correct gebruikt

Een ConfigMap voor niet-gevoelige configuratie en een Secret voor de credentials, gebruikt door je Deployments.

### PE2-R3: Geen gevoelige waarden in Deployments

Geen wachtwoorden, tokens of keys als letterlijke `value:` in een Deployment.

### PE2-R4: Deployt in een testcluster

`kubectl apply` van al je manifests in een verse cluster: alle Deployments worden Available.

### PE2-R5: Probes en resources

Frontend en backend hebben een `readinessProbe`; elke container heeft `resources.requests` en `resources.limits`.

### PE2-R6: Documentatie volledig

`docs/pe2-minikube.md` heeft alle verplichte koppen en minstens 3 screenshots die in de repository staan.
