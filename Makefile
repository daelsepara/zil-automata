all: clean
	zilf -w automata.zil
	zapf automata.zap
	zapf -ab automata.zap > automata_freq.xzap
	rm automata_freq.zap
	zapf automata.zap
clean:
	rm -f *.xzap *.zap *.z?
