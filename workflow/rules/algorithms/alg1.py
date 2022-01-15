from string import ascii_lowercase


def alg1(text: str):
    txt = text.lower()[::2]
    out = {}
    for c in ascii_lowercase:
        out[str(c)] = txt.count(c) * 2
    return out