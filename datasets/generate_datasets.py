from string import ascii_lowercase
import json
import kachery_client as kc


def main():
    channel = 'flatiron1'
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
        print(f'Uploading to channel: {channel}')
        out[ds_name] = {
            'text': kc.upload_text(txt, channel=channel),
            'truth': kc.upload_json(true_result, channel=channel)
        }
    with open('datasets.json', 'w') as f:
        print(f'Writing datasets.json')
        json.dump(out, f, indent=4)

if __name__ == '__main__':
    main()