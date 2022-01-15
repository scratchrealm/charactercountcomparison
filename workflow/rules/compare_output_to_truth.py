from string import ascii_lowercase


def compare_output_to_truth(job_result, truth):
    err_count = 0
    total_count = 0
    for c in ascii_lowercase:
        err_count = err_count + abs(job_result[str(c)] - truth[str(c)])
        total_count = total_count + truth[str(c)]
    return err_count / total_count
