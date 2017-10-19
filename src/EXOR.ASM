;by Slek @ 17.10.17
use32
	pushad
	mov esi, [esp+$28] ;pointer to str key
	xor eax, eax
	mov ebx, $EB9F7781 ;32-bit key hash
  @@:
	lodsb
	test al, al
	jz @f
	add ebx, eax
	ror ebx, $D
	jmp @b
  @@:
	mov edi, [esp+$24] ;pointer to &Data()
	mov edi, [edi] ;SAFEARRAY
	mov eax, [edi+$10] ;ecx = SAFEARRAY.rgsabound[0].cElements
	mov edi, [edi+$C] ;esi = SAFEARRAY.pvData
	mov edx, $C59BCF35 ;Nonce
	mov ecx, eax
	shr ecx, 2
	jz _@@
  @@:
	mov esi, ebx
	xor esi, edx
	add edx, ecx
	xchg ecx, ebp
	mov ecx, edx
	rcl edx, cl
	xchg ecx, ebp
	xor [edi], esi
	add edi, 4
	loop @b
  _@@:
	mov ecx, ebx
	xor ecx, edx
	test al, 2
	jz @f
	xor word [edi], cx
	add edi, 2
	shr ecx, $10
  @@:
	test al, 1
	jz @f
	xor byte [edi], cl
  @@:
	popad
	ret $10
