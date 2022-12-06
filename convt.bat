setlocal enabledelayedexpansion

echo [32m Please put your .bnk files in the bnk folder [0m

if not exist bnk (md bnk)

set /a cnt=0
for %%b in (bnk\*.bnk) do (
	echo [32m %%b found [0m
	set /a cnt+=1
	set m=%%b
	set n=!m:~0,-4!

	if not exist !n! (
		bnkextr.exe %%b
		for %%f in (!n!\*.wem) do ww2ogg.exe %%f --pcb packed_codebooks_aoTuV_603.bin
		for %%f in (!n!\*.ogg) do revorb.exe %%f
	)
	
	for %%f in (!n!\*.wem) do del %%f
)

if !cnt! equ 0 (echo [31m Not any .bnk file found! [0m)
