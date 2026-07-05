Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CAF3A7843
	for <linux-sunxi@lists.linux.dev>; Sun,  5 Jul 2026 19:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783280488; cv=none; b=W7IMCqM/pte6ijgfPH8HBht2awzK5ZTYTwNZDHwruQYreOt9/Ntvskp9Tw0Q0xS5S6ZBg9u75OCJt1Y1EyHl91wvzSr9nEzF9CoksPW1dPxhx+04FS2ZAqlnWzfN1NMaTqZYy+bu+Q2RVH/MlI41DevvIjq9WFqNUlE0iEi8sLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783280488; c=relaxed/simple;
	bh=GVKkJosfWbaAfOvliUHFeY44e0c1PSKKGH2GQjW/JNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QzoexCSu5gezKOtkTjO6Fm7PvZ0vtCkKRjW2yUBBrI8mApGhtLs1PxNYSvFCQJYMBrdta/WPIJVpPexMjk2jz/n74K5nTM6WMB8AYzR2lcBPCV3uBn5S07m6jrHXQs7VufQJWlFKR9xLyIOs55vd65ULdGyPI1kKO33HNBkQHME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TLn6zhut; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i8nDKIyu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TLn6zhut";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i8nDKIyu"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665HhfVT2342421
	for <linux-sunxi@lists.linux.dev>; Sun, 5 Jul 2026 19:41:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NGgGvwnqAVQQEeBPG1kTtk7oaNyoX+6Tcm1yJclm2Pw=; b=TLn6zhutzCtePBXP
	eApN5L/sdm3XfMAHOZhP82YsbqE0e2xRcEAFk/+OzouZNGNfc26qhw5knDcbPcel
	BP5iZZDUvJOH4Kdt2QhgKPJOeoScqNJcXRyWCHIYBBbsIEBD0ZiVVQvHgMHBpB06
	KDdBLLvkRr12JNjMqEtNLmZCzmB3HEASAP+zwk9LWIkse6JF6XJ5aE2oTFOlREXB
	HWsjh1ZGAPgsRx3a1N+Une0Zk6nBS+M8q7Nzxb/+beCfZqlUhL0J/8be0mCDgioR
	WDJzt0GGrulk/kLFg2I0CGVxAo6WNnObMHMMKTDfE+fIZHUMdON7dtl7vgqPIl6I
	fMEfTw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6td3ba3s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Sun, 05 Jul 2026 19:41:25 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88cfe287e1so1421998a12.1
        for <linux-sunxi@lists.linux.dev>; Sun, 05 Jul 2026 12:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280485; x=1783885285; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NGgGvwnqAVQQEeBPG1kTtk7oaNyoX+6Tcm1yJclm2Pw=;
        b=i8nDKIyuZYf60uVQ4Y5GhgX5qu6utyqKGTuOmwXcP9Lh8rhXpelQ5u001Pzgxa9h1+
         QNSb2z31uHv7FHDk3aPn7LqEjoZocy0G3eLkVFWoj2Lc5/7Jlc1B+81zbwIMduhw0n7F
         lS+gzt1FvHIsKv8i2ezDG9AUeCcOA36l2gKq7wlwP+H/fB8eZFfEIITMlijgnRia6npj
         cSpKMb72uWb4QzSZQ1mPJBd0LA8AkRqwdaXr8fASxpD5g1L0NZH/cdfG4OvEAMDdKc1g
         ngnZgZG+lToy/Hcl27qcR2V/chPO7lh4omZXrq5hdNowbTnUdedyTD5G4+IvzfOzxzSQ
         copQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280485; x=1783885285;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NGgGvwnqAVQQEeBPG1kTtk7oaNyoX+6Tcm1yJclm2Pw=;
        b=BTbJ/MkmKWSxeeRyHTlAoo1rnRtScXAnPNMaS1/an+j1TnKORu71A/+sWe4GXdi9le
         x3Fa7mc31KDRctgxEjCaKhRer74z0kVFJN3smvqjeHWDNXXWrF0SQX3wb/yKEBh8tZ0Q
         YMgdag2KhJ/3+Cn3tL9x0qLA7w8YmfrqrK4+StxJlex8RD2hFGDxFjgTJ/QYXYuVc6aa
         RIq7AH3gfmitQjpAKz1thZrxuo+8DTvJ9SVwN9wCinR7qleG+dz5SELejQUKPDR+UGNw
         jfQNFt28EVUeiGLOW3C2sYYGsoF/bYlaKgg23AzWRtr5Qd36ZZHyv/vUKENxUWxgk5mC
         5k6g==
X-Forwarded-Encrypted: i=1; AHgh+RpcIdPM4LNZvHeT0akolNqfgnA4RRG8k9E/wr5vCM6s6CELwkLL/bHssBMFilU6HQG9mMznUxva0ERz1w==@lists.linux.dev
X-Gm-Message-State: AOJu0YyqdO6qKri2nuPNoqJqKvf2G1qzNcHrbO/4yd3QY0ki3fPRY7JR
	8bva/mpz4Hi/5yZZ8OzkEV6iYAbzT5STx+UDGrpQAaCLhJLxwP62m6d0GiOxz0xFBn8O9vYZX8c
	t+Q3QfGJ7qExBlSHsyFPd52jIfZO2U5geZ74X3Ho/jZ94LMC8afLFDIwEGZ5+RN4d4Q==
X-Gm-Gg: AfdE7cmp3eMS75lFRS30PXSCdh1b5crhE0dd+wa8tZj1KhyfmrzolIA48hTZXNeCSXo
	DyXuuCacnzuTln9CpvIH5PMDUVn59tgprIydCLCWQRtzdiBWoZy9AmAbPOBvW/l9BxMS6SwZA2z
	c18wvp5tySSRiM86o29v/zzw6xJWI2PrKx2HDaTWujjYCCCaqfn+IVKJYwogm7QFSEltQFP/ZXI
	z9kFde87cyypq79mK8JtS4SsZYRYl/Lx5/i7Ul2z1MGfTTEinpCOVGJUvZvkJkm1gN5Khjte6Dr
	k9eAEECkXg8RYr+w2jRrj4LTBbXuj/s3O622fmdZgwZOKn6rgXvl+BspIiuimTTcMLdOPwRnsX/
	M5rAXXV01Szbc1Gkro3WMxuFEHrdyZPR5TzaN9g==
X-Received: by 2002:a05:6a20:43a9:b0:3bf:9e25:1a13 with SMTP id adf61e73a8af0-3c03e26ff8cmr8745230637.15.1783280484466;
        Sun, 05 Jul 2026 12:41:24 -0700 (PDT)
X-Received: by 2002:a05:6a20:43a9:b0:3bf:9e25:1a13 with SMTP id adf61e73a8af0-3c03e26ff8cmr8745209637.15.1783280483924;
        Sun, 05 Jul 2026 12:41:23 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:41:23 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, sound-open-firmware@alsa-project.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 41/42] ASoC: fsl: imx-rpmsg: Use devm_of_reserved_mem_device_init_by_idx()
Date: Mon,  6 Jul 2026 01:10:17 +0530
Message-ID: <20260705194019.2565498-9-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfXzdrnXJ1qwsI5
 G73m4DJck0jxbDjckdL/PilNvw8m0VQqkIsbv6pQrOSR3QPGgE1aSnUrpXDW0uG2nCI6BE17uMk
 WG1jULND8WqLRdEnD+qAZ5343AkQGPY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX1UXdbUishTc5
 hvoZonOtr5SYuApB6NBkQ0uegsI7ZRaYykhEM5EGNS5h4Oeb6NFl1pTSHZ/ELbphBqVgp4byr5n
 cL1A7MHAEtxEZgWUOlA/QU0oGe2sLW7Zf/IiN54cBFP4XUQQ1tT7nT2t/9r3fpc7rx59/fsFMxh
 SxSQcN4sf6dZMO3wWqeslJHlMPEujHHJDnMDdwDtuYHH7nnk45DMMhsZaJ2BmXgPCaj/Jft2zYa
 6FuJeyjq5SQCVdhom3lAsE7Y3pW+QsVPes7XVNSpNL1F4/NllBclzWHxyZIUD+nlPe15acgkUoH
 UCdRLsWKOf0KKViWAGNSa9wt6fv3M6ZMSPzvlf98P/svY5CmnulraN0hX/a8IyREUxwJluSZ005
 3zE6GxmKpt4hdqqiGcLkfhHmD3zpaLwsJsMyOdsJmaogfqK4PuMf/fIMx6T0dutnfKKUQyj2Lbb
 sHMpUY2Eg8qBnnj8Aew==
X-Proofpoint-GUID: 0vumLG87Aq8Oa_-RscqK6MRfPFq9ABXQ
X-Proofpoint-ORIG-GUID: 0vumLG87Aq8Oa_-RscqK6MRfPFq9ABXQ
X-Authority-Analysis: v=2.4 cv=b9GCJNGx c=1 sm=1 tr=0 ts=6a4ab365 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=dtkDxOtodmQ1SLiiO2kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212

Use the devres-managed devm_of_reserved_mem_device_init_by_idx() to
ensure the reserved memory region is released on device removal, fixing
a missing cleanup — the driver has no remove function.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/fsl/imx-rpmsg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/imx-rpmsg.c b/sound/soc/fsl/imx-rpmsg.c
index 5f1af258caf2..f504d94c4f68 100644
--- a/sound/soc/fsl/imx-rpmsg.c
+++ b/sound/soc/fsl/imx-rpmsg.c
@@ -199,7 +199,7 @@ static int imx_rpmsg_probe(struct platform_device *pdev)
 		goto fail;
 	}
 
-	ret = of_reserved_mem_device_init_by_idx(&pdev->dev, np, 0);
+	ret = devm_of_reserved_mem_device_init_by_idx(&pdev->dev, np, 0);
 	if (ret)
 		dev_warn(&pdev->dev, "no reserved DMA memory\n");
 
-- 
2.53.0

