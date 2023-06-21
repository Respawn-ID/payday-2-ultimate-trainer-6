UT.Utils = {}

function UT.Utils:isEmptyTable(value)
    return next(value) == nil
end

function UT.Utils:tableInsert(_table, value)
    table.insert(_table, value)
end

function UT.Utils:tableJoin(_table, separator)
    return table.concat(_table, separator)
end

function UT.Utils:jsonEncode(value)
    return json.encode(value)
end

function UT.Utils:jsonDecode(value)
    return json.decode(value)
end

function UT.Utils:callFunction(name, ...)
    return loadstring("return " .. name .. "(...)")(...)
end

function UT.Utils:httpRequest(url, callback)
    dohttpreq(url, callback)
end

function UT.Utils:getClock()
    return os.clock()
end

function UT.Utils:buildQueryString(query)
    local parts = {}
    for key, value in pairs(query) do
        local part = key .. "=" .. value
        UT.Utils:tableInsert(parts, part)
    end
    return UT.Utils:tableJoin(parts, "&")
end
