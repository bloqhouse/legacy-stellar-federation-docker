const express = require('express')
const bodyParser = require('body-parser')

const app = express()

app.use(bodyParser.urlencoded({ extended: false }))

app.post('/receive', function (request, response) {
  const payment = request.body
  console.log('RECEIVED PAYMENT!', payment)

  // // `receive` may be called multiple times for the same payment, so check that
  // // you haven't already seen this payment ID.
  // if (getPaymentByIdFromDb(payment.id)) {
  //   return response.status(200).end()
  // }

  // // Because we have one Stellar account representing many customers, the
  // // customer the payment is intended for should be in the transaction memo.
  // const customer = getAccountFromDb(payment.memo)

  // // You need to check the asset code and issuer to make sure it's an asset
  // // that you can accept payment to this account for. In this example, we just
  // // convert the amount to USD and adding the equivalent amount to the customer
  // // balance. You need to implement `convertToUsd()` yourself.
  // const dollarAmount = convertToUsd(
  //   payment.amount, payment.asset_code, payment.asset_issuer)
  // addToBankAccountBalance(customer, dollarAmount)
  response.status(200).end()
})

app.listen(8005, () => console.log('Bridge server callbacks running on port 8005!'))
