# zil-automata

Non-interactive fiction use case for ZIL (Zork Implementation Language)

Implements 1D Elementary Cellular automaton (Rules 30, 54, 60, 62, 90, 94, 102, 110, 122, 126, 150, 158, 182, 188, 190, 220, 222, 250).

See examples from (https://mathworld.wolfram.com/ElementaryCellularAutomaton.html)[https://mathworld.wolfram.com/ElementaryCellularAutomaton.html].

## Compiling and running

You need a ZIL compiler or assembler, or something like [ZILF](https://bitbucket.org/jmcgrew/zilf/wiki/Home) installed to convert the .zil file into a format usable by a z-machine interpreter such as [Frotz](https://davidgriffith.gitlab.io/frotz/).

Once installed, you can compile and convert it to a z-machine file using *zilf* and *zapf*

```
./zilf automata.zil
./zapf automata.zap
```
To run the program, use it with a Z-machine interpreter like *Frotz*

```
frotz automata.z5
```
