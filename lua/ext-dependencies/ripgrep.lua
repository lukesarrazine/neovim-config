local M = {}

local function is_executable(name)
    return vim.fn.executable(name) == 1
end

local function install_ripgrep()
    local os_name = vim.loop.os_uname().sysname

    if os_name == "Windows_NT" then
        local ripgrep_url = "https://github.com/BurntSushi/ripgrep/releases/latest/download/ripgrep-x86_64-pc-windows-msvc.zip"
        local download_path = vim.fn.stdpath("data") .. "/ripgrep.zip"
        local install_path = vim.fn.stdpath("data") .. "/ripgrep"

        -- Download and extract Ripgrep
        vim.fn.system({ "curl", "-L", ripgrep_url, "-o", download_path })
        vim.fn.system({ "powershell", "Expand-Archive", "-Path", download_path, "-DestinationPath", install_path })

        -- Add Ripgrep to PATH
        vim.env.PATH = install_path .. ";" .. vim.env.PATH
    else
        local ripgrep_cmd = os_name == "Darwin" and "brew install ripgrep" or "sudo apt install ripgrep -y"
        vim.fn.system(ripgrep_cmd)
    end
end

function M.ensure_ripgrep()
    if not is_executable("rg") then
        print("Ripgrep not found! Installing now...")
        install_ripgrep()
    end
end

return M

