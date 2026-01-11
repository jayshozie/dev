if [[ -f 'cbench.sh' ]]; then
    bash './cbench.sh'
    echo
    echo '[bench] Done.'
    echo
elif [[ -f 'bench.sh' ]]; then
    bash './bench.sh'
    echo
    echo '[bench] Done.'
    echo
elif [[ -f 'bench' ]]; then
    bash './bench'
    echo
    echo '[bench] Done.'
    echo
else
    echo
    echo "[bench] No auto compiler at $(pwd)"
    echo
fi
