from all_datasets import datasets


rule load_dataset:
    params:
        dataset="{dataset}",
    output: 'data/datasets/{dataset}.txt'
    run:
        import kachery_client as kc
        kec = kc.EphemeralClient(channel='flatiron1')
        dataset = params.dataset
        ds = datasets[dataset]
        text = kec.load_text(ds['text'])
        with open(output[0], 'w') as f:
            f.write(text)