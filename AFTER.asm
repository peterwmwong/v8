kind = BUILTIN
name = StringSubstring
compiler = turbofan

Trampoline (size = 4)

Instructions (size = 1128)
REX.W movq rsi,rcx
REX.W subq rsi,rbx
movl r8,[rax+0x7]
REX.W cmpq r8,rsi
jz ??? (StringSubstring)
REX.W cmpq rcx,rbx
jz ??? (StringSubstring)
movl rcx,[rax-0x1]
REX.W addq rcx,r13
movzxwl rcx,[rcx+0x7]
REX.W movq r8,rcx
andl r8,0xf
cmpl r8,0x8
jz ??? (StringSubstring)
cmpl r8,0x0
jz ??? (StringSubstring)
REX.W movq r9,rcx
andl r9,0x7
cmpl r9,0x5
jnz ??? (StringSubstring)
movl rax,[rax+0xb]
REX.W addq rax,r13
jmp ??? (StringSubstring)
cmpl r9,0x1
jnz ??? (StringSubstring)
movl rcx,[rax+0xf]
REX.W addq rcx,r13
cmpl [rcx+0x7],0x0
jnz ??? (StringSubstring)
movl rax,[rax+0xb]
REX.W addq rax,r13
jmp ??? (StringSubstring)
cmpl r9,0x3
jnz ??? (StringSubstring)
movl rcx,[rax+0xf]
REX.W movsxlq rcx,rcx
REX.W sarq rcx, 1
REX.W addq rbx,rcx
movl rax,[rax+0xb]
REX.W addq rax,r13
jmp ??? (StringSubstring)
REX.W leaq rcx,[rbx+rax*1+0xb]
movl r9,0x1
jmp ??? (StringSubstring)
REX.W leaq rcx,[rax+rbx*2+0xb]
xorl r9,r9
jmp ??? (StringSubstring)
cmpl r8,0xa
jnz ??? (StringSubstring)
testb rcx,0x10
jnz ??? (StringSubstring)
REX.W movq rcx,[rax+0x13]
REX.W addq rcx,rbx
movl r9,0x1
jmp ??? (StringSubstring)
cmpl r8,0x2
jnz ??? (StringSubstring)
testb rcx,0x10
jnz ??? (StringSubstring)
REX.W movq rcx,[rax+0x13]
REX.W leaq rcx,[rcx+rbx*2]
xorl r9,r9
REX.W cmpq rsi,0xd
jge ??? (StringSubstring)
cmpl r9,0x0
jnz ??? (StringSubstring)
REX.W leaq rbx,[rsi+rsi*1]
jmp ??? (StringSubstring)
REX.W movq rbx,rsi
REX.W cmpq rsi,0x1
jz ??? (StringSubstring)
movl r8,0x100
jmp ??? (StringSubstring)
cmpl r9,0x0
jnz ??? (StringSubstring)
movzxwl r8,[rcx]
jmp ??? (StringSubstring)
movzxbl r8,[rcx]
REX.W cmpq r8,0xff
ja ??? (StringSubstring)
REX.W movq rbx,[r13+0x1320] (root (single_character_string_cache))
movl r9,[rbx+0x3]
REX.W movsxlq r9,r9
REX.W sarq r9, 1
REX.W cmpq r8,r9
jc ??? (StringSubstring)
int3l
movl rax,[rbx+r8*4+0x7]
REX.W addq rax,r13
cmpl [r13+0x90] (root (undefined_value)),rax
jnz ??? (StringSubstring)
movl rbx,0x1
movl r9,0x1
REX.W movsxlq r11,rbx
movl r12,0xc
REX.W addq r12,r11
jo ??? (StringSubstring)
REX.W addq r12,0x3
REX.W movq r14,[r13+0x1a10] (external reference (Heap::NewSpaceAllocationTopAddress()))
REX.W movq r14,[r14]
REX.W andq r12,0xfc
REX.W leaq r15,[r14+r12*1]
REX.W movq rax,[r13+0x1a18] (external reference (Heap::NewSpaceAllocationLimitAddress()))
REX.W cmpq [rax],r15
jna ??? (StringSubstring)
REX.W cmpq r12,0x20000
jnc ??? (StringSubstring)
REX.W movq r12,[r13+0x1a10] (external reference (Heap::NewSpaceAllocationTopAddress()))
REX.W movq [r12],r15
REX.W leaq r12,[r14+0x1]
REX.W movq r14,[r13+0xf0] (root (one_byte_string_map))
movl [r12-0x1],r14
movl [r12+0x3],0x3
movl [r12+0x7],rbx
xorl rbx,rbx
movzxbl r14,[rcx+rbx*1]
movb [rbx+r12*1+0xb],r14l
REX.W addq rbx,0x1
REX.W cmpq r11,rbx
jnz ??? (StringSubstring)
cmpl r9,0x0
jnz ??? (StringSubstring)
REX.W movq rbx,[r13+0x2c0] (root (string_map))
movl [r12-0x1],rbx
movl [r12+0x7],rsi
REX.W cmpq r8,0xff
ja ??? (StringSubstring)
REX.W movq rbx,[r13+0x1320] (root (single_character_string_cache))
movl rcx,[rbx+0x3]
REX.W movsxlq rcx,rcx
REX.W sarq rcx, 1
REX.W cmpq r8,rcx
jc ??? (StringSubstring)
int3l
REX.W leaq rcx,[r8*4+0x7]
movl [rbx+rcx*1],r12
REX.W movq rsi,0xfffc0000
REX.W andq rsi,rbx
testb [rsi+0x8],0x4
jnz ??? (StringSubstring)
REX.W movq rax,r12
retl
int3l
retl
cmpl r9,0x0
jnz ??? (StringSubstring)
REX.W movq rcx,[r13+0x2e0] (root (sliced_string_map))
jmp ??? (StringSubstring)
REX.W movq rcx,[r13+0x2e8] (root (sliced_one_byte_string_map))
REX.W movq r8,[r13+0x1a10] (external reference (Heap::NewSpaceAllocationTopAddress()))
REX.W movq r9,[r8]
REX.W leaq r11,[r9+0x14]
REX.W movq r12,[r13+0x1a18] (external reference (Heap::NewSpaceAllocationLimitAddress()))
REX.W cmpq [r12],r11
jna ??? (StringSubstring)
REX.W movq [r8],r11
REX.W leaq r8,[r9+0x1]
movl [r8-0x1],rcx
movl [r8+0x3],0x3
shll rbx, 1
movl [r8+0x7],rsi
movl [r8+0xb],rax
movl [r8+0xf],rbx
REX.W movq rax,r8
retl
int3l
REX.W movq rax,[r13+0xb8] (root (empty_string))
retl
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
push rbp
REX.W movq rbp,rsp
push 0x1c
REX.W subq rsp,0x30
jmp ??? (StringSubstring)
push rbp
REX.W movq rbp,rsp
push 0x1c
REX.W subq rsp,0x30
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
testb r12,0x1
jz ??? (StringSubstring)
movl r12,r12
REX.W addq r12,r13
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



