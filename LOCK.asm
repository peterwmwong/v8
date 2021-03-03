kind = BUILTIN
name = StringSubstring
compiler = turbofan

Trampoline (size = 4)

Instructions (size = 1128)
                  -- B0 start (no frame) --
REX.W movq rsi,rcx
REX.W subq rsi,rbx
movl r8,[rax+0x7]
REX.W cmpq r8,rsi
jz ??? (StringSubstring)
                  -- B1 start (no frame) --
REX.W cmpq rcx,rbx
jz ??? (StringSubstring)
                  -- B2 start (no frame) --
                  -- B15 start (no frame) (in loop 3) --
                  -- B3 start (no frame) (loop up to 16) --
                  [ DecompressTaggedPointer
movl rcx,[rax-0x1]
REX.W addq rcx,r13
                  ]
movzxwl rcx,[rcx+0x7]
REX.W movq r8,rcx
andl r8,0xf
cmpl r8,0x8
jz ??? (StringSubstring)
                  -- B4 start (no frame) (in loop 3) --
cmpl r8,0x0
jz ??? (StringSubstring)
                  -- B5 start (no frame) (in loop 3) --
REX.W movq r9,rcx
andl r9,0x7
cmpl r9,0x5
jnz ??? (StringSubstring)
                  -- B6 start (no frame) (in loop 3) --
                  [ DecompressTaggedPointer
movl rax,[rax+0xb]
REX.W addq rax,r13
                  ]
jmp ??? (StringSubstring)
                  -- B7 start (no frame) (in loop 3) --
cmpl r9,0x1
jnz ??? (StringSubstring)
                  -- B8 start (no frame) (in loop 3) --
                  [ DecompressTaggedPointer
movl rcx,[rax+0xf]
REX.W addq rcx,r13
                  ]
cmpl [rcx+0x7],0x0
jnz ??? (StringSubstring)
                  -- B10 start (no frame) (in loop 3) --
                  [ DecompressTaggedPointer
movl rax,[rax+0xb]
REX.W addq rax,r13
                  ]
jmp ??? (StringSubstring)
                  -- B11 start (no frame) (in loop 3) --
                  -- B12 start (no frame) (in loop 3) --
cmpl r9,0x3
jnz ??? (StringSubstring)
                  -- B13 start (no frame) (in loop 3) --
                  [ DecompressTaggedSigned
movl rcx,[rax+0xf]
                  ]
REX.W movsxlq rcx,rcx
REX.W sarq rcx, 1
REX.W addq rbx,rcx
                  [ DecompressTaggedPointer
movl rax,[rax+0xb]
REX.W addq rax,r13
                  ]
jmp ??? (StringSubstring)
                  -- B14 start (no frame) (in loop 3) --
                  -- B16 start (no frame) --
REX.W leaq rcx,[rbx+rax*1+0xb]
movl r9,0x1
jmp ??? (StringSubstring)
                  -- B17 start (no frame) --
REX.W leaq rcx,[rax+rbx*2+0xb]
xorl r9,r9
jmp ??? (StringSubstring)
                  -- B18 start (no frame) --
cmpl r8,0xa
jnz ??? (StringSubstring)
                  -- B19 start (no frame) --
testb rcx,0x10
jnz ??? (StringSubstring)
                  -- B20 start (no frame) --
REX.W movq rcx,[rax+0x13]
                  -- B22 start (no frame) --
REX.W addq rcx,rbx
movl r9,0x1
jmp ??? (StringSubstring)
                  -- B23 start (no frame) --
cmpl r8,0x2
jnz ??? (StringSubstring)
                  -- B24 start (no frame) --
testb rcx,0x10
jnz ??? (StringSubstring)
                  -- B25 start (no frame) --
REX.W movq rcx,[rax+0x13]
                  -- B27 start (no frame) --
REX.W leaq rcx,[rcx+rbx*2]
xorl r9,r9
                  -- B28 start (no frame) --
REX.W cmpq rsi,0xd
jge ??? (StringSubstring)
                  -- B29 start (no frame) --
cmpl r9,0x0
jnz ??? (StringSubstring)
                  -- B30 start (no frame) --
REX.W leaq rbx,[rsi+rsi*1]
jmp ??? (StringSubstring)
                  -- B31 start (no frame) --
REX.W movq rbx,rsi
                  -- B32 start (no frame) --
REX.W cmpq rsi,0x1
jz ??? (StringSubstring)
                  -- B33 start (no frame) --
movl r8,0x100
jmp ??? (StringSubstring)
                  -- B34 start (no frame) --
cmpl r9,0x0
jnz ??? (StringSubstring)
                  -- B35 start (no frame) --
movzxwl r8,[rcx]
jmp ??? (StringSubstring)
                  -- B36 start (no frame) --
movzxbl r8,[rcx]
                  -- B37 start (no frame) --
REX.W cmpq r8,0xff
ja ??? (StringSubstring)
                  -- B38 start (no frame) --
                  -- B39 start (no frame) --
REX.W movq rbx,[r13+0x1320] (root (single_character_string_cache))
                  [ DecompressTaggedSigned
movl r9,[rbx+0x3]
                  ]
REX.W movsxlq r9,r9
REX.W sarq r9, 1
REX.W cmpq r8,r9
jc ??? (StringSubstring)
                  -- B40 start (no frame) --
int3l
                  -- B41 start (no frame) --
                  [ DecompressAnyTagged
movl rax,[rbx+r8*4+0x7]
REX.W addq rax,r13
                  ]
cmpl [r13+0x90] (root (undefined_value)),rax
jnz ??? (StringSubstring)
                  -- B42 start (no frame) --
movl rbx,0x1
movl r9,0x1
                  -- B43 start (no frame) --
                  -- B44 start (no frame) --
REX.W movsxlq r11,rbx
movl r12,0xc
REX.W addq r12,r11
jo ??? (StringSubstring)
                  -- B45 start (no frame) --
REX.W addq r12,0x3
REX.W movq r14,[r13+0x1a10] (external reference (Heap::NewSpaceAllocationTopAddress()))
REX.W movq r14,[r14]
REX.W andq r12,0xfc
                  Allocate
REX.W leaq r15,[r14+r12*1]
REX.W movq rax,[r13+0x1a18] (external reference (Heap::NewSpaceAllocationLimitAddress()))
REX.W cmpq [rax],r15
jna ??? (StringSubstring)
                  -- B47 start (no frame) --
REX.W cmpq r12,0x20000
jnc ??? (StringSubstring)
                  -- B50 start (no frame) --
REX.W movq r12,[r13+0x1a10] (external reference (Heap::NewSpaceAllocationTopAddress()))
REX.W movq [r12],r15
REX.W leaq r12,[r14+0x1]
                  -- B51 start (no frame) --
REX.W movq r14,[r13+0xf0] (root (one_byte_string_map))
movl [r12-0x1],r14
movl [r12+0x3],0x3
movl [r12+0x7],rbx
xorl rbx,rbx
                  -- B53 start (no frame) (in loop 52) --
                  -- B52 start (no frame) (loop up to 54) --
movzxbl r14,[rcx+rbx*1]
movb [rbx+r12*1+0xb],r14l
REX.W addq rbx,0x1
REX.W cmpq r11,rbx
jnz ??? (StringSubstring)
                  -- B54 start (no frame) --
cmpl r9,0x0
jnz ??? (StringSubstring)
                  -- B55 start (no frame) --
                  -- B56 start (no frame) --
REX.W movq rbx,[r13+0x2c0] (root (string_map))
movl [r12-0x1],rbx
movl [r12+0x7],rsi
                  -- B57 start (no frame) --
REX.W cmpq r8,0xff
ja ??? (StringSubstring)
                  -- B58 start (no frame) --
                  -- B59 start (no frame) --
REX.W movq rbx,[r13+0x1320] (root (single_character_string_cache))
                  [ DecompressTaggedSigned
movl rcx,[rbx+0x3]
                  ]
REX.W movsxlq rcx,rcx
REX.W sarq rcx, 1
REX.W cmpq r8,rcx
jc ??? (StringSubstring)
                  -- B60 start (no frame) --
int3l
                  -- B61 start (no frame) --
REX.W leaq rcx,[r8*4+0x7]
movl [rbx+rcx*1],r12
REX.W movq rsi,0xfffc0000
REX.W andq rsi,rbx
testb [rsi+0x8],0x4
jnz ??? (StringSubstring)
                  -- B62 start (no frame) --
REX.W movq rax,r12
retl
                  -- B63 start (no frame) --
int3l
                  -- B64 start (no frame) --
retl
                  -- B65 start (no frame) --
cmpl r9,0x0
jnz ??? (StringSubstring)
                  -- B66 start (no frame) --
REX.W movq rcx,[r13+0x2e0] (root (sliced_string_map))
jmp ??? (StringSubstring)
                  -- B67 start (no frame) --
REX.W movq rcx,[r13+0x2e8] (root (sliced_one_byte_string_map))
                  -- B68 start (no frame) --
REX.W movq r8,[r13+0x1a10] (external reference (Heap::NewSpaceAllocationTopAddress()))
REX.W movq r9,[r8]
                  Allocate
REX.W leaq r11,[r9+0x14]
REX.W movq r12,[r13+0x1a18] (external reference (Heap::NewSpaceAllocationLimitAddress()))
REX.W cmpq [r12],r11
jna ??? (StringSubstring)
                  -- B70 start (no frame) --
REX.W movq [r8],r11
REX.W leaq r8,[r9+0x1]
                  -- B71 start (no frame) --
movl [r8-0x1],rcx
movl [r8+0x3],0x3
shll rbx, 1
movl [r8+0x7],rsi
movl [r8+0xb],rax
movl [r8+0xf],rbx
REX.W movq rax,r8
retl
                  -- B72 start (no frame) --
int3l
                  -- B73 start (no frame) --
REX.W movq rax,[r13+0xb8] (root (empty_string))
retl
                  -- B74 start (no frame) --
                  -- B75 start (no frame) --
                  -- B9 start (deferred) (construct frame) (deconstruct frame) (in loop 3) --
push rbp
REX.W movq rbp,rsp
push 0x1c
REX.W subq rsp,0x30
REX.W movq [rbp-0x18],rsi
REX.W movq [rbp-0x20],rbx
call ??? (StringSlowFlatten)
REX.W movq rbx,[rbp-0x20]
REX.W movq rsi,[rbp-0x18]
REX.W movq rsp,rbp
pop rbp
jmp ??? (StringSubstring)
                  -- B21 start (deferred) (construct frame) (deconstruct frame) --
push rbp
REX.W movq rbp,rsp
push 0x1c
REX.W subq rsp,0x30
REX.W movq r10,rsp
REX.W subq rsp,0x8
REX.W andq rsp,0xf0
REX.W movq [rsp],r10
REX.W movq [rbp-0x10],rax
REX.W movq [rbp-0x18],rsi
REX.W movq [rbp-0x20],rbx
REX.W movq rdi,rax
REX.W movq rax,[r13+0x1730] (external reference (external_one_byte_string_get_chars))
REX.W leaq r10,[rip+0x0]
REX.W movq [r13+0x28] (external value (IsolateData::fast_c_call_caller_pc_address)),r10
REX.W movq [r13+0x20] (external value (IsolateData::fast_c_call_caller_fp_address)),rbp
call rax
REX.W movq [r13+0x20] (external value (IsolateData::fast_c_call_caller_fp_address)),0x0
REX.W movq rsp,[rsp]
REX.W movq rcx,rax
REX.W movq rax,[rbp-0x10]
REX.W movq rsi,[rbp-0x18]
REX.W movq rbx,[rbp-0x20]
REX.W movq rsp,rbp
pop rbp
jmp ??? (StringSubstring)
                  -- B26 start (deferred) (construct frame) (deconstruct frame) --
push rbp
REX.W movq rbp,rsp
push 0x1c
REX.W subq rsp,0x30
REX.W movq r10,rsp
REX.W subq rsp,0x8
REX.W andq rsp,0xf0
REX.W movq [rsp],r10
REX.W movq [rbp-0x10],rax
REX.W movq [rbp-0x18],rsi
REX.W movq [rbp-0x20],rbx
REX.W movq rdi,rax
REX.W movq rax,[r13+0x1738] (external reference (external_two_byte_string_get_chars))
REX.W leaq r10,[rip+0x0]
REX.W movq [r13+0x28] (external value (IsolateData::fast_c_call_caller_pc_address)),r10
REX.W movq [r13+0x20] (external value (IsolateData::fast_c_call_caller_fp_address)),rbp
call rax
REX.W movq [r13+0x20] (external value (IsolateData::fast_c_call_caller_fp_address)),0x0
REX.W movq rsp,[rsp]
REX.W movq rcx,rax
REX.W movq rax,[rbp-0x10]
REX.W movq rsi,[rbp-0x18]
REX.W movq rbx,[rbp-0x20]
REX.W movq rsp,rbp
pop rbp
jmp ??? (StringSubstring)
                  -- B46 start (deferred) (construct frame) --
push rbp
REX.W movq rbp,rsp
push 0x1c
REX.W subq rsp,0x30
jmp ??? (StringSubstring)
                  -- B48 start (deferred) (construct frame) --
push rbp
REX.W movq rbp,rsp
push 0x1c
REX.W subq rsp,0x30
                  -- B49 start (deferred) (deconstruct frame) --
REX.W movq [rbp-0x18],rsi
REX.W movq [rbp-0x10],r8
REX.W movq [rbp-0x20],r9
REX.W movq [rbp-0x28],r11
REX.W movq [rbp-0x30],rcx
REX.W movq [rbp-0x38],rbx
REX.W movq rdx,r12
call ??? (AllocateInYoungGeneration)
REX.W movq r12,rax
REX.W movq rsi,[rbp-0x18]
REX.W movq r8,[rbp-0x10]
REX.W movq r9,[rbp-0x20]
REX.W movq r11,[rbp-0x28]
REX.W movq rcx,[rbp-0x30]
REX.W movq rbx,[rbp-0x38]
REX.W movq rsp,rbp
pop rbp
jmp ??? (StringSubstring)
                  -- B69 start (deferred) (construct frame) (deconstruct frame) --
push rbp
REX.W movq rbp,rsp
push 0x1c
REX.W subq rsp,0x30
movl rdx,0x14
REX.W movq [rbp-0x10],rax
REX.W movq [rbp-0x18],rsi
REX.W movq [rbp-0x20],rbx
REX.W movq [rbp-0x28],rcx
call ??? (AllocateInYoungGeneration)
REX.W movq r8,rax
REX.W movq rax,[rbp-0x10]
REX.W movq rsi,[rbp-0x18]
REX.W movq rbx,[rbp-0x20]
REX.W movq rcx,[rbp-0x28]
REX.W movq rsp,rbp
pop rbp
jmp ??? (StringSubstring)
                  -- Out of line code --
testb r12,0x1
jz ??? (StringSubstring)
                  [ DecompressTaggedPointer
movl r12,r12
REX.W addq r12,r13
                  ]
REX.W movq rsi,0xfffc0000
REX.W andq rsi,r12
testb [rsi+0x8],0x2
jz ??? (StringSubstring)
REX.W leaq r8,[rbx+rcx*1]
push rax
push rcx
push rdx
push rsi
push rdi
REX.W movq rsi,r8
REX.W movq rdi,rbx
xorl rdx,rdx
xorl rcx,rcx
movb cl,2
call ??? (RecordWrite)
pop rdi
pop rsi
pop rdx
pop rcx
pop rax
jmp ??? (StringSubstring)
nop
nop


Safepoints (size = 50)

RelocInfo (size = 0)



