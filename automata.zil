<VERSION XZIP>

<CONSTANT LENGTH 60>
<CONSTANT WORLD <ITABLE BYTE ,LENGTH <BYTE 0>>>
<CONSTANT NEXT <ITABLE BYTE ,LENGTH <BYTE 0>>>
<CONSTANT CELL-CHAR !\#>

<ROUTINE GO ()
    <AUTOMATA-LOOP>>

<ROUTINE AUTOMATA-LOOP ("AUX" KEY RULE ITERATIONS)
	<SET KEY !\1>
	<REPEAT ()
		<SET RULE <SELECT-RULE .KEY>>
		<CLEAR-WORLD>
		<PUTB WORLD </ LENGTH 2> 1>
		<SET ITERATIONS </ LENGTH 2>>
		<DO (I 1 .ITERATIONS)
			<PRINT-WORLD>
			<APPLY-RULES .RULE>
			<COPY-NEXT>
		>
		<CRLF>
		<SET KEY <PRINT-MENU>>
		<COND (<EQUAL? .KEY !\x !\X> <RETURN>)>
    >>

<ROUTINE PRINT-MENU("AUX" KEY)
	<TELL "Select rule to apply: " CR>
	<TELL "0 - Rule 30, ">
	<TELL "1 - Rule 54, ">
	<TELL "2 - Rule 60, ">
	<TELL "3 - Rule 62, ">
	<TELL "4 - Rule 90, ">
	<TELL "5 - Rule 94, " >
	<TELL "6 - Rule 102, ">
	<TELL "7 - Rule 110, ">
	<TELL "8 - Rule 122, " CR>
	<TELL "9 - Rule 126, ">
	<TELL "a - Rule 150, ">
	<TELL "b - Rule 158, ">
	<TELL "c - Rule 182, ">
	<TELL "d - Rule 188, ">
	<TELL "e - Rule 190, ">
	<TELL "f - Rule 220, ">
	<TELL "g - Rule 222, ">
	<TELL "h - Rule 250, " CR>
	<TELL "x - Exit" CR>
	<SET KEY <INPUT 1>>
	<RETURN .KEY>
>

<ROUTINE SELECT-RULE (KEY)
	<COND (<EQUAL? .KEY !\0> <RETURN !30>)>
	<COND (<EQUAL? .KEY !\1> <RETURN !54>)>
	<COND (<EQUAL? .KEY !\2> <RETURN !60>)>
	<COND (<EQUAL? .KEY !\3> <RETURN !62>)>
	<COND (<EQUAL? .KEY !\4> <RETURN !90>)>
	<COND (<EQUAL? .KEY !\5> <RETURN !94>)>
	<COND (<EQUAL? .KEY !\6> <RETURN !102>)>
	<COND (<EQUAL? .KEY !\7> <RETURN !110>)>
	<COND (<EQUAL? .KEY !\8> <RETURN !122>)>
	<COND (<EQUAL? .KEY !\9> <RETURN !126>)>
	<COND (<EQUAL? .KEY !\a !\A> <RETURN !150>)>
	<COND (<EQUAL? .KEY !\b !\B> <RETURN !158>)>
	<COND (<EQUAL? .KEY !\c !\C> <RETURN !182>)>
	<COND (<EQUAL? .KEY !\d !\D> <RETURN !188>)>
	<COND (<EQUAL? .KEY !\e !\E> <RETURN !190>)>
	<COND (<EQUAL? .KEY !\f !\F> <RETURN !220>)>
	<COND (<EQUAL? .KEY !\g !\G> <RETURN !222>)>
	<COND (<EQUAL? .KEY !\h !\H> <RETURN !250>)>
	<RETURN !30>>

<ROUTINE PRINT-WORLD ()
    <TELL " ">
	<HLIGHT 2>
	<DO (I 1 LENGTH)
        <COND (<GETB WORLD .I> <TELL C CELL-CHAR>)(<TELL " ">)>
    >
	<HLIGHT 0>
    <CRLF>>

<ROUTINE SHL (VAL COUNT "AUX" RET)
    <SET RET .VAL>
    <COND (<G? .COUNT 0>
        <DO (I 1 .COUNT)
            <SET RET <* .RET 2>>
        >
    )>
    <RETURN .RET>>

<ROUTINE APPLY-RULES (RULE "AUX" LN RN VAL)

    <DO (I 1 LENGTH)

        <SET VAL !0>
        <SET LN <- .I 1>>
        <SET RN <+ .I 1>>

        <COND (<L? .LN 1> <SET .LN LENGTH>)>
        <COND (<G? .RN LENGTH> <SET .RN 1>)>

        <COND (<G? <GETB WORLD .RN> 0> <SET VAL <+ .VAL 1>>)>
        <COND (<G? <GETB WORLD .I> 0> <SET VAL <+ .VAL 2>>)>
        <COND (<G? <GETB WORLD .LN> 0> <SET VAL <+ .VAL 4>>)>

        <SET VAL <SHL 1 .VAL>>

        <COND (<G? <BAND .VAL .RULE> !0> <PUTB NEXT .I !1>)(<PUTB NEXT .I !0>)>
    >>

<ROUTINE COPY-NEXT ()
    <DO (I 1 LENGTH)
        <PUTB WORLD .I <GETB NEXT .I>>
    >>

<ROUTINE CLEAR-WORLD ()
	<DO (I 1 LENGTH)
		<PUTB WORLD .I !0>
	>>
