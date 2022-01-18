from trials import trials


rule aggregate:
    input: [f'data/results/{x["algorithm"]["name"]}_{x["dataset"]}.json' for x in trials]
    output: 'data/aggregated_results.json'
    run:
        import json
        def read_json(fname):
            with open(fname, 'r') as f:
                return json.load(f)
        def write_json(x, fname):
            with open(fname, 'w') as f:
                return json.dump(x, f, indent=4)
        aggregated = [read_json(fname) for fname in input]
        write_json(aggregated, output[0])