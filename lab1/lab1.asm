.586
.model flat, stdcall

extern MessageBoxA@16:near
includelib \masm32\lib\user32.lib

data segment
    head db "Some info",0
    mess db "TheBladeHit",13,
            "Some data",13,
            "Some digit",13,
            "Some data",13,
            "Some data",0
data ends

text segment
start:
    push 0
    push offset head
    push offset mess
    push 0
    call MessageBoxA@16

    ret
text ends
end start
