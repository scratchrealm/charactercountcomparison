import json
from string import ascii_lowercase


def alg3(dataset_fname: str, output_fname):
    with open(dataset_fname, 'r') as f:
        text = f.read()
    txt = text.lower()[::10]
    out = {}
    for c in ascii_lowercase:
        out[str(c)] = txt.count(c) * 10
    with open(output_fname, 'w') as f:
        json.dump(out, f)