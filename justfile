default:
    just --list

# Install everything for MacOS
all-macos:
    just le
    just br
    just rs
    just go
    just gpy
    @echo "Installation of the entire stack to MacOS completed with no errors."
alias mac := all-macos

# Language ecosystems used across my bioinformatics stack
lang-ecosystems:
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    wget "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"
    -bash Miniforge3-$(uname)-$(uname -m).sh -b -u
alias le := lang-ecosystems

# MacOS tools installed with Homebrew
brew-installs:
    brew install \
    git \
    wget \
    curl \
    zstd \
    pigz \
    unzip \
    precommit \
    seqkit \
    csvtk \
    vsearch \
    fastp \
    bedtools \
    vcftools \
    vcflib \
    bcftools \
    samtools \
    bwa \
    minimap2 \
    r \
    java \
    go
alias br := brew-installs

# Tools managed with the Cargo/Crates.io ecosystem
rust-tools:
    cargo install \
    sd \
    nohuman \
    ssubmit \
    scidataflow \
    just \
    nu
alias rs := rust-tools

# Go tools built from source
go-builds:
    -mkdir ~/bioinformatics
    git clone https://github.com/danielecook/still.git && \
    cd still && \
    go build
    cd ..
    mv still ~/bioinformatics/
    echo "export PATH=$PATH:~/bioinformatics/still" >> ~/.zprofile
alias go := go-builds

# Short list of tools to be installed globally with the Python toolchain
global-py-installs:
    mamba install -y -c conda-forge -c bioconda \
    "seqfu>1.10" \
    "nextflow>=23.10" \
    "multiqc>=1.19" \
    "poetry>=1.7.1" \
    "tox>=4.11.4" \
    "plink" \
    "sra-tools>=3.0.10" \
    "ncbi-datasets-cli>=16.0.0" \
    "jupyter>=1.0.0"
    mamba clean --all
alias gpy := global-py-installs

all-ubuntu:

alias lxu := all-ubuntu
