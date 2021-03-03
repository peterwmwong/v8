kind = BUILTIN
name = StringSubstring
compiler = turbofan

Trampoline (size = 4)

Instructions (size = 1312)
REX.W movq rsi,rcx
REX.W subq rsi,rbx
movl r8,[rax+0x7]
REX.W cmpq rsi,r8
jz ??? (StringSubstring)
REX.W cmpq rcx,rbx
jz ??? (StringSubstring)
xorl rcx,rcx
REX.W movq r9,rcx
movl r11,[rax-0x1]
REX.W addq r11,r13
movzxwl r11,[r11+0x7]
REX.W movq r12,r11
andl r12,0xf
cmpl r12,0x8
jz ??? (StringSubstring)
cmpl r12,0x0
jz ??? (StringSubstring)
REX.W movq r14,r11
andl r14,0x7
cmpl r14,0x5
jnz ??? (StringSubstring)
movl rax,[rax+0xb]
REX.W addq rax,r13
jmp ??? (StringSubstring)
cmpl r14,0x1
jnz ??? (StringSubstring)
movl r11,[rax+0xf]
REX.W addq r11,r13
cmpl [r11+0x7],0x0
jnz ??? (StringSubstring)
movl rax,[rax+0xb]
REX.W addq rax,r13
jmp ??? (StringSubstring)
cmpl r14,0x3
jnz ??? (StringSubstring)
movl r11,[rax+0xf]
REX.W movsxlq r11,r11
REX.W sarq r11, 1
REX.W addq r9,r11
movl rax,[rax+0xb]
REX.W addq rax,r13
jmp ??? (StringSubstring)
REX.W movsxlq r11,[rax+0x7]
REX.W cmpq r11,r8
jc ??? (StringSubstring)
REX.W subq r11,r8
REX.W cmpq r11,r9
jc ??? (StringSubstring)
REX.W leaq r8,[r9+0xc]
REX.W movq r11,rax
jmp ??? (StringSubstring)
int3l
REX.W movsxlq r11,[rax+0x7]
REX.W cmpq r11,r8
jc ??? (StringSubstring)
REX.W subq r11,r8
REX.W cmpq r11,r9
jc ??? (StringSubstring)
REX.W leaq r8,[r9*2+0xc]
REX.W movq r11,rax
jmp ??? (StringSubstring)
int3l
cmpl r12,0xa
jnz ??? (StringSubstring)
testb r11,0x10
jnz ??? (StringSubstring)
REX.W movq r11,[rax+0x13]
movl r12,[rax+0x7]
cmpl r12,r8
jc ??? (StringSubstring)
REX.W subq r12,r8
REX.W cmpq r12,r9
jc ??? (StringSubstring)
REX.W leaq r8,[r9+r11*1+0x1]
REX.W movq r11,rcx
REX.W leaq r8,[r11+r8*1-0x1]
REX.W addq r8,rbx
REX.W movq r11,r8
movl r8,0x1
jmp ??? (StringSubstring)
int3l
cmpl r12,0x2
jnz ??? (StringSubstring)
testb r11,0x10
jnz ??? (StringSubstring)
REX.W movq r11,[rax+0x13]
movl r12,[rax+0x7]
cmpl r12,r8
jc ??? (StringSubstring)
REX.W subq r12,r8
REX.W cmpq r12,r9
jc ??? (StringSubstring)
REX.W leaq r8,[r11+r9*2+0x1]
REX.W movq r11,rcx
REX.W leaq r8,[r11+r8*1-0x1]
REX.W leaq r8,[r8+rbx*2]
REX.W movq r11,r8
xorl r8,r8
movl r14,0x1
REX.W cmpq rsi,0xd
jge ??? (StringSubstring)
REX.W cmpq rsi,0x1
jz ??? (StringSubstring)
movl rbx,0x100
jmp ??? (StringSubstring)
cmpl r8,0x0
jnz ??? (StringSubstring)
movzxwl rbx,[r11]
jmp ??? (StringSubstring)
movzxbl rbx,[r11]
REX.W cmpq rbx,0xff
ja ??? (StringSubstring)
REX.W movq r8,[r13+0x1320] (root (single_character_string_cache))
movl r9,[r8+0x3]
REX.W movsxlq r9,r9
REX.W sarq r9, 1
REX.W cmpq rbx,r9
jc ??? (StringSubstring)
int3l
movl rax,[r8+rbx*4+0x7]
REX.W addq rax,r13
cmpl [r13+0x90] (root (undefined_value)),rax
jnz ??? (StringSubstring)
REX.W movq r8,r14
cmpl r8,0x0
jnz ??? (StringSubstring)
REX.W leaq r9,[rsi+rsi*1]
jmp ??? (StringSubstring)
REX.W movq r9,rsi
REX.W movsxlq r12,r9
movl r14,0xc
REX.W addq r14,r12
jo ??? (StringSubstring)
REX.W addq r14,0x3
REX.W movq r15,[r13+0x1a10] (external reference (Heap::NewSpaceAllocationTopAddress()))
REX.W movq r15,[r15]
REX.W andq r14,0xfc
REX.W leaq rax,[r15+r14*1]
REX.W movq rdx,[r13+0x1a18] (external reference (Heap::NewSpaceAllocationLimitAddress()))
REX.W cmpq [rdx],rax
jna ??? (StringSubstring)
REX.W cmpq r14,0x20000
jnc ??? (StringSubstring)
REX.W movq r14,[r13+0x1a10] (external reference (Heap::NewSpaceAllocationTopAddress()))
REX.W movq [r14],rax
REX.W leaq r14,[r15+0x1]
REX.W movq r15,[r13+0xf0] (root (one_byte_string_map))
movl [r14-0x1],r15
movl [r14+0x3],0x3
movl [r14+0x7],r9
movzxbl r9,[r11+rcx*1]
movb [rcx+r14*1+0xb],r9l
REX.W addq rcx,0x1
REX.W cmpq r12,rcx
jnz ??? (StringSubstring)
cmpl r8,0x0
jnz ??? (StringSubstring)
REX.W movq rcx,[r13+0x2c0] (root (string_map))
movl [r14-0x1],rcx
movl [r14+0x7],rsi
REX.W cmpq rbx,0xff
ja ??? (StringSubstring)
REX.W movq rcx,[r13+0x1320] (root (single_character_string_cache))
movl rsi,[rcx+0x3]
REX.W movsxlq rsi,rsi
REX.W sarq rsi, 1
REX.W cmpq rbx,rsi
jc ??? (StringSubstring)
int3l
REX.W leaq rbx,[rbx*4+0x7]
movl [rcx+rbx*1],r14
REX.W movq rsi,0xfffc0000
REX.W andq rsi,rcx
testb [rsi+0x8],0x4
jnz ??? (StringSubstring)
REX.W movq rax,r14
retl
int3l
retl
cmpl r8,0x0
jnz ??? (StringSubstring)
REX.W movq rcx,[r13+0x2e0] (root (sliced_string_map))
jmp ??? (StringSubstring)
REX.W movq rcx,[r13+0x2e8] (root (sliced_one_byte_string_map))
REX.W movq r8,[r13+0x1a10] (external reference (Heap::NewSpaceAllocationTopAddress()))
REX.W movq r11,[r8]
REX.W leaq r12,[r11+0x14]
REX.W movq r14,[r13+0x1a18] (external reference (Heap::NewSpaceAllocationLimitAddress()))
REX.W cmpq [r14],r12
jna ??? (StringSubstring)
REX.W movq [r8],r12
REX.W leaq r8,[r11+0x1]
REX.W addq rbx,r9
movl [r8-0x1],rcx
movl [r8+0x3],0x3
shll rbx, 1
movl [r8+0x7],rsi
movl [r8+0xb],rax
movl [r8+0xf],rbx
REX.W movq rax,r8
retl
int3l
int3l
REX.W movq rax,[r13+0xb8] (root (empty_string))
retl
push rbp
REX.W movq rbp,rsp
push 0x1c
REX.W subq rsp,0x30
REX.W movq [rbp-0x18],rsi
REX.W movq [rbp-0x28],r9
REX.W movq [rbp-0x30],rbx
REX.W movq [rbp-0x20],r8
call ??? (StringSlowFlatten)
REX.W movq r8,[rbp-0x20]
REX.W movq rsi,[rbp-0x18]
REX.W movq r9,[rbp-0x28]
REX.W movq rbx,[rbp-0x30]
xorl rcx,rcx
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
REX.W movq [rbp-0x28],r9
REX.W movq [rbp-0x30],rbx
REX.W movq [rbp-0x20],r8
REX.W movq rdi,rax
REX.W movq rax,[r13+0x1730] (external reference (external_one_byte_string_get_chars))
REX.W leaq r10,[rip+0x0]
REX.W movq [r13+0x28] (external value (IsolateData::fast_c_call_caller_pc_address)),r10
REX.W movq [r13+0x20] (external value (IsolateData::fast_c_call_caller_fp_address)),rbp
call rax
REX.W movq [r13+0x20] (external value (IsolateData::fast_c_call_caller_fp_address)),0x0
REX.W movq rsp,[rsp]
REX.W movq r11,rax
REX.W movq rax,[rbp-0x10]
REX.W movq rsi,[rbp-0x18]
REX.W movq r9,[rbp-0x28]
REX.W movq rbx,[rbp-0x30]
xorl rcx,rcx
REX.W movq r8,[rbp-0x20]
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
REX.W movq [rbp-0x28],r9
REX.W movq [rbp-0x30],rbx
REX.W movq [rbp-0x20],r8
REX.W movq rdi,rax
REX.W movq rax,[r13+0x1738] (external reference (external_two_byte_string_get_chars))
REX.W leaq r10,[rip+0x0]
REX.W movq [r13+0x28] (external value (IsolateData::fast_c_call_caller_pc_address)),r10
REX.W movq [r13+0x20] (external value (IsolateData::fast_c_call_caller_fp_address)),rbp
call rax
REX.W movq [r13+0x20] (external value (IsolateData::fast_c_call_caller_fp_address)),0x0
REX.W movq rsp,[rsp]
REX.W movq r11,rax
REX.W movq rax,[rbp-0x10]
REX.W movq rsi,[rbp-0x18]
REX.W movq r9,[rbp-0x28]
REX.W movq rbx,[rbp-0x30]
xorl rcx,rcx
REX.W movq r8,[rbp-0x20]
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
REX.W movq [rbp-0x10],rbx
REX.W movq [rbp-0x20],r8
REX.W movq [rbp-0x28],r12
REX.W movq [rbp-0x38],r11
REX.W movq [rbp-0x30],r9
REX.W movq rdx,r14
call ??? (AllocateInYoungGeneration)
REX.W movq r14,rax
REX.W movq rsi,[rbp-0x18]
REX.W movq rbx,[rbp-0x10]
REX.W movq r8,[rbp-0x20]
REX.W movq r12,[rbp-0x28]
REX.W movq r11,[rbp-0x38]
xorl rcx,rcx
REX.W movq r9,[rbp-0x30]
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
REX.W movq [rbp-0x20],rcx
REX.W movq [rbp-0x28],r9
REX.W movq [rbp-0x30],rbx
call ??? (AllocateInYoungGeneration)
REX.W movq r8,rax
REX.W movq rax,[rbp-0x10]
REX.W movq rsi,[rbp-0x18]
REX.W movq rcx,[rbp-0x20]
REX.W movq r9,[rbp-0x28]
REX.W movq rbx,[rbp-0x30]
REX.W movq rsp,rbp
pop rbp
jmp ??? (StringSubstring)
testb r14,0x1
jz ??? (StringSubstring)
movl r14,r14
REX.W addq r14,r13
REX.W movq rsi,0xfffc0000
REX.W andq rsi,r14
testb [rsi+0x8],0x2
jz ??? (StringSubstring)
REX.W leaq r8,[rcx+rbx*1]
push rax
push rcx
push rdx
push rsi
push rdi
REX.W movq rsi,r8
REX.W movq rdi,rcx
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



