//
//  main.swift
//
//  Copyright © 2015-2016 Daniel Leping (dileping). All rights reserved.
//

import Express

let app = express()

app.views.register(StencilViewEngine())

app.get("/assets/:file+", action: StaticAction(path: "public", param:"file"))

app.get("/") { (request:Request<AnyContent>)->Action<AnyContent> in
    return Action<AnyContent>.render("index", context: ["hello": "Hello,", "swift": "Swift", "express": "Express!"])
}

app.listen(9999).onSuccess { server in
    print("Express was successfully launched on port", server.port)
}

app.run()