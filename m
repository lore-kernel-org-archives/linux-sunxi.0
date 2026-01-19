Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66A430E0F4
	for <linux-sunxi@lists.linux.dev>; Mon, 19 Jan 2026 10:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768819241; cv=none; b=UZD/eTb6p3YyaYXfSDxMPxmmmRtjpkmwGze88L32dSbPPCHb12+2cEGc1uaUfbM339nXozTBChe9PY9yK9o6RUWxKpHGBDO06HSID0QreZ3RO/LNb8j7waV4aFffgBpFrcxI7a2jbmKtYxn4bwpsK17ijx1W0fycrRt6qh8EQzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768819241; c=relaxed/simple;
	bh=WqigZ1i/Zqs+7y6icbBSDn53U4awykhgsyQ1e8C6gJ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kYLCnxj0q9+n3bms/VDq1Gq5//fTwwxwWatN6m5Q5ZKwxGWuu766IcxDRm4LakCUggzYo/ke3oiWunYMmTQfVEglve5kQSy7YiJeCSyDtMH9Is7+uEaRtOSW9gqsVpeAT1OTjl+rthYSLvLS82DtTLSM7RkH+YgKHnPE+UEaTjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FAQzRxvE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rg6Ly1Z6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FAQzRxvE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rg6Ly1Z6"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J90jI4227888
	for <linux-sunxi@lists.linux.dev>; Mon, 19 Jan 2026 10:40:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DLE6Jb+dvX1EC2ApUxzM/nSNMTlzJNRVZzB5JSyB6YY=; b=FAQzRxvEmOkq4nwe
	6X908BdsC1UZgvdO3/qB+bGuI5yR1xBBxEiEQExUjqEMaEM8Jlxl3e1ibPb6qsKd
	mXEjmF/F5psoWQgO5tZXQi2phTwz+VlyzIMh0oMO35YGv4JXiAaoZGEKusEAnPiC
	f5MBTEfoWvsLIe4Sg1vzdQlW+s23AuxICYj2AUMxtSd5PxmJN9Z/ExawqgoiHq0K
	E+ux4kdd7FLsmVB9quWalT/U7JX2KVrmnDiCdcXakwkTr+96+BKqKNGL9uJsef4M
	5z7jP5VgC3pJQISC9gM57gVMbvJFY/r+Hndr7SwpMPcYJmrN5rX4OAqyFTdKaTMT
	zu6WgA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsgfr8m6b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Mon, 19 Jan 2026 10:40:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8bb9f029f31so1261053285a.2
        for <linux-sunxi@lists.linux.dev>; Mon, 19 Jan 2026 02:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768819235; x=1769424035; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DLE6Jb+dvX1EC2ApUxzM/nSNMTlzJNRVZzB5JSyB6YY=;
        b=Rg6Ly1Z659qQ9GY8bkQ48qFXmwxpwx+jbycNx7EW3FJSLAl8wL+gs16xa579miqUC6
         /HgirK3+ucjBH7LKVZfj4ET1H55m+iB/JENU52RPJ+kYyQqRZWi6WYr7pHB8LfPS+KNQ
         K4WNciFDa5wSbWfGRmTNR1IETyj28bMfBjxvdC1wcy2MCWky+Uy2I3YmIljPvY05fNL+
         n9ceMUkYKK2ZdlDeRL3KzFV1jmsLlNstvJQs59AVvv2mi/U3d0ijtZZRn28x98ftHuf9
         2W+/f9LFd2kuSLjTczdz0TAYU/Omo5Mjsxft95eOCZs/Q5KQ5sUlNUdoMgT5H28Z83zK
         nzpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768819235; x=1769424035;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DLE6Jb+dvX1EC2ApUxzM/nSNMTlzJNRVZzB5JSyB6YY=;
        b=jO3w4/K7qzMF7yrreQvTjG+uUKKI3HuNohcU6vdzRz2q9H6++348RlEjBksYz3xi2B
         kNTEgcZ7APALOzrVuR0xgaYw+xHuzJ9WcXZQWggNCQgSAgXCHDrHeFywzCMxYPR2zQUu
         iFmJSFqykAJKMogHajNZ725qrH2HytwmZDWZcvLIybMQ57ZNumriv9Qj4VqAAdf0OZJ2
         zXTHH1oYnPGPibQFXBOVRXrRASF6cvIkmgXJ4OLggkcOIQmK1xsmybvkML/pW+vdkU5I
         lqjt9QbQ14mXq1TMmmvKUVUYKtMC+QIFlEpzea+fbpOTgUiQHByGzCauJlvnLp1z5Uym
         63Jg==
X-Forwarded-Encrypted: i=1; AJvYcCVa8qyJdOqsBsPrqdMTJyjIy6qVXwqs9E+6H2hISl4eTN13YmhEKp+Lr9eRzsYuAsno0MPlzcy7hvoNLw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwvgwfzQjVeyq9LiUfKpIM66gHwUXs8iFp3gkBF0m8oYzGiI4N5
	8Hp7xTQqiGXbRkCkBbRYIo79zqDTWIK9CD7IBUqEQ/zdqWwxXQAe2hJmGHDHA0qDqK9+Yy7wkpG
	MR9wtFzjTw1cXXSxgUU5JswkMTt96dqXOgQ1dfqP+rGuubON2MiPWFx3SOd9SUS/nOw==
X-Gm-Gg: AY/fxX6I0VjWlNX811xyEd2Fq3EQSzedefrFsq8E3v7eAIz5fE+/zn2MMLWGTiYdUfW
	98N03wNIBIFUGJ8NMlsjus2RJ5vXjjVCRR22FUHlPZiIafs1cgyeZhkHz4F0Gdao4sA0OFItTNQ
	n9DyJ9PBG2puHfdCc3ky+ZnntwVkLgllsV+tDjLv2c8qxxhnUNHA/GlSA9vb4dItgL5wXBKWfJQ
	UT709+gizFrr2ubXRIRIIJcYdFBdOqA5fWu40ROo/DaM8aBpc8MPzdT8iO3EOEt8tsAzXwZOGYt
	3/EgOebh5Cfhnm8lsvjkVM6iX89gACGDFOR7h5xpDth/td/x39kF5C3JJ2ho3KGGGRwPxbGsdc4
	AIWfFkF7gmZV4a7wIVFY+ZvYNg1Ap+RK8njx1yXgN
X-Received: by 2002:a05:620a:2893:b0:8c3:650d:5785 with SMTP id af79cd13be357-8c6a66e90a2mr1549988085a.16.1768819235423;
        Mon, 19 Jan 2026 02:40:35 -0800 (PST)
X-Received: by 2002:a05:620a:2893:b0:8c3:650d:5785 with SMTP id af79cd13be357-8c6a66e90a2mr1549984985a.16.1768819234996;
        Mon, 19 Jan 2026 02:40:34 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4f55:d102:7129:1a8f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8c9cbcsm185185245e9.12.2026.01.19.02.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 02:40:34 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 11:40:13 +0100
Subject: [PATCH 2/8] base: soc: order includes alphabetically
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-soc-of-root-v1-2-32a0fa9a78b4@oss.qualcomm.com>
References: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com>
In-Reply-To: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-sunxi@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=994;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=WqigZ1i/Zqs+7y6icbBSDn53U4awykhgsyQ1e8C6gJ8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpbgoW6Dw6clE1IffARf8COVJxpRB8cEAp2x9pG
 TvHKRUu6z6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaW4KFgAKCRAFnS7L/zaE
 w6xoD/4rWvH3uol8I2IuxI/o8//O6VGtI2Wbz5D5ZYLXz0QFVJIXy2WIu6Ah7+ZEr0Efsod56Kc
 n2bdeCvg0FKZ4aLOs0Z0MwUwBiM9dd4taI3YhDwKv9mYioJwJKuwQe/XO/b7XuA9ao0/7tBOaCn
 IuV6Scj50Yg21Nzr6GRDYnNwJ+uyE+tuwUd/M40ldOm2s5EwYhEp7FsDBBP/E+omcFWjPS6Nov+
 kX2I2V2/yIUGQQWeG29kziuKfleRHlV1bU5cUE9pA1HNciTqA+mnvyxzxVWIkDQrharJUgQRtMY
 DlviBwLuIHWnF2ovA1my1PVrtpVBHBnamhoCKE1b+Juw7Y9sAYgMn9XHTfUliEBSAMWkrz1dlqo
 +zuMqU8zOf3a/BuE522FyiFZzLic3mZQgMWObGa6fVltN2UmTUFtssDi/u5JGQ1frFckvuQfRmX
 vfdP9mV6kZWAM8JRdKRr6Z5JyxG6XfRwQGGSMCsIBWJPIhZ3zRERqGaccJJmDFmb+u5F4+Y5T9M
 Y92DHCIjyI+KaAozrJzVRFGDtOwa4JGy649HKu5mRvgXI5D0G8lz3pTIYj/cmQPBPZa8uajAHFH
 ggYVJLo6V4JR3841jPEdpWhak9LAKC8Zmznb9a7qT7A0Ch1sKfQ5iKSJVloQbXmUPWuZyO8A1+y
 A1GAbxKMfKxOKAA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: Mmz4Pt-mR6N4iJzUJKfT9unvlVA_ZVUK
X-Proofpoint-GUID: Mmz4Pt-mR6N4iJzUJKfT9unvlVA_ZVUK
X-Authority-Analysis: v=2.4 cv=c4OmgB9l c=1 sm=1 tr=0 ts=696e0a23 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=ZFCmbahrWokcDKAChN0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA4NiBTYWx0ZWRfXzZ5EkKIFbdhM
 pxKkfWn74JO5lpYXUSgkYYy74RNr2iXpafSDaZE0fGean+BS7QZaAV9xQOJPJhcuqbNxYXZZkTh
 xSiC3yK34AumXroaexOsp+24w22js1NptBcgZu7SFjfv5bld1Bv7n9BGKJuBwYKH0kL7xYLcgfa
 o+mS8LW0R5iqoSw5+QSQJAVCFWdhrESVrSmt/IxYZAVSvbD5gVrGv6xNT8EAx039S1f+a+pGbkK
 Q2jpbZG1NplxxrIfe4pDb1gAtSzTLGQD9H0lSPjsYOk7pR+ePK3kzYWBxzVeYE0cqe/cRX1uRKN
 10lELWfTDEg/th2hbYQ4cFbzf4bRT2zk4Zi7W8QDlIMZxbtThHfaIqkX0XO8HWRRMi9/nMIlaT1
 savklCMIYw8mgd1Q+h9AVwk0RqIXYpd0Vh2CXny43Gy5lt/hThbBBJB5bJC3UkS3ZVovYBgtEal
 zhyGWhwgazFzIA08HAg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190086

For easier readability and maintenance, order the included headers
alphabetically.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/soc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/base/soc.c b/drivers/base/soc.c
index 282c38aece0de88049dc1e6e9bea00df52bed1ea..6f42632d2b0fcc8a729484e6ad270f9bcabe4a0b 100644
--- a/drivers/base/soc.c
+++ b/drivers/base/soc.c
@@ -5,16 +5,16 @@
  * Author: Lee Jones <lee.jones@linaro.org> for ST-Ericsson.
  */
 
-#include <linux/sysfs.h>
+#include <linux/err.h>
+#include <linux/glob.h>
+#include <linux/idr.h>
 #include <linux/init.h>
 #include <linux/of.h>
-#include <linux/stat.h>
 #include <linux/slab.h>
-#include <linux/idr.h>
 #include <linux/spinlock.h>
+#include <linux/stat.h>
+#include <linux/sysfs.h>
 #include <linux/sys_soc.h>
-#include <linux/err.h>
-#include <linux/glob.h>
 
 static DEFINE_IDA(soc_ida);
 

-- 
2.47.3

