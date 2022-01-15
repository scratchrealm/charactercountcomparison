from string import ascii_lowercase


def alg2(text: str):
    txt = text.lower()[::5]
    out = {}
    for c in ascii_lowercase:
        out[str(c)] = txt.count(c) * 5
    return out