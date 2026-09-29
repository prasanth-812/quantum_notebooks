# Quantum notebook theory and code summary

This file is regenerated automatically whenever a new file is added to the repository folder. It captures the main scientific idea, the structure of the code, and the purpose of each project artifact.

## 1. Scientific goal

The project studies numerical solutions of partial differential equations using quantum-inspired and variational computational methods. The main visible theme is the one-dimensional periodic Poisson equation.

The general model is:

- d^2 u / dx^2 = f(x)
- with periodic boundary conditions on a finite domain
- where the solution u(x) is represented numerically on a grid and compared to the analytic form when available

This is a classic benchmark problem because it connects linear differential operators with discretized matrix problems, and it can be tested against known analytic solutions.

## 2. Why the Poisson problem matters

The Poisson equation connects to many scientific fields:

- electrostatics
- heat diffusion
- fluid flow
- numerical linear algebra
- quantum simulation of differential equations

In this repository, the notebook named `Poisson_1D_periodic_corrected.ipynb` uses a quantum circuit representation and representation of the forcing term and solution as vectors. The code evaluates a normalized solution and compares it with an analytic formula using a periodic domain.

## 3. What the code is doing technically

The notebook uses standard Python scientific tooling, including:

- NumPy for arrays and linear algebra
- Matplotlib for plotting
- SciPy special functions when needed
- Qiskit for quantum circuit construction and statevector simulation

Typical steps are:

1. Define a forcing function `f(x)` and the analytic solution.
2. Create a spatial grid with periodic spacing.
3. Encode a discretized representation into a quantum circuit.
4. Run the circuit using a statevector simulation.
5. Post-select the desired amplitude or ancilla state.
6. Normalize and compare the result with the analytic solution.
7. Plot the numerical and analytic curves side by side.

This is a prototype for using quantum computational primitives to express a classical PDE solution in a circuit-compatible form.

## 4. Trial and variational notebooks

The other notebooks in the repository are more exploratory and test different ansatz designs and parameter optimization strategies.

Their general pattern is:

- build a parameterized circuit (for example `efficient_su2` or a custom ansatz)
- define an objective or energy-like functional
- optimize the circuit parameters using numerical optimization
- compute reconstructed functions or state profiles
- compare different parametrizations and trial states

This is a variational quantum approach: rather than solving the exact linear system directly, the code searches for a low-energy or best-fit parameter vector that approximates the desired physical solution.

## 5. Project files currently in the folder
- `Poisson_1D_periodic_corrected.ipynb` — Jupyter notebook: Solves the 1D periodic Poisson problem using a quantum-circuit-based implementation and compares the result with the analytic solution.
- `trial_2 copy.ipynb` — Jupyter notebook: Explores a variational or trial-quantum approach using ansatz circuits, parameter optimization, and energy-style objective functions.
- `trial_2.ipynb` — Jupyter notebook: Explores a variational or trial-quantum approach using ansatz circuits, parameter optimization, and energy-style objective functions.

## 6. How this repository is kept current

The script `watch_and_commit.ps1` watches the project folder. When a new file is added or an existing file is changed, it automatically stages and commits the update. A helper script named `refresh_project_summary.py` rebuilds this summary file so the documentation stays aligned with the project contents.

This makes the repository practical for iterative research: every new notebook, script, or result file is recorded and summarized automatically.
