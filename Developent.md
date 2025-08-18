## Development and testing

**Note: The Nix development environment is currently broken due to MOPS packaging issues.**

### Manual Setup (Recommended)

1. **Install MOPS** following the [quick start guide](https://docs.mops.one/quick-start):

    ```bash
    curl -fsSL cli.mops.one/install.sh | sh
    ```

2. **Install DFX** (Internet Computer SDK):

    ```bash
    sh -ci "$(curl -fsSL https://internetcomputer.org/install.sh)"
    ```

3. **Install GHC and Cabal** for running gen-tests using GHCup (recommended):

    ```bash
    # Install GHCup (Haskell toolchain installer)
    curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh

    # Source the environment (or restart your shell)
    source ~/.ghcup/env

    # Install GHC and Cabal
    ghcup install ghc 9.2.8
    ghcup install cabal 3.10.3.0
    ghcup set ghc 9.2.8
    ghcup set cabal 3.10.3.0

    # Add GHCup to your PATH permanently
    echo 'export PATH="$HOME/.ghcup/bin:$PATH"' >> ~/.bashrc
    ```

    **Alternative (not recommended):** System package manager:

    ```bash
    # On Ubuntu/Debian (may have version compatibility issues)
    sudo apt install ghc cabal-install
    ```

### Usage

Run `mops test` to run unit tests
Directory `test` contains a small test suite, mostly for the `Dyadic` helper module, using the
Motoko matcher's library.

In `gen-tests` you will find a Haskell program that generates random trees and witnesses and checks
that they behave as expected. Just run `cabal run gen-tests` in that directory (requires Cabal to be installed separately).
The Haskell code implements the same logic for how to structure the binary
trees, and thus can also serve as a specification. It exercises the `MerkleTree` module mostly.
The other (less hairy) modules are exercised thoroughly.

Run `make docs` to generate the documentation locally. Via github actions, this is also available
at <https://nomeata.github.io/ic-certification/>.
