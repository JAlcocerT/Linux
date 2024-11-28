---
title: LLMs on Linux
type: docs
prev: /docs/gcp/
next: docs/ansible/
draft: false
---

**Generative AI** and particularly LLMs are taking over.

You can **Get LLMs Running** in your personal computer or in big servers just for you or whoever you want to give access.

> To get the most popular commercial trends: https://theresanaiforthat.com/most-saved/

## Interfaces for LLMs

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
* https://github.com/khoj-ai/khoj


## VectorDBs

When you are using [embedding models](https://www.youtube.com/watch?v=QdDoFfkVkcw) to give LLMs context about your files, this is where that knowledge goes.

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

### Can I use LLMs to Code?

Yes, there are many ways to replace Github Copilot for Free:

* [Tabby](https://fossengineer.com/selfhosting-Tabby-coding-assistant/)
* [LLama Coder](https://github.com/ex3ndr/llama-coder) in a [vscode extension](https://marketplace.visualstudio.com/items?itemName=ex3ndr.llama-coder&ssr=false#review-details)
  * [CodeLLama in HF](https://huggingface.co/codellama/CodeLlama-70b-hf)
* Others: Bito, Codeium, or [Adrenaline](https://github.com/shobrook/adrenaline/)

### Choosing the Right Model


{{% details title="LLM Quantization" closed="true" %}}
* GPTQ quantization, a state-of-the-art method featured in research papers, offers minimal performance loss compared to previous techniques. It's most efficient on NVIDIA GPUs when the model fits entirely in VRAM.
* GGML, a machine learning library by Georgi Gerganov (who also developed llama.cpp for running local LLMs on Mac), performs best on Apple or Intel hardware.

Thanks: https://aituts.com/local-llms/#Which_Quantization

{{< /details >}}

#### Which LLMs are Trending?

{{% details title="You can always check the LLM's Leaderboards" closed="true" %}}

* <https://huggingface.co/spaces/HuggingFaceH4/open_llm_leaderboard>
* With **ELO** Rating: <https://huggingface.co/spaces/lmsys/chatbot-arena-leaderboard>
    * <https://chat.lmsys.org/?arena>

* Examples: use them also with GPT4All or TextGenWebUI
  * <https://huggingface.co/TheBloke/Llama-2-13B-Chat-fp16/tree/main>
  * <https://huggingface.co/docs/transformers/main/model_doc/mpt>
    * And [this one](https://www.mosaicml.com/mpt) you can train it and use commercially: https://www.mosaicml.com/training

> You can also check this repository: https://github.com/sindresorhus/awesome-chatgpt and https://github.com/f/awesome-chatgpt-prompts
{{< /details >}}


### Where to host in the Cloud?

If you need big GPU power, you can always try https://www.runpod.io/gpu-instance/pricing and similar services.



### You might be Wondering

{{% details title="Which Neuronal Network are we using?" closed="true" %}}

1. RNN (Recurrent Neural Network)
- **Typical Use**: RNNs are used for sequential data where the context and order of data points are crucial. Common applications include time-series data analysis, natural language processing (NLP), and speech recognition.
- **Characteristics**: 
  - RNNs possess a memory-like feature, allowing them to retain information about previous computations.
  - This memory feature enables RNNs to process sequences of data effectively, providing them with a sense of 'time' or sequence order.

2. CNN (Convolutional Neural Network)
- **Typical Use**: CNNs are primarily used for tasks involving spatial data, such as image and video recognition, image classification, and object detection. They are also utilized in some NLP tasks.
- **Characteristics**: 
  - CNNs consist of convolutional layers, pooling layers, and fully connected layers.
  - The convolutional layers learn spatial hierarchies of features adaptively from input images, making CNNs particularly effective in tasks that require pattern recognition in spatial data.

3. Transformers
- **Typical Use**: Transformers are used in tasks that involve processing entire sequences of data simultaneously, such as language modeling and translation.
- **Characteristics**: 
  - Unlike traditional neural networks that process data sequentially, transformers can handle entire sequences at once.
  - This architecture allows transformers to weigh the importance of different parts of the input data differently, enhancing efficiency and effectiveness in handling complex sequential tasks.
{{% /details %}}


**Mixed of Experts** is an approach in machine learning where a model consists of numerous sub-models (referred to as "experts"). Each expert specializes in handling different types of data or tasks. The main idea is to route different inputs to the most relevant experts to handle **specific tasks more efficiently** and effectively.

{{% details title="More about MoE LLMs" closed="true" %}}


For example, some experts might be better at understanding technical jargon, while others might excel at creative writing or conversational language.

GPT4 is an example of MoE. But also [Mixtral](https://erichartford.com/dolphin-25-mixtral-8x7b?source=more_articles_bottom_blogs) - Which you [download from HF](https://huggingface.co/TheBloke/dolphin-2.5-mixtral-8x7b-GGUF) or [this](https://huggingface.co/mistralai/Mixtral-8x7B-v0.1) and [run for Free locally with Ollama](https://fossengineer.com/selfhosting-llms-ollama/):

```sh
ollama run mixtral:8x7b #https://mistral.ai/news/mixtral-of-experts/
```

You can also try Solar 10.7B to compare these MoE's:

```sh 
ollama run solar:10.7b #https://ollama.ai/library/solar/tags
```

You can also run it in Google Colab: https://www.youtube.com/watch?v=ZyFlySElG1U
{{< /details >}}

{{% details title="What it is a RAG" closed="true" %}}

RAG, which stands for "Retrieval-Augmented Generation" is a methodology used in the development of advanced natural language processing (NLP) systems, particularly in the context of large language models (LLMs)

RAG is particularly useful for tasks that require a blend of understanding context, generating coherent responses, and incorporating up-to-date or specific factual information, such as in question-answering systems or chatbots.

{{< /details >}}