<script>
    // ethers allows you to interact with the Ethereum blockchain
    import { ethers } from 'ethers';
    // web3Props holds the properties of the web3 provider
    export let web3Props = {
        provider: null,
        signer: null,
        account: null,
        chainId: null,
        contract: null
    };
    // values for the quiz factory contract
    $: question = '';
    $: answer = '';
    $: encryptedAnswer = null;
    async function encryptAnswer() {
        // encrypt the answer using the same salt as the contract
        encryptedAnswer = ethers.utils.keccak256(
            ethers.utils.solidityPack(
                ['bytes32', 'string'],
                [ethers.utils.formatBytes32String('6942069'), answer]
            )
        );
        // use the factory contract to create a new quiz
        web3Props.contract.createQuiz(question, encryptedAnswer);
    }
</script>

<div class="wrapper">
    <span class="input-label"> question: </span>
    <!-- bind lets changes to question update the value of the variable  -->
    <input bind:value={question} />
    <br />
    <span class="input-label"> answer: </span>
    <input bind:value={answer} />
    <br />
    <!-- On click, run the encryptedAnswer function -->
    <button on:click={encryptAnswer}> Add Question </button>
</div>

<!-- Scoped CSS -->
<style>
    .wrapper {
        overflow: hidden;
        position: relative;
        margin-bottom: 1rem;
        padding: 20px;
        border-radius: 15px;
        width: 33%;
        box-shadow: 1px 1px 4px rgba(0, 0, 0, 0.3);
    }
    .input-label {
        display: inline-block;
        width: 15%;
    }
</style>