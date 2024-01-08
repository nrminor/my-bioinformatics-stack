default:
    just --list

# Install everything for MacOS
all-macos:
    just le
    just br
    just rs
    just go
    just r
    just gpy
    @echo "Installation of the entire stack to MacOS completed with no errors."
alias mac := all-macos

# Language ecosystems used across my bioinformatics stack
lang-ecosystems:
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    "${SHELL}" <(curl -L micro.mamba.pm/install.sh)
alias le := lang-ecosystems

# MacOS tools installed with Homebrew
brew-installs:
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew install wget
    brew install curl
    brew install zstd
    brew install pigz
    brew install unzip
    brew install fish
    brew install pre-commit
    brew install seqkit
    brew install csvtk
    brew install vsearch
    brew install bedtools
    brew install vcftools
    brew install brewsci/bio/vcflib
    brew install bcftools
    brew install samtools
    brew install bwa
    brew install minimap2
    brew install r
    brew install java
    brew install go
    brew install nim
    brew install duckdb
    brew install prqlc
alias br := brew-installs

# basic packages for use across R environments
r-tools:
    #!/usr/bin/env Rscript
    install.packages('renv', repos = 'https://cloud.r-project.org/', clean = TRUE)
    install.packages('tidyverse', repos = 'https://cloud.r-project.org/', clean = TRUE)
alias r := r-tools

# Tools managed with the Cargo/Crates.io ecosystem
rust-tools:
    cargo install sd
    cargo install nohuman
    cargo install ssubmit
    cargo install scidataflow
    cargo install just 
    cargo install nu --features=dataframe
    cargo install qsv --locked --features all_features
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

# Short list of tools to be installed globally with the Python toolchain
global-py-installs:
    conda install -y python=3.12
    mamba install -y -c conda-forge -c bioconda \
    "seqfu>1.10" \
    "nextflow>=23.10" \
    "multiqc>=1.19" \
    "poetry>=1.7.1" \
    "tox>=4.11.4" \
    plink \
    sra-tools \
    "ncbi-datasets-cli>=16.0.0" \
    "jupyter>=1.0.0"
    mamba clean --all
    pip install prql-python
alias gpy := global-py-installs

all-ubuntu:

alias lxu := all-ubuntu
