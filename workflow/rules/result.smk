rule result:
    params:
        algorithm="{algorithm}",
        dataset="{dataset}"
    input: r='data/job_results/{algorithm}_{dataset}.json', c='data/comparison_results/{algorithm}_{dataset}.json'
    output: 'data/results/{algorithm}_{dataset}.json'
    run:
        import json
        def read_json(fname):
            with open(fname, 'r') as f:
                return json.load(f)
        def write_json(x, fname):
            with open(fname, 'w') as f:
                return json.dump(x, f, indent=4)
        algorithm = params.algorithm
        dataset = params.dataset
        job_result = read_json(input.r)
        comparison_result = read_json(input.c)
        out = {
            'algorithm': algorithm,
            'dataset': dataset,
            'error': comparison_result['error']
        }
        with open(output[0], 'w') as f:
            json.dump(
                out,
                f,
                indent=4
            )