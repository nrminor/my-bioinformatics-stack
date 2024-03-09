default:
    @echo "Please note that this stack installation justfile has predominantly been tested on MacOS and less so on any Linux distros."
    just --list

# Install everything for MacOS
all-macos:
    just le
    just br
    just rs
    just go
    just r
    just py
    @echo "Installation of the entire stack to MacOS completed with no errors."
alias mac := all-macos

# Language ecosystems used across my bioinformatics stack
lang-ecosystems:
    # install Rust toolchain including the cargo package/library and project manager
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    # install `pixi`, a fast conda environment solver for python
    curl -fsSL https://pixi.sh/install.sh | bash
    # install the julia toolchain
    curl -fsSL https://install.julialang.org | sh -s -- --yes
alias le := lang-ecosystems

# MacOS tools installed with Homebrew
brew-installs:
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew install --quiet neovim
    brew install --quiet lazygit
    brew install --quiet r
    brew install --quiet openjdk
    brew install --quiet oracle-jdk --cask
    echo export "JAVA_HOME=\$(/usr/libexec/java_home)" >> ~/.zshrc
    brew install --quiet go
    brew install --quiet wget
    brew install --quiet curl
    brew install --quiet zstd
    brew install --quiet pigz
    brew install --quiet unzip
    brew install --quiet pre-commit
    brew install --quiet seqkit
    brew install --quiet csvtk
    brew install --quiet vsearch
    brew install --quiet bedtools
    brew install --quiet vcftools
    brew install --quiet bcftools
    brew install --quiet samtools
    brew install --quiet bwa
    brew install --quiet minimap2
    brew install --quiet duckdb
    brew install --quiet prqlc
    -brew install --quiet --cask warp
    -brew install --quiet --cask docker
    -brew install --quiet --cask vscode
alias br := brew-installs

# basic packages for use across R environments
r-tools:
    #!/usr/bin/env Rscript
    install.packages('renv', repos = 'https://cloud.r-project.org/', clean = TRUE)
    install.packages('tidyverse', repos = 'https://cloud.r-project.org/', clean = TRUE)
alias r := r-tools

# Tools managed with the Cargo/Crates.io ecosystem
rust-tools:
    cargo install just
    cargo install --locked bat
    cargo install du-dust
    cargo install nohuman
    cargo install ssubmit
    cargo install scidataflow
    cargo install nu --features=dataframe
    cargo install qsv --locked --features=apply,foreach,polars,luau,to,to_parquet,self_update,feature_capable
    cargo install csvlens
alias rs := rust-tools

# Go tools built from source
go-builds:
    -mkdir ~/bioinformatics
    git clone https://github.com/danielecook/still.git && \
    (cd still && go build && cd ..)
    mv still ~/bioinformatics/
    echo "export PATH=$PATH:~/bioinformatics/still" >> ~/.zprofile
    source ~/.zprofile
alias go := go-builds

# Shortlist of tools to install in the base conda environment
conda-installs:
    pixi global install \
    -c conda-forge -c bioconda \
    python==3.12 ruff poetry tox pytest micromamba marimo quarto seqfu multiqc plink sra-tools ncbi-datasets-cli
    echo 'export PATH=$PATH:~/.pixi' >> ~/.zprofile
alias conda := conda-installs

# Shortlist of tools to install with from PyPI
pip-installs:
    pip install uv
    uv pip install prql-python
alias pip := pip-installs

# Short list of tools to be installed globally with the Python toolchain
global-py-installs:
    just conda
    just pip
alias py := global-py-installs

all-ubuntu:

alias lxu := all-ubuntu
