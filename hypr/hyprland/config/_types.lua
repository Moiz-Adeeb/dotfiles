---@class AppItem
---@field id string             Unique identifier for the application
---@field name string           Display name of application
---@field cmd string            Terminal execution command for application

---@class AppList
---@field default integer       Index of the default application
---@field toggle string?        [Optional] Application toggle
---@field [integer] AppItem     List of available application

---@class DirectionKeyset
---@field left string           Key for moving left
---@field right string          Key for moving right
---@field up string             Key for moving up
---@field down string           Key for moving down
