FROM python:3.12-slim-trixie
USER root
RUN apt update && apt install -y git
RUN useradd -ms /bin/bash container
USER container
WORKDIR /home/container
RUN python3 -m venv ~/semgrep
RUN ~/semgrep/bin/pip install semgrep