#!/bin/bash

if [ "$#" -eq 1 ]
then
   cfile=$1
   if [ -f "$cfile" ]
   then
         echo "[MKDIR]: creating directory for extraction."
         mkdir extracted

         echo "[EXTRACTING]: $cfile contents to extracted/"
         tar xvf "$cfile" -C extracted
         cd extracted && cd crystal*/ && ls
         
         echo "[COPYING]: /bin/crystal and /bin/shards binaries to usr/bin"
         sudo cp -R /bin/crystal /usr/bin
         sudo cp -R /bin/shards /usr/bin

         echo "[COPYING]: lib/crystal/ to usr/lib/"
         sudo cp -R /lib/crystal /usr/lib/

         echo "[COPYING]: share/crystal to usr/share/"
         sudo cp -R /share/crystal /usr/share/

         echo "[COPYING]: share/man/man1 and share/man/man5 to usr/share/man1 and usr/share/man/man5"
         sudo cp -R /share/man/man1/* /usr/share/man/man1
         sudo cp -R /share/man/man5/* /usr/share/man/man5
         
         echo "[CHECKING]: if bash is installed."
         if [ command -v bash ]
         then
            bash --version
            sudo cp -R /share/bash-completion/completions/crystal /usr/share/bash-completion/completions/
         else
            echo "bash is not installed."
         fi

         echo "[CHECKING]: if zsh is installed."
         if [ command -v zsh ]
         then
            zsh --version
            sudo cp -R /share/zsh/site-functions/* /usr/share/zsh/site-functions
         else
            echo "zsh is not installed."
         fi

         echo "[CHECKING]: if fish is installed."
         if [ command -v fish ]
         then
            fish --version
            sudo cp -R /share/fish/vendor_completions/crystal.fish /usr/share/fish/vendor_completions/
         else
            echo "fish is not installed."
         fi
         
         echo "[COPYING]: share/licenses/crystal to /usr/share/licences/"
         sudo cp -R /share/licenses/crystal /usr/share/licences/

         echo "[FINISHED]: copying process finished. Trying to run crystal."
         crystal

         if [ "$?" -eq 0 ]
         then
            exit 0
         else
            echo "Crystal could not install properly. Try again!"
            exit 1
         fi
   else
      echo "$cfile is not a file!"
      exit 1
   fi
else
   echo "Usage: $0 '.tar.gz file'"
   exit 1
fi

# Deletes the directory created for extraction as it is no longer needed
rm -rf extracted/
