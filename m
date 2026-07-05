Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F2039EF20
	for <linux-sunxi@lists.linux.dev>; Sun,  5 Jul 2026 19:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783280457; cv=none; b=JXq85DuqhJiPRuRCGWqSuHwrR0w748KHuhhIgwsXmHyyx0iKMxVLdRfjtog54oviOO6Zdfqxd1gvBwEVY1LAg9vtHScDsvWG1+ukElYU318i7Wzh22Zi81TyRV8k8IX9X9KwsvyiZ2csEH52nU1PkBM/zgPbb2Sk2Pw4HWdQGnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783280457; c=relaxed/simple;
	bh=MBCzqv0j+WYMFcF4TKWqHla8911PrHE8zUSaVvk5eeg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wc+gpo82nVr1qJ4q5HQH7vjQnfG+7esM9TqCRseOUGSyknWZmaDMFyjL6BDGNpwnTkg05sn7QdBVXcrPgfbHD/3pFsyPGVm1CFuddjZfWpkn/2VPUVhI8qDnUASeLOKMfHt3l4OTtOJsNEWLdPoOP4BJBs034JLxPw4PLXdsNpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FtgGyEI1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jPj+VFRd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FtgGyEI1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jPj+VFRd"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665Ib0Rp2423125
	for <linux-sunxi@lists.linux.dev>; Sun, 5 Jul 2026 19:40:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hN6fEXJ0a4t
	H3MRwTjmjwBZxQ0G8Nv14FZEH67BaPoE=; b=FtgGyEI14vKK9OqT430xUfOmGLF
	J5bdRwGnYlPPVp42isHulDlrVXRumzlXOnWaKAvEqFlOMf4WK0t/UVb0tPS4H/wS
	PtxzMba7S17DNMo9ExtOcv+rJsW93dNgj/CIpMpvyCzFyneGj05+u1GK8iECoqyK
	WM1mPqrqXajrrVrH8/J9pdvK2VoDaXNIt2t74egeo5x9BAqNhYqqiB5QdwrFv+QG
	jv/TZ5nh6enGJUvvqqxYx00YdVL+37mb/7PnZAc+8iS+maLp8PJIHST5NiO92D5M
	ugD1/b8iFPnLJM/Dv5JgaqSUO0Jj7Rg0n1nlkl2C0BeSOL69BMELnoL/dgw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6t8uk9t5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Sun, 05 Jul 2026 19:40:53 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c9d5a5b63c5so3489408a12.1
        for <linux-sunxi@lists.linux.dev>; Sun, 05 Jul 2026 12:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280452; x=1783885252; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hN6fEXJ0a4tH3MRwTjmjwBZxQ0G8Nv14FZEH67BaPoE=;
        b=jPj+VFRdrUF2NUAH20dlNQJLY6/N4lJCS7OtK/hp2eTIL/TBIxXyzjGTstr5gKz4TU
         5outQOJnAb5lj5LVQ3Us6FqCkVU58fBYPfJBmrnIHJsSIWxKD61CYXJGWWFnnUVT5SHB
         2dskVJ8j53QEUzGpCrXgi4jNCV5qKqEKXpOoa1GsYpoWPVTdT+ehnO3RGZ9jL1todl70
         e1W0rFf6kf2Nu/+pgxdifvovKSESbtyb3w66FRaLCEp/UMgcj9fBpMAFJPFNgt6QI2Sm
         9SDz90bf+uEjKLskvtx8whciEqUGnNYdAioRnxwCMVeTXf8bwCenHBy9/yTxATit2s92
         7gKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280452; x=1783885252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hN6fEXJ0a4tH3MRwTjmjwBZxQ0G8Nv14FZEH67BaPoE=;
        b=DwWtNJBzmc4c0pzWgpHlRUEI+fpwhUx4POsy0XrHShpa6v5GFi1o3wExK5HwlbWA8u
         DTgQkqfyi0KdmJVcEvIKB5Wn/VTmGVrMYFBQGl2Q5mlFm3wMGz3GzM+1KR9LsI6cTyYe
         9hM7SUriqoSe6NWCy42IL/7Y8ZHkGQuObxc7xkA9vbuiO5i5/8mtDw4G/ck7iuiQmUXw
         3lQkvSt81jQ/MpXFRMnKwokgH28Gz6KXrhrjTyrkVP3gZdj2+uoubWHd7XiV8cPd0pQO
         DwSV/qNv8awODr20hxsUfsHSfGx6IPOy5ffGpjzIV1JRzkhkeWkbXMB6V/Q2OpsY/Y1U
         4p8w==
X-Forwarded-Encrypted: i=1; AHgh+Rp1IxwEpec9eFQ/VfCeDLUUw94AlRAvBA62BPSjyhLMWVe4Xd9n08tZkKlKwi9CdaVGjk3pW/rYghIh5A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzjp7siJzbZfJd9AuGnXROv/TAPbHOs0ibQy6JIn0eN+9LxBJvx
	rR7X9ST5Fo5DoJhCk4ZIRIOG0Qye9YYoaiAcDgutDetEgzjZkpZz+aFkP7NI02JutZuqHahjCuD
	AvwbrgyiOwyccVmUG1+qgnq28t+lMlItkJf3kDjExkhQ9gjawLH1T1NfH9Ea7ROb6+Q==
X-Gm-Gg: AfdE7cnxZ25kzyD5t5AQmIDpp60rt8iOQRpblcRc+lNTtOnWRBI9/pvVuhJ9j3DeF6R
	b1cU+L/aJC8SWEBah5Ou4WOG5tRplg6UIzso8IWA1awZOy731SX0zTQYa7PwldLGFKH3gJaHDf/
	imQ12YGnVB33BW3rsYn2cW6qR3mFLIsqtIALaIYpszTle3N9tUOkN2V4s+n4xkaMcLsVB07ywak
	rHaSV5RGXkX7ZMO1GleRsgPV30B44QcP+sCpxldEESPbSrcZrDCdfc0DaftLahzgzDMVS+TciV+
	Q0VokRiDHa+uBLlHKA9t2hMj60a7eKIQai0aLPB8Pd8xA1xOGc6PnIaBO1i3uG/w8irr9mtZk11
	wYlk3MkfPq7yutfhFzt9ZC4CuLGWgtt+Ugvn4hg==
X-Received: by 2002:a05:6300:670a:b0:3b4:9171:2573 with SMTP id adf61e73a8af0-3c03e4218c2mr7386834637.37.1783280452365;
        Sun, 05 Jul 2026 12:40:52 -0700 (PDT)
X-Received: by 2002:a05:6300:670a:b0:3b4:9171:2573 with SMTP id adf61e73a8af0-3c03e4218c2mr7386810637.37.1783280451853;
        Sun, 05 Jul 2026 12:40:51 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:40:51 -0700 (PDT)
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
Subject: [PATCH 36/42] ASoC: mediatek: mt8188: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:12 +0530
Message-ID: <20260705194019.2565498-4-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: oUm8pHQ0LY7mH3QeWO_W_01BeITpttY2
X-Proofpoint-GUID: oUm8pHQ0LY7mH3QeWO_W_01BeITpttY2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfXz3xA2w0UNHAs
 1IgVSpJLBqYYTGEZytuU3rIQa0YjLYxgRfD1lhybQpr1xf3SPO2NGFB2RMA2kMJijFDHt9cdnYx
 SBwE5UzWm5Z59AO5Pw6mrO1yCnlop4s=
X-Authority-Analysis: v=2.4 cv=MZxcfZ/f c=1 sm=1 tr=0 ts=6a4ab345 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=16fIdGUa3qEwhQSg-dQA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX5NZt3J5VcePa
 UZSR1Mv8L7M3qbGfhZexZyoZ/3M9Z322gUfG2jpBfS+vicDCQKO2CTVf/FBKuuPwJkofB1gMT06
 y0v2s7kPXakToy2vqzxGQ/AJv6cUytC1UK9dh19jRb4iDnJhgDqNJ1n8Gp31mqA/OutQ2BXslZD
 mycMUJQM1F0hXeJge2lKd+J0FRch+4k1mAW7rJlNitdH8turZAOGijpBRAXk820Gpn1VHdFhOUC
 m9YKQLgAI8CHb2v+mCWK9eyOnlzg5mdBjhfDOpgpHtwxxtLyROTnRlO8GS7i5u8mvmJrMon7mNQ
 tgoFJTz6Wvf2+4Bm49vrnHYOTJApAQmNhxLhPla4tYcoEHVxQKkXFUKAU/pgGQZ5ZegyP4N7wAX
 iCdakyT3OI3BAP7vuTnTnaxO1m9VIEF89/zwwxQXfEyPwoW5NP1DWhPBSD6hPQmuoAu/mT76S0r
 Ql+3LXzCVw31h9btKuQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
index 7b1f5d05f4d6..ab4ce5e86b9d 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
@@ -3199,7 +3199,7 @@ static int mt8188_afe_pcm_dev_probe(struct platform_device *pdev)
 	struct regmap *infra_ao;
 	int i, irq_id, ret;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret)
 		dev_dbg(dev, "failed to assign memory region: %d\n", ret);
 
-- 
2.53.0

