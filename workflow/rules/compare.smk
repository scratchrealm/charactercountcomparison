from compare_output_to_truth import compare_output_to_truth


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
        with open(input.d, 'r') as f:
            job_result = json.load(f)
        with open(input.t, 'r') as f:
            truth = json.load(f)
        error = compare_output_to_truth(job_result, truth)
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