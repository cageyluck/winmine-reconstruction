; ===== sub_1001516 =====
1001516: xor eax, eax
1001518: cmp word ptr [0x10056a0], ax
100151F: sete al
1001522: push eax
1001523: push 0x209
1001528: call 0x1003cc4
100152D: xor eax, eax
100152F: cmp word ptr [0x10056a0], 1
1001537: sete al
100153A: push eax
100153B: push 0x20a
1001540: call 0x1003cc4
1001545: xor eax, eax
1001547: cmp word ptr [0x10056a0], 2
100154F: sete al
1001552: push eax
1001553: push 0x20b
1001558: call 0x1003cc4
100155D: xor eax, eax
100155F: cmp word ptr [0x10056a0], 3
1001567: sete al
100156A: push eax
100156B: push 0x20c
1001570: call 0x1003cc4
1001575: push dword ptr [0x10056c8]
100157B: push 0x211
1001580: call 0x1003cc4
1001585: push dword ptr [0x10056bc]
100158B: push 0x20f
1001590: call 0x1003cc4
1001595: push dword ptr [0x10056b8]
100159B: push 0x20e
10015A0: call 0x1003cc4
10015A5: ret 

; ===== sub_10016BA =====
10016BA: push ebp
10016BB: mov ebp, esp
10016BD: sub esp, 0x40
10016C0: push esi
10016C1: push edi
10016C2: push dword ptr [ebp + 0x10]
10016C5: lea eax, [ebp - 0x40]
10016C8: push 0x1005ae0
10016CD: push eax
10016CE: call dword ptr [USER32!wsprintfW]
10016D4: mov edi, dword ptr [ebp + 0xc]
10016D7: mov esi, dword ptr [USER32!SetDlgItemTextW]
10016DD: add esp, 0xc
10016E0: lea eax, [ebp - 0x40]
10016E3: push eax
10016E4: push edi
10016E5: push dword ptr [ebp + 8]
10016E8: call esi
10016EA: push dword ptr [ebp + 0x14]
10016ED: inc edi
10016EE: push edi
10016EF: push dword ptr [ebp + 8]
10016F2: call esi
10016F4: pop edi
10016F5: pop esi
10016F6: leave 
10016F7: ret 0x10

; ===== sub_10016FA =====
10016FA: push ebp
10016FB: mov ebp, esp
10016FD: mov eax, dword ptr [ebp + 0xc]
1001700: sub eax, 0x53
1001703: push ebx
1001704: je 0x1001800
100170A: sub eax, 0x28
100170D: je 0x10017ef
1001713: sub eax, 0x95
1001718: mov ebx, 0x1005758
100171D: je 0x1001799
100171F: dec eax
1001720: jne 0x1001818
1001726: movzx eax, word ptr [ebp + 0x10]
100172A: test eax, eax
100172C: jle 0x1001818
1001732: cmp eax, 2
1001735: jle 0x10017df
100173B: cmp eax, 0x64
100173E: je 0x10017df
1001744: cmp eax, 0x6d
1001747: je 0x10017df
100174D: cmp eax, 0x2c3
1001752: jne 0x1001818
1001758: push esi
1001759: mov esi, dword ptr [KERNEL32!lstrcpyW]
100175F: push edi
1001760: mov eax, 0x3e7
1001765: mov edi, 0x1005b40
100176A: push edi
100176B: push 0x10056d8
1001770: mov dword ptr [0x10056d4], eax
1001775: mov dword ptr [0x10056d0], eax
100177A: mov dword ptr [0x10056cc], eax
100177F: call esi
1001781: push edi
1001782: push 0x1005718
1001787: call esi
1001789: push edi
100178A: push ebx
100178B: call esi
100178D: pop edi
100178E: mov dword ptr [0x100515c], 1
1001798: pop esi
1001799: push 0x10056d8
100179E: push dword ptr [0x10056cc]
10017A4: push 0x2bd
10017A9: push dword ptr [ebp + 8]
10017AC: call 0x10016ba
10017B1: push 0x1005718
10017B6: push dword ptr [0x10056d0]
10017BC: push 0x2bf
10017C1: push dword ptr [ebp + 8]
10017C4: call 0x10016ba
10017C9: push ebx
10017CA: push dword ptr [0x10056d4]
10017D0: push 0x2c1
10017D5: push dword ptr [ebp + 8]
10017D8: call 0x10016ba
10017DD: jmp 0x10017ea
10017DF: push 1
10017E1: push dword ptr [ebp + 8]
10017E4: call dword ptr [USER32!EndDialog]
10017EA: xor eax, eax
10017EC: inc eax
10017ED: jmp 0x100181a
10017EF: push 0x1005078
10017F4: push 0xa
10017F6: push 0x10011ec
10017FB: push dword ptr [ebp + 0x10]
10017FE: jmp 0x1001812
1001800: mov eax, dword ptr [ebp + 0x14]
1001803: push 0x1005078
1001808: push 0xc
100180A: push 0x10011ec
100180F: push dword ptr [eax + 0xc]
1001812: call dword ptr [USER32!WinHelpW]
1001818: xor eax, eax
100181A: pop ebx
100181B: pop ebp
100181C: ret 0x10

; ===== sub_100181F =====
100181F: push ebp
1001820: mov ebp, esp
1001822: sub esp, 0x100
1001828: mov eax, dword ptr [ebp + 0xc]
100182B: sub eax, 0x110
1001830: je 0x1001892
1001832: dec eax
1001833: jne 0x100188e
1001835: movzx eax, word ptr [ebp + 0x10]
1001839: test eax, eax
100183B: jle 0x100188e
100183D: cmp eax, 2
1001840: jle 0x100184c
1001842: cmp eax, 0x64
1001845: je 0x100184c
1001847: cmp eax, 0x6d
100184A: jne 0x100188e
100184C: mov eax, dword ptr [0x10056a0]
1001851: test ax, ax
1001854: jne 0x100185d
1001856: mov eax, 0x10056d8
100185B: jmp 0x100186d
100185D: cmp ax, 1
1001861: mov eax, 0x1005718
1001866: je 0x100186d
1001868: mov eax, 0x1005758
100186D: push 0x20
100186F: push eax
1001870: push 0x25a
1001875: push dword ptr [ebp + 8]
1001878: call dword ptr [USER32!GetDlgItemTextW]
100187E: push 1
1001880: push dword ptr [ebp + 8]
1001883: call dword ptr [USER32!EndDialog]
1001889: jmp 0x100190e
100188E: xor eax, eax
1001890: jmp 0x1001911
1001892: push esi
1001893: push edi
1001894: push 0x80
1001899: lea eax, [ebp - 0x100]
100189F: push eax
10018A0: mov eax, dword ptr [0x10056a0]
10018A5: add eax, 9
10018A8: push eax
10018A9: call 0x10039e7
10018AE: mov esi, dword ptr [USER32!SetDlgItemTextW]
10018B4: lea eax, [ebp - 0x100]
10018BA: push eax
10018BB: push 0x259
10018C0: push dword ptr [ebp + 8]
10018C3: call esi
10018C5: push 0
10018C7: push 0x20
10018C9: push 0xc5
10018CE: mov edi, 0x25a
10018D3: push edi
10018D4: push dword ptr [ebp + 8]
10018D7: call dword ptr [USER32!GetDlgItem]
10018DD: push eax
10018DE: call dword ptr [USER32!SendMessageW]
10018E4: mov eax, dword ptr [0x10056a0]
10018E9: test ax, ax
10018EC: jne 0x10018f5
10018EE: mov eax, 0x10056d8
10018F3: jmp 0x1001905
10018F5: cmp ax, 1
10018F9: mov eax, 0x1005718
10018FE: je 0x1001905
1001900: mov eax, 0x1005758
1001905: push eax
1001906: push edi
1001907: push dword ptr [ebp + 8]
100190A: call esi
100190C: pop edi
100190D: pop esi
100190E: xor eax, eax
1001910: inc eax
1001911: leave 
1001912: ret 0x10

; ===== sub_1001915 =====
1001915: mov eax, dword ptr [esp + 4]
1001919: sub eax, 0
100191C: push esi
100191D: je 0x100193b
100191F: dec eax
1001920: je 0x1001929
1001922: pop esi
1001923: jmp dword ptr [USER32!GetSystemMetrics]
1001929: mov esi, dword ptr [USER32!GetSystemMetrics]
100192F: push 0x4f
1001931: call esi
1001933: test eax, eax
1001935: jne 0x100194c
1001937: push 1
1001939: jmp 0x100194a
100193B: mov esi, dword ptr [USER32!GetSystemMetrics]
1001941: push 0x4e
1001943: call esi
1001945: test eax, eax
1001947: jne 0x100194c
1001949: push eax
100194A: call esi
100194C: pop esi
100194D: ret 4

; ===== sub_1001950 =====
1001950: sub esp, 0x34
1001953: mov ecx, dword ptr [0x1005b24]
1001959: push ebp
100195A: xor ebp, ebp
100195C: cmp ecx, ebp
100195E: mov dword ptr [esp + 4], ebp
1001962: je 0x1001b42
1001968: mov eax, dword ptr [0x1005b80]
100196D: push ebx
100196E: xor ebx, ebx
1001970: inc ebx
1001971: test byte ptr [0x10056c4], bl
1001977: push edi
1001978: mov edi, dword ptr [USER32!GetMenuItemRect]
100197E: mov dword ptr [0x1005b88], eax
1001983: jne 0x10019db
1001985: mov edx, dword ptr [0x1005b34]
100198B: add edx, eax
100198D: mov eax, dword ptr [0x1005a94]
1001992: cmp eax, ebp
1001994: mov dword ptr [0x1005b88], edx
100199A: je 0x10019db
100199C: lea edx, [esp + 0x10]
10019A0: push edx
10019A1: push ebp
10019A2: push eax
10019A3: push ecx
10019A4: call edi
10019A6: test eax, eax
10019A8: je 0x10019db
10019AA: lea eax, [esp + 0x20]
10019AE: push eax
10019AF: push ebx
10019B0: push dword ptr [0x1005a94]
10019B6: push dword ptr [0x1005b24]
10019BC: call edi
10019BE: test eax, eax
10019C0: je 0x10019db
10019C2: mov eax, dword ptr [esp + 0x14]
10019C6: cmp eax, dword ptr [esp + 0x24]
10019CA: je 0x10019db
10019CC: mov eax, dword ptr [0x1005b34]
10019D1: add dword ptr [0x1005b88], eax
10019D7: mov dword ptr [esp + 0xc], ebx
10019DB: mov eax, dword ptr [0x1005334]
10019E0: shl eax, 4
10019E3: add eax, 0x18
10019E6: mov dword ptr [0x1005b2c], eax
10019EB: mov eax, dword ptr [0x1005338]
10019F0: shl eax, 4
10019F3: add eax, 0x43
10019F6: push ebp
10019F7: mov dword ptr [0x1005b20], eax
10019FC: call 0x1001915
1001A01: mov ecx, dword ptr [0x1005b2c]
1001A07: mov edx, dword ptr [0x10056b0]
1001A0D: add ecx, edx
1001A0F: sub ecx, eax
1001A11: cmp ecx, ebp
1001A13: jle 0x1001a20
1001A15: or dword ptr [esp + 0x44], 2
1001A1A: sub dword ptr [0x10056b0], ecx
1001A20: push ebx
1001A21: call 0x1001915
1001A26: mov edx, dword ptr [0x10056b4]
1001A2C: mov ecx, dword ptr [0x1005b20]
1001A32: add ecx, edx
1001A34: sub ecx, eax
1001A36: cmp ecx, ebp
1001A38: jle 0x1001a47
1001A3A: or dword ptr [esp + 0x44], 2
1001A3F: sub edx, ecx
1001A41: mov dword ptr [0x10056b4], edx
1001A47: cmp dword ptr [0x1005b38], ebp
1001A4D: jne 0x1001b40
1001A53: test byte ptr [esp + 0x44], 2
1001A58: push esi
1001A59: mov esi, dword ptr [USER32!MoveWindow]
1001A5F: je 0x1001a8d
1001A61: mov eax, dword ptr [0x1005b88]
1001A66: mov ecx, dword ptr [0x1005b20]
1001A6C: push ebx
1001A6D: add ecx, eax
1001A6F: mov eax, dword ptr [0x1005b2c]
1001A74: push ecx
1001A75: mov ecx, dword ptr [0x1005a90]
1001A7B: add ecx, eax
1001A7D: push ecx
1001A7E: push edx
1001A7F: push dword ptr [0x10056b0]
1001A85: push dword ptr [0x1005b24]
1001A8B: call esi
1001A8D: cmp dword ptr [esp + 0x10], ebp
1001A91: je 0x1001b0d
1001A93: mov eax, dword ptr [0x1005a94]
1001A98: cmp eax, ebp
1001A9A: je 0x1001b0d
1001A9C: lea ecx, [esp + 0x14]
1001AA0: push ecx
1001AA1: push ebp
1001AA2: push eax
1001AA3: push dword ptr [0x1005b24]
1001AA9: call edi
1001AAB: test eax, eax
1001AAD: je 0x1001b0d
1001AAF: lea eax, [esp + 0x24]
1001AB3: push eax
1001AB4: push ebx
1001AB5: push dword ptr [0x1005a94]
1001ABB: push dword ptr [0x1005b24]
1001AC1: call edi
1001AC3: test eax, eax
1001AC5: je 0x1001b0d
1001AC7: mov eax, dword ptr [esp + 0x18]
1001ACB: cmp eax, dword ptr [esp + 0x28]
1001ACF: jne 0x1001b0d
1001AD1: mov eax, dword ptr [0x1005b88]
1001AD6: sub eax, dword ptr [0x1005b34]
1001ADC: mov ecx, dword ptr [0x1005b20]
1001AE2: push ebx
1001AE3: add ecx, eax
1001AE5: push ecx
1001AE6: mov ecx, dword ptr [0x1005a90]
1001AEC: mov dword ptr [0x1005b88], eax
1001AF1: mov eax, dword ptr [0x1005b2c]
1001AF6: add ecx, eax
1001AF8: push ecx
1001AF9: push dword ptr [0x10056b4]
1001AFF: push dword ptr [0x10056b0]
1001B05: push dword ptr [0x1005b24]
1001B0B: call esi
1001B0D: test byte ptr [esp + 0x48], 4
1001B12: pop esi
1001B13: je 0x1001b40
1001B15: push dword ptr [0x1005b20]
1001B1B: lea eax, [esp + 0x34]
1001B1F: push dword ptr [0x1005b2c]
1001B25: push ebp
1001B26: push ebp
1001B27: push eax
1001B28: call dword ptr [USER32!SetRect]
1001B2E: push ebx
1001B2F: lea eax, [esp + 0x34]
1001B33: push eax
1001B34: push dword ptr [0x1005b24]
1001B3A: call dword ptr [USER32!InvalidateRect]
1001B40: pop edi
1001B41: pop ebx
1001B42: pop ebp
1001B43: add esp, 0x34
1001B46: ret 4

; ===== sub_1001B49 =====
1001B49: push 0
1001B4B: push 0x10015a6
1001B50: push dword ptr [0x1005b24]
1001B56: push 0x50
1001B58: push dword ptr [0x1005b30]
1001B5E: call dword ptr [USER32!DialogBoxParamW]
1001B64: mov word ptr [0x10056a0], 3
1001B6D: call 0x1001516
1001B72: mov dword ptr [0x100515c], 1
1001B7C: jmp 0x100367a

; ===== sub_1001B81 =====
1001B81: push 0
1001B83: push 0x100181f
1001B88: push dword ptr [0x1005b24]
1001B8E: push 0x258
1001B93: push dword ptr [0x1005b30]
1001B99: call dword ptr [USER32!DialogBoxParamW]
1001B9F: mov dword ptr [0x100515c], 1
1001BA9: ret 

; ===== sub_1001BAA =====
1001BAA: push 0
1001BAC: push 0x10016fa
1001BB1: push dword ptr [0x1005b24]
1001BB7: push 0x2bc
1001BBC: push dword ptr [0x1005b30]
1001BC2: call dword ptr [USER32!DialogBoxParamW]
1001BC8: ret 

; ===== sub_1001BC9 =====
1001BC9: push ebp
1001BCA: mov ebp, esp
1001BCC: sub esp, 0x40
1001BCF: mov edx, dword ptr [ebp + 0xc]
1001BD2: mov ecx, dword ptr [ebp + 0x14]
1001BD5: push ebx
1001BD6: push esi
1001BD7: xor ebx, ebx
1001BD9: push edi
1001BDA: mov esi, 0x200
1001BDF: inc ebx
1001BE0: xor edi, edi
1001BE2: cmp edx, esi
1001BE4: ja 0x1001f5f
1001BEA: je 0x1002085
1001BF0: mov eax, 0x100
1001BF5: cmp edx, eax
1001BF7: ja 0x1001d59
1001BFD: je 0x1001c9a
1001C03: mov eax, edx
1001C05: dec eax
1001C06: dec eax
1001C07: je 0x1001c7f
1001C09: sub eax, 4
1001C0C: je 0x1001c65
1001C0E: sub eax, 9
1001C11: je 0x1001c3e
1001C13: sub eax, 0x38
1001C16: jne 0x10021a9
1001C1C: test byte ptr [0x1005000], 8
1001C23: jne 0x10021a9
1001C29: mov eax, dword ptr [ecx + 8]
1001C2C: mov dword ptr [0x10056b0], eax
1001C31: mov eax, dword ptr [ecx + 0xc]
1001C34: mov dword ptr [0x10056b4], eax
1001C39: jmp 0x10021a9
1001C3E: lea eax, [ebp - 0x40]
1001C41: push eax
1001C42: push dword ptr [ebp + 8]
1001C45: call dword ptr [USER32!BeginPaint]
1001C4B: push eax
1001C4C: call 0x1002ac3
1001C51: lea eax, [ebp - 0x40]
1001C54: push eax
1001C55: push dword ptr [ebp + 8]
1001C58: call dword ptr [USER32!EndPaint]
1001C5E: xor eax, eax
1001C60: jmp 0x10021bb
1001C65: cmp word ptr [ebp + 0x10], 2
1001C6A: jne 0x10021a9
1001C70: mov dword ptr [0x1005148], 1
1001C7A: jmp 0x10021a9
1001C7F: push 1
1001C81: push dword ptr [0x1005b24]
1001C87: call dword ptr [USER32!KillTimer]
1001C8D: push 0
1001C8F: call dword ptr [USER32!PostQuitMessage]
1001C95: jmp 0x10021a9
1001C9A: mov eax, dword ptr [ebp + 0x10]
1001C9D: sub eax, 0x10
1001CA0: je 0x1001d40
1001CA6: sub eax, 0x63
1001CA9: je 0x1001d0a
1001CAB: dec eax
1001CAC: je 0x1001cf1
1001CAE: dec eax
1001CAF: je 0x1001ce0
1001CB1: mov eax, dword ptr [0x1005154]
1001CB6: cmp eax, 5
1001CB9: jge 0x10021a9
1001CBF: mov cx, word ptr [eax*2 + 0x1005034]
1001CC7: sub cx, word ptr [ebp + 0x10]
1001CCB: inc eax
1001CCC: neg cx
1001CCF: sbb ecx, ecx
1001CD1: not ecx
1001CD3: and ecx, eax
1001CD5: mov dword ptr [0x1005154], ecx
1001CDB: jmp 0x10021a9
1001CE0: cmp dword ptr [0x10056c4], 0
1001CE7: je 0x10021a9
1001CED: push 2
1001CEF: jmp 0x1001d00
1001CF1: cmp dword ptr [0x10056c4], 0
1001CF8: je 0x10021a9
1001CFE: push 1
1001D00: call 0x1003ce5
1001D05: jmp 0x10021a9
1001D0A: mov eax, dword ptr [0x10056b8]
1001D0F: cmp eax, 1
1001D12: jle 0x10021a9
1001D18: cmp eax, 3
1001D1B: jne 0x1001d31
1001D1D: call 0x10038d7
1001D22: mov dword ptr [0x10056b8], 2
1001D2C: jmp 0x10021a9
1001D31: call 0x10038c2
1001D36: mov dword ptr [0x10056b8], eax
1001D3B: jmp 0x10021a9
1001D40: cmp dword ptr [0x1005154], 5
1001D47: jl 0x10021a9
1001D4D: xor dword ptr [0x1005154], 0x14
1001D54: jmp 0x10021a9
1001D59: mov eax, edx
1001D5B: sub eax, 0x111
1001D60: je 0x1001dbc
1001D62: dec eax
1001D63: je 0x1001d76
1001D65: dec eax
1001D66: jne 0x10021a9
1001D6C: call 0x1002fe0
1001D71: jmp 0x1001c5e
1001D76: mov eax, dword ptr [ebp + 0x10]
1001D79: and eax, 0xfff0
1001D7E: cmp eax, 0xf020
1001D83: je 0x1001dab
1001D85: cmp eax, 0xf120
1001D8A: jne 0x10021a9
1001D90: and dword ptr [0x1005000], 0xf5
1001D9A: call 0x100344c
1001D9F: and dword ptr [0x1005148], 0
1001DA6: jmp 0x10021a9
1001DAB: call 0x100341c
1001DB0: or dword ptr [0x1005000], 0xa
1001DB7: jmp 0x10021a9
1001DBC: movzx eax, word ptr [ebp + 0x10]
1001DC0: mov ecx, 0x210
1001DC5: cmp eax, ecx
1001DC7: jg 0x1001edc
1001DCD: je 0x1001ed2
1001DD3: cmp eax, 0x1fe
1001DD8: je 0x1001ec8
1001DDE: cmp eax, esi
1001DE0: je 0x1001e9d
1001DE6: cmp eax, 0x208
1001DEB: jle 0x10021a9
1001DF1: cmp eax, 0x20b
1001DF6: jle 0x1001e59
1001DF8: cmp eax, 0x20c
1001DFD: je 0x1001e4f
1001DFF: cmp eax, 0x20e
1001E04: je 0x1001e26
1001E06: cmp eax, 0x20f
1001E0B: jne 0x10021a9
1001E11: xor eax, eax
1001E13: cmp dword ptr [0x10056bc], eax
1001E19: sete al
1001E1C: mov dword ptr [0x10056bc], eax
1001E21: jmp 0x1001f4a
1001E26: xor edi, edi
1001E28: cmp dword ptr [0x10056b8], edi
1001E2E: je 0x1001e40
1001E30: call 0x10038d7
1001E35: mov dword ptr [0x10056b8], edi
1001E3B: jmp 0x1001f4a
1001E40: call 0x10038c2
1001E45: mov dword ptr [0x10056b8], eax
1001E4A: jmp 0x1001f4a
1001E4F: call 0x1001b49
1001E54: jmp 0x10021a9
1001E59: mov eax, dword ptr [ebp + 0x10]
1001E5C: add eax, 0xfffffdf7
1001E61: mov word ptr [0x10056a0], ax
1001E67: movzx eax, ax
1001E6A: lea eax, [eax + eax*2]
1001E6D: shl eax, 2
1001E70: mov ecx, dword ptr [eax + 0x1005010]
1001E76: mov dword ptr [0x10056a4], ecx
1001E7C: mov ecx, dword ptr [eax + 0x1005014]
1001E82: mov eax, dword ptr [eax + 0x1005018]
1001E88: mov dword ptr [0x10056a8], ecx
1001E8E: mov dword ptr [0x10056ac], eax
1001E93: call 0x100367a
1001E98: jmp 0x1001f4a
1001E9D: xor edi, edi
1001E9F: push edi
1001EA0: push dword ptr [0x1005b24]
1001EA6: call dword ptr [USER32!ShowWindow]
1001EAC: push edi
1001EAD: push 0xf060
1001EB2: push 0x112
1001EB7: push dword ptr [0x1005b24]
1001EBD: call dword ptr [USER32!SendMessageW]
1001EC3: jmp 0x1001c5e
1001EC8: call 0x100367a
1001ECD: jmp 0x10021a9
1001ED2: call 0x1001baa
1001ED7: jmp 0x10021a9
1001EDC: sub eax, 0x211
1001EE1: je 0x1001f19
1001EE3: sub eax, 0x3d
1001EE6: je 0x1001f0b
1001EE8: dec eax
1001EE9: je 0x1001f05
1001EEB: dec eax
1001EEC: je 0x1001eff
1001EEE: dec eax
1001EEF: jne 0x10021a9
1001EF5: call 0x1003d1d
1001EFA: jmp 0x1001c5e
1001EFF: push 0
1001F01: push 4
1001F03: jmp 0x1001f0f
1001F05: push 2
1001F07: push 1
1001F09: jmp 0x1001f0f
1001F0B: push 0
1001F0D: push 3
1001F0F: call 0x1003d76
1001F14: jmp 0x10021a9
1001F19: xor eax, eax
1001F1B: xor edi, edi
1001F1D: cmp dword ptr [0x10056c8], edi
1001F23: sete al
1001F26: mov dword ptr [0x10056c8], eax
1001F2B: call 0x1002607
1001F30: call 0x1002414
1001F35: test eax, eax
1001F37: jne 0x1001f45
1001F39: push 5
1001F3B: call 0x1003950
1001F40: jmp 0x1001eac
1001F45: call 0x1002af0
1001F4A: push dword ptr [0x10056c4]
1001F50: mov dword ptr [0x100515c], 1
1001F5A: jmp 0x1001d00
1001F5F: lea eax, [edx - 0x201]
1001F65: cmp eax, 0x11
1001F68: ja 0x10021a9
1001F6E: movzx eax, byte ptr [eax + 0x10021de]
1001F75: jmp dword ptr [eax*4 + 0x10021c2]
1001FED: mov dword ptr [0x1005140], edi
1001FF3: call dword ptr [USER32!ReleaseCapture]
1001FF9: test byte ptr [0x1005000], bl
1001FFF: je 0x10020bb
1002005: call 0x10037e1
100200A: jmp 0x10021a9
1002085: cmp dword ptr [0x1005140], edi
100208B: je 0x10020c1
100208D: test byte ptr [0x1005000], bl
1002093: je 0x1001fed
1002099: mov eax, dword ptr [ebp + 0x14]
100209C: shr eax, 0x10
100209F: sub eax, 0x27
10020A2: sar eax, 4
10020A5: push eax
10020A6: movzx eax, word ptr [ebp + 0x14]
10020AA: add eax, 4
10020AD: sar eax, 4
10020B0: push eax
10020B1: call 0x10031d4
10020B6: jmp 0x10021a9
10020BB: push -2
10020BD: push -2
10020BF: jmp 0x10020b1
10020C1: mov eax, dword ptr [0x1005154]
10020C6: cmp eax, edi
10020C8: je 0x10021a9
10020CE: cmp eax, 5
10020D1: jne 0x10020db
10020D3: test byte ptr [ebp + 0x10], 8
10020D7: jne 0x10020e1
10020D9: cmp eax, eax
10020DB: jle 0x10021a9
10020E1: movzx eax, cx
10020E4: shr ecx, 0x10
10020E7: add eax, 4
10020EA: sub ecx, 0x27
10020ED: sar eax, 4
10020F0: sar ecx, 4
10020F3: cmp eax, edi
10020F5: mov dword ptr [0x1005118], eax
10020FA: mov dword ptr [0x100511c], ecx
1002100: jle 0x10021a9
1002106: cmp ecx, edi
1002108: jle 0x10021a9
100210E: cmp eax, dword ptr [0x1005334]
1002114: jg 0x10021a9
100211A: cmp ecx, dword ptr [0x1005338]
1002120: jg 0x10021a9
1002126: push edi
1002127: call dword ptr [USER32!GetDC]
100212D: mov ecx, dword ptr [0x1005118]
1002133: mov esi, eax
1002135: mov eax, dword ptr [0x100511c]
100213A: shl eax, 5
100213D: mov al, byte ptr [eax + ecx + 0x1005340]
1002144: and al, 0x80
1002146: neg al
1002148: sbb eax, eax
100214A: and eax, 0xff000001
100214F: add eax, 0xffffff
1002154: push eax
1002155: push edi
1002156: push edi
1002157: push esi
1002158: call dword ptr [GDI32!SetPixel]
100215E: push esi
100215F: push edi
1002160: call dword ptr [USER32!ReleaseDC]
1002166: jmp 0x10021a9
10021A9: push dword ptr [ebp + 0x14]
10021AC: push dword ptr [ebp + 0x10]
10021AF: push dword ptr [ebp + 0xc]
10021B2: push dword ptr [ebp + 8]
10021B5: call dword ptr [USER32!DefWindowProcW]
10021BB: pop edi
10021BC: pop esi
10021BD: pop ebx
10021BE: leave 
10021BF: ret 0x10

; ===== sub_10021F0 =====
10021F0: push ebp
10021F1: mov ebp, esp
10021F3: sub esp, 0x4c
10021F6: mov eax, dword ptr [ebp + 8]
10021F9: push ebx
10021FA: push esi
10021FB: push edi
10021FC: mov dword ptr [0x1005b30], eax
1002201: call 0x1003ab0
1002206: xor ebx, ebx
1002208: inc ebx
1002209: xor edi, edi
100220B: cmp dword ptr [ebp + 0x14], 7
100220F: je 0x100221d
1002211: cmp dword ptr [ebp + 0x14], 2
1002215: mov dword ptr [0x1005b38], edi
100221B: jne 0x1002223
100221D: mov dword ptr [0x1005b38], ebx
1002223: lea eax, [ebp - 8]
1002226: push eax
1002227: mov dword ptr [ebp - 8], 8
100222E: mov dword ptr [ebp - 4], 0x16fd
1002235: call dword ptr [COMCTL32!InitCommonControlsEx]
100223B: push 0x64
100223D: push dword ptr [0x1005b30]
1002243: call dword ptr [USER32!LoadIconW]
1002249: mov ecx, dword ptr [0x1005b30]
100224F: push 0x7f00
1002254: push edi
1002255: mov dword ptr [0x1005b28], eax
100225A: mov dword ptr [ebp - 0x4c], edi
100225D: mov dword ptr [ebp - 0x48], 0x1001bc9
1002264: mov dword ptr [ebp - 0x44], edi
1002267: mov dword ptr [ebp - 0x40], edi
100226A: mov dword ptr [ebp - 0x3c], ecx
100226D: mov dword ptr [ebp - 0x38], eax
1002270: call dword ptr [USER32!LoadCursorW]
1002276: push ebx
1002277: mov dword ptr [ebp - 0x34], eax
100227A: call dword ptr [GDI32!GetStockObject]
1002280: mov dword ptr [ebp - 0x30], eax
1002283: lea eax, [ebp - 0x4c]
1002286: mov esi, 0x1005aa0
100228B: push eax
100228C: mov dword ptr [ebp - 0x2c], edi
100228F: mov dword ptr [ebp - 0x28], esi
1002292: call dword ptr [USER32!RegisterClassW]
1002298: test ax, ax
100229B: je 0x100233b
10022A1: push 0x1f4
10022A6: push dword ptr [0x1005b30]
10022AC: call dword ptr [USER32!LoadMenuW]
10022B2: push 0x1f5
10022B7: push dword ptr [0x1005b30]
10022BD: mov dword ptr [0x1005a94], eax
10022C2: call dword ptr [USER32!LoadAcceleratorsW]
10022C8: mov dword ptr [ebp + 0x14], eax
10022CB: call 0x1002bc2
10022D0: mov eax, dword ptr [0x1005b88]
10022D5: mov ecx, dword ptr [0x1005b20]
10022DB: mov edx, dword ptr [0x1005b2c]
10022E1: push edi
10022E2: push dword ptr [0x1005b30]
10022E8: add ecx, eax
10022EA: push edi
10022EB: push edi
10022EC: push ecx
10022ED: mov ecx, dword ptr [0x1005a90]
10022F3: add edx, ecx
10022F5: push edx
10022F6: mov edx, dword ptr [0x10056b4]
10022FC: sub edx, eax
10022FE: mov eax, dword ptr [0x10056b0]
1002303: push edx
1002304: sub eax, ecx
1002306: push eax
1002307: push 0xca0000
100230C: push esi
100230D: push esi
100230E: push edi
100230F: call dword ptr [USER32!CreateWindowExW]
1002315: cmp eax, edi
1002317: mov dword ptr [0x1005b24], eax
100231C: jne 0x1002325
100231E: push 0x3e8
1002323: jmp 0x1002336
1002325: push ebx
1002326: call 0x1001950
100232B: call 0x1002b14
1002330: test eax, eax
1002332: jne 0x1002342
1002334: push 5
1002336: call 0x1003950
100233B: xor eax, eax
100233D: jmp 0x10023c6
1002342: push dword ptr [0x10056c4]
1002348: call 0x1003ce5
100234D: call 0x100367a
1002352: push ebx
1002353: push dword ptr [0x1005b24]
1002359: call dword ptr [USER32!ShowWindow]
100235F: push dword ptr [0x1005b24]
1002365: call dword ptr [USER32!UpdateWindow]
100236B: mov esi, dword ptr [USER32!GetMessageW]
1002371: mov dword ptr [0x1005b38], edi
1002377: jmp 0x10023a4
1002379: lea eax, [ebp - 0x24]
100237C: push eax
100237D: push dword ptr [ebp + 0x14]
1002380: push dword ptr [0x1005b24]
1002386: call dword ptr [USER32!TranslateAcceleratorW]
100238C: test eax, eax
100238E: jne 0x10023a4
1002390: lea eax, [ebp - 0x24]
1002393: push eax
1002394: call dword ptr [USER32!TranslateMessage]
100239A: lea eax, [ebp - 0x24]
100239D: push eax
100239E: call dword ptr [USER32!DispatchMessageW]
10023A4: push edi
10023A5: push edi
10023A6: lea eax, [ebp - 0x24]
10023A9: push edi
10023AA: push eax
10023AB: call esi
10023AD: test eax, eax
10023AF: jne 0x1002379
10023B1: call 0x100263c
10023B6: cmp dword ptr [0x100515c], edi
10023BC: je 0x10023c3
10023BE: call 0x1002dab
10023C3: mov eax, dword ptr [ebp - 0x1c]
10023C6: pop edi
10023C7: pop esi
10023C8: pop ebx
10023C9: leave 
10023CA: ret 0x10

; ===== sub_10023CD =====
10023CD: xor eax, eax
10023CF: cmp dword ptr [0x10056c8], eax
10023D5: push 2
10023D7: sete al
10023DA: add eax, dword ptr [esp + 8]
10023DE: movzx eax, ax
10023E1: push eax
10023E2: push dword ptr [0x1005b30]
10023E8: call dword ptr [KERNEL32!FindResourceW]
10023EE: ret 4

; ===== sub_10023F1 =====
10023F1: mov eax, dword ptr [0x10056c8]
10023F6: neg eax
10023F8: sbb eax, eax
10023FA: and eax, 3
10023FD: inc eax
10023FE: imul eax, dword ptr [esp + 4]
1002403: add eax, 0x1f
1002406: sar eax, 3
1002409: and eax, 0xfffffffc
100240C: imul eax, dword ptr [esp + 8]
1002411: ret 8

; ===== sub_1002414 =====
1002414: push ebx
1002415: push esi
1002416: xor ebx, ebx
1002418: push 0x19a
100241D: mov dword ptr [0x1005954], ebx
1002423: mov dword ptr [0x1005a08], ebx
1002429: mov dword ptr [0x1005958], ebx
100242F: call 0x10023cd
1002434: cmp eax, ebx
1002436: mov esi, dword ptr [KERNEL32!LoadResource]
100243C: je 0x100244c
100243E: push eax
100243F: push dword ptr [0x1005b30]
1002445: call esi
1002447: mov dword ptr [0x1005958], eax
100244C: push 0x1a4
1002451: call 0x10023cd
1002456: cmp eax, ebx
1002458: je 0x1002468
100245A: push eax
100245B: push dword ptr [0x1005b30]
1002461: call esi
1002463: mov dword ptr [0x1005a08], eax
1002468: push 0x1ae
100246D: call 0x10023cd
1002472: cmp eax, ebx
1002474: je 0x1002484
1002476: push eax
1002477: push dword ptr [0x1005b30]
100247D: call esi
100247F: mov dword ptr [0x1005954], eax
1002484: mov eax, dword ptr [0x1005958]
1002489: cmp eax, ebx
100248B: je 0x1002602
1002491: cmp dword ptr [0x1005a08], ebx
1002497: je 0x1002602
100249D: cmp dword ptr [0x1005954], ebx
10024A3: je 0x1002602
10024A9: mov esi, dword ptr [KERNEL32!LockResource]
10024AF: push eax
10024B0: call esi
10024B2: push dword ptr [0x1005a08]
10024B8: mov dword ptr [0x1005a04], eax
10024BD: call esi
10024BF: push dword ptr [0x1005954]
10024C5: mov dword ptr [0x100595c], eax
10024CA: call esi
10024CC: cmp dword ptr [0x10056c8], ebx
10024D2: mov dword ptr [0x1005a00], eax
10024D7: jne 0x10024e3
10024D9: push 7
10024DB: call dword ptr [GDI32!GetStockObject]
10024E1: jmp 0x10024f1
10024E3: push 0x808080
10024E8: push 1
10024EA: push ebx
10024EB: call dword ptr [GDI32!CreatePen]
10024F1: mov ecx, dword ptr [0x10056c8]
10024F7: neg ecx
10024F9: sbb ecx, ecx
10024FB: push 0x10
10024FD: and ecx, 0x38
1002500: push 0x10
1002502: mov dword ptr [0x1005158], eax
1002507: add ecx, 0x30
100250A: call 0x10023f1
100250F: mov edx, 0x10059c0
1002514: mov esi, ecx
1002516: mov dword ptr [edx], esi
1002518: add edx, 4
100251B: add esi, eax
100251D: cmp edx, 0x1005a00
1002523: jl 0x1002516
1002525: push 0x17
1002527: push 0xd
1002529: call 0x10023f1
100252E: mov edx, 0x1005a60
1002533: mov esi, ecx
1002535: mov dword ptr [edx], esi
1002537: add edx, 4
100253A: add esi, eax
100253C: cmp edx, 0x1005a90
1002542: jl 0x1002535
1002544: push 0x18
1002546: push 0x18
1002548: call 0x10023f1
100254D: mov edx, 0x1005960
1002552: mov dword ptr [edx], ecx
1002554: add edx, 4
1002557: add ecx, eax
1002559: cmp edx, 0x1005974
100255F: jl 0x1002552
1002561: push ebp
1002562: push edi
1002563: push dword ptr [0x1005b24]
1002569: call dword ptr [USER32!GetDC]
100256F: mov ebp, eax
1002571: xor esi, esi
1002573: push ebp
1002574: call dword ptr [GDI32!CreateCompatibleDC]
100257A: cmp eax, ebx
100257C: mov dword ptr [esi + 0x1005a20], eax
1002582: jne 0x100258f
1002584: push 0x1001220
1002589: call dword ptr [KERNEL32!OutputDebugStringA]
100258F: push 0x10
1002591: push 0x10
1002593: push ebp
1002594: call dword ptr [GDI32!CreateCompatibleBitmap]
100259A: cmp eax, ebx
100259C: lea edi, [esi + 0x1005980]
10025A2: mov dword ptr [edi], eax
10025A4: jne 0x10025b1
10025A6: push 0x1001204
10025AB: call dword ptr [KERNEL32!OutputDebugStringA]
10025B1: push dword ptr [edi]
10025B3: push dword ptr [esi + 0x1005a20]
10025B9: call dword ptr [GDI32!SelectObject]
10025BF: mov eax, dword ptr [0x1005a04]
10025C4: mov ecx, dword ptr [esi + 0x10059c0]
10025CA: push ebx
10025CB: push eax
10025CC: add ecx, eax
10025CE: push ecx
10025CF: push 0x10
10025D1: push ebx
10025D2: push ebx
10025D3: push ebx
10025D4: push 0x10
10025D6: push 0x10
10025D8: push ebx
10025D9: push ebx
10025DA: push dword ptr [esi + 0x1005a20]
10025E0: call dword ptr [GDI32!SetDIBitsToDevice]
10025E6: add esi, 4
10025E9: cmp esi, 0x40
10025EC: jl 0x1002573
10025EE: push ebp
10025EF: push dword ptr [0x1005b24]
10025F5: call dword ptr [USER32!ReleaseDC]
10025FB: xor eax, eax
10025FD: pop edi
10025FE: inc eax
10025FF: pop ebp
1002600: jmp 0x1002604
1002602: xor eax, eax
1002604: pop esi
1002605: pop ebx
1002606: ret 

; ===== sub_1002607 =====
1002607: mov eax, dword ptr [0x1005158]
100260C: test eax, eax
100260E: push esi
100260F: push edi
1002610: mov edi, dword ptr [GDI32!DeleteObject]
1002616: je 0x100261b
1002618: push eax
1002619: call edi
100261B: xor esi, esi
100261D: push dword ptr [esi + 0x1005a20]
1002623: call dword ptr [GDI32!DeleteDC]
1002629: push dword ptr [esi + 0x1005980]
100262F: call edi
1002631: add esi, 4
1002634: cmp esi, 0x40
1002637: jl 0x100261d
1002639: pop edi
100263A: pop esi
100263B: ret 

; ===== sub_100263C =====
100263C: call 0x1002607
1002641: jmp 0x10038d7

; ===== sub_1002646 =====
1002646: push esi
1002647: push dword ptr [0x1005b24]
100264D: call dword ptr [USER32!GetDC]
1002653: mov ecx, dword ptr [esp + 0xc]
1002657: push 0xcc0020
100265C: mov esi, eax
100265E: mov eax, dword ptr [esp + 0xc]
1002662: mov edx, ecx
1002664: push 0
1002666: shl edx, 5
1002669: movsx edx, byte ptr [edx + eax + 0x1005340]
1002671: push 0
1002673: and edx, 0x1f
1002676: push dword ptr [edx*4 + 0x1005a20]
100267D: shl ecx, 4
1002680: push 0x10
1002682: push 0x10
1002684: add ecx, 0x27
1002687: shl eax, 4
100268A: push ecx
100268B: sub eax, 4
100268E: push eax
100268F: push esi
1002690: call dword ptr [GDI32!BitBlt]
1002696: push esi
1002697: push dword ptr [0x1005b24]
100269D: call dword ptr [USER32!ReleaseDC]
10026A3: pop esi
10026A4: ret 8

; ===== sub_10026A7 =====
10026A7: push ebp
10026A8: mov ebp, esp
10026AA: sub esp, 0xc
10026AD: xor eax, eax
10026AF: inc eax
10026B0: cmp dword ptr [0x1005338], eax
10026B6: mov dword ptr [ebp - 8], 0x37
10026BD: mov dword ptr [ebp - 0xc], eax
10026C0: jl 0x100272a
10026C2: push ebx
10026C3: push esi
10026C4: mov ebx, 0x1005360
10026C9: xor esi, esi
10026CB: inc esi
10026CC: cmp dword ptr [0x1005334], esi
10026D2: mov dword ptr [ebp - 4], 0xc
10026D9: jl 0x1002713
10026DB: push 0xcc0020
10026E0: xor eax, eax
10026E2: mov al, byte ptr [ebx + esi]
10026E5: push 0
10026E7: push 0
10026E9: and eax, 0x1f
10026EC: push dword ptr [eax*4 + 0x1005a20]
10026F3: push 0x10
10026F5: push 0x10
10026F7: push dword ptr [ebp - 8]
10026FA: push dword ptr [ebp - 4]
10026FD: push dword ptr [ebp + 8]
1002700: call dword ptr [GDI32!BitBlt]
1002706: add dword ptr [ebp - 4], 0x10
100270A: inc esi
100270B: cmp esi, dword ptr [0x1005334]
1002711: jle 0x10026db
1002713: inc dword ptr [ebp - 0xc]
1002716: mov eax, dword ptr [ebp - 0xc]
1002719: add dword ptr [ebp - 8], 0x10
100271D: add ebx, 0x20
1002720: cmp eax, dword ptr [0x1005338]
1002726: jle 0x10026c9
1002728: pop esi
1002729: pop ebx
100272A: leave 
100272B: ret 4

; ===== sub_100272E =====
100272E: push esi
100272F: push dword ptr [0x1005b24]
1002735: call dword ptr [USER32!GetDC]
100273B: mov esi, eax
100273D: push esi
100273E: call 0x10026a7
1002743: push esi
1002744: push dword ptr [0x1005b24]
100274A: call dword ptr [USER32!ReleaseDC]
1002750: pop esi
1002751: ret 

; ===== sub_1002752 =====
1002752: mov eax, dword ptr [0x100595c]
1002757: mov edx, dword ptr [esp + 0xc]
100275B: mov edx, dword ptr [edx*4 + 0x1005a60]
1002762: xor ecx, ecx
1002764: push ecx
1002765: push eax
1002766: add edx, eax
1002768: push edx
1002769: push 0x17
100276B: push ecx
100276C: push ecx
100276D: push ecx
100276E: push 0x17
1002770: push 0xd
1002772: push 0x10
1002774: push dword ptr [esp + 0x30]
1002778: push dword ptr [esp + 0x30]
100277C: call dword ptr [GDI32!SetDIBitsToDevice]
1002782: ret 0xc

; ===== sub_1002785 =====
1002785: push ebx
1002786: push ebp
1002787: push esi
1002788: mov esi, dword ptr [esp + 0x10]
100278C: push edi
100278D: push esi
100278E: call dword ptr [GDI32!GetLayout]
1002794: mov ebp, dword ptr [GDI32!SetLayout]
100279A: mov ebx, eax
100279C: mov dword ptr [esp + 0x14], ebx
10027A0: and ebx, 1
10027A3: je 0x10027aa
10027A5: push 0
10027A7: push esi
10027A8: call ebp
10027AA: mov eax, dword ptr [0x1005194]
10027AF: test eax, eax
10027B1: jge 0x10027c0
10027B3: push 0xb
10027B5: pop ecx
10027B6: neg eax
10027B8: push 0x64
10027BA: cdq 
10027BB: pop edi
10027BC: idiv edi
10027BE: jmp 0x10027c8
10027C0: push 0x64
10027C2: cdq 
10027C3: pop ecx
10027C4: idiv ecx
10027C6: mov ecx, eax
10027C8: push ecx
10027C9: push 0x11
10027CB: push esi
10027CC: mov edi, edx
10027CE: call 0x1002752
10027D3: push 0xa
10027D5: mov eax, edi
10027D7: pop ecx
10027D8: cdq 
10027D9: idiv ecx
10027DB: push eax
10027DC: push 0x1e
10027DE: push esi
10027DF: mov edi, edx
10027E1: call 0x1002752
10027E6: push edi
10027E7: push 0x2b
10027E9: push esi
10027EA: call 0x1002752
10027EF: test ebx, ebx
10027F1: je 0x10027fa
10027F3: push dword ptr [esp + 0x14]
10027F7: push esi
10027F8: call ebp
10027FA: pop edi
10027FB: pop esi
10027FC: pop ebp
10027FD: pop ebx
10027FE: ret 4

; ===== sub_1002801 =====
1002801: push esi
1002802: push dword ptr [0x1005b24]
1002808: call dword ptr [USER32!GetDC]
100280E: mov esi, eax
1002810: push esi
1002811: call 0x1002785
1002816: push esi
1002817: push dword ptr [0x1005b24]
100281D: call dword ptr [USER32!ReleaseDC]
1002823: pop esi
1002824: ret 

; ===== sub_1002825 =====
1002825: push ebx
1002826: push ebp
1002827: push esi
1002828: mov esi, dword ptr [esp + 0x10]
100282C: push edi
100282D: mov edi, dword ptr [0x100579c]
1002833: push esi
1002834: call dword ptr [GDI32!GetLayout]
100283A: mov ebp, eax
100283C: mov ebx, ebp
100283E: and ebx, 1
1002841: je 0x100284c
1002843: push 0
1002845: push esi
1002846: call dword ptr [GDI32!SetLayout]
100284C: push 0x64
100284E: mov eax, edi
1002850: cdq 
1002851: pop ecx
1002852: idiv ecx
1002854: push eax
1002855: mov eax, dword ptr [0x1005b2c]
100285A: sub eax, dword ptr [0x1005a90]
1002860: mov edi, edx
1002862: sub eax, 0x38
1002865: push eax
1002866: push esi
1002867: call 0x1002752
100286C: push 0xa
100286E: mov eax, edi
1002870: cdq 
1002871: pop ecx
1002872: idiv ecx
1002874: push eax
1002875: mov eax, dword ptr [0x1005b2c]
100287A: sub eax, dword ptr [0x1005a90]
1002880: mov edi, edx
1002882: sub eax, 0x2b
1002885: push eax
1002886: push esi
1002887: call 0x1002752
100288C: mov eax, dword ptr [0x1005b2c]
1002891: sub eax, dword ptr [0x1005a90]
1002897: push edi
1002898: sub eax, 0x1e
100289B: push eax
100289C: push esi
100289D: call 0x1002752
10028A2: test ebx, ebx
10028A4: je 0x10028ae
10028A6: push ebp
10028A7: push esi
10028A8: call dword ptr [GDI32!SetLayout]
10028AE: pop edi
10028AF: pop esi
10028B0: pop ebp
10028B1: pop ebx
10028B2: ret 4

; ===== sub_10028B5 =====
10028B5: push esi
10028B6: push dword ptr [0x1005b24]
10028BC: call dword ptr [USER32!GetDC]
10028C2: mov esi, eax
10028C4: push esi
10028C5: call 0x1002825
10028CA: push esi
10028CB: push dword ptr [0x1005b24]
10028D1: call dword ptr [USER32!ReleaseDC]
10028D7: pop esi
10028D8: ret 

; ===== sub_10028D9 =====
10028D9: mov eax, dword ptr [0x1005a00]
10028DE: mov edx, dword ptr [esp + 8]
10028E2: mov edx, dword ptr [edx*4 + 0x1005960]
10028E9: xor ecx, ecx
10028EB: push ecx
10028EC: push eax
10028ED: add edx, eax
10028EF: mov eax, dword ptr [0x1005b2c]
10028F4: push edx
10028F5: push 0x18
10028F7: push ecx
10028F8: push ecx
10028F9: push ecx
10028FA: push 0x18
10028FC: push 0x18
10028FE: add eax, -0x18
1002901: push 0x10
1002903: sar eax, 1
1002905: push eax
1002906: push dword ptr [esp + 0x30]
100290A: call dword ptr [GDI32!SetDIBitsToDevice]
1002910: ret 8

; ===== sub_1002913 =====
1002913: push esi
1002914: push dword ptr [0x1005b24]
100291A: call dword ptr [USER32!GetDC]
1002920: push dword ptr [esp + 8]
1002924: mov esi, eax
1002926: push esi
1002927: call 0x10028d9
100292C: push esi
100292D: push dword ptr [0x1005b24]
1002933: call dword ptr [USER32!ReleaseDC]
1002939: pop esi
100293A: ret 4

; ===== sub_100293D =====
100293D: test byte ptr [esp + 8], 1
1002942: je 0x1002952
1002944: push 0x10
1002946: push dword ptr [esp + 8]
100294A: call dword ptr [GDI32!SetROP2]
1002950: jmp 0x100296e
1002952: push 0xd
1002954: push dword ptr [esp + 8]
1002958: call dword ptr [GDI32!SetROP2]
100295E: push dword ptr [0x1005158]
1002964: push dword ptr [esp + 8]
1002968: call dword ptr [GDI32!SelectObject]
100296E: ret 8

; ===== sub_1002971 =====
1002971: push ebp
1002972: mov ebp, esp
1002974: push ecx
1002975: and dword ptr [ebp - 4], 0
1002979: push ebx
100297A: mov ebx, dword ptr [ebp + 8]
100297D: push esi
100297E: push edi
100297F: push dword ptr [ebp + 0x20]
1002982: push ebx
1002983: call 0x100293d
1002988: mov eax, dword ptr [ebp + 0x1c]
100298B: test eax, eax
100298D: mov edi, dword ptr [GDI32!MoveToEx]
1002993: mov esi, dword ptr [GDI32!LineTo]
1002999: jle 0x10029cf
100299B: mov dword ptr [ebp + 8], eax
100299E: mov dword ptr [ebp - 4], eax
10029A1: dec dword ptr [ebp + 0x18]
10029A4: push 0
10029A6: push dword ptr [ebp + 0x18]
10029A9: push dword ptr [ebp + 0xc]
10029AC: push ebx
10029AD: call edi
10029AF: push dword ptr [ebp + 0x10]
10029B2: push dword ptr [ebp + 0xc]
10029B5: push ebx
10029B6: call esi
10029B8: push dword ptr [ebp + 0x10]
10029BB: inc dword ptr [ebp + 0xc]
10029BE: push dword ptr [ebp + 0x14]
10029C1: push ebx
10029C2: call esi
10029C4: dec dword ptr [ebp + 0x14]
10029C7: inc dword ptr [ebp + 0x10]
10029CA: dec dword ptr [ebp + 8]
10029CD: jne 0x10029a1
10029CF: mov eax, dword ptr [ebp + 0x20]
10029D2: inc dword ptr [ebp - 4]
10029D5: cmp eax, 2
10029D8: jge 0x10029e4
10029DA: xor eax, 1
10029DD: push eax
10029DE: push ebx
10029DF: call 0x100293d
10029E4: mov eax, dword ptr [ebp - 4]
10029E7: dec eax
10029E8: je 0x1002a1b
10029EA: mov dword ptr [ebp + 0x20], eax
10029ED: inc dword ptr [ebp + 0x18]
10029F0: push 0
10029F2: push dword ptr [ebp + 0x18]
10029F5: push dword ptr [ebp + 0xc]
10029F8: push ebx
10029F9: call edi
10029FB: push dword ptr [ebp + 0x18]
10029FE: dec dword ptr [ebp + 0xc]
1002A01: inc dword ptr [ebp + 0x14]
1002A04: push dword ptr [ebp + 0x14]
1002A07: push ebx
1002A08: call esi
1002A0A: dec dword ptr [ebp + 0x10]
1002A0D: push dword ptr [ebp + 0x10]
1002A10: push dword ptr [ebp + 0x14]
1002A13: push ebx
1002A14: call esi
1002A16: dec dword ptr [ebp + 0x20]
1002A19: jne 0x10029ed
1002A1B: pop edi
1002A1C: pop esi
1002A1D: pop ebx
1002A1E: leave 
1002A1F: ret 0x1c

; ===== sub_1002A22 =====
1002A22: push ebx
1002A23: mov ebx, dword ptr [0x1005b20]
1002A29: push ebp
1002A2A: push esi
1002A2B: mov esi, dword ptr [0x1005b2c]
1002A31: push edi
1002A32: mov edi, dword ptr [esp + 0x14]
1002A36: push 1
1002A38: push 3
1002A3A: dec esi
1002A3B: dec ebx
1002A3C: push ebx
1002A3D: push esi
1002A3E: xor ebp, ebp
1002A40: push ebp
1002A41: push ebp
1002A42: push edi
1002A43: call 0x1002971
1002A48: push ebp
1002A49: push 3
1002A4B: add ebx, -9
1002A4E: push ebx
1002A4F: sub esi, 9
1002A52: push esi
1002A53: push 0x34
1002A55: push 9
1002A57: push edi
1002A58: call 0x1002971
1002A5D: push ebp
1002A5E: push 2
1002A60: push 0x2d
1002A62: push esi
1002A63: push 9
1002A65: push 9
1002A67: push edi
1002A68: call 0x1002971
1002A6D: push ebp
1002A6E: push 1
1002A70: push 0x27
1002A72: push 0x38
1002A74: push 0xf
1002A76: push 0x10
1002A78: push edi
1002A79: call 0x1002971
1002A7E: mov eax, dword ptr [0x1005b2c]
1002A83: sub eax, dword ptr [0x1005a90]
1002A89: push ebp
1002A8A: push 1
1002A8C: sub eax, 0x39
1002A8F: push 0x27
1002A91: lea ecx, [eax + 0x28]
1002A94: push ecx
1002A95: push 0xf
1002A97: push eax
1002A98: push edi
1002A99: call 0x1002971
1002A9E: mov eax, dword ptr [0x1005b2c]
1002AA3: push 2
1002AA5: add eax, -0x18
1002AA8: push 1
1002AAA: sar eax, 1
1002AAC: dec eax
1002AAD: push 0x28
1002AAF: lea ecx, [eax + 0x19]
1002AB2: push ecx
1002AB3: push 0xf
1002AB5: push eax
1002AB6: push edi
1002AB7: call 0x1002971
1002ABC: pop edi
1002ABD: pop esi
1002ABE: pop ebp
1002ABF: pop ebx
1002AC0: ret 4

; ===== sub_1002AC3 =====
1002AC3: push esi
1002AC4: mov esi, dword ptr [esp + 8]
1002AC8: push esi
1002AC9: call 0x1002a22
1002ACE: push esi
1002ACF: call 0x1002785
1002AD4: push dword ptr [0x1005160]
1002ADA: push esi
1002ADB: call 0x10028d9
1002AE0: push esi
1002AE1: call 0x1002825
1002AE6: push esi
1002AE7: call 0x10026a7
1002AEC: pop esi
1002AED: ret 4

; ===== sub_1002AF0 =====
1002AF0: push esi
1002AF1: push dword ptr [0x1005b24]
1002AF7: call dword ptr [USER32!GetDC]
1002AFD: mov esi, eax
1002AFF: push esi
1002B00: call 0x1002ac3
1002B05: push esi
1002B06: push dword ptr [0x1005b24]
1002B0C: call dword ptr [USER32!ReleaseDC]
1002B12: pop esi
1002B13: ret 

; ===== sub_1002B14 =====
1002B14: call 0x1002414
1002B19: test eax, eax
1002B1B: jne 0x1002b1e
1002B1D: ret 
1002B1E: call 0x1002ed5
1002B23: xor eax, eax
1002B25: inc eax
1002B26: ret 

; ===== sub_1002B27 =====
1002B27: push ebp
1002B28: mov ebp, esp
1002B2A: push ecx
1002B2B: lea eax, [ebp - 4]
1002B2E: push eax
1002B2F: lea eax, [ebp + 8]
1002B32: push eax
1002B33: mov eax, dword ptr [ebp + 8]
1002B36: push 0
1002B38: push 0
1002B3A: push dword ptr [eax*4 + 0x10050d0]
1002B41: mov dword ptr [ebp - 4], 4
1002B48: push dword ptr [0x1005950]
1002B4E: call dword ptr [ADVAPI32!RegQueryValueExW]
1002B54: test eax, eax
1002B56: je 0x1002b5d
1002B58: mov eax, dword ptr [ebp + 0xc]
1002B5B: jmp 0x1002b7c
1002B5D: mov edx, dword ptr [ebp + 0x14]
1002B60: push esi
1002B61: mov esi, dword ptr [ebp + 8]
1002B64: cmp edx, esi
1002B66: mov ecx, edx
1002B68: jl 0x1002b6c
1002B6A: mov ecx, esi
1002B6C: mov eax, dword ptr [ebp + 0x10]
1002B6F: cmp eax, ecx
1002B71: jg 0x1002b7b
1002B73: cmp edx, esi
1002B75: mov eax, edx
1002B77: jl 0x1002b7b
1002B79: mov eax, esi
1002B7B: pop esi
1002B7C: leave 
1002B7D: ret 0x10

; ===== sub_1002B80 =====
1002B80: push ebp
1002B81: mov ebp, esp
1002B83: push ecx
1002B84: lea eax, [ebp - 4]
1002B87: push eax
1002B88: push dword ptr [ebp + 0xc]
1002B8B: mov eax, dword ptr [ebp + 8]
1002B8E: push 0
1002B90: push 0
1002B92: push dword ptr [eax*4 + 0x10050d0]
1002B99: mov dword ptr [ebp - 4], 0x40
1002BA0: push dword ptr [0x1005950]
1002BA6: call dword ptr [ADVAPI32!RegQueryValueExW]
1002BAC: test eax, eax
1002BAE: je 0x1002bbe
1002BB0: push 0x1005b40
1002BB5: push dword ptr [ebp + 0xc]
1002BB8: call dword ptr [KERNEL32!lstrcpyW]
1002BBE: leave 
1002BBF: ret 8

; ===== sub_1002BC2 =====
1002BC2: push ecx
1002BC3: push ebx
1002BC4: push esi
1002BC5: push edi
1002BC6: lea eax, [esp + 0xc]
1002BCA: push eax
1002BCB: push 0x1005950
1002BD0: xor edi, edi
1002BD2: push edi
1002BD3: push 0x20019
1002BD8: push edi
1002BD9: push edi
1002BDA: push edi
1002BDB: push 0x1001340
1002BE0: push 0x80000001
1002BE5: call dword ptr [ADVAPI32!RegCreateKeyExW]
1002BEB: push 0x19
1002BED: push 9
1002BEF: pop esi
1002BF0: push esi
1002BF1: push esi
1002BF2: push 2
1002BF4: call 0x1002b27
1002BF9: push 0x1e
1002BFB: push esi
1002BFC: push esi
1002BFD: push 3
1002BFF: mov dword ptr [0x10056a8], eax
1002C04: mov dword ptr [0x1005338], eax
1002C09: call 0x1002b27
1002C0E: push 3
1002C10: push edi
1002C11: push edi
1002C12: push edi
1002C13: mov dword ptr [0x10056ac], eax
1002C18: mov dword ptr [0x1005334], eax
1002C1D: call 0x1002b27
1002C22: mov esi, 0x3e7
1002C27: push esi
1002C28: push 0xa
1002C2A: push 0xa
1002C2C: push 1
1002C2E: mov word ptr [0x10056a0], ax
1002C34: call 0x1002b27
1002C39: mov ebx, 0x400
1002C3E: push ebx
1002C3F: push edi
1002C40: push 0x50
1002C42: push 4
1002C44: mov dword ptr [0x10056a4], eax
1002C49: call 0x1002b27
1002C4E: push ebx
1002C4F: push edi
1002C50: push 0x50
1002C52: push 5
1002C54: mov dword ptr [0x10056b0], eax
1002C59: call 0x1002b27
1002C5E: push 3
1002C60: push edi
1002C61: push edi
1002C62: push 6
1002C64: mov dword ptr [0x10056b4], eax
1002C69: call 0x1002b27
1002C6E: push 1
1002C70: push edi
1002C71: push 1
1002C73: push 7
1002C75: mov dword ptr [0x10056b8], eax
1002C7A: call 0x1002b27
1002C7F: push 1
1002C81: push edi
1002C82: push edi
1002C83: push 9
1002C85: mov dword ptr [0x10056bc], eax
1002C8A: call 0x1002b27
1002C8F: push 2
1002C91: push edi
1002C92: push edi
1002C93: push 8
1002C95: mov dword ptr [0x10056c0], eax
1002C9A: call 0x1002b27
1002C9F: mov dword ptr [0x10056c4], eax
1002CA4: push esi
1002CA5: push edi
1002CA6: push esi
1002CA7: push 0xb
1002CA9: call 0x1002b27
1002CAE: push esi
1002CAF: push edi
1002CB0: push esi
1002CB1: push 0xd
1002CB3: mov dword ptr [0x10056cc], eax
1002CB8: call 0x1002b27
1002CBD: push esi
1002CBE: push edi
1002CBF: push esi
1002CC0: push 0xf
1002CC2: mov dword ptr [0x10056d0], eax
1002CC7: call 0x1002b27
1002CCC: push 0x10056d8
1002CD1: push 0xc
1002CD3: mov dword ptr [0x10056d4], eax
1002CD8: call 0x1002b80
1002CDD: push 0x1005718
1002CE2: push 0xe
1002CE4: call 0x1002b80
1002CE9: push 0x1005758
1002CEE: push 0x10
1002CF0: call 0x1002b80
1002CF5: mov esi, dword ptr [USER32!GetDesktopWindow]
1002CFB: call esi
1002CFD: push eax
1002CFE: call dword ptr [USER32!GetDC]
1002D04: push 1
1002D06: push edi
1002D07: mov ebx, eax
1002D09: push 0x18
1002D0B: push ebx
1002D0C: call dword ptr [GDI32!GetDeviceCaps]
1002D12: xor ecx, ecx
1002D14: cmp eax, 2
1002D17: setne cl
1002D1A: push ecx
1002D1B: push 0xa
1002D1D: call 0x1002b27
1002D22: push ebx
1002D23: mov dword ptr [0x10056c8], eax
1002D28: call esi
1002D2A: push eax
1002D2B: call dword ptr [USER32!ReleaseDC]
1002D31: cmp dword ptr [0x10056b8], 3
1002D38: pop edi
1002D39: pop esi
1002D3A: pop ebx
1002D3B: jne 0x1002d47
1002D3D: call 0x10038c2
1002D42: mov dword ptr [0x10056b8], eax
1002D47: push dword ptr [0x1005950]
1002D4D: call dword ptr [ADVAPI32!RegCloseKey]
1002D53: pop ecx
1002D54: ret 

; ===== sub_1002D55 =====
1002D55: push 4
1002D57: lea eax, [esp + 0xc]
1002D5B: push eax
1002D5C: mov eax, dword ptr [esp + 0xc]
1002D60: push 4
1002D62: push 0
1002D64: push dword ptr [eax*4 + 0x10050d0]
1002D6B: push dword ptr [0x1005950]
1002D71: call dword ptr [ADVAPI32!RegSetValueExW]
1002D77: ret 8

; ===== sub_1002D7A =====
1002D7A: push dword ptr [esp + 8]
1002D7E: call dword ptr [KERNEL32!lstrlenW]
1002D84: lea eax, [eax + eax + 2]
1002D88: push eax
1002D89: push dword ptr [esp + 0xc]
1002D8D: mov eax, dword ptr [esp + 0xc]
1002D91: push 1
1002D93: push 0
1002D95: push dword ptr [eax*4 + 0x10050d0]
1002D9C: push dword ptr [0x1005950]
1002DA2: call dword ptr [ADVAPI32!RegSetValueExW]
1002DA8: ret 8

; ===== sub_1002DAB =====
1002DAB: push ecx
1002DAC: push esi
1002DAD: lea eax, [esp + 4]
1002DB1: push eax
1002DB2: push 0x1005950
1002DB7: xor esi, esi
1002DB9: push esi
1002DBA: push 0x20006
1002DBF: push esi
1002DC0: push esi
1002DC1: push esi
1002DC2: push 0x1001340
1002DC7: push 0x80000001
1002DCC: call dword ptr [ADVAPI32!RegCreateKeyExW]
1002DD2: movzx eax, word ptr [0x10056a0]
1002DD9: push eax
1002DDA: push esi
1002DDB: call 0x1002d55
1002DE0: push dword ptr [0x10056a8]
1002DE6: push 2
1002DE8: call 0x1002d55
1002DED: push dword ptr [0x10056ac]
1002DF3: push 3
1002DF5: call 0x1002d55
1002DFA: push dword ptr [0x10056a4]
1002E00: push 1
1002E02: call 0x1002d55
1002E07: push dword ptr [0x10056bc]
1002E0D: push 7
1002E0F: call 0x1002d55
1002E14: push 1
1002E16: push 0x11
1002E18: call 0x1002d55
1002E1D: push dword ptr [0x10056c8]
1002E23: push 0xa
1002E25: call 0x1002d55
1002E2A: push dword ptr [0x10056b8]
1002E30: push 6
1002E32: call 0x1002d55
1002E37: push dword ptr [0x10056b0]
1002E3D: push 4
1002E3F: call 0x1002d55
1002E44: push dword ptr [0x10056b4]
1002E4A: push 5
1002E4C: call 0x1002d55
1002E51: push dword ptr [0x10056cc]
1002E57: push 0xb
1002E59: call 0x1002d55
1002E5E: push dword ptr [0x10056d0]
1002E64: push 0xd
1002E66: call 0x1002d55
1002E6B: push dword ptr [0x10056d4]
1002E71: push 0xf
1002E73: call 0x1002d55
1002E78: push 0x10056d8
1002E7D: push 0xc
1002E7F: call 0x1002d7a
1002E84: push 0x1005718
1002E89: push 0xe
1002E8B: call 0x1002d7a
1002E90: push 0x1005758
1002E95: push 0x10
1002E97: call 0x1002d7a
1002E9C: push dword ptr [0x1005950]
1002EA2: call dword ptr [ADVAPI32!RegCloseKey]
1002EA8: pop esi
1002EA9: pop ecx
1002EAA: ret 

; ===== sub_1002EAB =====
1002EAB: mov eax, dword ptr [esp + 8]
1002EAF: mov ecx, dword ptr [esp + 4]
1002EB3: push dword ptr [esp + 8]
1002EB7: shl eax, 5
1002EBA: lea eax, [eax + ecx + 0x1005340]
1002EC1: mov dl, byte ptr [eax]
1002EC3: and dl, 0xe0
1002EC6: or dl, byte ptr [esp + 0x10]
1002ECA: push ecx
1002ECB: mov byte ptr [eax], dl
1002ECD: call 0x1002646
1002ED2: ret 0xc

; ===== sub_1002ED5 =====
1002ED5: mov eax, 0x360
1002EDA: dec eax
1002EDB: mov byte ptr [eax + 0x1005340], 0xf
1002EE2: jne 0x1002eda
1002EE4: mov ecx, dword ptr [0x1005334]
1002EEA: mov edx, dword ptr [0x1005338]
1002EF0: lea eax, [ecx + 2]
1002EF3: test eax, eax
1002EF5: push esi
1002EF6: je 0x1002f11
1002EF8: mov esi, edx
1002EFA: shl esi, 5
1002EFD: lea esi, [esi + 0x1005360]
1002F03: dec eax
1002F04: mov byte ptr [eax + 0x1005340], 0x10
1002F0B: mov byte ptr [esi + eax], 0x10
1002F0F: jne 0x1002f03
1002F11: lea esi, [edx + 2]
1002F14: test esi, esi
1002F16: je 0x1002f39
1002F18: mov eax, esi
1002F1A: shl eax, 5
1002F1D: lea edx, [eax + 0x1005340]
1002F23: lea eax, [eax + ecx + 0x1005341]
1002F2A: sub edx, 0x20
1002F2D: sub eax, 0x20
1002F30: dec esi
1002F31: mov byte ptr [edx], 0x10
1002F34: mov byte ptr [eax], 0x10
1002F37: jne 0x1002f2a
1002F39: pop esi
1002F3A: ret 

; ===== sub_1002F3B =====
1002F3B: mov ecx, dword ptr [esp + 8]
1002F3F: push esi
1002F40: xor eax, eax
1002F42: lea esi, [ecx - 1]
1002F45: inc ecx
1002F46: cmp esi, ecx
1002F48: jg 0x1002f7c
1002F4A: mov edx, dword ptr [esp + 8]
1002F4E: push ebx
1002F4F: lea ebx, [edx - 1]
1002F52: push edi
1002F53: lea edi, [edx + 1]
1002F56: mov edx, esi
1002F58: shl edx, 5
1002F5B: sub ecx, esi
1002F5D: add edx, 0x1005340
1002F63: inc ecx
1002F64: mov esi, ebx
1002F66: jmp 0x1002f70
1002F68: test byte ptr [edx + esi], 0x80
1002F6C: je 0x1002f6f
1002F6E: inc eax
1002F6F: inc esi
1002F70: cmp esi, edi
1002F72: jle 0x1002f68
1002F74: add edx, 0x20
1002F77: dec ecx
1002F78: jne 0x1002f64
1002F7A: pop edi
1002F7B: pop ebx
1002F7C: pop esi
1002F7D: ret 8

; ===== sub_1002F80 =====
1002F80: mov eax, dword ptr [0x1005338]
1002F85: cmp eax, 1
1002F88: jl 0x1002fd8
1002F8A: push ebx
1002F8B: push esi
1002F8C: mov esi, dword ptr [0x1005334]
1002F92: push edi
1002F93: mov edi, 0x1005360
1002F98: mov edx, eax
1002F9A: xor ecx, ecx
1002F9C: inc ecx
1002F9D: cmp esi, ecx
1002F9F: jl 0x1002fcf
1002FA1: mov al, byte ptr [edi + ecx]
1002FA4: test al, 0x40
1002FA6: jne 0x1002fca
1002FA8: mov bl, al
1002FAA: and bl, 0x1f
1002FAD: test al, al
1002FAF: jns 0x1002fbe
1002FB1: cmp bl, 0xe
1002FB4: je 0x1002fca
1002FB6: and al, 0xe0
1002FB8: or al, byte ptr [esp + 0x10]
1002FBC: jmp 0x1002fc7
1002FBE: cmp bl, 0xe
1002FC1: jne 0x1002fca
1002FC3: and al, 0xeb
1002FC5: or al, 0xb
1002FC7: mov byte ptr [edi + ecx], al
1002FCA: inc ecx
1002FCB: cmp ecx, esi
1002FCD: jle 0x1002fa1
1002FCF: add edi, 0x20
1002FD2: dec edx
1002FD3: jne 0x1002f9a
1002FD5: pop edi
1002FD6: pop esi
1002FD7: pop ebx
1002FD8: call 0x100272e
1002FDD: ret 4

; ===== sub_1002FE0 =====
1002FE0: cmp dword ptr [0x1005164], 0
1002FE7: je 0x1003007
1002FE9: cmp dword ptr [0x100579c], 0x3e7
1002FF3: jge 0x1003007
1002FF5: inc dword ptr [0x100579c]
1002FFB: call 0x10028b5
1003000: push 1
1003002: call 0x10038ed
1003007: ret 

; ===== sub_1003008 =====
1003008: push ebp
1003009: mov ebp, esp
100300B: push ebx
100300C: mov ebx, dword ptr [ebp + 8]
100300F: push esi
1003010: push edi
1003011: mov edi, dword ptr [ebp + 0xc]
1003014: mov esi, edi
1003016: shl esi, 5
1003019: add esi, ebx
100301B: movsx eax, byte ptr [esi + 0x1005340]
1003022: test al, 0x40
1003024: jne 0x100307d
1003026: and eax, 0x1f
1003029: cmp eax, 0x10
100302C: je 0x100307d
100302E: cmp eax, 0xe
1003031: je 0x100307d
1003033: inc dword ptr [0x10057a4]
1003039: push edi
100303A: push ebx
100303B: call 0x1002f3b
1003040: mov dword ptr [ebp + 0xc], eax
1003043: push edi
1003044: or al, 0x40
1003046: push ebx
1003047: mov byte ptr [esi + 0x1005340], al
100304D: call 0x1002646
1003052: cmp dword ptr [ebp + 0xc], 0
1003056: jne 0x100307d
1003058: mov eax, dword ptr [0x1005798]
100305D: mov dword ptr [eax*4 + 0x10051a0], ebx
1003064: mov dword ptr [eax*4 + 0x10057c0], edi
100306B: inc eax
100306C: cmp eax, 0x64
100306F: mov dword ptr [0x1005798], eax
1003074: jne 0x100307d
1003076: and dword ptr [0x1005798], 0
100307D: pop edi
100307E: pop esi
100307F: pop ebx
1003080: pop ebp
1003081: ret 8

; ===== sub_1003084 =====
1003084: push ebp
1003085: mov ebp, esp
1003087: push ebx
1003088: push dword ptr [ebp + 0xc]
100308B: xor ebx, ebx
100308D: push dword ptr [ebp + 8]
1003090: inc ebx
1003091: mov dword ptr [0x1005798], ebx
1003097: call 0x1003008
100309C: cmp dword ptr [0x1005798], ebx
10030A2: je 0x1003114
10030A4: push esi
10030A5: push edi
10030A6: mov esi, dword ptr [ebx*4 + 0x10057c0]
10030AD: mov edi, dword ptr [ebx*4 + 0x10051a0]
10030B4: dec esi
10030B5: lea eax, [edi - 1]
10030B8: push esi
10030B9: push eax
10030BA: call 0x1003008
10030BF: push esi
10030C0: push edi
10030C1: call 0x1003008
10030C6: lea eax, [edi + 1]
10030C9: push esi
10030CA: push eax
10030CB: mov dword ptr [ebp + 0xc], eax
10030CE: call 0x1003008
10030D3: inc esi
10030D4: push esi
10030D5: lea eax, [edi - 1]
10030D8: push eax
10030D9: call 0x1003008
10030DE: push esi
10030DF: push dword ptr [ebp + 0xc]
10030E2: call 0x1003008
10030E7: inc esi
10030E8: push esi
10030E9: lea eax, [edi - 1]
10030EC: push eax
10030ED: call 0x1003008
10030F2: push esi
10030F3: push edi
10030F4: call 0x1003008
10030F9: push esi
10030FA: push dword ptr [ebp + 0xc]
10030FD: call 0x1003008
1003102: inc ebx
1003103: cmp ebx, 0x64
1003106: jne 0x100310a
1003108: xor ebx, ebx
100310A: cmp ebx, dword ptr [0x1005798]
1003110: jne 0x10030a6
1003112: pop edi
1003113: pop esi
1003114: pop ebx
1003115: pop ebp
1003116: ret 8

; ===== sub_1003119 =====
1003119: push ebp
100311A: mov ebp, esp
100311C: push ecx
100311D: mov ecx, dword ptr [ebp + 0xc]
1003120: and dword ptr [ebp - 4], 0
1003124: push esi
1003125: lea esi, [ecx - 1]
1003128: inc ecx
1003129: cmp esi, ecx
100312B: jg 0x1003163
100312D: mov edx, dword ptr [ebp + 8]
1003130: push ebx
1003131: lea ebx, [edx - 1]
1003134: push edi
1003135: lea edi, [edx + 1]
1003138: mov edx, esi
100313A: shl edx, 5
100313D: sub ecx, esi
100313F: add edx, 0x1005340
1003145: inc ecx
1003146: mov esi, ebx
1003148: jmp 0x1003157
100314A: mov al, byte ptr [edx + esi]
100314D: and al, 0x1f
100314F: cmp al, 0xe
1003151: jne 0x1003156
1003153: inc dword ptr [ebp - 4]
1003156: inc esi
1003157: cmp esi, edi
1003159: jle 0x100314a
100315B: add edx, 0x20
100315E: dec ecx
100315F: jne 0x1003146
1003161: pop edi
1003162: pop ebx
1003163: mov eax, dword ptr [ebp - 4]
1003166: pop esi
1003167: leave 
1003168: ret 8

; ===== sub_100316B =====
100316B: mov eax, dword ptr [esp + 8]
100316F: mov ecx, dword ptr [esp + 4]
1003173: shl eax, 5
1003176: lea edx, [eax + ecx + 0x1005340]
100317D: mov al, byte ptr [edx]
100317F: xor ecx, ecx
1003181: mov cl, al
1003183: and ecx, 0x1f
1003186: cmp ecx, 0xd
1003189: jne 0x1003190
100318B: push 9
100318D: pop ecx
100318E: jmp 0x1003197
1003190: cmp ecx, 0xf
1003193: jne 0x1003197
1003195: xor ecx, ecx
1003197: and al, 0xe0
1003199: or al, cl
100319B: mov byte ptr [edx], al
100319D: ret 8

; ===== sub_10031A0 =====
10031A0: mov eax, dword ptr [esp + 8]
10031A4: mov ecx, dword ptr [esp + 4]
10031A8: shl eax, 5
10031AB: lea edx, [eax + ecx + 0x1005340]
10031B2: mov al, byte ptr [edx]
10031B4: xor ecx, ecx
10031B6: mov cl, al
10031B8: and ecx, 0x1f
10031BB: cmp ecx, 9
10031BE: jne 0x10031c4
10031C0: push 0xd
10031C2: jmp 0x10031ca
10031C4: test ecx, ecx
10031C6: jne 0x10031cb
10031C8: push 0xf
10031CA: pop ecx
10031CB: and al, 0xe0
10031CD: or al, cl
10031CF: mov byte ptr [edx], al
10031D1: ret 8

; ===== sub_10031D4 =====
10031D4: push ebp
10031D5: mov ebp, esp
10031D7: sub esp, 0x20
10031DA: mov edx, dword ptr [ebp + 8]
10031DD: mov eax, dword ptr [0x1005118]
10031E2: cmp edx, eax
10031E4: mov ecx, dword ptr [0x100511c]
10031EA: push edi
10031EB: mov edi, dword ptr [ebp + 0xc]
10031EE: jne 0x10031f8
10031F0: cmp edi, ecx
10031F2: je 0x1003417
10031F8: cmp dword ptr [0x1005144], 0
10031FF: push ebx
1003200: push esi
1003201: mov ebx, eax
1003203: mov esi, ecx
1003205: mov dword ptr [0x1005118], edx
100320B: mov dword ptr [0x100511c], edi
1003211: je 0x1003397
1003217: cmp dword ptr [ebp + 8], 0
100321B: mov edx, dword ptr [0x1005334]
1003221: mov eax, dword ptr [0x1005338]
1003226: jle 0x100323e
1003228: test edi, edi
100322A: jle 0x100323e
100322C: cmp dword ptr [ebp + 8], edx
100322F: jg 0x100323e
1003231: cmp edi, eax
1003233: jg 0x100323e
1003235: mov dword ptr [ebp - 0x18], 1
100323C: jmp 0x1003242
100323E: and dword ptr [ebp - 0x18], 0
1003242: test ebx, ebx
1003244: jle 0x100325b
1003246: test esi, esi
1003248: jle 0x100325b
100324A: cmp ebx, edx
100324C: jg 0x100325b
100324E: cmp esi, eax
1003250: jg 0x100325b
1003252: mov dword ptr [ebp - 0x14], 1
1003259: jmp 0x100325f
100325B: and dword ptr [ebp - 0x14], 0
100325F: lea ecx, [esi - 1]
1003262: cmp ecx, 1
1003265: mov dword ptr [ebp - 0xc], ecx
1003268: jg 0x1003271
100326A: mov dword ptr [ebp - 0xc], 1
1003271: lea ecx, [esi + 1]
1003274: cmp ecx, eax
1003276: mov dword ptr [ebp - 4], ecx
1003279: jl 0x100327e
100327B: mov dword ptr [ebp - 4], eax
100327E: xor esi, esi
1003280: lea ecx, [edi - 1]
1003283: inc esi
1003284: cmp ecx, esi
1003286: mov dword ptr [ebp - 0x1c], ecx
1003289: jg 0x100328e
100328B: mov dword ptr [ebp - 0x1c], esi
100328E: lea ecx, [edi + 1]
1003291: cmp ecx, eax
1003293: mov dword ptr [ebp - 8], ecx
1003296: jl 0x100329b
1003298: mov dword ptr [ebp - 8], eax
100329B: lea eax, [ebx - 1]
100329E: cmp eax, esi
10032A0: mov dword ptr [ebp - 0x10], eax
10032A3: jg 0x10032a8
10032A5: mov dword ptr [ebp - 0x10], esi
10032A8: lea eax, [ebx + 1]
10032AB: cmp eax, edx
10032AD: mov dword ptr [ebp + 0xc], eax
10032B0: jl 0x10032b5
10032B2: mov dword ptr [ebp + 0xc], edx
10032B5: mov ecx, dword ptr [ebp + 8]
10032B8: lea eax, [ecx - 1]
10032BB: cmp eax, esi
10032BD: mov dword ptr [ebp - 0x20], eax
10032C0: jg 0x10032c5
10032C2: mov dword ptr [ebp - 0x20], esi
10032C5: lea eax, [ecx + 1]
10032C8: cmp eax, edx
10032CA: mov dword ptr [ebp + 8], eax
10032CD: jl 0x10032d2
10032CF: mov dword ptr [ebp + 8], edx
10032D2: cmp dword ptr [ebp - 0x14], 0
10032D6: je 0x1003311
10032D8: mov ebx, dword ptr [ebp - 0xc]
10032DB: cmp ebx, dword ptr [ebp - 4]
10032DE: jg 0x1003311
10032E0: mov esi, ebx
10032E2: shl esi, 5
10032E5: add esi, 0x1005340
10032EB: mov edi, dword ptr [ebp - 0x10]
10032EE: mov eax, edi
10032F0: cmp eax, dword ptr [ebp + 0xc]
10032F3: jg 0x1003308
10032F5: test byte ptr [esi + edi], 0x40
10032F9: jne 0x1003302
10032FB: push ebx
10032FC: push edi
10032FD: call 0x10031a0
1003302: inc edi
1003303: cmp edi, dword ptr [ebp + 0xc]
1003306: jle 0x10032f5
1003308: inc ebx
1003309: add esi, 0x20
100330C: cmp ebx, dword ptr [ebp - 4]
100330F: jle 0x10032eb
1003311: cmp dword ptr [ebp - 0x18], 0
1003315: je 0x100334b
1003317: mov esi, dword ptr [ebp - 0x1c]
100331A: cmp esi, dword ptr [ebp - 8]
100331D: mov ebx, esi
100331F: jg 0x100334b
1003321: shl esi, 5
1003324: add esi, 0x1005340
100332A: mov edi, dword ptr [ebp - 0x20]
100332D: jmp 0x100333d
100332F: test byte ptr [esi + edi], 0x40
1003333: jne 0x100333c
1003335: push ebx
1003336: push edi
1003337: call 0x100316b
100333C: inc edi
100333D: cmp edi, dword ptr [ebp + 8]
1003340: jle 0x100332f
1003342: inc ebx
1003343: add esi, 0x20
1003346: cmp ebx, dword ptr [ebp - 8]
1003349: jle 0x100332a
100334B: cmp dword ptr [ebp - 0x14], 0
100334F: je 0x100336e
1003351: mov edi, dword ptr [ebp - 0xc]
1003354: jmp 0x1003369
1003356: mov esi, dword ptr [ebp - 0x10]
1003359: jmp 0x1003363
100335B: push edi
100335C: push esi
100335D: call 0x1002646
1003362: inc esi
1003363: cmp esi, dword ptr [ebp + 0xc]
1003366: jle 0x100335b
1003368: inc edi
1003369: cmp edi, dword ptr [ebp - 4]
100336C: jle 0x1003356
100336E: cmp dword ptr [ebp - 0x18], 0
1003372: je 0x1003415
1003378: mov edi, dword ptr [ebp - 0x1c]
100337B: jmp 0x1003390
100337D: mov esi, dword ptr [ebp - 0x20]
1003380: jmp 0x100338a
1003382: push edi
1003383: push esi
1003384: call 0x1002646
1003389: inc esi
100338A: cmp esi, dword ptr [ebp + 8]
100338D: jle 0x1003382
100338F: inc edi
1003390: cmp edi, dword ptr [ebp - 8]
1003393: jle 0x100337d
1003395: jmp 0x1003415
1003397: test ebx, ebx
1003399: jle 0x10033cf
100339B: test esi, esi
100339D: jle 0x10033cf
100339F: cmp ebx, dword ptr [0x1005334]
10033A5: jg 0x10033cf
10033A7: cmp esi, dword ptr [0x1005338]
10033AD: jg 0x10033cf
10033AF: mov eax, esi
10033B1: shl eax, 5
10033B4: test byte ptr [eax + ebx + 0x1005340], 0x40
10033BC: jne 0x10033cf
10033BE: push esi
10033BF: push ebx
10033C0: call 0x10031a0
10033C5: push esi
10033C6: push ebx
10033C7: call 0x1002646
10033CC: mov edx, dword ptr [ebp + 8]
10033CF: test edx, edx
10033D1: jle 0x1003415
10033D3: test edi, edi
10033D5: jle 0x1003415
10033D7: cmp edx, dword ptr [0x1005334]
10033DD: jg 0x1003415
10033DF: cmp edi, dword ptr [0x1005338]
10033E5: jg 0x1003415
10033E7: shl edi, 5
10033EA: mov al, byte ptr [edi + edx + 0x1005340]
10033F1: test al, 0x40
10033F3: jne 0x1003415
10033F5: and al, 0x1f
10033F7: cmp al, 0xe
10033F9: je 0x1003415
10033FB: mov edi, dword ptr [0x100511c]
1003401: mov esi, dword ptr [0x1005118]
1003407: push edi
1003408: push esi
1003409: call 0x100316b
100340E: push edi
100340F: push esi
1003410: call 0x1002646
1003415: pop esi
1003416: pop ebx
1003417: pop edi
1003418: leave 
1003419: ret 8

; ===== sub_100341C =====
100341C: call 0x10038d7
1003421: test byte ptr [0x1005000], 2
1003428: jne 0x1003434
100342A: mov eax, dword ptr [0x1005164]
100342F: mov dword ptr [0x1005168], eax
1003434: test byte ptr [0x1005000], 1
100343B: je 0x1003444
100343D: and dword ptr [0x1005164], 0
1003444: or dword ptr [0x1005000], 2
100344B: ret 

; ===== sub_100344C =====
100344C: test byte ptr [0x1005000], 1
1003453: je 0x100345f
1003455: mov eax, dword ptr [0x1005168]
100345A: mov dword ptr [0x1005164], eax
100345F: and dword ptr [0x1005000], 0xfd
1003469: ret 

; ===== sub_100346A =====
100346A: mov eax, dword ptr [esp + 4]
100346E: add dword ptr [0x1005194], eax
1003474: call 0x1002801
1003479: ret 4

; ===== sub_100347C =====
100347C: and dword ptr [0x1005164], 0
1003483: push esi
1003484: mov esi, dword ptr [esp + 8]
1003488: xor eax, eax
100348A: test esi, esi
100348C: setne al
100348F: inc eax
1003490: inc eax
1003491: push eax
1003492: mov dword ptr [0x1005160], eax
1003497: call 0x1002913
100349C: xor eax, eax
100349E: test esi, esi
10034A0: setne al
10034A3: lea eax, [eax*4 + 0xa]
10034AA: push eax
10034AB: call 0x1002f80
10034B0: test esi, esi
10034B2: je 0x10034c5
10034B4: mov eax, dword ptr [0x1005194]
10034B9: test eax, eax
10034BB: je 0x10034c5
10034BD: neg eax
10034BF: push eax
10034C0: call 0x100346a
10034C5: mov eax, esi
10034C7: neg eax
10034C9: sbb eax, eax
10034CB: add eax, 3
10034CE: push eax
10034CF: call 0x10038ed
10034D4: test esi, esi
10034D6: mov dword ptr [0x1005000], 0x10
10034E0: pop esi
10034E1: je 0x100350f
10034E3: mov ax, word ptr [0x10056a0]
10034E9: cmp ax, 3
10034ED: je 0x100350f
10034EF: mov ecx, dword ptr [0x100579c]
10034F5: movzx eax, ax
10034F8: lea eax, [eax*4 + 0x10056cc]
10034FF: cmp ecx, dword ptr [eax]
1003501: jge 0x100350f
1003503: mov dword ptr [eax], ecx
1003505: call 0x1001b81
100350A: call 0x1001baa
100350F: ret 4

; ===== sub_1003512 =====
1003512: mov eax, dword ptr [esp + 8]
1003516: push ebx
1003517: push ebp
1003518: push esi
1003519: mov esi, dword ptr [esp + 0x10]
100351D: mov ecx, eax
100351F: shl ecx, 5
1003522: lea edx, [ecx + esi + 0x1005340]
1003529: test byte ptr [edx], 0x80
100352C: push edi
100352D: je 0x1003595
100352F: cmp dword ptr [0x10057a4], 0
1003536: jne 0x1003588
1003538: mov ebp, dword ptr [0x1005338]
100353E: xor eax, eax
1003540: inc eax
1003541: cmp ebp, eax
1003543: jle 0x10035b0
1003545: mov ebx, dword ptr [0x1005334]
100354B: mov edi, 0x1005360
1003550: xor ecx, ecx
1003552: inc ecx
1003553: cmp ebx, ecx
1003555: jle 0x1003562
1003557: test byte ptr [edi + ecx], 0x80
100355B: je 0x100356c
100355D: inc ecx
100355E: cmp ecx, ebx
1003560: jl 0x1003557
1003562: inc eax
1003563: add edi, 0x20
1003566: cmp eax, ebp
1003568: jl 0x1003550
100356A: jmp 0x10035b0
100356C: push dword ptr [esp + 0x18]
1003570: shl eax, 5
1003573: lea eax, [eax + ecx + 0x1005340]
100357A: mov byte ptr [edx], 0xf
100357D: or byte ptr [eax], 0x80
1003580: push esi
1003581: call 0x1003084
1003586: jmp 0x10035b0
1003588: push 0x4c
100358A: push eax
100358B: push esi
100358C: call 0x1002eab
1003591: push 0
1003593: jmp 0x10035ab
1003595: push eax
1003596: push esi
1003597: call 0x1003084
100359C: mov eax, dword ptr [0x10057a4]
10035A1: cmp eax, dword ptr [0x10057a0]
10035A7: jne 0x10035b0
10035A9: push 1
10035AB: call 0x100347c
10035B0: pop edi
10035B1: pop esi
10035B2: pop ebp
10035B3: pop ebx
10035B4: ret 8

; ===== sub_10035B7 =====
10035B7: push ebp
10035B8: mov ebp, esp
10035BA: push ecx
10035BB: push ecx
10035BC: and dword ptr [ebp - 4], 0
10035C0: push ebx
10035C1: push esi
10035C2: mov esi, dword ptr [ebp + 8]
10035C5: push edi
10035C6: mov edi, dword ptr [ebp + 0xc]
10035C9: mov eax, edi
10035CB: shl eax, 5
10035CE: mov bl, byte ptr [eax + esi + 0x1005340]
10035D5: test bl, 0x40
10035D8: je 0x100366a
10035DE: push edi
10035DF: push esi
10035E0: call 0x1003119
10035E5: and ebx, 0x1f
10035E8: cmp ebx, eax
10035EA: jne 0x100366a
10035EC: lea ebx, [edi - 1]
10035EF: inc edi
10035F0: cmp ebx, edi
10035F2: mov dword ptr [ebp - 8], edi
10035F5: jg 0x1003654
10035F7: lea eax, [esi - 1]
10035FA: inc esi
10035FB: mov dword ptr [ebp + 0xc], esi
10035FE: mov esi, ebx
1003600: shl esi, 5
1003603: mov dword ptr [ebp + 8], eax
1003606: add esi, 0x1005340
100360C: mov edi, dword ptr [ebp + 8]
100360F: jmp 0x100363c
1003611: mov al, byte ptr [esi + edi]
1003614: mov cl, al
1003616: and cl, 0x1f
1003619: cmp cl, 0xe
100361C: je 0x1003634
100361E: test al, al
1003620: jns 0x1003634
1003622: push 0x4c
1003624: push ebx
1003625: push edi
1003626: mov dword ptr [ebp - 4], 1
100362D: call 0x1002eab
1003632: jmp 0x100363b
1003634: push ebx
1003635: push edi
1003636: call 0x1003084
100363B: inc edi
100363C: cmp edi, dword ptr [ebp + 0xc]
100363F: jle 0x1003611
1003641: inc ebx
1003642: add esi, 0x20
1003645: cmp ebx, dword ptr [ebp - 8]
1003648: jle 0x100360c
100364A: cmp dword ptr [ebp - 4], 0
100364E: je 0x1003654
1003650: push 0
1003652: jmp 0x1003663
1003654: mov eax, dword ptr [0x10057a4]
1003659: cmp eax, dword ptr [0x10057a0]
100365F: jne 0x1003673
1003661: push 1
1003663: call 0x100347c
1003668: jmp 0x1003673
100366A: push -2
100366C: push -2
100366E: call 0x10031d4
1003673: pop edi
1003674: pop esi
1003675: pop ebx
1003676: leave 
1003677: ret 8

; ===== sub_100367A =====
100367A: mov eax, dword ptr [0x10056ac]
100367F: mov ecx, dword ptr [0x10056a8]
1003685: push ebx
1003686: push esi
1003687: push edi
1003688: xor edi, edi
100368A: cmp eax, dword ptr [0x1005334]
1003690: mov dword ptr [0x1005164], edi
1003696: jne 0x10036a4
1003698: cmp ecx, dword ptr [0x1005338]
100369E: jne 0x10036a4
10036A0: push 4
10036A2: jmp 0x10036a6
10036A4: push 6
10036A6: pop ebx
10036A7: mov dword ptr [0x1005334], eax
10036AC: mov dword ptr [0x1005338], ecx
10036B2: call 0x1002ed5
10036B7: mov eax, dword ptr [0x10056a4]
10036BC: mov dword ptr [0x1005160], edi
10036C2: mov dword ptr [0x1005330], eax
10036C7: push dword ptr [0x1005334]
10036CD: call 0x1003940
10036D2: push dword ptr [0x1005338]
10036D8: mov esi, eax
10036DA: inc esi
10036DB: call 0x1003940
10036E0: inc eax
10036E1: mov ecx, eax
10036E3: shl ecx, 5
10036E6: test byte ptr [ecx + esi + 0x1005340], 0x80
10036EE: jne 0x10036c7
10036F0: shl eax, 5
10036F3: lea eax, [eax + esi + 0x1005340]
10036FA: or byte ptr [eax], 0x80
10036FD: dec dword ptr [0x1005330]
1003703: jne 0x10036c7
1003705: mov ecx, dword ptr [0x1005338]
100370B: imul ecx, dword ptr [0x1005334]
1003712: mov eax, dword ptr [0x10056a4]
1003717: sub ecx, eax
1003719: push edi
100371A: mov dword ptr [0x100579c], edi
1003720: mov dword ptr [0x1005330], eax
1003725: mov dword ptr [0x1005194], eax
100372A: mov dword ptr [0x10057a4], edi
1003730: mov dword ptr [0x10057a0], ecx
1003736: mov dword ptr [0x1005000], 1
1003740: call 0x100346a
1003745: push ebx
1003746: call 0x1001950
100374B: pop edi
100374C: pop esi
100374D: pop ebx
100374E: ret 

; ===== sub_10037E1 =====
10037E1: mov eax, dword ptr [0x1005118]
10037E6: test eax, eax
10037E8: jle 0x10038b6
10037EE: mov ecx, dword ptr [0x100511c]
10037F4: test ecx, ecx
10037F6: jle 0x10038b6
10037FC: cmp eax, dword ptr [0x1005334]
1003802: jg 0x10038b6
1003808: cmp ecx, dword ptr [0x1005338]
100380E: jg 0x10038b6
1003814: push ebx
1003815: xor ebx, ebx
1003817: inc ebx
1003818: cmp dword ptr [0x10057a4], 0
100381F: jne 0x100386b
1003821: cmp dword ptr [0x100579c], 0
1003828: jne 0x100386b
100382A: push ebx
100382B: call 0x10038ed
1003830: inc dword ptr [0x100579c]
1003836: call 0x10028b5
100383B: push 0
100383D: push 0x3e8
1003842: push ebx
1003843: push dword ptr [0x1005b24]
1003849: mov dword ptr [0x1005164], ebx
100384F: call dword ptr [USER32!SetTimer]
1003855: test eax, eax
1003857: jne 0x1003860
1003859: push 4
100385B: call 0x1003950
1003860: mov eax, dword ptr [0x1005118]
1003865: mov ecx, dword ptr [0x100511c]
100386B: test byte ptr [0x1005000], bl
1003871: pop ebx
1003872: jne 0x1003884
1003874: push -2
1003876: pop ecx
1003877: mov eax, ecx
1003879: mov dword ptr [0x100511c], ecx
100387F: mov dword ptr [0x1005118], eax
1003884: cmp dword ptr [0x1005144], 0
100388B: je 0x1003896
100388D: push ecx
100388E: push eax
100388F: call 0x10035b7
1003894: jmp 0x10038b6
1003896: mov edx, ecx
1003898: shl edx, 5
100389B: mov dl, byte ptr [edx + eax + 0x1005340]
10038A2: test dl, 0x40
10038A5: jne 0x10038b6
10038A7: and dl, 0x1f
10038AA: cmp dl, 0xe
10038AD: je 0x10038b6
10038AF: push ecx
10038B0: push eax
10038B1: call 0x1003512
10038B6: push dword ptr [0x1005160]
10038BC: call 0x1002913
10038C1: ret 

; ===== sub_10038C2 =====
10038C2: push 0x40
10038C4: push 0
10038C6: push 0
10038C8: call dword ptr [WINMM!PlaySoundW]
10038CE: neg eax
10038D0: sbb eax, eax
10038D2: neg eax
10038D4: inc eax
10038D5: inc eax
10038D6: ret 

; ===== sub_10038D7 =====
10038D7: cmp dword ptr [0x10056b8], 3
10038DE: jne 0x10038ec
10038E0: push 0x40
10038E2: push 0
10038E4: push 0
10038E6: call dword ptr [WINMM!PlaySoundW]
10038EC: ret 

; ===== sub_10038ED =====
10038ED: cmp dword ptr [0x10056b8], 3
10038F4: jne 0x100393d
10038F6: mov eax, dword ptr [esp + 4]
10038FA: dec eax
10038FB: je 0x1003927
10038FD: dec eax
10038FE: je 0x1003915
1003900: dec eax
1003901: jne 0x100393d
1003903: push 0x40005
1003908: push dword ptr [0x1005b30]
100390E: push 0x1b2
1003913: jmp 0x1003937
1003915: push 0x40005
100391A: push dword ptr [0x1005b30]
1003920: push 0x1b1
1003925: jmp 0x1003937
1003927: push 0x40005
100392C: push dword ptr [0x1005b30]
1003932: push 0x1b0
1003937: call dword ptr [WINMM!PlaySoundW]
100393D: ret 4

; ===== sub_1003940 =====
1003940: call dword ptr [msvcrt!rand]
1003946: cdq 
1003947: idiv dword ptr [esp + 4]
100394B: mov eax, edx
100394D: ret 4

; ===== sub_1003950 =====
1003950: push ebp
1003951: mov ebp, esp
1003953: sub esp, 0x200
1003959: cmp word ptr [ebp + 8], 0x3e7
100395F: push 0x80
1003964: jae 0x1003980
1003966: lea eax, [ebp - 0x200]
100396C: push eax
100396D: movzx eax, word ptr [ebp + 8]
1003971: push eax
1003972: push dword ptr [0x1005b30]
1003978: call dword ptr [USER32!LoadStringW]
100397E: jmp 0x10039b1
1003980: lea eax, [ebp - 0x100]
1003986: push eax
1003987: push 6
1003989: push dword ptr [0x1005b30]
100398F: call dword ptr [USER32!LoadStringW]
1003995: movzx eax, word ptr [ebp + 8]
1003999: push eax
100399A: lea eax, [ebp - 0x100]
10039A0: push eax
10039A1: lea eax, [ebp - 0x200]
10039A7: push eax
10039A8: call dword ptr [USER32!wsprintfW]
10039AE: add esp, 0xc
10039B1: push 0x80
10039B6: lea eax, [ebp - 0x100]
10039BC: push eax
10039BD: push 3
10039BF: push dword ptr [0x1005b30]
10039C5: call dword ptr [USER32!LoadStringW]
10039CB: push 0x10
10039CD: lea eax, [ebp - 0x100]
10039D3: push eax
10039D4: lea eax, [ebp - 0x200]
10039DA: push eax
10039DB: push 0
10039DD: call dword ptr [USER32!MessageBoxW]
10039E3: leave 
10039E4: ret 4

; ===== sub_10039E7 =====
10039E7: push dword ptr [esp + 0xc]
10039EB: movzx eax, word ptr [esp + 8]
10039F0: push dword ptr [esp + 0xc]
10039F4: push eax
10039F5: push dword ptr [0x1005b30]
10039FB: call dword ptr [USER32!LoadStringW]
1003A01: test eax, eax
1003A03: jne 0x1003a0f
1003A05: push 0x3e9
1003A0A: call 0x1003950
1003A0F: ret 0xc

; ===== sub_1003A12 =====
1003A12: push ebp
1003A13: mov ebp, esp
1003A15: mov eax, dword ptr [ebp + 8]
1003A18: push ebx
1003A19: push esi
1003A1A: mov esi, dword ptr [KERNEL32!GetPrivateProfileIntW]
1003A20: push edi
1003A21: mov ebx, 0x1005120
1003A26: push ebx
1003A27: push dword ptr [ebp + 0xc]
1003A2A: lea eax, [eax*4 + 0x10050d0]
1003A31: push dword ptr [eax]
1003A33: mov edi, 0x1005aa0
1003A38: push edi
1003A39: mov dword ptr [ebp + 8], eax
1003A3C: call esi
1003A3E: cmp dword ptr [ebp + 0x14], eax
1003A41: jge 0x1003a48
1003A43: mov eax, dword ptr [ebp + 0x14]
1003A46: jmp 0x1003a54
1003A48: mov eax, dword ptr [ebp + 8]
1003A4B: push ebx
1003A4C: push dword ptr [ebp + 0xc]
1003A4F: push dword ptr [eax]
1003A51: push edi
1003A52: call esi
1003A54: cmp dword ptr [ebp + 0x10], eax
1003A57: jle 0x1003a5e
1003A59: mov eax, dword ptr [ebp + 0x10]
1003A5C: jmp 0x1003a80
1003A5E: mov eax, dword ptr [ebp + 8]
1003A61: push ebx
1003A62: push dword ptr [ebp + 0xc]
1003A65: push dword ptr [eax]
1003A67: push edi
1003A68: call esi
1003A6A: cmp dword ptr [ebp + 0x14], eax
1003A6D: jge 0x1003a74
1003A6F: mov eax, dword ptr [ebp + 0x14]
1003A72: jmp 0x1003a80
1003A74: mov eax, dword ptr [ebp + 8]
1003A77: push ebx
1003A78: push dword ptr [ebp + 0xc]
1003A7B: push dword ptr [eax]
1003A7D: push edi
1003A7E: call esi
1003A80: pop edi
1003A81: pop esi
1003A82: pop ebx
1003A83: pop ebp
1003A84: ret 0x10

; ===== sub_1003A87 =====
1003A87: mov eax, dword ptr [esp + 4]
1003A8B: push 0x1005120
1003A90: push 0x20
1003A92: push dword ptr [esp + 0x10]
1003A96: push 0x1005b40
1003A9B: push dword ptr [eax*4 + 0x10050d0]
1003AA2: push 0x1005aa0
1003AA7: call dword ptr [KERNEL32!GetPrivateProfileStringW]
1003AAD: ret 8

; ===== sub_1003AB0 =====
1003AB0: push ecx
1003AB1: push ebp
1003AB2: push esi
1003AB3: push edi
1003AB4: call dword ptr [KERNEL32!GetTickCount]
1003ABA: movzx eax, ax
1003ABD: push eax
1003ABE: call dword ptr [msvcrt!srand]
1003AC4: pop ecx
1003AC5: push 0x20
1003AC7: xor ebp, ebp
1003AC9: push 0x1005aa0
1003ACE: inc ebp
1003ACF: push ebp
1003AD0: call 0x10039e7
1003AD5: push 0x20
1003AD7: push 0x1005ae0
1003ADC: push 7
1003ADE: call 0x10039e7
1003AE3: push 0x20
1003AE5: push 0x1005b40
1003AEA: push 8
1003AEC: call 0x10039e7
1003AF1: mov esi, dword ptr [USER32!GetSystemMetrics]
1003AF7: push 4
1003AF9: call esi
1003AFB: inc eax
1003AFC: push 0xf
1003AFE: mov dword ptr [0x1005b80], eax
1003B03: call esi
1003B05: inc eax
1003B06: push 6
1003B08: mov dword ptr [0x1005b34], eax
1003B0D: call esi
1003B0F: inc eax
1003B10: push 5
1003B12: mov dword ptr [0x1005b84], eax
1003B17: call esi
1003B19: inc eax
1003B1A: mov dword ptr [0x1005a90], eax
1003B1F: lea eax, [esp + 0xc]
1003B23: push eax
1003B24: push 0x1005950
1003B29: xor edi, edi
1003B2B: push edi
1003B2C: push 0x20019
1003B31: push edi
1003B32: push edi
1003B33: push edi
1003B34: push 0x1001340
1003B39: push 0x80000001
1003B3E: call dword ptr [ADVAPI32!RegCreateKeyExW]
1003B44: test eax, eax
1003B46: jne 0x1003b68
1003B48: push ebp
1003B49: push edi
1003B4A: push edi
1003B4B: push 0x11
1003B4D: call 0x1002b27
1003B52: push dword ptr [0x1005950]
1003B58: mov esi, eax
1003B5A: call dword ptr [ADVAPI32!RegCloseKey]
1003B60: cmp esi, edi
1003B62: jne 0x1003cbf
1003B68: push ebx
1003B69: push 0x19
1003B6B: push 9
1003B6D: pop esi
1003B6E: push esi
1003B6F: push esi
1003B70: push 2
1003B72: call 0x1003a12
1003B77: push 0x1e
1003B79: push esi
1003B7A: push esi
1003B7B: push 3
1003B7D: mov dword ptr [0x10056a8], eax
1003B82: call 0x1003a12
1003B87: push 3
1003B89: push edi
1003B8A: push edi
1003B8B: push edi
1003B8C: mov dword ptr [0x10056ac], eax
1003B91: call 0x1003a12
1003B96: mov esi, 0x3e7
1003B9B: push esi
1003B9C: push 0xa
1003B9E: push 0xa
1003BA0: push ebp
1003BA1: mov word ptr [0x10056a0], ax
1003BA7: call 0x1003a12
1003BAC: mov ebx, 0x400
1003BB1: push ebx
1003BB2: push edi
1003BB3: push 0x50
1003BB5: push 4
1003BB7: mov dword ptr [0x10056a4], eax
1003BBC: call 0x1003a12
1003BC1: push ebx
1003BC2: push edi
1003BC3: push 0x50
1003BC5: push 5
1003BC7: mov dword ptr [0x10056b0], eax
1003BCC: call 0x1003a12
1003BD1: push 3
1003BD3: push edi
1003BD4: push edi
1003BD5: push 6
1003BD7: mov dword ptr [0x10056b4], eax
1003BDC: call 0x1003a12
1003BE1: push ebp
1003BE2: push edi
1003BE3: push ebp
1003BE4: push 7
1003BE6: mov dword ptr [0x10056b8], eax
1003BEB: call 0x1003a12
1003BF0: push ebp
1003BF1: push edi
1003BF2: push edi
1003BF3: push 9
1003BF5: mov dword ptr [0x10056bc], eax
1003BFA: call 0x1003a12
1003BFF: push 2
1003C01: push edi
1003C02: push edi
1003C03: push 8
1003C05: mov dword ptr [0x10056c0], eax
1003C0A: call 0x1003a12
1003C0F: push esi
1003C10: push edi
1003C11: push esi
1003C12: push 0xb
1003C14: mov dword ptr [0x10056c4], eax
1003C19: call 0x1003a12
1003C1E: push esi
1003C1F: push edi
1003C20: push esi
1003C21: push 0xd
1003C23: mov dword ptr [0x10056cc], eax
1003C28: call 0x1003a12
1003C2D: push esi
1003C2E: push edi
1003C2F: push esi
1003C30: mov dword ptr [0x10056d0], eax
1003C35: push 0xf
1003C37: call 0x1003a12
1003C3C: push 0x10056d8
1003C41: push 0xc
1003C43: mov dword ptr [0x10056d4], eax
1003C48: call 0x1003a87
1003C4D: push 0x1005718
1003C52: push 0xe
1003C54: call 0x1003a87
1003C59: push 0x1005758
1003C5E: push 0x10
1003C60: call 0x1003a87
1003C65: mov esi, dword ptr [USER32!GetDesktopWindow]
1003C6B: call esi
1003C6D: push eax
1003C6E: call dword ptr [USER32!GetDC]
1003C74: push ebp
1003C75: push edi
1003C76: mov ebx, eax
1003C78: push 0x18
1003C7A: push ebx
1003C7B: call dword ptr [GDI32!GetDeviceCaps]
1003C81: xor ecx, ecx
1003C83: cmp eax, 2
1003C86: setne cl
1003C89: push ecx
1003C8A: push 0xa
1003C8C: call 0x1003a12
1003C91: push ebx
1003C92: mov dword ptr [0x10056c8], eax
1003C97: call esi
1003C99: push eax
1003C9A: call dword ptr [USER32!ReleaseDC]
1003CA0: cmp dword ptr [0x10056b8], 3
1003CA7: pop ebx
1003CA8: jne 0x1003cb4
1003CAA: call 0x10038c2
1003CAF: mov dword ptr [0x10056b8], eax
1003CB4: pop edi
1003CB5: pop esi
1003CB6: pop ebp
1003CB7: add esp, 4
1003CBA: jmp 0x1002dab
1003CBF: pop edi
1003CC0: pop esi
1003CC1: pop ebp
1003CC2: pop ecx
1003CC3: ret 

; ===== sub_1003CC4 =====
1003CC4: mov eax, dword ptr [esp + 8]
1003CC8: neg eax
1003CCA: sbb eax, eax
1003CCC: and eax, 8
1003CCF: push eax
1003CD0: movzx eax, word ptr [esp + 8]
1003CD5: push eax
1003CD6: push dword ptr [0x1005a94]
1003CDC: call dword ptr [USER32!CheckMenuItem]
1003CE2: ret 8

; ===== sub_1003CE5 =====
1003CE5: mov eax, dword ptr [esp + 4]
1003CE9: mov dword ptr [0x10056c4], eax
1003CEE: call 0x1001516
1003CF3: mov eax, dword ptr [0x10056c4]
1003CF8: and al, 1
1003CFA: neg al
1003CFC: sbb eax, eax
1003CFE: not eax
1003D00: and eax, dword ptr [0x1005a94]
1003D06: push eax
1003D07: push dword ptr [0x1005b24]
1003D0D: call dword ptr [USER32!SetMenu]
1003D13: push 2
1003D15: call 0x1001950
1003D1A: ret 4

; ===== sub_1003D1D =====
1003D1D: push ebp
1003D1E: mov ebp, esp
1003D20: sub esp, 0x200
1003D26: push esi
1003D27: mov esi, 0x80
1003D2C: push esi
1003D2D: lea eax, [ebp - 0x200]
1003D33: push eax
1003D34: push 0xc
1003D36: call 0x10039e7
1003D3B: push esi
1003D3C: lea eax, [ebp - 0x100]
1003D42: push eax
1003D43: push 0xd
1003D45: call 0x10039e7
1003D4A: push 0x64
1003D4C: push dword ptr [0x1005b30]
1003D52: call dword ptr [USER32!LoadIconW]
1003D58: push eax
1003D59: lea eax, [ebp - 0x100]
1003D5F: push eax
1003D60: lea eax, [ebp - 0x200]
1003D66: push eax
1003D67: push dword ptr [0x1005b24]
1003D6D: call dword ptr [SHELL32!ShellAboutW]
1003D73: pop esi
1003D74: leave 
1003D75: ret 

; ===== sub_1003D76 =====
1003D76: push ebp
1003D77: mov ebp, esp
1003D79: sub esp, 0xfc
1003D7F: cmp word ptr [ebp + 8], 4
1003D84: push esi
1003D85: push edi
1003D86: je 0x1003dc8
1003D88: push 0xfa
1003D8D: lea eax, [ebp - 0xfc]
1003D93: push eax
1003D94: push dword ptr [0x1005b30]
1003D9A: call dword ptr [KERNEL32!GetModuleFileNameA]
1003DA0: lea edi, [ebp + eax - 0xfd]
1003DA7: mov eax, edi
1003DA9: lea ecx, [ebp - 0xfc]
1003DAF: sub eax, ecx
1003DB1: cmp eax, 4
1003DB4: jle 0x1003dc0
1003DB6: lea eax, [edi - 3]
1003DB9: cmp byte ptr [eax], 0x2e
1003DBC: jne 0x1003dc0
1003DBE: mov edi, eax
1003DC0: mov esi, 0x1001384
1003DC5: movsd dword ptr es:[edi], dword ptr [esi]
1003DC6: jmp 0x1003dd7
1003DC8: mov esi, 0x1001378
1003DCD: lea edi, [ebp - 0xfc]
1003DD3: movsd dword ptr es:[edi], dword ptr [esi]
1003DD4: movsd dword ptr es:[edi], dword ptr [esi]
1003DD5: movsw word ptr es:[edi], word ptr [esi]
1003DD7: push 0
1003DD9: push dword ptr [ebp + 0xc]
1003DDC: lea eax, [ebp - 0xfc]
1003DE2: push eax
1003DE3: movsb byte ptr es:[edi], byte ptr [esi]
1003DE4: call dword ptr [USER32!GetDesktopWindow]
1003DEA: push eax
1003DEB: call 0x1004062
1003DF0: pop edi
1003DF1: pop esi
1003DF2: leave 
1003DF3: ret 8

; ===== sub_1003E21 =====
1003E21: push 0x70
1003E23: push 0x1001390
1003E28: call 0x100400c
1003E2D: xor ebx, ebx
1003E2F: push ebx
1003E30: mov edi, dword ptr [KERNEL32!GetModuleHandleA]
1003E36: call edi
1003E38: cmp word ptr [eax], 0x5a4d
1003E3D: jne 0x1003e5e
1003E3F: mov ecx, dword ptr [eax + 0x3c]
1003E42: add ecx, eax
1003E44: cmp dword ptr [ecx], 0x4550
1003E4A: jne 0x1003e5e
1003E4C: movzx eax, word ptr [ecx + 0x18]
1003E50: cmp eax, 0x10b
1003E55: je 0x1003e76
1003E57: cmp eax, 0x20b
1003E5C: je 0x1003e63
1003E5E: mov dword ptr [ebp - 0x1c], ebx
1003E61: jmp 0x1003e8a
1003E63: cmp dword ptr [ecx + 0x84], 0xe
1003E6A: jbe 0x1003e5e
1003E6C: xor eax, eax
1003E6E: cmp dword ptr [ecx + 0xf8], ebx
1003E74: jmp 0x1003e84
1003E76: cmp dword ptr [ecx + 0x74], 0xe
1003E7A: jbe 0x1003e5e
1003E7C: xor eax, eax
1003E7E: cmp dword ptr [ecx + 0xe8], ebx
1003E84: setne al
1003E87: mov dword ptr [ebp - 0x1c], eax
1003E8A: mov dword ptr [ebp - 4], ebx
1003E8D: push 2
1003E8F: call dword ptr [msvcrt!__set_app_type]
1003E95: pop ecx
1003E96: or dword ptr [0x1005b8c], 0xffffffff
1003E9D: or dword ptr [0x1005b90], 0xffffffff
1003EA4: call dword ptr [msvcrt!__p__fmode]
1003EAA: mov ecx, dword ptr [0x1005178]
1003EB0: mov dword ptr [eax], ecx
1003EB2: call dword ptr [msvcrt!__p__commode]
1003EB8: mov ecx, dword ptr [0x1005174]
1003EBE: mov dword ptr [eax], ecx
1003EC0: mov eax, dword ptr [msvcrt!_adjust_fdiv]
1003EC5: mov eax, dword ptr [eax]
1003EC7: mov dword ptr [0x1005b94], eax
1003ECC: call 0x1004006
1003ED1: cmp dword ptr [0x1005138], ebx
1003ED7: jne 0x1003ee5
1003ED9: push 0x1004006
1003EDE: call dword ptr [msvcrt!__setusermatherr]
1003EE4: pop ecx
1003EE5: call 0x1003ff4
1003EEA: push 0x10011c4
1003EEF: push 0x10011c0
1003EF4: call 0x1003fee
1003EF9: mov eax, dword ptr [0x1005170]
1003EFE: mov dword ptr [ebp - 0x20], eax
1003F01: lea eax, [ebp - 0x20]
1003F04: push eax
1003F05: push dword ptr [0x100516c]
1003F0B: lea eax, [ebp - 0x24]
1003F0E: push eax
1003F0F: lea eax, [ebp - 0x28]
1003F12: push eax
1003F13: lea eax, [ebp - 0x2c]
1003F16: push eax
1003F17: call dword ptr [msvcrt!__getmainargs]
1003F1D: mov dword ptr [ebp - 0x30], eax
1003F20: push 0x10011bc
1003F25: push 0x10011b8
1003F2A: call 0x1003fee
1003F2F: add esp, 0x24
1003F32: mov eax, dword ptr [msvcrt!_acmdln]
1003F37: mov esi, dword ptr [eax]
1003F39: mov dword ptr [ebp - 0x34], esi
1003F3C: cmp byte ptr [esi], 0x22
1003F3F: jne 0x1003f7b
1003F41: inc esi
1003F42: mov dword ptr [ebp - 0x34], esi
1003F45: mov al, byte ptr [esi]
1003F47: cmp al, bl
1003F49: je 0x1003f4f
1003F4B: cmp al, 0x22
1003F4D: jne 0x1003f41
1003F4F: cmp byte ptr [esi], 0x22
1003F52: jne 0x1003f58
1003F54: inc esi
1003F55: mov dword ptr [ebp - 0x34], esi
1003F58: mov al, byte ptr [esi]
1003F5A: cmp al, bl
1003F5C: je 0x1003f62
1003F5E: cmp al, 0x20
1003F60: jbe 0x1003f54
1003F62: mov dword ptr [ebp - 0x4c], ebx
1003F65: lea eax, [ebp - 0x78]
1003F68: push eax
1003F69: call dword ptr [KERNEL32!GetStartupInfoA]
1003F6F: test byte ptr [ebp - 0x4c], 1
1003F73: je 0x1003f86
1003F75: movzx eax, word ptr [ebp - 0x48]
1003F79: jmp 0x1003f89
1003F7B: cmp byte ptr [esi], 0x20
1003F7E: jbe 0x1003f58
1003F80: inc esi
1003F81: mov dword ptr [ebp - 0x34], esi
1003F84: jmp 0x1003f7b
1003F86: push 0xa
1003F88: pop eax
1003F89: push eax
1003F8A: push esi
1003F8B: push ebx
1003F8C: push ebx
1003F8D: call edi
1003F8F: push eax
1003F90: call 0x10021f0
1003F95: mov esi, eax
1003F97: mov dword ptr [ebp - 0x7c], esi
1003F9A: cmp dword ptr [ebp - 0x1c], ebx
1003F9D: jne 0x1003fa6
1003F9F: push esi
1003FA0: call dword ptr [msvcrt!exit]
1003FA6: call dword ptr [msvcrt!_cexit]
1003FAC: jmp 0x1003fdb
1003FDB: or dword ptr [ebp - 4], 0xffffffff
1003FDF: mov eax, esi
1003FE1: call 0x1004045
1003FE6: ret 

; ===== sub_1003FEE =====
1003FEE: jmp dword ptr [msvcrt!_initterm]

; ===== sub_1003FF4 =====
1003FF4: push 0x30000
1003FF9: push 0x10000
1003FFE: call 0x1004056
1004003: pop ecx
1004004: pop ecx
1004005: ret 

; ===== sub_1004006 =====
1004006: xor eax, eax
1004008: ret 

; ===== sub_100400C =====
100400C: push 0x100405c
1004011: mov eax, dword ptr fs:[0]
1004017: push eax
1004018: mov dword ptr fs:[0], esp
100401F: mov eax, dword ptr [esp + 0x10]
1004023: mov dword ptr [esp + 0x10], ebp
1004027: lea ebp, [esp + 0x10]
100402B: sub esp, eax
100402D: push ebx
100402E: push esi
100402F: push edi
1004030: mov eax, dword ptr [ebp - 8]
1004033: mov dword ptr [ebp - 0x18], esp
1004036: push eax
1004037: mov eax, dword ptr [ebp - 4]
100403A: mov dword ptr [ebp - 4], 0xffffffff
1004041: mov dword ptr [ebp - 8], eax
1004044: ret 

; ===== sub_1004045 =====
1004045: mov ecx, dword ptr [ebp - 0x10]
1004048: mov dword ptr fs:[0], ecx
100404F: pop ecx
1004050: pop edi
1004051: pop esi
1004052: pop ebx
1004053: leave 
1004054: push ecx
1004055: ret 

; ===== sub_1004056 =====
1004056: jmp dword ptr [msvcrt!_controlfp]

; ===== sub_100405C =====
100405C: jmp dword ptr [msvcrt!_except_handler3]

; ===== sub_1004062 =====
1004062: push ebp
1004063: mov ebp, esp
1004065: sub esp, 0x104
100406B: mov ecx, dword ptr [0x1005180]
1004071: push esi
1004072: test ecx, ecx
1004074: jne 0x10040bf
1004076: cmp dword ptr [0x1005188], ecx
100407C: jne 0x10040bf
100407E: lea eax, [ebp - 0x104]
1004084: push eax
1004085: call 0x10040fb
100408A: mov esi, dword ptr [KERNEL32!LoadLibraryA]
1004090: test eax, eax
1004092: je 0x10040a2
1004094: lea eax, [ebp - 0x104]
100409A: push eax
100409B: call esi
100409D: mov dword ptr [0x1005180], eax
10040A2: mov ecx, dword ptr [0x1005180]
10040A8: test ecx, ecx
10040AA: jne 0x10040bf
10040AC: push 0x10013a0
10040B1: call esi
10040B3: mov ecx, eax
10040B5: test ecx, ecx
10040B7: mov dword ptr [0x1005180], ecx
10040BD: je 0x10040da
10040BF: mov eax, dword ptr [0x1005190]
10040C4: test eax, eax
10040C6: jne 0x10040e8
10040C8: push 0xe
10040CA: push ecx
10040CB: call dword ptr [KERNEL32!GetProcAddress]
10040D1: test eax, eax
10040D3: mov dword ptr [0x1005190], eax
10040D8: jne 0x10040e8
10040DA: mov dword ptr [0x1005188], 1
10040E4: xor eax, eax
10040E6: jmp 0x10040f6
10040E8: push dword ptr [ebp + 0x14]
10040EB: push dword ptr [ebp + 0x10]
10040EE: push dword ptr [ebp + 0xc]
10040F1: push dword ptr [ebp + 8]
10040F4: call eax
10040F6: pop esi
10040F7: leave 
10040F8: ret 0x10

; ===== sub_10040FB =====
10040FB: push ebp
10040FC: mov ebp, esp
10040FE: push ecx
10040FF: push ecx
1004100: lea eax, [ebp - 4]
1004103: push esi
1004104: xor esi, esi
1004106: push eax
1004107: push 0x20019
100410C: push esi
100410D: push 0x10013b0
1004112: push 0x80000000
1004117: call dword ptr [ADVAPI32!RegOpenKeyExA]
100411D: test eax, eax
100411F: jne 0x1004153
1004121: lea eax, [ebp - 8]
1004124: mov dword ptr [ebp - 8], 0x104
100412B: push eax
100412C: push dword ptr [ebp + 8]
100412F: push esi
1004130: push esi
1004131: push 0x10013ec
1004136: push dword ptr [ebp - 4]
1004139: call dword ptr [ADVAPI32!RegQueryValueExA]
100413F: test eax, eax
1004141: jne 0x1004146
1004143: push 1
1004145: pop esi
1004146: push dword ptr [ebp - 4]
1004149: call dword ptr [ADVAPI32!RegCloseKey]
100414F: mov eax, esi
1004151: jmp 0x1004155
1004153: xor eax, eax
1004155: pop esi
1004156: leave 
1004157: ret 4
