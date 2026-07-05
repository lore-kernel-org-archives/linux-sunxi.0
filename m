Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB08939EF20
	for <linux-sunxi@lists.linux.dev>; Sun,  5 Jul 2026 19:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783280468; cv=none; b=my8aQh3wIYk78jgrz0PPkQkQiLSXUDr2vgn+Z9hvnREgfPkBoXjBT4lji5IrqQC7l8glu5M1NZzWU3x3ytO+3OxA2YylIx9oB+tky97QmX5KPPajF3wzUpwYg/4ia08uOPBMDWID2vEHBOibWtxYz64KhnCyXjMNN6J+3Jq2mdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783280468; c=relaxed/simple;
	bh=aDbMtkb7vLXS6gEaXl0MiYPwbTWQdGwMD5R/KH8kYUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s9DydzOaBsbR//FeDr47x6MkB05LPTG/M9cxHmP0KGvM+N4oPP17nzdZEKJEQVpMHsebC67lsDrNI6y9vD0xp386QL2fwvk5biiIkn8VH8+BsVWXAeG76xIB4sTjS6O78FGZu+4bpVqOeoZ19V5+Y3hmvqUMs4zZs8K6nyI6NfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gu2AUpMP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A+kIV2g4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gu2AUpMP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A+kIV2g4"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665HiVJB2201609
	for <linux-sunxi@lists.linux.dev>; Sun, 5 Jul 2026 19:41:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YE6y7UueLsf
	6Wosu2MYgZO8ntkoAFUpog26frL0IVlI=; b=Gu2AUpMPsdWihBeIKFaHZTQdE6w
	3hlEj5FaB6LO25HrrwgnnnhbotR4nd9Z4wSGwf4UfkCGQV/6ByGXzYxc9t77t1UR
	KxydvfiZRzO7LVQt12P9iUwRudBr1BpCa8xRlWA11APsaC65cFh9VkqkdXLfhVEu
	RS7FUpWGXF4DoGxxuONB7a1iHQSW5kUybFXNTGlhVzncQd/ITVBR3Qzh2FEbhv44
	Ssss7TOOyxh8WnUK7ITPBb/1fcoeLek05gTbaYXanK/TXcrfcsX30aor/3gRRzD7
	xH/7V5eC+aAPsHQJS4BlpVVOM2yO5umWhzidCMbdBGwQ6NruQAfsY+kAKHw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6txek767-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Sun, 05 Jul 2026 19:41:05 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ca0481106cso24488055ad.0
        for <linux-sunxi@lists.linux.dev>; Sun, 05 Jul 2026 12:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280465; x=1783885265; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YE6y7UueLsf6Wosu2MYgZO8ntkoAFUpog26frL0IVlI=;
        b=A+kIV2g4I8QRIxcOBT1tqyvQ1ZNDtCY5prDWBNdq/inOGR2bSJ1/sygE0TIVmesVwK
         k/odRaY7JDgY8/K5KFxKLTGOFdnXF5K9/nkIUT5UBGYYy7Q+9t4VynFN7n5qUFzsUsB2
         M3bqQvo726XdzGtVYWen0mMP3zdXHQ245NUgNEB5KyzQroq98NK2eBNhORwtg5hZKuUM
         fG3V1FxMAxUr9Lz18PilWafsTvmpyf7agO+zMfe1mzvPbNVqpv3XaWumYAlcxRdtw5A8
         bIhyqpejKiZwv7hh92LdnTL5hvcjot0GZAHoUf2TOqFpT4/kiDNVioEnnBojJU1VoFSH
         8oXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280465; x=1783885265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YE6y7UueLsf6Wosu2MYgZO8ntkoAFUpog26frL0IVlI=;
        b=WSyWUx+TQpDT7SyQoZbyqgkBqPIXAgVLAKiow4lzWlm0E9sU3vVmti+VmZN56ayFQq
         MV4h8zwToN84FOuC59j8hrVrJetcYiznqbi5QCdvIuXaWEd0WAbKue6rRIZiy6Nngvdl
         zgDTN2IahWu9rLdbPHGYzkQjBIE1uzqwbX64PW8A1TYxyKQUBGFb4SpH40qBQlvr/cIS
         d5cEgLbGziMhOk8zv5L1yfqlPkQi5jkR8WrS8g/v7k+4ApfrFDQKupw5wff4Z1PlYmwn
         i0XMCurk+Y9PQJoKXUF693T5pRwAWy42Ee5QfRMH4hkOj2DIJmeNfco4HahurggLZ/s7
         Y1fA==
X-Forwarded-Encrypted: i=1; AHgh+RqUo8OrJwxnDB61FRdZGQLqvmj+CemHIJ1V2Gpy/UUDmdY9aTV/egFCPB+0QrJVOsYuOFmhgqaTZgwgTA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwVJRsRxBmJiNnJg9sg/ty+BWal5/0T3rpm2e/y+JlXaHlhVa8H
	4fRQelWyQIzxBraNUk4HF4jqGhalmRjs88IKux/nwhbJTT/6K1dzPWZSw/hZW1OpuXx9GFY+JgH
	8lSZK2MmF4uTDaPDrixlnofCWBHlambFqAOg1umtZkezYdMJnnFtthdhm/qbJkD7sPA==
X-Gm-Gg: AfdE7cnnJ2c17n6GsnSuHvixy7d+jVfU03DBU7qrO/HwNB7ITrikJl9qz+oQPDTYbHh
	BfIOdID8RKDW13+1f47aUkR95VuLD6UFI/3zaU2KC2x67QcuvZOXXGvEEXfPNMZPyh3tfQokQZP
	ZlVpd9vHAN/3S4Zff5cK5D8mkhEaa3hQZFy6bRmP/yIvVIXBSlanC2OzD2qAbQbaz+TRDTI5HYx
	yCtAZb8OD1mncsZQXQopWS28dCUnVrjTZrZquI4r0KYaxbsHge8XHmM1YIhir6d4wmUznNIlswY
	tflRroSYcVx0QXrTrO+cEB5can7VrI98JvHdphl1mkT0g9ousLqgbUbVFsaO848y1cYIEkbHM83
	pv3j6dVIjTXXEIvFcwvE4MlI2H3AscEDkcYqEqw==
X-Received: by 2002:a17:902:f60a:b0:2c7:f12d:5d37 with SMTP id d9443c01a7336-2cbb9e264d9mr68673725ad.17.1783280465201;
        Sun, 05 Jul 2026 12:41:05 -0700 (PDT)
X-Received: by 2002:a17:902:f60a:b0:2c7:f12d:5d37 with SMTP id d9443c01a7336-2cbb9e264d9mr68673415ad.17.1783280464710;
        Sun, 05 Jul 2026 12:41:04 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:41:04 -0700 (PDT)
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
Subject: [PATCH 38/42] ASoC: SOF: mediatek: mt8186: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:14 +0530
Message-ID: <20260705194019.2565498-6-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX9alGBGVkFvFz
 JWGGRh4Hwb+tHxejLM5Et2zxwQpLvdcAK0SSiu65+QiQbtcnqOGYrcx5d9933xzB22MNr7HWS5C
 F5nkwpxp/CvK2JJHjFz4SLIXtmstDGA=
X-Proofpoint-GUID: _5_yoKU21eOgiAkrZyHUiG76lA5zMX13
X-Proofpoint-ORIG-GUID: _5_yoKU21eOgiAkrZyHUiG76lA5zMX13
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX/eUOoT0ia/G9
 caFTYAgtdekF2oj+zGx5Zc3lGri+4zo5vfWKpqhOUYNzsY6DhLbovGcr2qKso12TehJ33pzp42a
 xCZdYErCkRfl0LVPjowERuV5aEh/My5efquTbswLaM2rV6bo8A4d8z51BpGnDlXjvkVnraipxlt
 eqqcc4FtCWsOiN3Ux1oc0VpgdKvLKhRZLUfUcoai49zwgrp5v30HPsivK+pAh7PYjhnEXRdjVEW
 MI8aTzYHohV/wCr34o6YgOvf8sN8okq9uFHUc77fGx7GTbEQPICuoTnrXYbigN2QUm5TQ0tln2s
 Co0yRpnUmkPVbvUbT1qRj0DMSprTvwKT0lSZvU11hbyQ+p4Go2l3XVb1o8ByE7WmR5vZvZjDCBD
 +yJFveuna5I6E4LDTthYl+9SxBSGGpnTgDJ+7FP1qn8zRQxaDcKwyVO0OMTOI7urzIeL8QJ6pyd
 U7x4mQQcRSz6fsYhA2Q==
X-Authority-Analysis: v=2.4 cv=HLLz0Itv c=1 sm=1 tr=0 ts=6a4ab352 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=YxFYfaw6DuWYmsw8bRUA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/sof/mediatek/mt8186/mt8186.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.c b/sound/soc/sof/mediatek/mt8186/mt8186.c
index c1bea967737d..a5ccee87e684 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186.c
+++ b/sound/soc/sof/mediatek/mt8186/mt8186.c
@@ -49,7 +49,7 @@ static int platform_parse_resource(struct platform_device *pdev, void *data)
 	struct mtk_adsp_chip_info *adsp = data;
 	int ret;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret) {
 		dev_err(dev, "of_reserved_mem_device_init failed\n");
 		return ret;
-- 
2.53.0

