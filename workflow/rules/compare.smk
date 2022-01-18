from compare_with_truth.compare_with_truth import compare_with_truth


rule compare:
    params:
        algorithm="{algorithm}",
        dataset="{dataset}",
    input: d='data/job_results/{algorithm}_{dataset}.json', t='data/truth/{dataset}.json'
    output: 'data/comparison_results/{algorithm}_{dataset}.json'
    run:
        import json
        algorithm = params.algorithm
        dataset = params.dataset
        result_fname = input.d
        truth_fname = input.t
        error = compare_with_truth(result_fname, truth_fname)
        with open(output[0], 'w') as f:
            json.dump(
                {
                    'algorithm': algorithm,
                    'dataset': dataset,
                    'error': error
                },
                f,
                indent=4
            )