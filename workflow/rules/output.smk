rule output:
    input: [f'data/aggregated_results.json' for x in trials]
    output: 'output.md'
    run:
        import json
        with open(input[0], 'r') as f:
            aggregated_results = json.load(f)
        md_text = ''
        md_text += 'These results were automatically generated\n\n'
        for result in aggregated_results:
            md_text += f'___\n\n'
            md_text += f'```\n'
            md_text += f'Algorithm: {result["algorithm"]}\n'
            md_text += f'Dataset: {result["dataset"]}\n'
            md_text += f'Error: {result["error"]}\n'
            md_text += f'```\n\n'
        with open(output[0], 'w') as f:
            f.write(md_text)