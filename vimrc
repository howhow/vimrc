" ~/.vimrc (configuration file for vim only)
" skeletons
function! SKEL_spec()
	0r /usr/share/vim/current/skeletons/skeleton.spec
	language time en_US
	if $USER != ''
	    let login = $USER
	elseif $LOGNAME != ''
	    let login = $LOGNAME
	else
	    let login = 'unknown'
	endif
	let newline = stridx(login, "\n")
	if newline != -1
	    let login = strpart(login, 0, newline)
	endif
	if $HOSTNAME != ''
	    let hostname = $HOSTNAME
	else
	    let hostname = system('hostname -f')
	    if v:shell_error
		let hostname = 'localhost'
	    endif
	endif
	let newline = stridx(hostname, "\n")
	if newline != -1
	    let hostname = strpart(hostname, 0, newline)
	endif
	exe "%s/specRPM_CREATION_DATE/" . strftime("%a\ %b\ %d\ %Y") . "/ge"
	exe "%s/specRPM_CREATION_AUTHOR_MAIL/" . login . "@" . hostname . "/ge"
	exe "%s/specRPM_CREATION_NAME/" . expand("%:t:r") . "/ge"
	setf spec
endfunction
"autocmd BufNewFile	*.spec	call SKEL_spec()

" filetypes
filetype plugin on
filetype indent on

if has("cscope")
	set csprg=/usr/bin/cscope
	set csto=0
	set cst
	set nocsverb
	" add any database in current directory
if filereadable("cscope.out")
cs add cscope.out
" else add database pointed to by environment
elseif $CSCOPE_DB != ""
	 cs add $CSCOPE_DB
endif
	 set csverb
	 set cscopetag
	 set cscopequickfix=s-,g-,c-,d-,t-,e-,f-,i-
endif

" self config
set nocompatible
set number
set ruler
set incsearch
set hlsearch
set tabstop=4
set shiftwidth=4
set mouse=a
"set fo-=r
set showmatch
set matchtime=2
set fileencodings=utf-8,gbk
set cursorline

"set list
"set listchars=tab:\|\,trail:.,extends:>,precedes:<,eol:$
"set listchars=tab:\|.

" tags set
let Tlist_File_Fold_Auto_Close=1
let Tlist_Auto_Open=1
let Tlist_Exit_OnlyWindow=1
nmap <F2> :TlistToggle<CR>

set tags=/home/how/work/cStudy/thinking/trunk/tags,./tags,../tags,../../tags

" NERD
let NERDTreeWinPos='Right'
let NERDTreeMouseMode=2
nmap <F3> :NERDTreeToggle<CR>

" TAB
nmap <F5> :tabprevious<CR>
nmap <F6> :tabnext<CR>

menu 10.340 &File.&Save<Tab>:w :confirm w<CR>

" ~/.vimrc ends here
