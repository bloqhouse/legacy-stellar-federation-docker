const http = require('http')
const express = require('express')
const app = express()

app.post('/compliance/fetch_info', function (request, response) {
    console.log("fetch_info")
    response.json({
        name: "Example",
        address: "Street",
        date_of_birth: "1-4-44"
    })

    response.end()
})

app.post('/compliance/sanctions', function (request, response) {
    console.log("sanctions")
    response.status(200).end()
})

app.post('/compliance/ask_user', function (request, response) {
    console.log("ask_user")
    response.status(200).end()
})

http.createServer(app).listen(process.env.COMPLIANCE_NODE_PORT, function(){
    console.log(`server running at https://${DOMAIN}:8005/`)
})
