Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA57B36BCE8
	for <linux-sunxi@lists.linux.dev>; Sun,  5 Jul 2026 19:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783280449; cv=none; b=mfmQMN8BPlVt0f5vdwjIFU3WjHyYURXJh0aFlFPXa0Ad75r4jKSPJ204LHPhFecRfpCikOpvH9PVA2FRMvO/HkixTokkjJWrudmgzjyAohFX66TVdRWo4uWBiuFPrSGxVHYWZX1LF0oQhsjAY5OHjhRWsZkdIOjl+MNV0Th3BjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783280449; c=relaxed/simple;
	bh=uWGYzLdeRrzr6t0aAVNStOMdR0p2+G904nfPHoPwpPs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aj6CjiKWa1krt66XFCulTfzDDbrGwBQzhYhyFOieHaitre4AZEA/HQHbMQnIommVPpzkoskPl46KYExUgun/MitVHtq5l8P4CdLBTRAMta5pb+isV3nlLv6EBbxsVikWSvTumAhGU47qeuuBYDh2COzybZN2eNsuYIXRIrhUzSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lc/WGFTE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cmXJxYtn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lc/WGFTE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cmXJxYtn"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665HhuiE2347451
	for <linux-sunxi@lists.linux.dev>; Sun, 5 Jul 2026 19:40:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7OthzF5yzbE
	g8KQGkSEAgoedjCLI4POQTlWuL9KBHJU=; b=Lc/WGFTEsBR6FyBf8pb2q2cTo/S
	IRTkAnMpy4BZluObjv10Ds1+8wWUnkRZLMFnZfxn4lwUf9wNpTCxvblYHfxq/YKl
	Ovc/Cj5jLSEuk8ulecmXZk1CDgTUxGIQtjZKnuWR+K1jUu+ftDDZonwnoZEjSzlk
	ct1xTk+NVIo42IekyeGwdAr5vq+YHarJ6RB16P36dz97W6pvhWCceSyR2czSTYp6
	hSXnIp2oW/ZkZTxzubwpV++50pKMPkSorshnXRFfqderNm50KPgm9F/0EgLX4x+X
	hMm6Gy4Wmztc6y63i7GrlHroXX0TGdaLddDcR9h9VbzCKd2rrL7p6658Gqg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6s64ke16-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Sun, 05 Jul 2026 19:40:46 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c88fc985a65so3719791a12.2
        for <linux-sunxi@lists.linux.dev>; Sun, 05 Jul 2026 12:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280446; x=1783885246; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7OthzF5yzbEg8KQGkSEAgoedjCLI4POQTlWuL9KBHJU=;
        b=cmXJxYtnVmvZD9DsfdolHaRuHkkwY2E+SppdPeLnHGF1lacVpGjOy1Ry0I8tTlmLSE
         3Xus1oIAM0eSarMIkgVHjMZW1u0c8yphaNHkca3ohfvimnQYymlrj1N5x7aUgL/Od8vU
         mGxj4VPdO0hivr5sZRj9+ntpgbimMPCuwQ2brqwgfHg/dvGemrD6QITrsxefpN6KBqWo
         C1f9BXdeZbkJTggtuhnGUajc3+CXCtUnhIA0yIyE2gcIT/tmpB08Qlf/Ve/nbtvktwNz
         hv5o4rCn+bUCPlX7xZM2WW3FcjWm0ZamlM3WPX19mhhBpln0An5gbt5HwjArgLHzb42x
         y0pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280446; x=1783885246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7OthzF5yzbEg8KQGkSEAgoedjCLI4POQTlWuL9KBHJU=;
        b=Dtb3lahES+TA9CvSkAC+o/J+xs4p6jjOX+pcAaOhoyLqwnDB6Y/lUEawTCLpUgEvc4
         kaMCE2cnwZ/MwD7gSw2PiIkidezw9hmrF+hSpGwYQkTeoKgTx70ScDzSGk53Ig3FC14c
         q/BMH8GAHtZRGfQazGqRcdIcjm/4JmQkDI7Mds7y9K6kLRSnmRBQclNm+75MTXXSAY2S
         MjjqBZUkjzrHqsLaY8AoCJKxpLZSjRCp6akKKM1LyTGJsoHV6f/lY0jxmihGah+N6krw
         cTcHB83dwaQEa2qg4MrJsOVxA0zJzazJXU2KmNNvoY2RHiGoP1EvBNZgvJiBjOP/Z3U9
         bwJQ==
X-Forwarded-Encrypted: i=1; AHgh+RoVTeodO6cpcBCJTfQL66VbSJjWSeo/zmKcSuS7XvFamArCh/VZGc73LJsLdclkik85TGro+s+F2uwM9g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxl6+VYv95FOtx7+eB74/sMlCZ4lfchbC4Mu8GGs5fHsCjlSwLJ
	7b8C11W5cHecq297iWvTpWpRbgBW2NjPyaaFOTYy65gW1Da+xLuDcj7X6HYGCFzJJqc+KhRYQwP
	peM8P1gwalVMeckSQ2UXNpv1MstxXZqt6R4DMJ3+Zc0bjmBiPoMw6u47sVxWIFxCXCw==
X-Gm-Gg: AfdE7ck+6sy06PI25EA40Z+6VVCEYI55cgSEYGhZwT3p3mrj/8mksh+v6vgGog7Y5OP
	MaIRzp1/ZJpb3KReJ/Kci1u9HIDoUbV4vUywHYDRN1OKAdIrzYORw0I5AMt+9f3sHeNATUJ2GuD
	2c1gI7LG0Vb6MfAtsN8LSgBhEGVH5LCWPHqEUF9MbIIDAbaSNQFeGcXH/4yX8VHRDPKb/AiCJiu
	qv5b+VUMBbvSqn1RXlKeId2+KdMheZ+lcfmh5WdrrTaEFF0cMYVPkTi5z9If5P9tJu16HDBCk6U
	ew+XvHbaCWmAnRmoKQ2J20Mcgolo5PwOCISgOkNuxOv6vQNbl6ZFJ9Lli4MxtBDBNtNSnRajpyA
	NLF37qoxswBIWY/XYFZxD/fFOz8IfycxTPog9wA==
X-Received: by 2002:a05:6300:2211:b0:3bf:6c08:fb8c with SMTP id adf61e73a8af0-3c03e521435mr7049944637.60.1783280445931;
        Sun, 05 Jul 2026 12:40:45 -0700 (PDT)
X-Received: by 2002:a05:6300:2211:b0:3bf:6c08:fb8c with SMTP id adf61e73a8af0-3c03e521435mr7049907637.60.1783280445455;
        Sun, 05 Jul 2026 12:40:45 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:40:45 -0700 (PDT)
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
Subject: [PATCH 35/42] ASoC: mediatek: mt8186: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:11 +0530
Message-ID: <20260705194019.2565498-3-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfXwaFKSDcccHR7
 y7/n6f78clQvJWfA5ABf4LUFXEJ0Yyl0Om3ix7vVEM2ZLHG3I7n6XwJIE8fdCblkIkMEOJm/+Nu
 +ZDDxAWKMWdrZqUZD/X5xDbM6yAUobslG6mBnic8HatfbpvutGoaYgKM4FtYRut+i9f+SgfLat1
 j/dCdIpANhEqIdKzuTa7AQhCqM9qmkgdDn4OG6cTETdDE1xI0zRfYB811twvREHaIgmlLCa6630
 dPDMVDt6CBoDv1a/EfofliTPTJUfhqZzZ13+Z3Nkl3+JlkAHV46mBiADN1i6uyAq/s9h5yugMu6
 PcxCvnXpQ8pJrRtgQ4E44Z+DYRuoVXEysBgW8WLwDWFWM+IFbqvm1BobaDNfkOjox0da+7NpkNd
 7qiljbxyALqYeR9xbAFPoi6AP5RcP2e9XSPbtk5+OFvZT9dHltyDrvP6QmNqlo/rB9jkYsKDdJN
 eYLjlvFUdIfNOaIxdBA==
X-Authority-Analysis: v=2.4 cv=VvITxe2n c=1 sm=1 tr=0 ts=6a4ab33e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=YxFYfaw6DuWYmsw8bRUA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: vqXFSAZCjgTqRupYTT_J6oP8jGHaQyD2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX8W0/uoBeWmFN
 d7LOEhvdkGO5sC7AOr6z5NdviPd10Up2WZxkoDKnzsDYdAzNw326AOR40Ey8NUsVxcwQjPudC0I
 h2YnDbcmlzMMvliFhIXlmr0EbIUYWEk=
X-Proofpoint-GUID: vqXFSAZCjgTqRupYTT_J6oP8jGHaQyD2
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
the reserved memory region is released on device removal, fixing a
missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
index 44a521c3a610..60576f885acd 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
@@ -2836,7 +2836,7 @@ static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
 	afe_priv = afe->platform_priv;
 	afe->dev = &pdev->dev;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret) {
 		dev_info(dev, "no reserved memory found, pre-allocating buffers instead\n");
 		afe->preallocate_buffers = true;
-- 
2.53.0

