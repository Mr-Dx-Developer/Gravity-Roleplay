if isBridgeLoaded('Database', Database.GHMATTI) then
    MySQL = {
        Sync = {},
        Async = {},
        ready = function(cb)
            fprint('MySQL.ready is not supported by GHMattiMySQL', Levels.ERROR)
        end
    }

    function MySQL.Sync.fetchAll(query, table, cb)
        return exports[Bridge.Database]:executeSync(query, table, cb)
    end

    function MySQL.Sync.fetchScalar(query, table, cb)
        return exports[Bridge.Database]:scalar(query, table, cb)
    end

    function MySQL.Sync.execute(query, table, cb)
        return exports[Bridge.Database]:executeSync(query, table, cb)
    end

    function MySQL.Sync.insert(query, table, cb)
        return exports[Bridge.Database]:insert(query, table, cb)
    end

    function MySQL.Async.fetchAll(query, table, cb)
        return exports[Bridge.Database]:execute(query, table, cb)
    end

    function MySQL.Async.execute(query, table, cb)
        return exports[Bridge.Database]:execute(query, table, cb)
    end
end
