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

{{< tabs items="Ollama,PrivateGPT,TextGeneration Web UI" >}}

  {{< tab >}}
  Probably the **Ollama is the quickest way** to [get LLMs working locally](https://fossengineer.com/selfhosting-llms-ollama), specially if you already have Docker installed.


<iframe width="560" height="315" src="https://www.youtube.com/embed/jl9bfPsBBcM" frameborder="0" allowfullscreen></iframe>
  {{< /tab >}}
  {{< tab >}}
  Say Hi to your documents, locally, when you interact with them with [PrivateGPT Freely](https://fossengineer.com/selfhosting-local-llms-with-privateGPT)



<iframe width="560" height="315" src="https://www.youtube.com/embed/Ib3nQu5bB_k" frameborder="0" allowfullscreen></iframe>
  
  {{< /tab >}}
  {{< tab >}}

  Yet another way to [get LLMs running locally, and with UI](https://fossengineer.com/Generative-AI-LLMs-locally-with-cpu/).
  
  <iframe width="560" height="315" src="https://www.youtube.com/embed/-zNWDTqKF1E" frameborder="0" allowfullscreen></iframe>


  {{< /tab >}}

{{< /tabs >}}

* **Others:** [LibreChat](https://www.youtube.com/watch?v=0BRnK5BGZHU), Autogen + AutogenStudio https://microsoft.github.io/autogen/blog/2023/12/01/AutoGenStudio/ or [Quivir](https://github.com/StanGirard/quivr) with great [docs](https://docs.quivr.app/home/intro) or [LocalGPT](https://github.com/PromtEngineer/localGPT).
  * Bindings:
    * https://github.com/abetlen/llama-cpp-python
    *



## VectorDBs

When you are using embedding models to give LLMs context about your files, this is where that knowledge goes.

And there are many Vector DBs that you can use with Linux

{{< tabs items="VectorAdmin,ChromaDB,Other Vector DBs" >}}

  {{< tab >}}
  Manage them with [VectorAdmin and Docker](https://fossengineer.com/what-are-vector-dbs/#selfhosting-vectoradmin-with-docker)
  {{< /tab >}}
  {{< tab >}}
  [ChromaDB with Docker](https://fossengineer.com/selfhosting-chroma-vector-db/)
  {{< /tab >}}
  {{< tab >}}QDrant{{< /tab >}}

{{< /tabs >}}

All of this tech will work in Linux and **with just CPU**, if you dont have a GPU handy.

---

## FAQ

### How to monitor Hardware while using LLMs?

You can [setup Netdata with Docker](https://fossengineer.com/selfhosting-server-monitoring-with-netdata-and-docker/) really quick.

It will give you insights on workload, temperatures of your Hardware where you run LLMs.

### Can I use LLMs to Code?

Yes, there are many ways to replace Github Copilot for Free:

* [Tabby](https://fossengineer.com/selfhosting-Tabby-coding-assistant/)
* [LLama Coder](https://github.com/ex3ndr/llama-coder) in a [vscode extension](https://marketplace.visualstudio.com/items?itemName=ex3ndr.llama-coder&ssr=false#review-details)

### And to Power my Notes?

* LogSeq + Ollama
    * The plugin: <https://github.com/omagdy7/ollama-logseq>

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

You can also run it in Google Colab: https://www.youtube.com/watch?v=ZyFlySElG1U

### Choosing the Right Model

#### Quantization

* GPTQ quantization, a state-of-the-art method featured in research papers, offers minimal performance loss compared to previous techniques. It's most efficient on NVIDIA GPUs when the model fits entirely in VRAM.
* GGML, a machine learning library by Georgi Gerganov (who also developed llama.cpp for running local LLMs on Mac), performs best on Apple or Intel hardware.

Thanks: https://aituts.com/local-llms/#Which_Quantization

#### Which LLMs are Trending now?

You can always check the LLM's Leaderboards:

* <https://huggingface.co/spaces/HuggingFaceH4/open_llm_leaderboard>
* With **ELO** Rating: <https://huggingface.co/spaces/lmsys/chatbot-arena-leaderboard>
    * <https://chat.lmsys.org/?arena>

* Examples:
  * <https://huggingface.co/TheBloke/Llama-2-13B-Chat-fp16/tree/main>

> You can also check this repository: https://github.com/sindresorhus/awesome-chatgpt and https://github.com/f/awesome-chatgpt-prompts

#### What about Image Generation?

You can find them in [Hugging Face](https://huggingface.co/spaces):

* Stable Difussion: Quick Setup -> https://github.com/AbdBarho/stable-diffusion-webui-docker/wiki/Setup (Thanks to Jim Garage https://www.youtube.com/watch?v=5XHSV56hsJM)
  * <https://huggingface.co/runwayml/stable-diffusion-v1-5/tree/main>
  * <https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0/tree/main>
  * <https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0/tree/main>
  * <https://huggingface.co/stabilityai/stable-diffusion-2-base>
  * <https://github.com/AUTOMATIC1111/stable-diffusion-webui> or <https://github.com/vladmandic/automatic>
    * <https://github.com/AUTOMATIC1111/stable-diffusion-webui/wiki/Features#stable-diffusion-20>

What are other people building? https://civitai.com/

#### Voice?

Generally, here you can get many ideas: <https://github.com/sindresorhus/awesome-whisper>

* <https://www.futuretools.io/tools/uberduck>
* [Audiocraft](http://localhost:1313/whishper-docker/#how-to-install-audiocraft)
* ecoute (OpenAI API needed)
* Meeper (OpenAI API needed)
* Bark
* Whisper
* [Whishper](https://fossengineer.com/whishper-docker)
  * <https://github.com/pluja/whishper>
  * https://libretranslate.com/

* Linux Desktop App:

```sh
flatpak install flathub net.mkiol.SpeechNote
flatpak run net.mkiol.SpeechNote
```

* Not F/OSS: 
  * https://www.gladia.io/pricing
  * https://bigwav.app/

#### Other Interesting AI Tools

* <https://www.futuretools.io/?pricing-model=open-source>

### What is a RAG?

RAG, which stands for "Retrieval-Augmented Generation" is a methodology used in the development of advanced natural language processing (NLP) systems, particularly in the context of large language models (LLMs)

RAG is particularly useful for tasks that require a blend of understanding context, generating coherent responses, and incorporating up-to-date or specific factual information, such as in question-answering systems or chatbots.


### Do I need to Know programming to use LLMs?

You dont have to be a developer to get to use LLMs.

Mostly we will be using frameworks that provide a level of abstraction to the real code behind the scenes.

It would be definitely beneficial if you are [familiar with Python](https://fossengineer.com/guide-python/) if you want to try [Cutting-Edge and Free AI](https://fossengineer.com/tags/gen-ai/) or at least to know [how to manage Python Dependencies](https://fossengineer.com/guide-python/).


### Prompting

* <https://prompthero.com/prompt/ccc554cf355-stable-diffusion-1-5-renaissance-painting-of-darth-vader-in-pink-fur-as-a-fashion-model-vogue-oil-paint-on-dark-background-masked-darth>

### Where to host in the Cloud?

If you need big GPU power, you can always try https://www.runpod.io/gpu-instance/pricing and similar services.