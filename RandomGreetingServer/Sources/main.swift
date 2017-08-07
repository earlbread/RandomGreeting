import Kitura

let router = Router()

router.get("/") {
    request, response, next in
    response.send("Hello, World!")
    next()
}

let greetings: [String] = {
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
}

Kitura.addHTTPServer(onPort: 8080, with: router)

Kitura.run()
