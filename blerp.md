/* -.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-. */
/* -.-.-.-.-.-.-.-. QUIZ 2 EARN v0.0.1 -.-.-.-.-.-.-.-. */
/* -.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-. */

# TUTORIAL
- https://blog.chain.link/how-to-build-a-crypto-game/#connecting_your_wallet 
- in "cd my-app", run "npm run dev -- --open"
- if you see this then the answer given is wrong (could be related to the 'salt')
    >>
        index.ts:261 Uncaught (in promise) Error: cannot estimate gas; transaction may fail or may require manual gas limit [ See: https://links.ethers.org/v5-errors-UNPREDICTABLE_GAS_LIMIT ] (error={"code":-32000,"message":"execution reverted"}, method="estimateGas", transaction={"from":"0x4d28B3b1A14c90F859675e9c9bFc0852edDd1574","to":"0x0e413e78B95b081cc53a7C811680453B264250D3","data":"0x4eee59b3000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000023432000000000000000000000000000000000000000000000000000000000000","accessList":null}, code=UNPREDICTABLE_GAS_LIMIT, version=providers/5.6.3)


# TO DO
- add a payment function to create passive revenue
    - they provide payment and submit answer in same txn
    - if correct answer then reward, if not then end
- create a list of stuff
    - target audience + holding location
    - list of Questions + Answers
- How could I use this setup to make a roulette game?
    - There could be a random number chosen and the first one to input the correct number wins it!
    - I would have to turn OFF the require statement so that users CAN try with wrong password (winning number)
    - I would profit from the tax, while id also need to stock the contract to begin with
    - The cost could double every time? Or something like that
