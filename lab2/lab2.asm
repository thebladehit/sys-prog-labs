.586
.model flat, stdcall
option casemap:none

include \masm32\include\masm32rt.inc

.data?
    messBuff db 128 dup(?)

    posDBuff db 32 dup(?)
    negDBuff db 32 dup(?)

    posEBuff db 32 dup(?)
    negEBuff db 32 dup(?)

    posFBuff db 32 dup(?)
    negFBuff db 32 dup(?)

.data
    titleMsg db "Lab 2 numeric representation Yarmolka",0

    birthday db "90121111", 0

    posByteA db 13
    negByteA db -13

    posWordA dw 13
    negWordA dw -13
    posWordB dw 1303
    negWordB dw -1303

    posDoubleWordA dd 13
    negDoubleWoedA dd -13
    posDoubleWordB dd 1303
    negDoubleWordB dd -1303
    posDoubleWordC dd 13032005
    negDoubleWordC dd -13032005

    posQuadWordA dq 13
    negQuadWordA dq -13
    posQuadWordB dq 1303
    negQuadWordB dq -1303
    posQuadWordC dq 13032005
    negQuadWordC dq -13032005

    posDoubleWordD dd 0.001
    negDoubleWoedD dd -0.001

    posQuadWordE dq 0.147
    negQuadWordE dq -0.147
    posQuadWordD dq 0.001
    negQuadWordD dq -0.001
    posQuadWordF dq 1468.560
    negQuadWordF dq -1468.560

    posTenBytesF dt 1468.560
    negTenBytesF dt -1468.560

    mess db "ddmmyyyy = %s",13,13,
            "A = %d",32,32,"-A = %d",13,
            "B = %d",32,32,"-B = %d",13,
            "C = %d",32,32,"-C = %d",13,13,
            "D = %s",32,32,"-D = %s",13,
            "E = %s",32,32,"-E = %s",13,
            "F = %s",32,32,"-F = %s",0

.code
Main:
    invoke FloatToStr2, posQuadWordD, addr posDBuff
    invoke FloatToStr2, negQuadWordD, addr negDBuff
    invoke FloatToStr2, posQuadWordE, addr posEBuff
    invoke FloatToStr2, negQuadWordE, addr negEBuff
    invoke FloatToStr2, posQuadWordF, addr posFBuff
    invoke FloatToStr2, negQuadWordF, addr negFBuff

    invoke wsprintf, addr messBuff, addr mess, addr birthday, posDoubleWordA, negDoubleWoedA,
                                               posDoubleWordB, negDoubleWordB,
                                               posDoubleWordC, negDoubleWordC,
                                               addr posDBuff, addr negDBuff,
                                               addr posEBuff, addr negEBuff,
                                               addr posFBuff, addr negFBuff

    invoke MessageBox, 0, addr messBuff, addr titleMsg, 0
    
    invoke ExitProcess, 0
end Main
