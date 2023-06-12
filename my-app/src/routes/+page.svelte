<script>
    import WalletConnect from "$lib/WalletConnect.svelte";
    export let web3Props = {
        provider: null,
        signer: null,
        account: null,
        chainId: null
    };
</script>
<h1>QUIZ-2-EARN</h1>
<p>Answer questions -- Earn rewards!</p>
{#if !web3Props.account}
<WalletConnect bind:web3Props />
{:else}
--connected--
{/if}
