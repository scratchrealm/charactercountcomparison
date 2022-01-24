from all_datasets import datasets


rule load_truth:
    params:
        dataset="{dataset}",
    output: 'data/truth/{dataset}.json'
    run:
        import json
        import kachery_client as kc
        kec = kc.EphemeralClient(channel='flatiron1')
        dataset = params.dataset
        ds = datasets[dataset]
        truth = kec.load_json(ds['truth'])
        with open(output[0], 'w') as f:
            json.dump(truth, f)