import json, hashlib, os
os.makedirs('data', exist_ok=True)

primes = [2, 5]

with open('data/S6_pi10.txt', 'w') as f:
    f.write('\n'.join(map(str, primes)) + '\n')

h_txt = hashlib.sha256(open('data/S6_pi10.txt','rb').read()).hexdigest()
with open('data/S6_pi10.txt.sha256', 'w') as f:
    f.write(f"{h_txt} data/S6_pi10.txt\n")

data = {"N": 10, "genus": 0, "ramified_primes": primes, "count": len(primes)}
j = json.dumps(data, sort_keys=True)
data["sha256"] = hashlib.sha256(j.encode()).hexdigest()
with open('data/S6_pi10.json', 'w') as f:
    json.dump(data, f, indent=2)

print("Conductor Shaw:", h_txt)
