---
layout: post
title: "Office Tips"
date: 2016-08-20
category: "office" 
tags: [libreoffice]
---

## Calc

### 计算H18->H96这一列中所有小于50的数的和
    
    1. SUMIF(H18:H96,"<50",H18:H96)
    2. 用I列标记每一项是否需要计入总和(1, 0)，然后用SUMPRODUCT做乘积求和
        SUMPRODUCT((H18:H96), (I18:I96))
