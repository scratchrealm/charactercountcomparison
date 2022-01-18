from string import ascii_lowercase
import json
import kachery_client as kc


def main():
    out = {}
    for ds_name in ['dataset1', 'dataset2', 'dataset3']:
        fname = 'files/' + ds_name + '.txt'
        fname_truth = 'files/' + ds_name + '.truth.json'
        true_result = {}
        with open(fname, 'r') as f:
            txt = f.read().lower()
            for c in ascii_lowercase:
                true_result[str(c)] = txt.count(c)
        with open(fname_truth, 'w') as f:
            print(f'Writing {fname_truth}')
            json.dump(true_result, f)
        out[ds_name] = {
            'text': kc.store_text(txt),
            'truth': kc.store_json(true_result)
        }
    with open('datasets.json', 'w') as f:
        print(f'Writing datasets.json')
        json.dump(out, f, indent=4)

if __name__ == '__main__':
    main()