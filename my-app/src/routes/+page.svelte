<script>
    import WalletConnect from "$lib/WalletConnect.svelte";
    import AddQuestion from '$lib/AddQuestion.svelte';
    import AllQuestion from '$lib/AllQuestion.svelte';
    import contractAbi from '../contracts/Q2EFactory.json';
    const contractAddr = '0xe0C91d2DEF1f4524B77dF771FC4d8Dc00e38B4Dd';
    export let web3Props = {
        provider: null,
        signer: null,
        account: null,
        chainId: null
    };
</script>
<h1>QUIZ-2-EARN</h1>
<p>Answer questions -- Earn rewards!</p>

<br/>

{#if !web3Props.account}
    <WalletConnect 
        bind:web3Props
        {contractAddr}
        {contractAbi}
    />
{:else}
    <AddQuestion bind:web3Props />
    <br/><br/>
    <AllQuestion bind:web3Props />
{/if}
