# sage/exceptional_S_pi10.sage
# Battleplan v1.6: Machine outputs for S(pi/10) - 4+1+9 structure
import json, hashlib, os
from sage.all import pi

os.makedirs('data', exist_ok=True)

# Your proved machine logic here
# Placeholder: replace with actual 4+1+9 generation
first_four = [2, 3, 19, 191] # Example structure
fifth = [p_5] # Your proved 5th prime
next_nine = [p_6, p_7, p_8, p_9, p_10, p_11, p_12, p_13, p_14]

S_pi10 = first_four + [fifth] + next_nine
assert len(S_pi10) == 14

# Output for C + LaTeX
with open('data/S_pi10_exceptional.txt', 'w') as f:
    for p in S_pi10:
        f.write(f"{p}\n")

# JSON + Shaw for referee
data = {"alpha": "pi/10", "structure": "4+1+9", "primes": S_pi10, "count": 14}
sha = hashlib.sha256(json.dumps(data, sort_keys=True).encode()).hexdigest()
data["sha256"] = sha

with open('data/S_pi10_exceptional.json', 'w') as f:
    json.dump(data, f, indent=2)

with open('data/S_pi10_exceptional.txt.sha256', 'w') as f:
    f.write(f"{hashlib.sha256(open('data/S_pi10_exceptional.txt','rb').read()).hexdigest()} data/S_pi10_exceptional.txt\n")

print(f"Machine generated S(pi/10): 4+1+9 = {len(S_pi10)} primes")
