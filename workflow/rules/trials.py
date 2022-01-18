from algorithms import algorithms
from all_datasets import datasets

trials = [
    {
        'algorithm': alg,
        'dataset': ds
    }
    for ds in datasets
    for alg in algorithms
]