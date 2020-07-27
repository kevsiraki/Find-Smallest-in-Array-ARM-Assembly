.data
.balign 4
format: .asciz "min=%d\n"

.text
.global main
.extern printf
ary: .int 12,39,7,16

min: 	push {ip,lr}
	ldr r5,=ary
	mov r7,#0
	mov r3,#1
	ldr r1, [r5,r7, lsl #2]
for: 	cmp r3,#4
	bge endfor
	ldr r2, [r5,r3, lsl #2]
	cmp r1,r2
	bgt if
	cmp r1,r2
	blt endif
if:	ldr r1,[r5,r3, lsl #2]	
endif:	add r3,#1
	b for
endfor:	pop {ip, pc}

main: 	push {ip,lr}
	bl min
	ldr r0,=format
	bl printf
      	pop {ip, pc}
