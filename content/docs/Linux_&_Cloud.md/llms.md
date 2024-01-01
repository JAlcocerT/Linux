---
title: LLMs
type: docs
prev: /docs/gcp/
next: docs/ansible/
draft: false
---

**Generative AI** and particularly LLMs are taking over.

You can **Get LLMs Running** in your personal computer or in big servers just for you or whoever you want to give access.

## Interfaces

### Ollama

Probably the **quickest way to get LLMs working**, specially if you already have Docker installed.

* <https://fossengineer.com/selfhosting-llms-ollama/>

<iframe width="560" height="315" src="https://www.youtube.com/embed/jl9bfPsBBcM" frameborder="0" allowfullscreen></iframe>

### {{% details title="Other Ways! PrivateGPT, TextGenWebUI" closed="true" %}}


#### PrivateGPT

* <https://fossengineer.com/selfhosting-local-llms-with-privateGPT/>

<iframe width="560" height="315" src="https://www.youtube.com/embed/Ib3nQu5bB_k" frameborder="0" allowfullscreen></iframe>

#### TextGeneration Web UI

* <https://fossengineer.com/Generative-AI-LLMs-locally-with-cpu/>

<iframe width="560" height="315" src="https://www.youtube.com/embed/-zNWDTqKF1E" frameborder="0" allowfullscreen></iframe>

{{% /details %}}


## FAQ

### How to monitor Hardware while using LLMs?

You can [setup Netdata with Docker](https://fossengineer.com/selfhosting-server-monitoring-with-netdata-and-docker/) really quick.

It will give you insights on workload, temperatures of your Hardware where you run LLMs.

### Can I use LLMs to Code?

Yes, there are many ways to replace Github Copilot for Free:

* [Tabby](https://fossengineer.com/selfhosting-Tabby-coding-assistant/)
* [LLama Coder](https://github.com/ex3ndr/llama-coder) in a [vscode extension](https://marketplace.visualstudio.com/items?itemName=ex3ndr.llama-coder&ssr=false#review-details)

### And to Power my Notes?

* LogSeq + Ollama: <https://github.com/omagdy7/ollama-logseq>

### What is a MoE?

**Mixed of Experts** is an approach in machine learning where a model consists of numerous sub-models (referred to as "experts"). Each expert specializes in handling different types of data or tasks. The main idea is to route different inputs to the most relevant experts to handle **specific tasks more efficiently** and effectively.

For example, some experts might be better at understanding technical jargon, while others might excel at creative writing or conversational language.

GPT4 is an example of MoE. But also [Mixtral](https://erichartford.com/dolphin-25-mixtral-8x7b?source=more_articles_bottom_blogs) - Which you can [run for Free locally with Ollama](https://fossengineer.com/selfhosting-llms-ollama/):

```sh
ollama run mixtral:8x7b #https://mistral.ai/news/mixtral-of-experts/
```

You can also try Solar 10.7B to compare these MoE's:

```sh 
ollama run solar:10.7b #https://ollama.ai/library/solar/tags
```

#### Which LLMs are Trending now?

You can always check the leaderboards:

* <https://huggingface.co/spaces/HuggingFaceH4/open_llm_leaderboard>
* With **ELO** Rating: <https://huggingface.co/spaces/lmsys/chatbot-arena-leaderboard>
    * <https://chat.lmsys.org/?arena>

### What is a RAG?

RAG," which stands for "Retrieval-Augmented Generation," is a methodology used in the development of advanced natural language processing (NLP) systems, particularly in the context of large language models (LLMs)

RAG is particularly useful for tasks that require a blend of understanding context, generating coherent responses, and incorporating up-to-date or specific factual information, such as in question-answering systems or chatbots.


### Do I need to Know programming to use LLMs?

You dont have to be a developer to get to use LLMs. Mostly we will be using frameworks that provide a level of abstraction to the real code behind the scenes.

It would be definitely beneficial if you are [familiar with Python](https://fossengineer.com/guide-python/) if you want to try [Cutting-Edge and Free AI](https://fossengineer.com/tags/gen-ai/) or at least to know [how to manage Python Dependencies](https://fossengineer.com/guide-python/).