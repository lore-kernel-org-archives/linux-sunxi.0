Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B85136BCE8
	for <linux-sunxi@lists.linux.dev>; Sun,  5 Jul 2026 19:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783280442; cv=none; b=GIehehIthrVX1ev37z+AKS3DfWnhcHjNn30pufUqek6nBBzEHE/Ha/51yUNQTvUhpSwiB39gD8Hds/12oldfo+Bdog11Wxp65F3QzHMrMeQzmeMAjJdj1LjZ/FM9qmP0ChcVScrgoQShvWo9ZcINKifb9xin4orDejZrEZvSzu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783280442; c=relaxed/simple;
	bh=gFgKgEu5qajbHpLEFwwgM/A3QPsBxXRqQi+CF+ZFu9I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sfj+sQA6Bw1Fz8oAGPx/zVpkkU7wHgH44BnkPssPUBuamFADTpByCXh9ZoqHBQpodyjteREeVqbWMQPNxSxGZGP/PgcJGJfkjO+mMo6cCTvocPhIc8zykAnCyXD8Gai7CYQ0fcxi2FcmsSyZvrRDNXVhtUGthdqa9Wl+5LaYFN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BbBSGLsA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FGFta8vd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BbBSGLsA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FGFta8vd"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665HhdjG2351692
	for <linux-sunxi@lists.linux.dev>; Sun, 5 Jul 2026 19:40:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WZiFjnWLtnN
	smK5dA/42zGQp+sVNdR8iWt1Gg293cw0=; b=BbBSGLsAqnWOATGTpRNCO1gHtgn
	+/zw/8wXZTNlV0J3BkwSreM5wcmTjEIf/OTa3q53G3k+GmVKk2WvAcGb1Ew8Q+8E
	QrpYExNDDivaknI9UzYxo3JTDkbOWqzrVRq+0pWix+SzBwl+OC9alMamMCk86nPx
	bmTcN5MVq2c1dhjwDSCMvlPP+5gNlCOpgfXdThV6SMKQM+0ZTQPkQ4Udmvt+mimB
	/CiyDPPnOPppMy7keT4n98UkPZmn2g6GcpUmf3hrAlfVAqeyUVB9oeO42PhzzgZB
	p0LNoVgtCvusL9jOPJlKPYe4pVrl4XUBs3oqCO5q6awivbcuGKDA559+r1g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6s4sudu8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Sun, 05 Jul 2026 19:40:40 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-37fca5f21b1so3305759a91.0
        for <linux-sunxi@lists.linux.dev>; Sun, 05 Jul 2026 12:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280440; x=1783885240; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WZiFjnWLtnNsmK5dA/42zGQp+sVNdR8iWt1Gg293cw0=;
        b=FGFta8vd/asWjX/DKIIkkoWrpijQEQ0c/ouymq83I3IwzNsJ23xWwLRg2oR/ZC/of2
         xtUfH75SowTjkGkyBivmnQogSTlx+otYB2mkWdX5Zw3X0CSrCBmhCtB+KUhwzIR/gDkd
         o4WRHoMbdTWq1rEYjgDWu0yJVFt3r1EvqiZMZFhvaEyl9d+cazwEVrl0j4YqQcJJYhGS
         P9wtIEZ+5nKTJZHlrKGp7NPhjdJCMXqbQVN5KIwy3H80ZLqulIhcNR7oWIg6HE1IGtgm
         bOcHm9fPeU1eMtEyBkEhc3oF9uPtXX9bqyznIGeoxvjce28lEs3LPXxk3Vvq+FPbJ8wL
         onyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280440; x=1783885240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WZiFjnWLtnNsmK5dA/42zGQp+sVNdR8iWt1Gg293cw0=;
        b=msgYXOK9IsRv8RbwAL0lrZ8gUpocfPUqP7Nlon3tj2186e2jpPp1vmknHeIlAg3aTz
         JHLv0urkDD6F8n6qB5xpOsKNfG8+a2YOzOM78yZrHuEsq5il0Jn1U7hKoitPcNhLcRXc
         4cWYmByyIFfFz43QBkBFJHfzyI0PD75UOWiIikbpFm0E3JOzy1KiO9FNWadJZz26ZEzZ
         5PPpQPeEremxebc/KIeCI+bZLmHULpHlyMtEKNbyMrpEPOsE0fHG6SmaYM4ALgVwTneq
         SBpTmPU4SVFB6XmhPS6k43cJAW5SU6sLIqs1PXqz6Z+eZmk7IMuGsxkpsku2MdHq7uXk
         7KQA==
X-Forwarded-Encrypted: i=1; AHgh+RoVlnzOC3326US+S8dFaxUj0HdMNWQRCCQxXcue2kPFezcXSQatI7SC2HigVMMMCUYcekENUupPHwPxog==@lists.linux.dev
X-Gm-Message-State: AOJu0YzdM9xz6krsirU+446b8ksZFDp0RkSsHyRJHddfxtJoojpysDOx
	Ydks3+kwVLP40hzovXzItw7rs6aqaxVu2li/1/G0f7iFwW+jsabfJqwSJOECUhe6TRW7xHazGZL
	roWbdOXUOr323tlGadwM6jmNq+xtyUUtlmDuZg6+Fdtshnq/SWJHy+1o42txxuo0HxnYhlZGiuA
	==
X-Gm-Gg: AfdE7cngghiXNcSl8FBHgewNkXHr51qlqwrqf7SJkk9kh8WDldj6DGSobLuRUF8Cwsg
	dm0ud5bNwtXyBy1AsillvfGsS/wG5/631wDq93kap7PJ1Z0BXKBSWtpKOqv4tuJKgJY41tAe+Yh
	q0iXKh+346peVXfyStCq23pRVTmE792vjALNBSqkL2d0XccdaRI5BUhuQovOTyOYdXHVUeHLn9f
	53PtDGwB/dFB+xnHsxNNj3s/fsiRlEoOzzKAyVxJbpG1rS/DntJxd1mvCYhUD6sccpz8GP1+DP5
	T7xAy87HnJ+RBIsK0+LLf21e2y3KeLW1wU8ejd6CrNT/EKVp9n8BFLl8to4W8plo6h/Avg7HXTu
	IP+Tna5BPjFH36DPhZMqdgcYvYUZclDgOcGwsDA==
X-Received: by 2002:a17:902:d591:b0:2bd:5ae4:26d1 with SMTP id d9443c01a7336-2cacb06f287mr116872375ad.17.1783280439593;
        Sun, 05 Jul 2026 12:40:39 -0700 (PDT)
X-Received: by 2002:a17:902:d591:b0:2bd:5ae4:26d1 with SMTP id d9443c01a7336-2cacb06f287mr116871975ad.17.1783280439045;
        Sun, 05 Jul 2026 12:40:39 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:40:38 -0700 (PDT)
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
Subject: [PATCH 34/42] ASoC: mediatek: mt8173: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:10 +0530
Message-ID: <20260705194019.2565498-2-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfXwD9adswazXUe
 uI0DmxUaDx7fjuKGz1HliuBFo/fQE3JH61VTZAnyBOUVQWJyKxJFJuzZ0FkQsUGTAeTFxXaI7/m
 4o+m1twHBahoxnt7BPp0wnUd8tqrURQ=
X-Proofpoint-ORIG-GUID: 4-F3VELTR-cDS4vGYy4VdOhDKBkQz9wf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfXxpdUzI4ZVazB
 hMzjIFx811aUXJmmLETOqTuHDXbU6I9JQCmFUzZgVT15coqykyMdGV/VhD1nrG4e8FF8GAUP3FT
 GXGKcZ6gyooS3WtAyed2tAUitYh6yFQDikkQ+dVNPnv0ECYyl+tGdaLXr/5+ZEQr4xo0FyYS41B
 ARUKFozes1/kpcGBixZWG6aGOkblo8pp4Qw66RV0hcQ/Y5Vu9ALoMoajhxVp27vGBVocYUKZBrs
 gC99nPZAcHhoTzn3BovyfLOd+X031Sck8y2bhODFpbFihKWzEsjzP/fxFaZWiVlwvpvYNtBxooX
 OrEGHYThcMIdwIhg7VntGYipqC2deThlSj/LSIxtHu21dKPLITYIcHDzYxfviDi0L8aOrHn9hgJ
 7xWZC8MCXLeCjGmQOmWKdKjdYJs52xDmNnzoBa14sMR+b0plt08bP2kosuOCtfwXHmVOJktyz3H
 IX4hZQcyGxWujOObcRA==
X-Proofpoint-GUID: 4-F3VELTR-cDS4vGYy4VdOhDKBkQz9wf
X-Authority-Analysis: v=2.4 cv=ZfQt8MVA c=1 sm=1 tr=0 ts=6a4ab338 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=2-kJ_DxirqQsj2pPc2sA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
index 69cadc91c97f..0424d79bc9b0 100644
--- a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
+++ b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
@@ -1072,7 +1072,7 @@ static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	afe->dev = dev;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret) {
 		dev_info(dev, "no reserved memory found, pre-allocating buffers instead\n");
 		afe->preallocate_buffers = true;
-- 
2.53.0

