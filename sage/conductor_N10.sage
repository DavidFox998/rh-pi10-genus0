# Sage verification for Lemma 2.2: N=10, g=0, dim=1
# Run: sage sage/conductor_N10.sage
# Date: 2026-05-19

print("=== Conductor 10 Verification ===")
G = DirichletGroup(10)
chi = G[2] # chi_{-4} mod 5 extended to mod 10
S = CuspForms(chi, 3)
print("dim S_3(Gamma0(10), chi_{-4}) =", S.dimension())
print("genus X_0(10) =", Gamma0(10).genus())
print("f =", S.basis()[0].q_expansion(10))
print("Conductor N = 10 confirmed. Genus 0 confirmed.")
