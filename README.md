# character count comparison

This is a generic template repo for comparing algorithms on datasets.

The algorithms in this toy example simply attempt to count the number of occurances of each letter (a-z) in a text file. I realize this is completely trivial, but it's a placeholder for more interesting applications.

Sample datasets (text files) are provided in the datasets folder. The [datasets/datasets.json](datasets/datasets.json) JSON file contains all of these as kachery references, together with ground truth on the character counts.

The two algorithms being tested are:

* alg1: subsample every other character and then estimate the full counts
* alg2: subsample every fifth character and then estimate the full counts

The results are found in [output.md](output.md)