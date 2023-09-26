FROM madebytimo/scripts AS builder

WORKDIR /root/builder/

RUN download.sh --name semgrep-rules.tar.gz \
    https://github.com/madebyTimo/semgrep-rules/archive/refs/heads/main.tar.gz \
    && compress.sh --decompress semgrep-rules.tar.gz \
    && mv semgrep-rules-main/src/rules semgrep-rules \
    && rm -r semgrep-rules.tar.gz semgrep-rules-main

FROM madebytimo/python

RUN pip3 install semgrep

COPY --from=builder /root/builder/semgrep-rules /media/semgrep-rules

ENV SEMGREP_SEND_METRICS="off"
ENV SEMGREP_ENABLE_VERSION_CHECK=0
ENV SEMGREP_RULES="/media/semgrep-rules \
    p/bandit \
    p/brakeman \
    p/c \
    p/ci \
    p/clientside-js \
    p/command-injection \
    p/comment \
    p/csharp \
    p/cwe-top-25 \
    p/deepsemgrep \
    p/django \
    p/docker-compose \
    p/electron-desktop-app \
    p/eslint \
    p/eslint-plugin-security \
    p/expressjs \
    p/findsecbugs \
    p/flask \
    p/flawfinder \
    p/gitlab \
    p/gitlab-bandit \
    p/gitlab-eslint \
    p/gitleaks \
    p/go-command-injection \
    p/golang \
    p/gosec \
    p/headless-browser \
    p/insecure-transport \
    p/insecure-transport-jsnode \
    p/java \
    p/java-command-injection \
    p/javascript \
    p/javascript-command-injection \
    p/juice-shop \
    p/jwt \
    p/kotlin \
    p/kubernetes \
    p/lockfiles \
    p/nextjs \
    p/nginx \
    p/nodejs \
    p/nodejsscan \
    p/ocaml \
    p/owasp-flask \
    p/owasp-java-benchmark \
    p/owasp-sf \
    p/owasp-top-ten \
    p/php \
    p/php-laravel \
    p/phpcs-security-audit \
    p/play \
    p/python \
    p/python-command-injection \
    p/python-flask-meetup \
    p/r2c \
    p/r2c-best-practices \
    p/r2c-bug-scan \
    p/r2c-ci \
    p/r2c-owasp-presentation \
    p/r2c-security-audit \
    p/react \
    p/react-best-practices \
    p/react-team-tier \
    p/reverse-shells \
    p/ruby \
    p/ruby-command-injection \
    p/ruby-on-rails-xss \
    p/rust \
    p/scala \
    p/secrets \
    p/security-audit \
    p/security-code-scan \
    p/semgrep-go-correctness \
    p/semgrep-misconfigurations \
    p/semgrep-rule-lints \
    p/sql-injection \
    p/supply-chain \
    p/swift \
    p/terraform \
    p/trailofbits \
    p/typescript \
    p/vuln-finding \
    p/wordpress \
    p/xss \
    r/yaml.github-actions.security.allowed-unsecure-commands.allowed-unsecure-commands \
    r/yaml.github-actions.security.run-shell-injection.run-shell-injection \
    r/yaml.github-actions.security.pull-request-target-code-checkout.\
pull-request-target-code-checkout"

WORKDIR /media/workdir

CMD [ "semgrep", "ci", "--output", "test-results/semgrep-results.txt" ]
