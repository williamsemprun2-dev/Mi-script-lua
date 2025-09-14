-- Script creado por wnxffx para eliminar texturas y mejorar rendimiento en Roblox
local function clearTextures(object)
    -- Recorre todos los descendientes del objeto
    for _, descendant in pairs(object:GetDescendants()) do
        -- Verifica si el objeto es una textura o un material relacionado
        if descendant:IsA("Texture") or descendant:IsA("Decal") or descendant:IsA("SurfaceAppearance") then
            -- Elimina la textura
            descendant:Destroy()
        elseif descendant:IsA("BasePart") then
            -- Simplifica materiales para reducir carga gráfica
            descendant.Material = Enum.Material.SmoothPlastic
            -- Desactiva sombras para mejorar rendimiento
            descendant.CastShadow = false
        end
    end
end

-- Función principal para limpiar texturas del juego
local function optimizeGame()
    -- Limpia texturas de Workspace
    clearTextures(workspace)
    -- Limpia texturas de otros servicios importantes
    clearTextures(game:GetService("ReplicatedStorage"))
    clearTextures(game:GetService("Lighting"))
    -- Reduce efectos de iluminación global
    local lighting = game:GetService("Lighting")
    lighting.GlobalShadows = false
    lighting.Brightness = 1
    lighting.FogEnd = 100000
end

-- Ejecuta la optimización
optimizeGame()

-- Monitorea nuevos objetos para eliminar texturas dinámicamente
workspace.DescendantAdded:Connect(function(descendant)
    if descendant:IsA("Texture") or descendant:IsA("Decal") or descendant:IsA("SurfaceAppearance") then
        descendant:Destroy()
    elseif descendant:IsA("BasePart") then
        descendant.Material = Enum.Material.SmoothPlastic
        descendant.CastShadow = false
    end
end)

-- Mensaje personalizado indicando que wnxffx es el creador
print("¡Optimización de texturas completada! Script creado por wnxffx.")
