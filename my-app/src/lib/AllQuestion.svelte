<script>
    import Question from '$lib/Question.svelte';
    export let web3Props = {
        provider: null,
        signer: null,
        account: null,
        chainId: null,
        contract: null
    };

    $: questions = null;

    // this is pulling the array from the contract
    async function getQuestions(){
        questions = await web3Props.contract.getQuizzes();
        web3Props.contract.on('QuizCreated', (addr) => {
            getQuestions();
        })
    }
    getQuestions();
</script>

{#if questions}
    <div class="qwrap">
        {#each questions as questionAddr}
            <Question {questionAddr} {web3Props}></Question>
        {/each}
    </div>
{/if}

<style>
    .qwrap {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
    }
</style>