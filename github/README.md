## GitHub Actions Runner

This GitHub Actions runner was embedded inside the same buildmystack image. The entrypoint will be similar with GitLab runner since GitHub runner requires manual configuration to add the self hosted runner into GitHub.

### Configuration

Use `config.sh` script to configure the GitHub Actions runner.

1. Create new runner configuration: `./config.sh new-runner`
1. Enter container for configuration:  `./config.sh`
1. Navigate to runner folder `cd ~/github/runner/environments/new-runner`
1. Follow GitHub runner configuration `./config.sh --url https://github.com/<org_name> --token <token>`
1. Run `docker-compose` after all runners configured
