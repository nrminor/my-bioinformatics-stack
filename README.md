# Tools for configuring my bioinformatics stack on a new machine

This repository contains two files that can be used to install my stack of bioinformatics tools: a Dockerfile and a justfile. Depending on your preference, you can either a) build the Dockerfile using the Docker engine to get a containerized, Linux-ubuntu version of my stack, or b) run the justfile recipes with `just` to install the stack globally on your machine. My typical use case for this repo is when I move a new Mac computer and need to set up the tools I use on a daily basis. To do so, I do the following steps in the command line: 
1. Install the Rust toolchain (e.g., `cargo`, `rustup`, etc.) with: `curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y`
2. Install just with `cargo install just`
3. Run the MacOS recipe in this directory: `just mac`

This will fire up the `justfile` and install the entire stack. I then install any additional Python or R libraries in virtual environments or `renv` environments, respectively.

The justfile has been tested on MacOS machines with Intel and Apple silicon, and not yet on a Linux machine.
