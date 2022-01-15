from datasets import datasets


rule load_truth:
    params:
        dataset="{dataset}",
    output: 'data/truth/{dataset}.json'
    run:
        import json
        import kachery_client as kc
        dataset = params.dataset
        ds = datasets[dataset]
        truth = kc.load_json(ds['truth'])
        with open(output[0], 'w') as f:
            json.dump(truth, f)