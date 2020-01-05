
fu! s:a1()
py << EOF

{{{
ll
au buf
au! BufWritePost
au BufWritePost
au BufWritePost *nrun.vim so %
au BufWritePost *xx.vim so %
echo x

nn qr :<C-U>call nrun#runbash(line('.'),v:count1)<CR>
nn qr :<C-U>call run#runbash(line('.'),v:count1)<CR>

exec '!' . './xx.sh'
exec '!' . shellescape('./xx.sh')
fu nrun#runbash
fu nrun#writelines
echo g:run
call nrun#runbash(line('.'),1)
call job_start('/cygdrive/e/nnotes/dev/rc/xx.sh')

/cygdrive/e/notes/.bvimbrc
ll run
ll
gi

set dictionary
setl dictionary=/cygdrive/e/nnotes/dev/rc/dict-vim

      --format=WORD          across -x, commas -m, horizontal -x, long -l,
                               single-column -1, verbose -l, vertical -C
echo fnamemodify
}}}
EOF
endfu


















