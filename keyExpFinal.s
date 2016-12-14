#key expansion

lw r1, 0x1000000c(r0)	# r1 gets P = 0xb7e15163
lw r2, 0x10000010(r0)	# r2 gets Q = 0x9e3779b9
lw r3, 0x10000014(r0)   # r3 gets t = 26

lw r4, 0x10000018(r0)	# r4 gets L(0)= ukey(0)
lw r5, 0x1000001c(r0)  	# r5 gets L(1)= ukey(1)
lw r6, 0x10000020(r0)  	# r6 gets L(2)= ukey(2)
lw r7, 0x10000024(r0)	# r7 gets L(3)= ukey(3)

lw r8, 0x10000028(r0) #base addr for skey r8=1000002c

loop: 
	sw r1, 0(r8) 		# S[0] gets P
	addi r1, r1, r2 		# r1 = P + Q
	addi r8, r8, 0x4		#increment base address 
	addi r3, r3, -1		#decrement counter t
	bne r3, 0, loop 

lw r8, 0x10000028(r0) #base addr for skey r8=1000002c
andi r9, r9, 0	#initialize A to 0
andi r10, r10, 0	#initialize B to 0
add r11, r9, r10	# A + B
lw r1, 0(r8)		# r1 gets s[0]
add r9, r11, r1	# r9 gets s[0] + A + B
or r12, r9, r0	#r12 gets copy of r9
shl r9, r9, 3		#left shift by 3
shr r12, r12, 29	#right shift by 29
or r9, r9, r12	# r9 = Anew gets ROTL(S[i]+(A+B),3) 
add r11, r9, r10	# r11 gets Anew + B










	
	