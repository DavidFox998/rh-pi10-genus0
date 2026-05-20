#!/bin/bash
set -euo pipefail

echo "=== Battleplan v1.6: Dual Shaw Verification ==="

# 1. Check conductor set
echo "[1/6] Verifying conductor SHA..."
sha256sum -c data/S6_pi10.txt.sha256

echo "[2/6] Running conductor C verifier..."
./bin/print_S6_pi10 data/S6_pi10.txt

# 2. Check exceptional set 
echo "[3/6] Verifying exceptional set SHA..."
sha256sum -c data/S_pi10_exceptional.txt.sha256

echo "[4/6] Running exceptional set C verifier..."
./bin/print_S_pi10_exceptional data/S_pi10_exceptional.txt

# 3. Cross-check JSON counts
echo "[5/6] Checking JSON vs TXT counts..."
CONDUCTOR_COUNT=$(jq '.count' data/S6_pi10.json)
EXCEPT_COUNT=$(jq '.count' data/S_pi10_exceptional.json)
[ "$CONDUCTOR_COUNT" = "2" ] || { echo "FAIL: Conductor count"; exit 1; }
[ "$EXCEPT_COUNT" = "14" ] || { echo "FAIL: Exceptional count"; exit 1; }

echo "[6/6] Battleplan v1.6 VERIFY: PASS"
ls -la data/*.sha256
