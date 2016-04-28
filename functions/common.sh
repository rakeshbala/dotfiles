function platform_get()
{
    local ostype=$(uname -s)
    if [[ "$ostype" == "Darwin" ]]; then
        ostype="osx"
    elif [[ "$ostype" == "Linux" ]]; then
        ostype="linux"
    fi
    echo $ostype
}
