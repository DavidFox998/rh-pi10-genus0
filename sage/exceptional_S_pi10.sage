import json, hashlib, os
os.makedirs('data', exist_ok=True)

primes = [2, 3, 19, 191, 421, 1123, 1669, 2129, 3389, 4451, 6469, 12569, 18119, 25583]

with open('data/S_pi10_exceptional.txt', 'w') as f:
    f.write('\n'.join(map(str, primes)) + '\n')

h_txt = hashlib.sha256(open('data/S_pi10_exceptional.txt','rb').read()).hexdigest()
with open('data/S_pi10_exceptional.txt.sha256', 'w') as f:
    f.write(f"{h_txt} data/S_pi10_exceptional.txt\n")

data = {"alpha": "pi/10", "structure": "4+1+9", "primes": primes, "count": len(primes)}
j = json.dumps(data, sort_keys=True)
data["sha256"] = hashlib.sha256(j.encode()).hexdigest()
with open('data/S_pi10_exceptional.json', 'w') as f:
    json.dump(data, f, indent=2)

print("Exceptional Shaw:", h_txt)
