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