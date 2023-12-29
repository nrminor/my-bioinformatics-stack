# Tools for configuring my bioinformatics stack on a new machine

This repository contains two files that can be used to install my stack of bioinformatics tools: a `Dockerfile` and a `justfile`. Depending on your preference, you can either a) build the Dockerfile using the Docker engine to get a containerized, Linux-ubuntu version of my stack, or b) run the `justfile` recipes with `just` to install the stack globally on your machine. My typical use case for this repo is when I move to a new Mac computer and need to set up the tools I use on a daily basis. To do so, I do the following steps in the command line: 
1. Install the Rust toolchain (e.g., `cargo`, `rustup`, etc.) with: `curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y`
2. Install just with `cargo install just`
3. Run the MacOS recipe in this directory: `just mac`

This will fire up the `justfile` and install the entire stack. I then install any additional Python or R libraries in virtual environments or `renv` environments, respectively.

The `justfile` has been tested on MacOS machines with Intel and Apple silicon, and not yet on a Linux machine. The Dockerfile and Linux-ubuntu-specific setup commands will be added soon.

### Summary of tools installed
The stack here hinges on two language toolchains: Python and Rust. For macOS, the setup commands lean heavily on Homebrew as well. Between `conda`/`mamba` and `pip` with Python, Homebrew, and `cargo` with Rust, once can install the majority of the tools I use for bioinformatics. These tools can be organized as follows:

Environment and data management:
- `git`
- `precommit`
- `wget`
- `curl`
- `zstd`
- `pigz`
- `unzip`
- `sd` (a Rust-based, modern `sed` replacement)
- `just`
- `nushell`, for a faster pipeline-based shell replacement
- `conda` and `mamba`
- `poetry`
- `tox`
- `jupyter`
- `renv`
- `cargo` and the rest of the Rust toolchain
- `scidataflow` for linking code with data assets
- `sra-tools`
- NCBI's `datasets` tool
- `Nextflow` for building and deploying data pipelines
- `ssubmit` for easily running commands on a SLURM cluster

For working with tabular data:
- `csvtk`
- `still` for validating tabular data that may or may not be normalized
- `tidyverse` in R for working with a visualizing dataframes

For working with FASTQ/A files:
- `seqkit`
- `seqfu`
- `vsearch`
- `bwa`
- `minimap2`
- `bbmap` and the rest of the "bbtools" suite
- `nohuman` for scrubbing human reads
- `fastqc-rs`, a Rust version of `fastqc`
- `multiqc`

For working with alignments and variation:
- `samtools`
- `bedtools`
- `bcftools`
- `vcflib`
- `vcftools`
- `plink`

As mentioned above, the tools above are on this shortlist because I tend to use them across projects, environments, etc., and installing them globally has its conveniences. However, it should be emphasized that installing many packages globally can lead to so-called "dependency hell," and should be done very conservatively. I strongly recommend that users install only the above packages (or a subset of those packages), which is made possible by the organization of recipes in the `justfile`. All additional packages should be isolated within their own environments or containers.
