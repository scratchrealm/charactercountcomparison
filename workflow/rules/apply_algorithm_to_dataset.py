from algorithms.alg1 import alg1
from algorithms.alg2 import alg2


def apply_algorithm_to_dataset(algorithm: str, dataset_fname: str):
    with open(dataset_fname, 'r') as f:
        ts_text = f.read()
    if algorithm == 'alg1':
        out = alg1(ts_text)
    elif algorithm == 'alg2':
        out = alg2(ts_text)
    else:
        raise Exception(f'Unexpected algorithm: {algorithm}')
    return out