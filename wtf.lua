return function(Release, Path, Branch)
    getgenv().Import = function(Module)
        local Script
        
        if not Release then
            Script = readfile(("%s/Modules/%s.lua"):format(Path:sub(Path:find("/"), #Path), Module))
        end

        Script = Script or game:HttpGet(("https://raw.githubusercontent.com/%s/%s/Modules/%s.lua"):format(Path, Branch, Module))

        local Status, Result = pcall(loadstring, Script)

        if not Status then
            error(("Module %s:\n %s"):format(Module, Result))
        else 
            return Result()
        end
    end
end
