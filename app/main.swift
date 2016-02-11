//
//  main.swift
//
//  Copyright © 2015-2016 Daniel Leping (dileping). All rights reserved.
//

import Express

let app = express()

app.views.register(MustacheViewEngine())

app.get("/assets/:file+", action: StaticAction(path: "public", param:"file"))

app.get("/") { (request:Request<AnyContent>)->Action<AnyContent> in
    return Action<AnyContent>.render("index", context: ["hello": "Hello, Swift Express!"])
}

app.listen(9999).onSuccess {
    print("Successfully launched server")
}

app.run()