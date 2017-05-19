Google在2015年11月9日宣布开源自己的第二代机器学习系统Tensorflow。

Tensorflow支持python和c++语言，支持CNN、RNN和LSTM等算法，可以被用于语音识别或图像处理等多项深度学习领域。它可以在一个或多个CPU或GPU中运行。它可以运行在嵌入式系统(如手机，平板电脑)中，PC中以及分布式系统中。它是目前全世界最火爆的深度学习平台(没有之一)。

卷积神经网络CNN


编程入门有Hello World，机器学习入门有MNIST。

softmax regression
softmax模型可以用来给不同的对象分配概率。即使在之后，我们训练更加精细的模型时，最后一步也需要用softmax来分配概率。

TensorFlow也把复杂的计算放在python之外完成，但是为了避免前面说的那些开销，它做了进一步完善。Tensorflow不单独地运行单一的复杂计算，而是让我们可以先用图描述一系列可交互的计算操作，然后全部一起在Python之外运行。（这样类似的运行方式，可以在不少的机器学习库中看到。）

http://www.tensorfly.cn/tfdoc/tutorials/mnist_beginners.html
