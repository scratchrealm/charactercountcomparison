from apply_algorithm_to_dataset import apply_algorithm_to_dataset


rule run_job:
    params:
        algorithm="{algorithm}",
        dataset="{dataset}"
    input: 'data/datasets/{dataset}.txt'
    output: 'data/job_results/{algorithm}_{dataset}.json'
    run:
        import json
        import kachery_client as kc
        algorithm = params.algorithm
        job_result = apply_algorithm_to_dataset(algorithm, input[0], output[0])