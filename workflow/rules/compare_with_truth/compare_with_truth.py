import json
from string import ascii_lowercase


def compare_with_truth(result_fname, truth_fname):
    with open(result_fname, 'r') as f:
        job_result = json.load(f)
    with open(truth_fname, 'r') as f:
        truth = json.load(f)
    err_count = 0
    total_count = 0
    for c in ascii_lowercase:
        err_count = err_count + abs(job_result[str(c)] - truth[str(c)])
        total_count = total_count + truth[str(c)]
    return err_count / total_count
