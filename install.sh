if [ -n "$($SHELL -c 'echo $ZSH_VERSION')" ]; then
    shell_profile="$HOME/.zshrc"
elif [ -n "$($SHELL -c 'echo $BASH_VERSION')" ]; then
    shell_profile="$HOME/.bashrc"
elif [ -n "$($SHELL -c 'echo $FISH_VERSION')" ]; then
    shell="fish"
    if [ -d "$XDG_CONFIG_HOME" ]; then
        shell_profile="$XDG_CONFIG_HOME/fish/config.fish"
    else
        shell_profile="$HOME/.config/fish/config.fish"
    fi
fi

chmod +x chatgpt

{
    echo '# ChatGPT CLI'
    echo 'export PATH='"$(pwd)"':$PATH'
} >> "$shell_profile"

echo
echo 'Saved the ChatGPT CLI path to' $shell_profile
echo "Installation complete"
echo "Open a new terminal and run chatgpt command"
echo