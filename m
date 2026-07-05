Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20853A16B6
	for <linux-sunxi@lists.linux.dev>; Sun,  5 Jul 2026 19:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783280435; cv=none; b=Ui5txwIq+z5mh3f8Bo03088XhgwSDm9AHYV4qDSbNCaKo7L8+TziyXRAWEbfE3rzZNdQaZhVWvzo3TV7HhVVANf+xLNHr0dYkOxvp1tPe6cVkZK/dIWZOcJXuUc7vIR/ej0DpT0FH6Pd/ovZOaeSNlxHKqB4Cqpe8oNQZnlAlEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783280435; c=relaxed/simple;
	bh=hPzzIh+00z/2sTyljZcHfK6TfnoHNAT4ontX894B59I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t7pkdpHBrbxb1TDZfPnmFOKTkGtIyzd6UC594Hc7Lwqu5A5UyaZjVb4MFZhgh3xDozfULRkszR5CIQCFJ5fSxm6F6x0RSDmE3/8RY/ZPJJ04q4+ZS+64sXWILRSlVYBelz25sTfbSWAUtddRPVXFKqq8OtKOcyo/8UwFUYkdsD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EDqYFdv4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SKau78+K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EDqYFdv4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SKau78+K"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665HhjFj2346454
	for <linux-sunxi@lists.linux.dev>; Sun, 5 Jul 2026 19:40:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=03p+FFlmwi4
	5suRC+aZpApiuhNt9KA4gObs4WxBM+z8=; b=EDqYFdv4Pmeqy9IR99dcNiLiDAT
	/yuTE7Ljg9Hev+D7GIua619X8FUaXVlexko06UWo2I1UG1HwTHa/3pcOiO1FNKdk
	YiY1UO4+AP6rm2LO5F78feakLwRgePs5DdWtrzsXwhYCgTfecFqPFRL/MQqcfyO9
	pb9r2UQAkfcA5gru+dfTHa2mdfv7340zDAANejxt7cH1lKuJqEenlOMOzxtkjth3
	hBP3jcZzSc9vRDjWjL0r4gMT/svWmjZh1dvVGSJdpYFTDJ+ZtuRTINMxgHG6Wmig
	3zizUVw2wRtMv7D6VUvWZqVy2hRD9jXlwyfLqvXinpJSMddoU1sfRGdzOYQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6s64ke0h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Sun, 05 Jul 2026 19:40:32 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c88aab7c1d4so1730139a12.3
        for <linux-sunxi@lists.linux.dev>; Sun, 05 Jul 2026 12:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280432; x=1783885232; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=03p+FFlmwi45suRC+aZpApiuhNt9KA4gObs4WxBM+z8=;
        b=SKau78+K29IdWaff0UgN2zZptX4uePk5rUAL6nK5LwdRlubLdE9GdTl77DD4JadxaY
         /v9J5eMVS6+JmwtcZuDh93JVzjv7//5HzgfQgXHCfZLZxwNUnSmuYX2dFjBtgRcFsWX0
         iiIIx61fhiEbVFjAvCAN7qjFzGkwlcVVzJg1/PNo1t3CFRE+ovLWhru5TGhd2SEsi7sc
         weJ7a/2IwlqcMaPrP7bgz0ndT/E+tMGqZLz0jLSY3GB+OLWNQbSTqLd5i20CQbzsPINg
         KUZrHJTSrrpduDFWzqWmk3RtfHS5PkL6bXgFllOL92M1mIJrQ+VKAJYeVRhOAQxY45Jx
         V4KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280432; x=1783885232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=03p+FFlmwi45suRC+aZpApiuhNt9KA4gObs4WxBM+z8=;
        b=dLTumeWnawhGEy+BdjV7IJIALGQ+56XfaMAmJUBHDOCvT3fKatAFpamcxm7PT96UM3
         zDyEeWfshW50/guFi5ZvBpA8qZdIAKlDE0n9/2aOKFIBKveNqLt6hnkz3eqYgWXQ0Bl5
         9W2hNdUU3GvxYeLPoSqk/PiM2qa+d6dUujpSXMHAq92HlCY1bcil4/nfOJHGB263q3VF
         SA8/QWnnPWkAoXLDTP8ociyuwKa1K16+3fYxSgQN8iZ5/JioBI73gUbp+0HN5OpN584e
         PY0cVfJ5aaH++X6aOVQOduWF+5lKc4w6jmPhEvXV0NGy4K1QCLHvX5Wi6kvQ3ovRYOFK
         hykg==
X-Forwarded-Encrypted: i=1; AHgh+RrXJCBlvUXoelTQl9UD09rWnDiBDH+/NY76iLOb/J81YcPmXyieJhva3SNvmrK5/MVsOp9J4fGG+n9gOQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyrsgBYj6oXGBCoxf08ZCjALlJUIcHiybSJdudxXb+ksaqyMIBw
	F/LpMXTAF/mUdgLJL6uV4l7zHjeFFGkD2ijTbiK7YHdXMz3MWCMvc2DVs/j3QLJiPE0eMSpXf//
	QfOLq6MtZBIyfY2DiJYNEjlvwvwa5K6yzHORjDvjjsgFydt7ZHLBgXzIYWfUtQ1sOQg==
X-Gm-Gg: AfdE7cl26oHTkOXIE5LUQKL8zRZ4R02II9prHG/BGQ0nIuF9WqD3+vTVSnsu6i1xSK2
	HQ98QRfO34e68WyJc+q5f0H8tKM9SezZHUUZPEPzqNumkNr9ZaQfngtrM/yQXHKkUGhpDK5VDkB
	TW4yu76TK0NQbhUEt7HYwnmFmN3fYsqFbrYF4tiJhNaGOjB4BVQCc7+nDqLXARuXxQiuDkx88My
	jMZWwTJKCpHqKcHW0AhS+pEEVIZPIRtdsXikfLluUU9SPUlwQj5/+w5usdtXBlpepzz6yCqvcjJ
	Fb/MlvcKKjAsGt5LPsK3iDTlQK87BDTK5euMAZrOH2VNACSW1T2G17GpQjUiVMaoCmNCJr7JOVO
	Xr5wLVVUY2hyoeKvukdURCvZOwj/uqrhEDzXLNw==
X-Received: by 2002:a05:6a20:a122:b0:3bf:9944:a8d8 with SMTP id adf61e73a8af0-3c03e3ed638mr7693679637.34.1783280430283;
        Sun, 05 Jul 2026 12:40:30 -0700 (PDT)
X-Received: by 2002:a05:6a20:a122:b0:3bf:9944:a8d8 with SMTP id adf61e73a8af0-3c03e3ed638mr7693658637.34.1783280429779;
        Sun, 05 Jul 2026 12:40:29 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:40:29 -0700 (PDT)
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
Subject: [PATCH 33/42] drm: arcpgu: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:09 +0530
Message-ID: <20260705194019.2565498-1-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX9gKq/HbAloPS
 odXjZaOTKITVJ5A1TWwh3t60ehMar0e87obAYunzAoHYVvqkP02PuzirkyCy8vm+KV5Vg/NMrdA
 1+oA1pAcSUXN/aouvxIm9Dz9sgQnj1j3Bsp+y3RF5NaiC2l/rEV+xFwFXzm4mUd08vijTdXw/lK
 +XV3Z/OJcurSr3YrXHH/Nesz1gRYZ+dLBR7c+BdcCsbfH8WF1dRPTJUniprtNF3KtG+fSDETWDD
 IV7seFhSwKqXOtc1PqITblkZ2R3rqMSd3tdmbrk/pEY5DzGOeFgBa+cHwECSMzEOWmANFsrv3H8
 ozmlaOFPRJy2JEiEL42VBhJX+3PpBMu+NQ0+PWGRHU25J2IlIjRca7sQPEdn8dEVJXZ+u4MI1mg
 XockOM962bmsJevsT2HoERB6vfILYydqJkmrJKZAy035G/OruRhRhgRjaJmpqRLOoFfDN9ygKnb
 fGnXiELy087R+FX8x6g==
X-Authority-Analysis: v=2.4 cv=VvITxe2n c=1 sm=1 tr=0 ts=6a4ab330 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=lEtn7xO9CsvGDZioIccA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: EOMMIX91bE4IPiZfXAw3fkztUbpk4vxo
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX1PN3OSmTTOIi
 lpDRIRK5CdLG2jjXImM4xiwFoDIHVsyoJx9/M4fsDIMU18xu+aR/xV414gzsDKebNkLtMW+mez3
 zJ7ZI0pF8qQDuqoCWIXAn6C0ZYtQ+kE=
X-Proofpoint-GUID: EOMMIX91bE4IPiZfXAw3fkztUbpk4vxo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607050212

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the optional reserved memory region is released on device removal,
fixing a missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/tiny/arcpgu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/arcpgu.c b/drivers/gpu/drm/tiny/arcpgu.c
index c93d61ac0bb7..fa01407570a8 100644
--- a/drivers/gpu/drm/tiny/arcpgu.c
+++ b/drivers/gpu/drm/tiny/arcpgu.c
@@ -278,7 +278,7 @@ static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
 		 arc_pgu_read(arcpgu, ARCPGU_REG_ID));
 
 	/* Get the optional framebuffer memory resource */
-	ret = of_reserved_mem_device_init(drm->dev);
+	ret = devm_of_reserved_mem_device_init(drm->dev);
 	if (ret && ret != -ENODEV)
 		return ret;
 
-- 
2.53.0

