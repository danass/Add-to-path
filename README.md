# Easily Add or Remove the Current Directory to the `$PATH` in Bash

This simple utility allows you to quickly add or remove the **current directory** to the global `$PATH` in Bash, making it accessible from anywhere.

To use this tool, simply add the content of the [atp.sh](https://github.com/danass/Add-to-path/blob/main/atp.sh) script to your **~/.bashrc** file, then source the file to activate the function.

## Usage Instructions

### 1. Adding the Current Directory to `$PATH`

To temporarily add the current directory to the `$PATH`, run:

```bash
user@machine:~/current-directory$ atp .
```

Now, when you check `$PATH`, you should see `/home/user/current-directory` (or the directory you are currently in) added to the end of the path:

```bash
user@machine:~/current-directory$ echo $PATH
/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/user/current-directory
```

### 2. Removing the Current Directory from `$PATH`

To remove the current directory from the `$PATH`, use:

```bash
user@machine:~/current-directory$ atp -r .
```

After running this command, the `$PATH` will return to its previous state, without the current directory:

```bash
user@machine:~/current-directory$ echo $PATH
/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
```

---

### And that’s it!

With just two simple commands, you can add or remove the current directory from your `$PATH`. This is especially useful for testing or running scripts without needing to permanently modify the global `$PATH`.
