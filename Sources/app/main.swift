//
//  main.swift
//
//  Copyright © 2015-2016 Daniel Leping (dileping). All rights reserved.
//

import Express

let app = express()

app.views.register(StencilViewEngine())

app.get(path: "/assets/:file+", action: StaticAction(path: "public", param:"file"))

app.get(path: "/") { (request:Request<AnyContent>)->Action<AnyContent> in
    return Action<AnyContent>.render(view: "index", context: ["hello": "Hello,", "swift": "Swift", "express": "Express!"])
}

app.listen(port: 9999).onSuccess { server in
    print("Express was successfully launched on port", server.port)
}

app.run()
