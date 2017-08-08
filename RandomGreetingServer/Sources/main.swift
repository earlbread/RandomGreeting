import Kitura
import SwiftyJSON

#if os(Linux)
    import Glibc
    srand(UInt32(time(nil)))
#else
    import Darwin.C
#endif

let router = Router()

let greetings: [String] = [
    "Hello",
    "안녕하세요",
    "こんにちは",
    "你好",
    "Bonjour",
    "Hola",
    "Guten Tag",
    "Xin chào",
    "Здравствуйте",
    "Bom dia",
    "Сайн байна уу",
    "halo",
    "assalom allaykum",
    "Mirёdita",
    "नमस्ते , नमस्कार",
    "Ciao",
    "Bună ziua",
    "صباح الخير",
    "สวัสดี"
]

router.get("/greeting") {
    request, response, next in
#if os(Linux)
    let idx = Int(random() % greetings.count)
#else
    let idx = Int(arc4random_uniform(UInt32(greetings.count)))
#endif
    response.send(json: JSON(["greeting": greetings[idx]]))
    next()
}

Kitura.addHTTPServer(onPort: 8080, with: router)

Kitura.run()
