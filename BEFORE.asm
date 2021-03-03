kind = BUILTIN
name = StringSubstring
compiler = turbofan

Trampoline (size = 4)

Instructions (size = 2556)
movl rdi,[rax-0x1]
REX.W addq rdi,r13
REX.W movq r8,rcx
REX.W subq r8,rbx
movl r9,[rax+0x7]
movzxwl rdi,[rdi+0x7]
REX.W cmpq r9,r8
jna ??? (StringSubstring)
REX.W cmpq rcx,rbx
jz ??? (StringSubstring)
testb rdi,0x7
setzl r9l
movzxbl r9,r9
REX.W cmpq r8,0x1
jz ??? (StringSubstring)
cmpl r9,0x0
jnz ??? (StringSubstring)
xorl rsi,rsi
REX.W movq r9,rdi
REX.W movq rdi,rax
REX.W movq r11,r9
andl r11,0x7
cmpl r11,0x2
jl ??? (StringSubstring)
cmpl r11,0x2
jz ??? (StringSubstring)
cmpl r11,0x3
jz ??? (StringSubstring)
cmpl r11,0x5
jz ??? (StringSubstring)
jmp ??? (StringSubstring)
cmpl r11,0x0
jz ??? (StringSubstring)
cmpl r11,0x1
jz ??? (StringSubstring)
jmp ??? (StringSubstring)
movl r9,[rdi+0xf]
cmpl [r13+0xb8] (root (empty_string)),r9
jnz ??? (StringSubstring)
movl rdi,[rdi+0xb]
REX.W addq rdi,r13
movl r9,[rdi-0x1]
REX.W addq r9,r13
movzxwl r9,[r9+0x7]
jmp ??? (StringSubstring)
movl r9,[rdi+0xf]
REX.W movsxlq r9,r9
REX.W sarq r9, 1
REX.W addq rsi,r9
movl rdi,[rdi+0xb]
REX.W addq rdi,r13
movl r9,[rdi-0x1]
REX.W addq r9,r13
movzxwl r9,[r9+0x7]
jmp ??? (StringSubstring)
movl rdi,[rdi+0xb]
REX.W addq rdi,r13
movl r9,[rdi-0x1]
REX.W addq r9,r13
movzxwl r9,[r9+0x7]
jmp ??? (StringSubstring)
push rbp
REX.W movq rbp,rsp
push 0x1c
REX.W subq rsp,0x28
jmp ??? (StringSubstring)
xorl r11,r11
REX.W movq r10,r9
REX.W movq r9,rdi
REX.W movq rdi,r10
jmp ??? (StringSubstring)
push rbp
REX.W movq rbp,rsp
push 0x1c
REX.W subq rsp,0x28
jmp ??? (StringSubstring)
movl r11,0x1
REX.W movq r10,r9
REX.W movq r9,rdi
REX.W movq rdi,r10
jmp ??? (StringSubstring)
REX.W movq r9,rax
xorl rsi,rsi
xorl r11,r11
REX.W cmpq r8,0xd
jl ??? (StringSubstring)
REX.W leaq rcx,[rbx+rsi*1]
andl rdi,0x8
shll rcx, 1
cmpl rdi,0x8
jz ??? (StringSubstring)
REX.W movq rdi,[r13+0x1a10] (external reference (Heap::NewSpaceAllocationTopAddress()))
REX.W movq r11,[rdi]
REX.W leaq r12,[r11+0x14]
REX.W movq r14,[r13+0x1a18] (external reference (Heap::NewSpaceAllocationLimitAddress()))
REX.W cmpq [r14],r12
jna ??? (StringSubstring)
REX.W movq [rdi],r12
REX.W leaq rdi,[r11+0x1]
REX.W movq r11,[r13+0x2e0] (root (sliced_string_map))
movl [rdi-0x1],r11
movl [rdi+0x3],0x3
movl [rdi+0x7],r8
movl [rdi+0xb],r9
movl [rdi+0xf],rcx
REX.W movq rax,rdi
retl
REX.W movq rdi,[r13+0x1a10] (external reference (Heap::NewSpaceAllocationTopAddress()))
REX.W movq r11,[rdi]
REX.W leaq r14,[r11+0x14]
REX.W movq r12,[r13+0x1a18] (external reference (Heap::NewSpaceAllocationLimitAddress()))
REX.W cmpq [r12],r14
jna ??? (StringSubstring)
REX.W movq [rdi],r14
REX.W leaq rdi,[r11+0x1]
REX.W movq r11,[r13+0x2e8] (root (sliced_one_byte_string_map))
movl [rdi-0x1],r11
movl [rdi+0x3],0x3
movl [rdi+0x7],r8
movl [rdi+0xb],r9
movl [rdi+0xf],rcx
REX.W movq rax,rdi
retl
cmpl r11,0x0
jnz ??? (StringSubstring)
movl rcx,r8
andl rdi,0x8
cmpl rcx,0x0
setzl cl
movzxbl rcx,rcx
cmpl rdi,0x8
jz ??? (StringSubstring)
cmpl rcx,0x0
jnz ??? (StringSubstring)
movl rcx,r8
REX.W movq rdi,rcx
addl rdi,rcx
jo ??? (StringSubstring)
REX.W movsxlq rcx,rdi
movl rdi,0xc
REX.W addq rcx,rdi
jo ??? (StringSubstring)
REX.W addq rcx,0x3
REX.W movq rdi,[r13+0x1a10] (external reference (Heap::NewSpaceAllocationTopAddress()))
REX.W movq rdi,[rdi]
REX.W andq rcx,0xfc
REX.W leaq r11,[rdi+rcx*1]
REX.W movq r12,[r13+0x1a18] (external reference (Heap::NewSpaceAllocationLimitAddress()))
REX.W cmpq [r12],r11
jna ??? (StringSubstring)
REX.W cmpq rcx,0x20000
jnc ??? (StringSubstring)
REX.W movq rcx,[r13+0x1a10] (external reference (Heap::NewSpaceAllocationTopAddress()))
REX.W movq [rcx],r11
REX.W leaq rcx,[rdi+0x1]
REX.W movq rdi,[r13+0x2c0] (root (string_map))
movl [rcx-0x1],rdi
movl [rcx+0x3],0x3
movl [rcx+0x7],r8
REX.W movq rax,rcx
jmp ??? (StringSubstring)
int3l
int3l
REX.W movq rax,[r13+0xb8] (root (empty_string))
REX.W leaq rcx,[rbx+rsi*1]
REX.W leaq rcx,[rcx*2+0xb]
REX.W leaq rdi,[rcx+r8*2]
REX.W cmpq rcx,rdi
jz ??? (StringSubstring)
movl r8,0xb
jmp ??? (StringSubstring)
REX.W addq r8,0x2
REX.W movq rcx,r11
REX.W leaq r11,[rcx+0x2]
movzxwl rcx,[r9+rcx*1]
movw [rax+r8*1],rcx
REX.W cmpq rdi,r11
jnz ??? (StringSubstring)
retl
cmpl rcx,0x0
jnz ??? (StringSubstring)
REX.W movsxlq rcx,r8
movl rdi,0xc
REX.W addq rcx,rdi
jo ??? (StringSubstring)
REX.W addq rcx,0x3
REX.W movq rdi,[r13+0x1a10] (external reference (Heap::NewSpaceAllocationTopAddress()))
REX.W movq rdi,[rdi]
REX.W andq rcx,0xfc
REX.W leaq r11,[rdi+rcx*1]
REX.W movq r12,[r13+0x1a18] (external reference (Heap::NewSpaceAllocationLimitAddress()))
REX.W cmpq [r12],r11
jna ??? (StringSubstring)
REX.W cmpq rcx,0x20000
jnc ??? (StringSubstring)
REX.W movq rcx,[r13+0x1a10] (external reference (Heap::NewSpaceAllocationTopAddress()))
REX.W movq [rcx],r11
REX.W leaq rcx,[rdi+0x1]
REX.W movq rdi,[r13+0xf0] (root (one_byte_string_map))
movl [rcx-0x1],rdi
movl [rcx+0x3],0x3
movl [rcx+0x7],r8
REX.W movq rax,rcx
jmp ??? (StringSubstring)
int3l
REX.W movq rax,[r13+0xb8] (root (empty_string))
REX.W leaq rcx,[rsi+rbx*1+0xb]
REX.W leaq rdi,[rcx+r8*1]
REX.W cmpq rcx,rdi
jz ??? (StringSubstring)
movl r8,0xb
jmp ??? (StringSubstring)
REX.W addq r8,0x1
REX.W movq rcx,r11
REX.W leaq r11,[rcx+0x1]
movzxbl rcx,[r9+rcx*1]
movb [rax+r8*1],cl
REX.W cmpq rdi,r11
jnz ??? (StringSubstring)
jmp ??? (StringSubstring)
testb rdi,0x10
jnz ??? (StringSubstring)
movl rcx,r8
REX.W movq r9,[r9+0x13]
andl rdi,0x8
cmpl rcx,0x0
setzl cl
movzxbl rcx,rcx
cmpl rdi,0x8
jz ??? (StringSubstring)
cmpl rcx,0x0
jnz ??? (StringSubstring)
movl rcx,r8
REX.W movq rdi,rcx
addl rdi,rcx
jo ??? (StringSubstring)
REX.W movsxlq rcx,rdi
movl rdi,0xc
REX.W addq rcx,rdi
jo ??? (StringSubstring)
REX.W addq rcx,0x3
REX.W movq rdi,[r13+0x1a10] (external reference (Heap::NewSpaceAllocationTopAddress()))
REX.W movq rdi,[rdi]
REX.W andq rcx,0xfc
REX.W leaq r11,[rdi+rcx*1]
REX.W movq r12,[r13+0x1a18] (external reference (Heap::NewSpaceAllocationLimitAddress()))
REX.W cmpq [r12],r11
jna ??? (StringSubstring)
REX.W cmpq rcx,0x20000
jnc ??? (StringSubstring)
REX.W movq rcx,[r13+0x1a10] (external reference (Heap::NewSpaceAllocationTopAddress()))
REX.W movq [rcx],r11
REX.W leaq rcx,[rdi+0x1]
REX.W movq rdi,[r13+0x2c0] (root (string_map))
movl [rcx-0x1],rdi
movl [rcx+0x3],0x3
movl [rcx+0x7],r8
REX.W movq rax,rcx
jmp ??? (StringSubstring)
int3l
int3l
REX.W movq rax,[r13+0xb8] (root (empty_string))
REX.W leaq rcx,[rbx+rsi*1]
REX.W leaq rcx,[rcx*2+0xb]
REX.W leaq rdi,[rcx+r8*2]
REX.W cmpq rcx,rdi
jz ??? (StringSubstring)
movl r8,0xb
jmp ??? (StringSubstring)
REX.W addq r8,0x2
REX.W movq rcx,r11
REX.W leaq r11,[rcx+0x2]
movzxwl rcx,[rcx+r9*1-0xb]
movw [rax+r8*1],rcx
REX.W cmpq rdi,r11
jnz ??? (StringSubstring)
jmp ??? (StringSubstring)
cmpl rcx,0x0
jnz ??? (StringSubstring)
REX.W movsxlq rcx,r8
movl rdi,0xc
REX.W addq rcx,rdi
jo ??? (StringSubstring)
REX.W addq rcx,0x3
REX.W movq rdi,[r13+0x1a10] (external reference (Heap::NewSpaceAllocationTopAddress()))
REX.W movq rdi,[rdi]
REX.W andq rcx,0xfc
REX.W leaq r11,[rdi+rcx*1]
REX.W movq r12,[r13+0x1a18] (external reference (Heap::NewSpaceAllocationLimitAddress()))
REX.W cmpq [r12],r11
jna ??? (StringSubstring)
REX.W cmpq rcx,0x20000
jnc ??? (StringSubstring)
REX.W movq rcx,[r13+0x1a10] (external reference (Heap::NewSpaceAllocationTopAddress()))
REX.W movq [rcx],r11
REX.W leaq rcx,[rdi+0x1]
REX.W movq rdi,[r13+0xf0] (root (one_byte_string_map))
movl [rcx-0x1],rdi
movl [rcx+0x3],0x3
movl [rcx+0x7],r8
REX.W movq rax,rcx
jmp ??? (StringSubstring)
int3l
REX.W movq rax,[r13+0xb8] (root (empty_string))
REX.W leaq rcx,[rsi+rbx*1+0xb]
REX.W leaq rdi,[rcx+r8*1]
REX.W cmpq rcx,rdi
jz ??? (StringSubstring)
movl r8,0xb
jmp ??? (StringSubstring)
REX.W addq r8,0x1
REX.W movq rcx,r11
REX.W leaq r11,[rcx+0x1]
movzxbl rcx,[rcx+r9*1-0xb]
movb [rax+r8*1],cl
REX.W cmpq rdi,r11
jnz ??? (StringSubstring)
jmp ??? (StringSubstring)
push rbp
REX.W movq rbp,rsp
push 0x1c
REX.W subq rsp,0x28
jmp ??? (StringSubstring)
cmpl r9,0x0
jnz ??? (StringSubstring)
xorl rsi,rsi
REX.W movq rcx,rax
REX.W movq r8,rdi
andl r8,0x7
cmpl r8,0x2
jl ??? (StringSubstring)
cmpl r8,0x2
jz ??? (StringSubstring)
cmpl r8,0x3
jz ??? (StringSubstring)
cmpl r8,0x5
jz ??? (StringSubstring)
jmp ??? (StringSubstring)
cmpl r8,0x0
jz ??? (StringSubstring)
cmpl r8,0x1
jz ??? (StringSubstring)
jmp ??? (StringSubstring)
movl rdi,[rcx+0xf]
cmpl [r13+0xb8] (root (empty_string)),rdi
jnz ??? (StringSubstring)
movl rcx,[rcx+0xb]
REX.W addq rcx,r13
movl rdi,[rcx-0x1]
REX.W addq rdi,r13
movzxwl rdi,[rdi+0x7]
jmp ??? (StringSubstring)
movl rdi,[rcx+0xf]
REX.W movsxlq rdi,rdi
REX.W sarq rdi, 1
REX.W addq rsi,rdi
movl rcx,[rcx+0xb]
REX.W addq rcx,r13
movl rdi,[rcx-0x1]
REX.W addq rdi,r13
movzxwl rdi,[rdi+0x7]
jmp ??? (StringSubstring)
movl rcx,[rcx+0xb]
REX.W addq rcx,r13
movl rdi,[rcx-0x1]
REX.W addq rdi,r13
movzxwl rdi,[rdi+0x7]
jmp ??? (StringSubstring)
xorl r11,r11
jmp ??? (StringSubstring)
movl r11,0x1
jmp ??? (StringSubstring)
xorl rsi,rsi
REX.W movq rcx,rax
xorl r11,r11
cmpl r11,0x0
jnz ??? (StringSubstring)
REX.W addq rcx,0xb
andl rdi,0x8
REX.W leaq r8,[rbx+rsi*1]
cmpl rdi,0x8
jz ??? (StringSubstring)
movzxwl rcx,[rcx+r8*2]
jmp ??? (StringSubstring)
movzxbl rcx,[r8+rcx*1]
cmpl rcx,0xff
jg ??? (StringSubstring)
REX.W leaq rdi,[rcx*4+0x7]
REX.W movq r8,[r13+0x1320] (root (single_character_string_cache))
movl rax,[r8+rcx*4+0x7]
REX.W addq rax,r13
cmpl [r13+0x90] (root (undefined_value)),rax
jz ??? (StringSubstring)
jmp ??? (StringSubstring)
REX.W movq rax,[r13+0xb8] (root (empty_string))
retl
REX.W cmpq rbx,0x0
jna ??? (StringSubstring)
push rbp
REX.W movq rbp,rsp
push 0x1c
REX.W subq rsp,0x28
leal rdi,[rbx+rbx*1]
shll rcx, 1
push rax
push rdi
push rcx
REX.W movq rbx,[r13+0x2e30] (external reference (Runtime::StringSubstring))
movl rax,0x3
xorl rsi,rsi
call ??? (CEntry_Return1_DontSaveFPRegs_ArgvOnStack_NoBuiltinExit)
REX.W movq rsp,rbp
pop rbp
retl
push rbp
REX.W movq rbp,rsp
push 0x1c
REX.W subq rsp,0x28
movl rdx,0x14
REX.W movq [rbp-0x20],r8
REX.W movq [rbp-0x30],r9
REX.W movq [rbp-0x10],rcx
call ??? (AllocateRegularInYoungGeneration)
REX.W movq rdi,rax
REX.W movq r8,[rbp-0x20]
REX.W movq r9,[rbp-0x30]
REX.W movq rcx,[rbp-0x10]
REX.W movq rsp,rbp
pop rbp
jmp ??? (StringSubstring)
push rbp
REX.W movq rbp,rsp
push 0x1c
REX.W subq rsp,0x28
REX.W movq [rbp-0x20],r8
REX.W movq [rbp-0x30],r9
REX.W movq [rbp-0x10],rcx
movl rdx,0x14
call ??? (AllocateRegularInYoungGeneration)
REX.W movq rdi,rax
REX.W movq r8,[rbp-0x20]
REX.W movq r9,[rbp-0x30]
REX.W movq rcx,[rbp-0x10]
REX.W movq rsp,rbp
pop rbp
jmp ??? (StringSubstring)
push rbp
REX.W movq rbp,rsp
push 0x1c
REX.W subq rsp,0x28
jmp ??? (StringSubstring)
push rbp
REX.W movq rbp,rsp
push 0x1c
REX.W subq rsp,0x28
REX.W movq [rbp-0x18],rbx
REX.W movq [rbp-0x20],r8
REX.W movq [rbp-0x28],rsi
REX.W movq [rbp-0x30],r9
REX.W movq rdx,rcx
call ??? (AllocateInYoungGeneration)
REX.W movq rcx,rax
REX.W movq rbx,[rbp-0x18]
REX.W movq r8,[rbp-0x20]
REX.W movq rsi,[rbp-0x28]
REX.W movq r9,[rbp-0x30]
REX.W movq rsp,rbp
pop rbp
jmp ??? (StringSubstring)
push rbp
REX.W movq rbp,rsp
push 0x1c
REX.W subq rsp,0x28
jmp ??? (StringSubstring)
push rbp
REX.W movq rbp,rsp
push 0x1c
REX.W subq rsp,0x28
REX.W movq [rbp-0x18],rbx
REX.W movq [rbp-0x20],r8
REX.W movq [rbp-0x28],rsi
REX.W movq [rbp-0x30],r9
REX.W movq rdx,rcx
call ??? (AllocateInYoungGeneration)
REX.W movq rcx,rax
REX.W movq rbx,[rbp-0x18]
REX.W movq r8,[rbp-0x20]
REX.W movq rsi,[rbp-0x28]
REX.W movq r9,[rbp-0x30]
REX.W movq rsp,rbp
pop rbp
jmp ??? (StringSubstring)
push rbp
REX.W movq rbp,rsp
push 0x1c
REX.W subq rsp,0x28
jmp ??? (StringSubstring)
push rbp
REX.W movq rbp,rsp
push 0x1c
REX.W subq rsp,0x28
REX.W movq [rbp-0x18],rbx
REX.W movq [rbp-0x10],r9
REX.W movq [rbp-0x20],r8
REX.W movq [rbp-0x28],rsi
REX.W movq rdx,rcx
call ??? (AllocateInYoungGeneration)
REX.W movq rcx,rax
REX.W movq rbx,[rbp-0x18]
REX.W movq r9,[rbp-0x10]
REX.W movq r8,[rbp-0x20]
REX.W movq rsi,[rbp-0x28]
REX.W movq rsp,rbp
pop rbp
jmp ??? (StringSubstring)
push rbp
REX.W movq rbp,rsp
push 0x1c
REX.W subq rsp,0x28
jmp ??? (StringSubstring)
push rbp
REX.W movq rbp,rsp
push 0x1c
REX.W subq rsp,0x28
REX.W movq [rbp-0x18],rbx
REX.W movq [rbp-0x10],r9
REX.W movq [rbp-0x20],r8
REX.W movq [rbp-0x28],rsi
REX.W movq rdx,rcx
call ??? (AllocateInYoungGeneration)
REX.W movq rcx,rax
REX.W movq rbx,[rbp-0x18]
REX.W movq r9,[rbp-0x10]
REX.W movq r8,[rbp-0x20]
REX.W movq rsi,[rbp-0x28]
REX.W movq rsp,rbp
pop rbp
jmp ??? (StringSubstring)
push rbp
REX.W movq rbp,rsp
push 0x1c
REX.W subq rsp,0x28
REX.W movq [rbp-0x10],rax
REX.W movq [rbp-0x18],rbx
jmp ??? (StringSubstring)
push rbp
REX.W movq rbp,rsp
push 0x1c
REX.W subq rsp,0x28
REX.W movq [rbp-0x10],rax
REX.W movq [rbp-0x18],rbx
jmp ??? (StringSubstring)
push rbp
REX.W movq rbp,rsp
push 0x1c
REX.W subq rsp,0x28
REX.W movq [rbp-0x10],rax
REX.W movq [rbp-0x18],rbx
testb rdi,0x10
jnz ??? (StringSubstring)
REX.W movq rcx,[rcx+0x13]
REX.W movq rsp,rbp
pop rbp
jmp ??? (StringSubstring)
REX.W cmpq rbx,0x3fffffff
ja ??? (StringSubstring)
leal rcx,[rbx+rbx*1]
jmp ??? (StringSubstring)
REX.W movq rcx,[r13+0x1a10] (external reference (Heap::NewSpaceAllocationTopAddress()))
REX.W movq rdi,[rcx]
REX.W leaq r8,[rdi+0xc]
REX.W movq r9,[r13+0x1a18] (external reference (Heap::NewSpaceAllocationLimitAddress()))
REX.W cmpq [r9],r8
ja ??? (StringSubstring)
movl rdx,0xc
call ??? (AllocateRegularInYoungGeneration)
REX.W movq rcx,rax
REX.W movq rax,[rbp-0x10]
REX.W movq rbx,[rbp-0x18]
jmp ??? (StringSubstring)
REX.W movq [rcx],r8
REX.W leaq rcx,[rdi+0x1]
xorpd xmm0,xmm0
REX.W cvtsi2sd xmm0,rbx
REX.W testq rbx,rbx
jns ??? (StringSubstring)
REX.W movq r10,rbx
REX.W shrq r10, 1
jnc ??? (StringSubstring)
REX.W orq r10,0x1
xorpd xmm0,xmm0
REX.W cvtsi2sd xmm0,r10
addsd xmm0,xmm0
REX.W movq rdi,[r13+0x130] (root (heap_number_map))
movl [rcx-0x1],rdi
movsd [rcx+0x3],xmm0
push rax
push rcx
REX.W movq rbx,[r13+0x2de0] (external reference (Runtime::StringCharCodeAt))
movl rax,0x2
xorl rsi,rsi
call ??? (CEntry_Return1_DontSaveFPRegs_ArgvOnStack_NoBuiltinExit)
sarl rax, 1
REX.W movq rcx,rax
REX.W movq rsp,rbp
pop rbp
jmp ??? (StringSubstring)
push rbp
REX.W movq rbp,rsp
push 0x1c
REX.W subq rsp,0x28
REX.W movq rdi,[r13+0x1a10] (external reference (Heap::NewSpaceAllocationTopAddress()))
REX.W movq r8,[rdi]
REX.W leaq r9,[r8+0x10]
REX.W movq [rbp-0x18],rcx
REX.W movq r11,[r13+0x1a18] (external reference (Heap::NewSpaceAllocationLimitAddress()))
REX.W cmpq [r11],r9
ja ??? (StringSubstring)
movl rdx,0x10
call ??? (AllocateRegularInYoungGeneration)
jmp ??? (StringSubstring)
REX.W movq [rdi],r9
REX.W leaq rdi,[r8+0x1]
REX.W movq rax,rdi
REX.W movq rcx,[r13+0x2c0] (root (string_map))
movl [rax-0x1],rcx
movl [rax+0x7],0x1
movl [rax+0x3],0x3
REX.W movq rcx,[rbp-0x18]
movw [rax+0xb],rcx
jmp ??? (StringSubstring)
push rbp
REX.W movq rbp,rsp
push 0x1c
REX.W subq rsp,0x28
REX.W movq r9,[r13+0x1a10] (external reference (Heap::NewSpaceAllocationTopAddress()))
REX.W movq r11,[r9]
REX.W leaq r12,[r11+0x10]
REX.W movq [rbp-0x10],rdi
REX.W movq [rbp-0x18],rcx
REX.W movq r14,[r13+0x1a18] (external reference (Heap::NewSpaceAllocationLimitAddress()))
REX.W cmpq [r14],r12
ja ??? (StringSubstring)
movl rdx,0x10
call ??? (AllocateRegularInYoungGeneration)
jmp ??? (StringSubstring)
REX.W movq [r9],r12
REX.W leaq r9,[r11+0x1]
REX.W movq rax,r9
REX.W movq rcx,[r13+0xf0] (root (one_byte_string_map))
movl [rax-0x1],rcx
movl [rax+0x7],0x1
movl [rax+0x3],0x3
REX.W movq rcx,[rbp-0x18]
movb [rax+0xb],cl
REX.W movq r8,[r13+0x1320] (root (single_character_string_cache))
movl rdi,[r8+0x3]
REX.W movsxlq rdi,rdi
REX.W sarq rdi, 1
REX.W cmpq rcx,rdi
jc ??? (StringSubstring)
int3l
REX.W movq rdi,[rbp-0x10]
movl [r8+rdi*1],rax
REX.W movq rcx,0xfffc0000
REX.W andq rcx,r8
testb [rcx+0x8],0x4
jnz ??? (StringSubstring)
jmp ??? (StringSubstring)
test al,0x1
jz ??? (StringSubstring)
movl rax,rax
REX.W addq rax,r13
REX.W movq rcx,0xfffc0000
REX.W andq rcx,rax
testb [rcx+0x8],0x2
jz ??? (StringSubstring)
REX.W leaq r9,[r8+rdi*1]
push rax
push rcx
push rdx
push rsi
push rdi
REX.W movq rsi,r9
REX.W movq rdi,r8
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


Safepoints (size = 151)

RelocInfo (size = 0)



