#atp_function_start

function path_remove {
  # Delete path by parts so we can never accidentally remove sub paths
  # part from stackexchange Mark Booths answer (q 108873)
  if [ "$PATH" == "$1" ] ; then PATH="" ; fi
  PATH=${PATH//":$1:"/":"} # delete any instances in the middle
  PATH=${PATH/#"$1:"/} # delete any instance at the beginning
  PATH=${PATH/%":$1"/} # delete any instance in the at the end
}

remove_path_from_list() {
if grep -q "^export PATH=\$PATH:$1$" ~/.bashrc; then
    sed -i "/^export PATH=\$PATH:${1//\//\\/}$/d" ~/.bashrc
    #sed -i "/^export PATH=\$PATH:${1//\//\/}$/d" ~/.bashrc
    path_remove "$path"
else
echo "Path not in .bashrc"
    path_remove "$path"
fi
}

add_path_to_list() {
    if grep -q "^export PATH=\$PATH:$1$" ~/.bashrc; then
        echo "Path already exists in .bashrc"
    else
        echo "export PATH=\$PATH:$1" >> ~/.bashrc
        exec bash
    fi
}


atp() {
  if [ "$1" = "--uninstall" ]; then
    sed -i "/^#atp_function_start/,/^#atp_function_end/d" ~/.bashrc
    unset -f atp
    echo "atp uninstalled"
  elif [ "$1" = "-r" ]; then
    shift # Remove the -r option from the arguments
    for path in "$@"; do
        # Check if the path is a dot (.), interpret it as the current folder
        if [ "$path" = "." ]; then
            path=$(pwd)
        fi
        remove_path_from_list "$path"
        exec bash
    done
   else
    for path in "$@"; do
        # Check if the path is a dot (.), interpret it as the current folder
        if [ "$path" = "." ]; then
            path=$(pwd)
        fi
        add_path_to_list "$path"
    done
fi
}
#atp_function_end
