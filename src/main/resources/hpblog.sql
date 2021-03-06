/*
 Navicat Premium Data Transfer

 Source Server         : 连接mysql
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : hpblog

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 07/02/2021 23:21:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for blog
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(0) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `status` tinyint(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog
-- ----------------------------
INSERT INTO `blog` VALUES (14, 1, 'Markdown的用法', '- 学习\n- 随笔', '# 一、Markdown的标题\n## 1.使用 = 标记一级标题\n\n```\n例如所示：\n\n我展示的是一级标题\n=====================\n```\n\n## 2.使用 - 标记二级标题\n\n```\n例如所示：\n\n我展示的是二级标题\n--------------------\n```\n\n<!--more-->\n\n## 3.使用#号标记\n```\n    使用 # 号可表示 1-6 级标题，一级标题对应一个 # 号，二级标题对应两个 # 号，以此类推\n```\n例如所示：\n\n```\n# 一级标题\n## 二级标题\n### 三级标题\n#### 四级标题\n##### 五级标题\n###### 六级标题\n```\n\n----------------------------\n\n# 二、Markdown的段落\n\n## 1.段落要求\n```\n注：Markdown 段落没有特殊的格式，直接编写文字就好，段落的换行是使用两个以上空格加上回车或者也可以在段落后面使用一个空行来表示重新开始一个段落。\n```\n\n## 2.Markdown的字体\nMarkdown主要有以下字体可以使用\n```\n1. *斜体文本*  或者  _斜体文本_\n\n2. **粗体文本**  或者  __粗体文本__\n\n3. ***粗斜体文本***   或者   ___粗斜体文本___\n```\n\n-------------------------\n\n## 3.分隔符   \n\n```\n注：你可以在一行中用三个以上的星号、减号、底线来建立一个分隔线，行内不能有其他东西。你也可以在星号或是减号中间插入空格。\n\n例如所示:\n****\n* * *\n----\n-     -     -\n```\n\n--------------------\n\n## 4.删除线\n\n```\n如果段落上的文字要添加删除线，只需要在文字的两端加上两个波浪线 ~~ 即可，实例如下：\n    RUNOOB.COM\n    GOOGLE.COM\n    ~~BAIDU.COM~~\n```\n\n例如所示：  \n~~BAIDU.COM~~\n\n## 5.下划线\n\n```\n下划线可以通过 HTML 的 <u> 标签来实现：\n\n    <u>带下划线文本</u>\n```\n\n例如所示：\n\n<u>带下划线的文本</u>\n\n## 6.脚注\n\n```\n脚注是对文本的补充说明。\n\nMarkdown 脚注的格式如下:\n\n[^要注明的文本]\n\n以下实例演示了脚注的用法：\n\n创建脚注格式类似这样 \n\n[^码农]。\n\n[^码农]: 程序员 -- 学的越多，秃的越快！！！\n\n```\n\n[^study]:学习\n[^码农]: 程序员 -- 学的越多，秃的越快！！！\n\n********************\n\n# 三、Markdown列表\n\n```\nMarkdown 支持有序列表和无序列表。\n \n无序列表使用星号(*)、加号(+)或是减号(-)作为列表标记：\n\n* 第一项\n* 第二项\n* 第三项\n\n+ 第一项\n+ 第二项\n+ 第三项\n\n\n- 第一项\n- 第二项\n- 第三项\n\n有序列表使用数字并加上 . 号来表示，如：\n\n1. 第一项\n2. 第二项\n3. 第三项\n\n列表嵌套只需在子列表中的选项添加四个空格即可：\n\n1. 第一项：\n    - 第一项嵌套的第一个元素\n    - 第一项嵌套的第二个元素\n2. 第二项：\n    - 第二项嵌套的第一个元素\n    - 第二项嵌套的第二个元素\n```\n\n例如所示：\n\n* 第一项\n    - 第一项嵌套的第一个元素\n    - 第一项嵌套的第二个元素\n* 第二项\n* 第三项\n\n\n1. 第一项  \n    - 第一项嵌套的第一个元素\n    - 第一项嵌套的第二个元素\n2. 第二项\n    - 第二项嵌套的第一个元素\n        - 第二项嵌套的第一项的第一个元素\n    - 第二项嵌套的第二个元素\n3. 第三项\n\n-------------------------\n\n# 四、Markdown区块\n\n```\nMarkdown 区块引用是在段落开头使用 > 符号 ，然后后面紧跟一个空格符号：\n\n> 区块引用\n> 学的不仅是技术更是梦想\n\n另外区块是可以嵌套的，一个 > 符号是最外层，两个 > 符号是第一层嵌套，以此类推：\n> 最外层\n> > 第一层嵌套\n> > > 第二层嵌套\n\n```\n> 区块引用  \n> 学习Markdown\n\n> 最外层  \n> > 第一层嵌套  \n> >\n> > > 第二层嵌套\n\n```\n注:区块可以和列表相互嵌套使用，例如：\n1. 第一项\n    > 菜鸟教程\n    > 学的不仅是技术更是梦想\n2. 第二项\n```\n1. 第一项\n    > 菜鸟教程  \n    > 学习Markdown\n2. 第二项\n    - 第二项的第一个元素\n    - 第二项的第二个元素\n\n----------------------\n\n# 五、Markdown的代码\n\n```\n1.如果是段落上的一个函数或片段的代码可以用反引号把它包起来（`），例如：\n\n`printf()` 函数\n\n2.代码区块\n代码区块使用 4 个空格或者一个制表符（Tab 键）\n\n3.可以用 ``` 包裹一段代码，并指定一种语言（也可以不指定）：\n\n```\n\n例如所示:  \n`printf()`\n\n```php\n<?php\n    echo \"1111\"; \n?>\n```\n\n```java\n    int a = 1;\n    System.out.println(a);\n```\n-----------------------\n\n# 六、Markdown的链接\n\n```\n链接使用方法如下：\n[链接名称](链接地址)\n或者\n<链接地址>\n例如：\n\n[我的博客网址](http://hplts.github.io)\n\n\n高级链接\n我们可以通过变量来设置一个链接，变量赋值在文档末尾进行：\n\n这个链接用 1 作为网址变量 [Google][1]\n这个链接用 runoob 作为网址变量 [Runoob][runoob]\n然后在文档的结尾为变量赋值（网址）\n\n  [1]: http://www.google.com/\n  [runoob]: http://www.runoob.com/\n```\n\n这是一个链接 [我的博客网址](http://hplts.github.io)\n\n或者 直接输出链接\n\n<http://hplts.github.io>\n\n# 七、Markdown的图片\n\n```\nMarkdown 图片语法格式如下：\n\n![alt 属性文本](图片地址)\n\n![alt 属性文本](图片地址 \"可选标题\")\n开头一个感叹号 !\n接着一个方括号，里面放上图片的替代文字\n接着一个普通括号，里面放上图片的网址，最后还可以用引号包住并加上选择性的 \'title\' 属性的文字。\n    \n```\n\n![美女图片](https://pic.downk.cc/item/5e9ecac3c2a9a83be585549a.jpg \"如图所示\")\n\n--------------------\n\n# 八、Markdown的表格\n\n```\n1.Markdown 制作表格使用 | 来分隔不同的单元格，使用 - 来分隔表头和其他行。\n\n语法格式如下：\n\n|  表头   | 表头  |\n|  ----  | ----  |\n| 单元格  | 单元格 |\n| 单元格  | 单元格 |\n\n2.对齐方式\n\n我们可以设置表格的对齐方式：\n\n-: 设置内容和标题栏居右对齐。\n:- 设置内容和标题栏居左对齐。\n:-: 设置内容和标题栏居中对齐。\n实例如下：\n\n| 左对齐 | 右对齐 | 居中对齐 |\n| :-----| ----: | :----: |\n| 单元格 | 单元格 | 单元格 |\n| 单元格 | 单元格 | 单元格 |\n```\n\n例如所示：\n\n| 左对齐 | 右对齐 | 居中对齐 |\n| :-----| ----: | :----: |\n| 单元格 | 单元格 | 单元格 |\n| 单元格 | 单元格 | 单元格 |\n\n# 九、Markdown的高级技巧\n\n```\n1.支持的 HTML 元素\n不在 Markdown 涵盖范围之内的标签，都可以直接在文档里面用 HTML 撰写。\n\n目前支持的 HTML 元素有：<kbd> <b> <i> <em> <sup> <sub> <br>等 ，如：\n\n使用 <kbd>Ctrl</kbd>+<kbd>Alt</kbd>+<kbd>Del</kbd> 重启电脑\n\n2.转义：使用\\进行转义\nMarkdown 使用了很多特殊符号来表示特定的意义，如果需要显示特定的符号则需要使用转义字符，Markdown 使用反斜杠转义特殊字符：\n\n**文本加粗** \n\\*\\* 正常显示星号 \\*\\*\n\n```\n## typora 画流程图、时序图(顺序图)、甘特图\n\n### 1、横向流程图源码格式：\n\n```mermaid\ngraph LR\nA[方形] -->B(圆角)\n    B --> C{条件a}\n    C -->|a=1| D[结果1]\n    C -->|a=2| E[结果2]\n    F[横向流程图]\n```\n2、竖向流程图源码格式：\n\n```mermaid\ngraph TD\nA[方形] --> B(圆角)\n    B --> C{条件a}\n    C --> |a=1| D[结果1]\n    C --> |a=2| E[结果2]\n    F[竖向流程图]\n```\n\n3、标准流程图源码格式：\n\n```flow\nst=>start: 开始框\nop=>operation: 处理框\ncond=>condition: 判断框(是或否?)\nsub1=>subroutine: 子流程\nio=>inputoutput: 输入输出框\ne=>end: 结束框\nst->op->cond\ncond(yes)->io->e\ncond(no)->sub1(right)->op\n```\n\n4、标准流程图源码格式（横向）：\n\n```flow\nst=>start: 开始框\nop=>operation: 处理框\ncond=>condition: 判断框(是或否?)\nsub1=>subroutine: 子流程\nio=>inputoutput: 输入输出框\ne=>end: 结束框\nst(right)->op(right)->cond\ncond(yes)->io(bottom)->e\ncond(no)->sub1(right)->op\n```\n\n5、UML时序图源码样例：\n\n```sequence\n对象A->对象B: 对象B你好吗?（请求）\nNote right of 对象B: 对象B的描述\nNote left of 对象A: 对象A的描述(提示)\n对象B-->对象A: 我很好(响应)\n对象A->对象B: 你真的好吗？\n```\n\n6、UML时序图源码复杂样例：\n\n```sequence\nTitle: 标题：复杂使用\n对象A->对象B: 对象B你好吗?（请求）\nNote right of 对象B: 对象B的描述\nNote left of 对象A: 对象A的描述(提示)\n对象B-->对象A: 我很好(响应)\n对象B->小三: 你好吗\n小三-->>对象A: 对象B找我了\n对象A->对象B: 你真的好吗？\nNote over 小三,对象B: 我们是朋友\nparticipant C\nNote right of C: 没人陪我玩\n```\n\n7、UML标准时序图样例：\n\n```mermaid\n%% 时序图例子,-> 直线，-->虚线，->>实线箭头\n  sequenceDiagram\n    participant 张三\n    participant 李四\n    张三->王五: 王五你好吗？\n    loop 健康检查\n        王五->王五: 与疾病战斗\n    end\n    Note right of 王五: 合理 食物 <br/>看医生...\n    李四-->>张三: 很好!\n    王五->李四: 你怎么样?\n    李四-->王五: 很好!\n```\n\n8、甘特图样例：\n\n```mermaid\n%% 语法示例\n        gantt\n        dateFormat  YYYY-MM-DD\n        title 软件开发甘特图\n        section 设计\n        需求                      :done,    des1, 2014-01-06,2014-01-08\n        原型                      :active,  des2, 2014-01-09, 3d\n        UI设计                     :         des3, after des2, 5d\n    未来任务                     :         des4, after des3, 5d\n        section 开发\n        学习准备理解需求                      :crit, done, 2014-01-06,24h\n        设计框架                             :crit, done, after des2, 2d\n        开发                                 :crit, active, 3d\n        未来任务                              :crit, 5d\n        耍                                   :2d\n        section 测试\n        功能测试                              :active, a1, after des3, 3d\n        压力测试                               :after a1  , 20h\n        测试报告                               : 48h\n```', '2021-02-07 02:16:41', '2021-02-07 02:16:44', 0);
INSERT INTO `blog` VALUES (15, 1, '解决servlet的乱码问题', '-学习\n-记录', '## servlet中请求乱码问题解决: \n### 1.最有效的办法：\n    使用 String 进行重新编码： uname=new String(uname.getBytes(\"iso8859-1\"),\"utf-8\"); \n### 2.Get 方式请求： \n    在 service 方法中使用: req.setCharacterEncoding(“utf-8”)； \n    在 tomcat 服务器目录下的 conf 文件下找到 server.xml 文件，打开进 行如下配置: \n![picture](https://pic.downk.cc/item/5e9ebc7dc2a9a83be5786ced.png)\n### 3.Post 方式请求： \n    在 service 方法中使用: req.setCharacterEncoding(“utf-8”)；', '2021-02-06 23:34:48', '2021-02-06 23:34:48', 0);
INSERT INTO `blog` VALUES (16, 2, '面向对象和面向过程的区别', '-学习\n-java', '- **面向过程** ：**面向过程性能比面向对象高。** 因为类调用时需要实例化，开销比较大，比较消耗资源，所以当性能是最重要的考量因素的时候，比如单片机、嵌入式开发、Linux/Unix 等一般采用面向过程开发。但是，**面向过程没有面向对象易维护、易复用、易扩展。**\n\n- **面向对象** ：**面向对象易维护、易复用、易扩展。** 因为面向对象有封装、继承、多态性的特性，所以可以设计出低耦合的系统，使系统更加灵活、更加易于维护。但是，**面向对象性能比面向过程低**。\n', '2021-02-07 01:07:33', '2021-02-07 01:07:33', 0);
INSERT INTO `blog` VALUES (17, 2, 'Java 语言有哪些特点?', '-学习\n-java', '1. 简单易学；\n2. 面向对象（封装，继承，多态）；\n3. 平台无关性（ Java 虚拟机实现平台无关性）；\n4. 可靠性；\n5. 安全性；\n6. 支持多线程（ C++ 语言没有内置的多线程机制，因此必须调用操作系统的多线程功能来进行多线程程序设计，而 Java 语言却提供了多线程支持）；\n7. 支持网络编程并且很方便（ Java 语言诞生本身就是为简化网络编程设计的，因此 Java 语言不仅支持网络编程而且很方便）；\n8. 编译与解释并存；\n', '2021-02-07 01:08:18', '2021-02-07 01:08:18', 0);
INSERT INTO `blog` VALUES (18, 2, 'Java 和 C++的区别?', '-学习\n-java', '我知道很多人没学过 C++，但是面试官就是没事喜欢拿咱们 Java 和 C++ 比呀！没办法！！！就算没学过 C++，也要记下来！\n\n- 都是面向对象的语言，都支持封装、继承和多态\n- Java 不提供指针来直接访问内存，程序内存更加安全\n- Java 的类是单继承的，C++ 支持多重继承；虽然 Java 的类不可以多继承，但是接口可以多继承。\n- Java 有自动内存管理机制，不需要程序员手动释放无用内存\n- **在 C 语言中，字符串或字符数组最后都会有一个额外的字符‘\\0’来表示结束。但是，Java 语言中没有结束符这一概念。', '2021-02-07 01:09:08', '2021-02-07 01:09:08', 0);
INSERT INTO `blog` VALUES (19, 11, ' 接口和抽象类的区别是什么？', '-学习\n-java', '1. 接口的方法默认是 public，所有方法在接口中不能有实现(Java 8 开始接口方法可以有默认实现），而抽象类可以有非抽象的方法。\n2. 接口中除了 static、final 变量，不能有其他变量，而抽象类中则不一定。\n3. 一个类可以实现多个接口，但只能实现一个抽象类。接口自己本身可以通过 extends 关键字扩展多个接口。\n4. 接口方法默认修饰符是 public，抽象方法可以有 public、protected 和 default 这些修饰符（抽象方法就是为了被重写所以不能使用 private 关键字修饰！）。\n5. 从设计层面来说，抽象是对类的抽象，是一种模板设计，而接口是对行为的抽象，是一种行为的规范。\n', '2021-02-07 01:11:01', '2021-02-07 01:11:01', 0);
INSERT INTO `blog` VALUES (20, 1, 'Java 集合概览', '-学习\n-集合', '### Java 集合概览\n\n从下图可以看出，在 Java 中除了以 Map 结尾的类之外， 其他类都实现了 `Collection` 接口。\n\n并且，以 `Map` 结尾的类都实现了 `Map` 接口。\n\n![85101047-1646be80-b234-11ea-90ee-f4be604b0183.png](https://i.loli.net/2020/06/19/JvCHs5BS34ZkO1l.png)\n\n### 说说 List,Set,Map 三者的区别？\n\n- `List`(对付顺序的好帮手)： 存储的元素是有序的、可重复的。\n- `Set`(注重独一无二的性质): 存储的元素是无序的、不可重复的。\n- `Map`(用 Key 来搜索的专家): 使用键值对（kye-value）存储，类似于数学上的函数 y=f(x)，“x”代表 key，\"y\"代表 value，Key 是无序的、不可重复的，value 是无序的、可重复的，每个键最多映射到一个值。\n\n### 集合框架底层数据结构总结\n\n先来看一下 `Collection` 接口下面的集合。\n\n#### List\n\n- `Arraylist`： `Object[]`数组\n- `Vector`：`Object[]`数组\n- `LinkedList`： 双向链表(JDK1.6 之前为循环链表，JDK1.7 取消了循环)\n\n#### Set\n\n- `HashSet`（无序，唯一）: 基于 `HashMap` 实现的，底层采用 `HashMap` 来保存元素\n- `LinkedHashSet`：`LinkedHashSet` 是 `HashSet` 的子类，并且其内部是通过 `LinkedHashMap` 来实现的。有点类似于我们之前说的 `LinkedHashMap` 其内部是基于 `HashMap` 实现一样，不过还是有一点点区别的\n- `TreeSet`（有序，唯一）： 红黑树(自平衡的排序二叉树)\n\n再来看看 `Map` 接口下面的集合。\n\n#### Map\n\n- `HashMap`： JDK1.8 之前 HashMap 由数组+链表组成的，数组是 HashMap 的主体，链表则是主要为了解决哈希冲突而存在的（“拉链法”解决冲突）。JDK1.8 以后在解决哈希冲突时有了较大的变化，当链表长度大于阈值（默认为 8）（将链表转换成红黑树前会判断，如果当前数组的长度小于 64，那么会选择先进行数组扩容，而不是转换为红黑树）时，将链表转化为红黑树，以减少搜索时间\n- `LinkedHashMap`： `LinkedHashMap` 继承自 `HashMap`，所以它的底层仍然是基于拉链式散列结构即由数组和链表或红黑树组成。另外，`LinkedHashMap` 在上面结构的基础上，增加了一条双向链表，使得上面的结构可以保持键值对的插入顺序。同时通过对链表进行相应的操作，实现了访问顺序相关逻辑。详细可以查看：[《LinkedHashMap 源码详细分析（JDK1.8）》](https://www.imooc.com/article/22931)\n- `Hashtable`： 数组+链表组成的，数组是 HashMap 的主体，链表则是主要为了解决哈希冲突而存在的\n- `TreeMap`： 红黑树（自平衡的排序二叉树）', '2021-02-07 01:58:56', '2021-02-07 01:58:56', 0);
INSERT INTO `blog` VALUES (21, 19, 'SpringMVC入门', '-学习\n-spring', '> **Spring MVC是Spring Framework的一部分，是基于Java实现MVC的轻量级Web框架。**\n>\n> [官网文档地址](https://docs.spring.io/spring-framework/docs/5.2.0.RELEASE/spring-framework-reference/web.html#spring-web)\n\n**我们为什么要学习SpringMVC呢?**\n\nSpring MVC的特点：\n\n1. 轻量级，简单易学\n2. 高效 , 基于请求响应的MVC框架\n3. 与Spring兼容性好，无缝结合\n4. 约定优于配置\n5. 功能强大：RESTful、数据验证、格式化、本地化、主题等\n6. 简洁灵活\n\n**Spring的web框架围绕DispatcherServlet[ 调度Servlet ] 设计**。\n\nDispatcherServlet的作用是将请求分发到不同的处理器。从Spring 2.5开始，使用Java 5或者以上版本的用户可以采用基于注解形式进行开发，十分简洁；\n\n正因为SpringMVC好 , 简单 , 便捷 , 易学 , 天生和Spring无缝集成(使用SpringIoC和Aop) , 使用约定优于配置 . 能够进行简单的junit测试 . 支持Restful风格 .异常处理 , 本地化 , 国际化 , 数据验证 , 类型转换 , 拦截器 等等......所以我们要学习 .\n\n**最重要的一点还是用的人多 , 使用的公司多 .**\n\n## 二.SpringMVC入门程序\n\n### 1.步骤\n\n1. 建立子项目spingmvc-02-hello，添加web框架\n2. 配置web.xml，注册DispatcherServlet\n3. 在resources目录中创建springmvc-servlet.xml，添加处理器映射器，处理器适配器，视图解析器\n4. 在java目录中创建com/hp/controller/HelloController.java\n5. 注册类到springmvc-servlet.xml\n6. 在WEB-INF下创建jsp/hello.jsp\n7. 查看是否导入lib包，配置Tomcat，执行程序\n\n**建立子项目spingmvc-02-hello，添加web框架，配置web.xml，注册DispatcherServlet**\n\n```xml\n<!--1.注册DispatcherServlet-->\n<servlet>\n    <servlet-name>springmvc</servlet-name>\n    <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>\n    <!--关联一个springmvc的配置文件:【servlet-name】-servlet.xml-->\n    <init-param>\n        <param-name>contextConfigLocation</param-name>\n        <param-value>classpath:springmvc-servlet.xml</param-value>\n    </init-param>\n    <!--启动级别-1-->\n    <load-on-startup>1</load-on-startup>\n</servlet>\n\n<!--/ 匹配所有的请求；（不包括.jsp）-->\n<!--/* 匹配所有的请求；（包括.jsp）-->\n<servlet-mapping>\n    <servlet-name>springmvc</servlet-name>\n    <url-pattern>/</url-pattern>\n</servlet-mapping>\n```\n\n**在resources目录中创建springmvc-servlet.xml，添加处理器映射器，处理器适配器，视图解析器**\n\n```xml\n<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<beans xmlns=\"http://www.springframework.org/schema/beans\"\n	   xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\n	   xsi:schemaLocation=\"http://www.springframework.org/schema/beans\n       http://www.springframework.org/schema/beans/spring-beans.xsd\">\n\n	<!--处理器映射器-->\n	<bean class=\"org.springframework.web.servlet.handler.BeanNameUrlHandlerMapping\"/>\n\n	<!--处理器适配器-->\n	<bean class=\"org.springframework.web.servlet.mvc.SimpleControllerHandlerAdapter\"/>\n\n	<!--视图解析器:DispatcherServlet给他的ModelAndView-->\n	<bean class=\"org.springframework.web.servlet.view.InternalResourceViewResolver\" id=\"InternalResourceViewResolver\">\n		<!--前缀-->\n		<property name=\"prefix\" value=\"/WEB-INF/jsp/\"/>\n		<!--后缀-->\n		<property name=\"suffix\" value=\".jsp\"/>\n	</bean>\n\n\n</beans>\n\n```\n\n**在java目录中创建com.hp/controller/HelloController.java**\n\n```java\npackage com.hp.controller;\n\nimport org.springframework.web.servlet.ModelAndView;\nimport org.springframework.web.servlet.mvc.Controller;\n\nimport javax.servlet.http.HttpServletRequest;\nimport javax.servlet.http.HttpServletResponse;\n\n/**\n * @Auther: Administrator\n * @Date: 2021-01-22\n * @Description: 第一个SpringMVC程序\n */\npublic class HelloController implements Controller {\n    @Override\n    public ModelAndView handleRequest(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {\n        //ModelAndView 模型和视图\n        ModelAndView mv = new ModelAndView();\n        //封装对象，放在ModelAndView中\n        mv.addObject(\"msg\",\"HelloSpringMVC!\");\n        //封装要跳转的视图，放在ModelAndView中\n        // /WEB-INF/jsp/hello.jsp\n        mv.setViewName(\"hello\");\n        return mv;\n    }\n}\n\n```\n\n**注册类到springmvc-servlet.xml**\n\n```xml\n<!--Handler-->\n	<bean id=\"/hello\" class=\"com.hp.controller.HelloController\"/>\n```\n\n**在WEB-INF下创建jsp/hello.jsp**\n\n```jsp\n<%--\n  Created by IntelliJ IDEA.\n  User: Administrator\n  Date: 2021-01-22\n  Time: 16:24\n  To change this template use File | Settings | File Templates.\n--%>\n<%@ page contentType=\"text/html;charset=UTF-8\" language=\"java\" %>\n<%\n    String path = request.getContextPath();\n    String basePath = request.getScheme() + \"://\" + request.getServerName() + \":\" + request.getServerPort() + path + \"/\";\n%>\n<html>\n<head>\n    <base href=\"<%=basePath%>\">\n    <title>第一个SpringMVC</title>\n</head>\n<body>\n    <div style=\"width: 300px;height: 300px;text-align: center;margin: auto\">\n        <!--这里展示的msg就是之前我们在HelloController中发送过来的信息\n        mv.addObject(\"msg\",\"hello SpringMVC\");-->\n        <p>${msg}</p>\n    </div>\n</body>\n</html>\n\n```\n\n**配置Tomcat，执行程序**\n\n```注意：```但是有时候也会报404错误\n\n![1611305159041](C:\\Users\\Administrator\\AppData\\Roaming\\Typora\\typora-user-images\\1611305159041.png)\n\n`这个时候我们要查看是否导入lib包`\n\n1. 在WEB-INF目录下添加一个lib目录\n\n   ![1611304916223](C:\\Users\\Administrator\\AppData\\Roaming\\Typora\\typora-user-images\\1611304916223.png)\n\n2. 添加library Files 导入所有包\n\n   ![1611305032088](C:\\Users\\Administrator\\AppData\\Roaming\\Typora\\typora-user-images\\1611305032088.png)\n\n3. 点击Apply和OK即可\n\n## 三.SpringMVC的执行原理\n\n###### ![1611296119566](C:\\Users\\Administrator\\AppData\\Roaming\\Typora\\typora-user-images\\1611296119566.png)\n\n### **简要分析执行流程**\n\n1. DispatcherServlet表示前置控制器，是整个SpringMVC的控制中心。用户发出请求，DispatcherServlet接收请求并拦截请求。-\n   - 我们假设请求的url为 : http://localhost:8080/SpringMVC/hello\n   - **如上url拆分成三部分：**\n   - http://localhost:8080服务器域名\n   - SpringMVC部署在服务器上的web站点\n   - hello表示控制器\n   - 通过分析，如上url表示为：请求位于服务器localhost:8080上的SpringMVC站点的hello控制器。\n2. HandlerMapping为处理器映射。DispatcherServlet调用HandlerMapping,HandlerMapping根据请求url查找Handler。\n3. HandlerExecution表示具体的Handler,其主要作用是根据url查找控制器，如上url被查找控制器为：hello。\n4. HandlerExecution将解析后的信息传递给DispatcherServlet,如解析控制器映射等。\n5. HandlerAdapter表示处理器适配器，其按照特定的规则去执行Handler。\n6. Handler让具体的Controller执行。\n7. Controller将具体的执行信息返回给HandlerAdapter,如ModelAndView。\n8. HandlerAdapter将视图逻辑名或模型传递给DispatcherServlet。\n9. DispatcherServlet调用视图解析器(ViewResolver)来解析HandlerAdapter传递的逻辑视图名。\n10. 视图解析器将解析的逻辑视图名传给DispatcherServlet。\n11. DispatcherServlet根据视图解析器解析的视图结果，调用具体的视图。\n12. 最终视图呈现给用户。\n', '2021-02-07 17:50:42', '2021-02-07 17:50:42', 0);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱唯一',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` int(0) NOT NULL DEFAULT 0,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  INDEX `UK_USERNAME`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'admin-1.png', '2417490714@qq.com', '96e79218965eb72c92a549dd5a330112', 1, '2021-02-06 23:53:15', '2021-02-06 23:53:18');
INSERT INTO `user` VALUES (2, 'root', 'root-1.png', '1453714437@qq.com', 'e10adc3949ba59abbe56e057f20f883e', 1, '2021-02-06 23:53:21', '2021-02-06 23:53:25');
INSERT INTO `user` VALUES (18, '小胡', '小胡-logo.jpg', '123456789@qq.com', 'e10adc3949ba59abbe56e057f20f883e', 0, '2021-02-07 17:31:38', '2021-02-07 17:31:38');
INSERT INTO `user` VALUES (19, '小花', '小花-2.jpg', '123456@qq.com', 'e10adc3949ba59abbe56e057f20f883e', 0, '2021-02-07 17:48:27', '2021-02-07 17:48:27');

SET FOREIGN_KEY_CHECKS = 1;
