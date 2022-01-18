from algorithms import algorithms


def apply_algorithm_to_dataset(algorithm: str, dataset_fname: str, output_fname: str):
    try:
        A = [a for a in algorithms if a["name"] == algorithm][0]
    except:
        raise Exception(f'Algorithm not found: {algorithm}')
    F = A['function']
    F(dataset_fname, output_fname)