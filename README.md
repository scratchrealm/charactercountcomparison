# character count comparison

This is a template repo for comparing algorithms on datasets.

The algorithms in this toy example simply estimate the number of occurrences of each letter (a-z) in a text file. I realize this is a rather trivial task, but it's a placeholder for more interesting applications.

Some sample datasets (text files) are provided in the datasets folder. The [datasets/datasets.json](datasets/datasets.json) JSON file contains all of these as kachery references, together with ground truth on the character counts.

The three algorithms being tested are:

* alg1: subsample *every other* character and then estimate the full counts
* alg2: subsample *every fifth* character and then estimate the full counts
* alg3: subsample *every tenth* character and then estimate the full counts

Python implementations of these are found [here](./workflow/rules/algorithms).

The automatically-generated results are found in [output.md](output.md)

## Workflow

The workflow for this project is defined in [snakemake](https://snakemake.readthedocs.io/en/stable/index.html) files (.smk) files in the [workflow/rules](workflow/rules) directory.

## Setup

This project uses [snakemake](https://snakemake.readthedocs.io/en/stable/index.html) and [kachery](https://github.com/kacheryhub/kachery-doc)

Prerequisites:
* [install snakemake](https://snakemake.readthedocs.io/en/stable/getting_started/installation.html)
* Install kachery-client: `pip install kachery-client`
* If you want to store new files (in addition to loading existing files), then you should also [set up a kachery node](https://github.com/kacheryhub/kachery-doc/blob/main/doc/hostKacheryNode.md)

## Running the workflow

To run the workflow, clone this repo and `cd` to the base directory. Then:

```bash
# Run the workflow
snakemake -p -c1
```

To force rerun:

```bash
# Force rerun the workflow
snakemake -F -p -c1
```

## Creating the DAG of the workflow

To create a .pdf file of the directed acyclic graph (DAG) of the workflow, clone this repo and `cd` to the base directory. Then:

```bash
# Create dag.tmp.pdf
snakemake -F --rulegraph | dot -Tpdf > dag.tmp.pdf
```

## Authors

Jeremy Magland