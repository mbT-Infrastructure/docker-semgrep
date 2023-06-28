FROM madebytimo/python

RUN pip3 install semgrep

ENV SEMGREP_SEND_METRICS=off

WORKDIR /media/workdir

CMD [ "semgrep", "ci", "--config", "auto", "--disable-version-check", \
    "--output", "test-results/semgrep-results.txt" ]
