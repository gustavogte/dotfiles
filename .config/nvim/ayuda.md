# Optional utilities:

   - ripgrep - live grep telescope search <Leader>fw
   - lazygit - git ui toggle terminal (<Leader>tl or <Leader>gg)
   - go DiskUsage() - disk usage toggle terminal (<Leader>tu)
   - bottom - process viewer toggle terminal (<Leader>tt)
   - Python - python repl toggle terminal (<Leader>tp)
   - Node - Node is needed for a lot of the LSPs, and for the node repl toggle terminal (<Leader>tn) ??? not workinng

# Importar plugins de Astrovim community

* Primero se cargan los archivos core de Astrovim, despues los de astrocommunity y finalemente
  los del usuario, que se sobre-escriben a a los anteriores (override).


1.- Incluir en ~.config/nvim/community.lua :
 
 { import = "astrocommunity.xxx.plugin" },
 
2.- Incluir configuración con la dirección del archivo de github y nombre en:
  
  ~.config/nvim/lua/plugins

  * Se pueden incluir distintas llaves (keys) despues del plugin o dependencias.
  
  return {
    "plugin_name/nvim", -- short url from github address

    name = "plugin_name",
    cmd = "xxx",
    event = "x",
    opts = { },
  }


