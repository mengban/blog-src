---
title: 数学知识集锦
tags: 
	- math
categories: "math"
date: 2019-01-02 10:26:00
updated: 2017-01-02 17:35:00
---


### 
> **导读**:FAIR(Facebook AI Reaearch) 何恺明团队最新论文提出 “全景 FPN”，聚焦于图像的全景分割任务，将分别用于语义分割和实例分割的FCN和Mask R-CNN结合起来，设计了 Panoptic FPN。该方法可能成为全景分割研究的强大基线。

### 全景特征金字塔网络 Panoptic FPN
> Panoptic FPN 是一个简单的、单网络的 baseline，它的目标是在实例分割和语义分割以及它们的联合任务：全景分割上实现最高性能。
设计原则是：从具有FPN Mask R-CNN 开始，进行最小的修改，生成一个语义分割的 dense-pixel 输出。
**模型架构如下：**
![](https://raw.githubusercontent.com/mengban/ImageHosting/master/cnblog/20190111095343.png)

####特征金字塔网络 (Feature Pyramid Network)：
> 首先简要回顾一下 FPN。FPN 采用一个具有多空间分辨率特征的标准网络 (如 ResNet)，并添加一个具有横向连接的自上而下的通道，如图 1a 所示。自上而下的路径从网络的最深层开始，并逐步向上采样，同时添加自底向上路径的高分辨率特性的转换版本。FPN 生成一个金字塔，通常具有 1/32 到 1/4 的分辨率，其中每个金字塔级别具有相同的通道维度 (默认是 256)。



####实例分割分支：
> FPN 的设计，特别是对所有金字塔级别使用相同的通道维数，使得附加基于区域的对象检测器变得很容易，比如 Faster R-CNN。 为了输出实例分段，我们使用 Mask R-CNN，它通过添加 FCN 分支来预测每个候选区域的二进制分段 Mask，从而扩展 Faster R-CNN.
![](https://raw.githubusercontent.com/mengban/ImageHosting/master/cnblog/20190111095817.png)

#### Panoptic FPN：
> 如前所述，我们的方法是使用 FPN 对 Mask R-CNN 进行修改，实现像素级语义分割预测。然而，为了实现准确的预测，该任务所使用的特性应该具备以下特征：
>>- 1 具有适当的高分辨率，以捕获精细的结构;
>>- 2 编码足够丰富的语义，以准确地预测类标签;
>>- 3 虽然 FPN 是为目标检测而设计的，但是这些要求——高分辨率、丰富的、多尺度的特征——正好是 FPN 的特征。因此，我们建议在 FPN 上附加一个简单而快速的语义分割分支。
![](https://raw.githubusercontent.com/mengban/ImageHosting/master/cnblog/20190111100055.png)

### 实验和结果
> 我们的目标是证明我们的方法，Panoptic FPN，可以作为一个简单有效的单网络 baseline，用于实例分割、语义分割，以及他们的联合任务全景分割。
因此，我们从测试语义分割方法 (我们将这个单任务变体称为 Semantic FPN) 开始分析。令人惊讶的是，这个简单的模型在 COCO 和 Cityscapes 数据集上实现了具有竞争力的语义分割结果。
接下来，我们分析了语义分割分支与 Mask R-CNN 的集成，以及联合训练的效果。最后，我们再次在 COCO 和 Cityscapes 数据集上展示了全景分割的结果。定性结果如表 2 和表 6 所示。

![](https://raw.githubusercontent.com/mengban/ImageHosting/master/cnblog/20190111100216.png)

###多任务训练
>我们的方法在单任务上表现非常好；对于语义分割，上一节的结果证明了这一点；对于实例分割，这是已知的，因为该方法基于 Mask R-CNN。但是，我们是否可以在多任务环境中共同训练这两项任务呢?
为了将我们的语义分割分支与 Mask R-CNN 中的实例分割分支结合起来，我们需要确定如何训练一个单一的、统一的网络。以往的研究表明，多任务训练往往具有挑战性，并可能导致结果精度下降。我们同样观察到，对于语义或实例分割，添加辅助任务与单任务基线相比会降低准确性。
![](https://raw.githubusercontent.com/mengban/ImageHosting/master/cnblog/20190111100341.png)
表中，ResNet-50-FPN 的结果表明，使用一个简单的语义分割损失λs，或实例分割损失λi，结果可以改善单任务 baseline 的结果。具体来说，适当地添加一个语义分割分支λs 能改进实例分割，反之亦然。这可以用来改进单任务结果。然而，我们的主要目标是同时解决这两个任务，这将在下一节讨论。

###Panoptic FPN
![](https://raw.githubusercontent.com/mengban/ImageHosting/master/cnblog/20190111100518.png)
> 测试 Panoptic FPN 对于全景分割的联合任务的结果，其中网络必须联合并准确的输出 stuff 和 thing 分割。
主要结果：在表 3a 中，我们比较了使用相同骨架的 Panoptic FPN 分别训练的两个网络。Panoptic FPN 具有相当的性能，但只需要一半的计算量。
> 我们还通过比较两个单独的网络，分别是 Panoptic R101-FPN 和 R50-FPN×2，来平衡计算预算，见表 3b。使用大致相等的计算预算，Panoptic FPN 明显优于两个独立的网络。
> 综上所述，这些结果表明联合方法是有益的，我们提出的 Panoptic FPN 方法可以作为联合任务的可靠 baseline。

