Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E80420868
	for <linux-sunxi@lists.linux.dev>; Wed,  2 Sep 2026 20:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788379709; cv=none; b=bA8ocL6b0m1+7zotPlBWRDAxrZrkhTN6X3NWILpnEqwS/LaWq3dqPt9dFyirmTjJVZEpjW48lE5uXeHbx9ujbcoB4RRBI3xCKv1oncWc+omCh6NzqGRPZm3TSZJY+6UUXjJRjBr5F0yWV6ZTIE9BY8OHUGbufD34eJ67Fvzr4UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788379709; c=relaxed/simple;
	bh=Q/UORPhGAU2fywQU1yEoWb8L5nIPF1bJxGdWPOrhRfU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DcKckCofalIfGD5whuWXB49pSnT81KYkvO5pF4ms/s3L9X8qYETK8/AUKME29SgJRedogTBybIXWJAuJqe9JdVJPxFAn6OVq+YsAZeS0pfb0tm66Bd/QbVEZDJw9QWjXkTz0ei3TluaeegZMLpuVp4xGJFOTG7GJZi3jjpIh/Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oz/tv1sR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F3+jvgFs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oz/tv1sR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F3+jvgFs"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682Hr0dn2209688
	for <linux-sunxi@lists.linux.dev>; Wed, 2 Sep 2026 20:08:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=a6ghP9glQZI
	jLasHwBOsrO1uiVG300zETw/KSJymUtA=; b=oz/tv1sRl/3WsGWjrvJ22sIWBYb
	EK44Eaj/gx7eSgTeGrFcBt5xotgqCYwj204u2D0Ndd3sEk1CT566XOJaRzl5VqpC
	EbEiiC/Sm70Il6ZcpQ1Ov/NdzUMXu1/Qh5WISHG1p9iAn+cPO5nWSkGhU+MTBev2
	tRFRmXaaICjuberKDCp9omSoB4vhP9evTmwK66S0w45DyWz7Iw8r8xrQISBK1dmi
	fkEIEA2g/dFwWupDcNawXcQpj0E0Wo9XOuag+STbTcUpHqLyXrUTMbOIJszCF5rK
	DtB+rd2+Is6sHEHgkmy94RiOKEOgofNKpIiX38htK6gO7L7l+GjQ7AdMY9A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gepv5s3nq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Wed, 02 Sep 2026 20:08:25 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398e1f7d1a5so2377504a91.0
        for <linux-sunxi@lists.linux.dev>; Wed, 02 Sep 2026 13:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788379705; x=1788984505; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a6ghP9glQZIjLasHwBOsrO1uiVG300zETw/KSJymUtA=;
        b=F3+jvgFs9cpEXacfu3ytk3U89wHuXIgTVt/5pQ9C1L1+NgNkVA5GwI78oQyeRKdYKw
         pyQPfaYIhZG/4FVbga2QGF8uJBE2Vo+KvabpivT6nzDiUSlWOsLZI2DSk2e/Z+BT7bPe
         PA/1U2GePy83+s7jBrFlzuBf45WiyFubxl2nbqRtflibnF/ZLvFrg4/9dfkvouU2+R7h
         nNVvU3JH84U1mCjqG3F9pyL+lpUTS/1jfsrBnbUCTDA8c9bw7ofbEuXpqRdGkK0OAO86
         Nre3+AH5nxErk+kON4VFz2PF4tHKNpKX53a3M1YyEjyFvPiAovq/tSntfRieNQsVHHPB
         BbYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788379705; x=1788984505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a6ghP9glQZIjLasHwBOsrO1uiVG300zETw/KSJymUtA=;
        b=cCNG3oLoU8X24oUH/oAsCGdlnrqCUZCJ64zDpFg4iMN9v9LPct0Mh3R/5cGjjiTdZy
         5h8H5eS5vzNLobAKPDPObQYGrV4MXYlpCHSntpRaKOOqe5b9+VgUXMkn1aH30+XmCOcM
         v2G5xx6t7/rXwvbT5AONZagDK9nUQrqzk5wJFVK3KZCokZVbtwzhKk0HOelu7suwtSSD
         AK/RD0eveKJd/NaWoTSCu6UTYEC93n5F1SYh1Sl+SLWMGol5iJkYqpbLjmfH12T+Kffb
         qvVxxN/j0l3UOyYdLcuS4gyRmFxyKmalhxvh1L1V7uauE2C3EdgvucYOpfh2I0UmRwRC
         jpiw==
X-Forwarded-Encrypted: i=1; AKwUvBzfFSNz/9Aa5CTZliRfOYR1EeIyKNK0eQ2V7zHx0awSeJTpwc37GTG/S2AujKxFeK17MP+KUt+rz5Wyxg==@lists.linux.dev
X-Gm-Message-State: AFuF++l5eL4vYapEL/CZ+A0GhTEP5AKoTYxjp8zja2KXFhsSuB9ilL8e
	LS1HLEQbygSWxCmf0eoAWMfgKS9VrVTLX7VwP0OgbtHvQ08ygXUX0gCDKfI9Q/YSr1BeI4Iw0jK
	4rPjlLTvrapFVii/EtVkgDn7N0NZvxfQ+xTTh8yDxGCxQvf2qDAkAxM5qIF2dat3pXQ==
X-Gm-Gg: AYBFou2q/ND+xdoNNYAoMzgyWmLJND0XdMzdJDEjN41JIhjlwnKUFdVBFtGHd1ZDONg
	/xu+J0DOcK8VELM7/Q1ljxMZDZpD21tggvW3zYBzqzyIk6jCCt6DZcsHbOaOet73h9zNVXIrY16
	MmuVdtHWj+DyGg7jhnawQr3N2bQR6DZdQ2gpzsFEv/4BLnxGc68sy0Cf2JnO+mX5lKDPz2F4hjs
	YaNITed5W1Zz9Fgn9gtGFz814TDsWIbiKeRjBscO9/7wY3+FItmlU8uJp2l+LItezSOKejRI4UO
	2tYBFBr8AJT5Vk3JiNTIUkGBs26sLDK7t+5Al5Rd8D9oay2tVLQEpMr9ZPpNLELUVdJPtL0668s
	871RJImN6g/sEYZ1JB7iMKRkeeYE=
X-Received: by 2002:a17:90b:2cc8:b0:398:dc16:3c29 with SMTP id 98e67ed59e1d1-39aedf7733emr11293349a91.7.1788379704622;
        Wed, 02 Sep 2026 13:08:24 -0700 (PDT)
X-Received: by 2002:a17:90b:2cc8:b0:398:dc16:3c29 with SMTP id 98e67ed59e1d1-39aedf7733emr11293267a91.7.1788379704103;
        Wed, 02 Sep 2026 13:08:24 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33255f2981dsm434360eec.19.2026.09.02.13.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:08:23 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Daniel Scally <dan.scally@ideasonboard.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Eddie James <eajames@linux.ibm.com>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
        linux-mediatek@lists.infradead.org, kernel@collabora.com,
        linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 6/6] staging: media: cedrus: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:37:03 +0530
Message-ID: <20260902200703.2016410-7-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902200703.2016410-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902200703.2016410-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=T8y8ifKQ c=1 sm=1 tr=0 ts=6a988239 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=mTAD4mZO0xO8FHYJIeoA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: gs8_X1kvmx8JfBDOsJD6qOWYyz9WOLn7
X-Proofpoint-ORIG-GUID: gs8_X1kvmx8JfBDOsJD6qOWYyz9WOLn7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfXznayJ0t3/rvk
 0BPDEMueGEJhYX+x3FFMpPplZfKdt4OE01JgoSPRUX0rcXyAqTM59FFHpmbwMCFYsttY24IqvLP
 jKTHQ3K/6OHyVi2FzG6otJzJh+U7z/0zKCHDCvG92RpNeagqEJla0CiY2L/YxGu40QUqniGKnKS
 OtqBoTacl75HbcHzyOi+LL5ii6G44O3W/eHbvjy/a4OY7Fopb3C81IjoTH5VPgqISxOMpSO+mQN
 w64I34HpMlZ0HWMbQxfcsNpCjiJtefyrJpz5zyu7FDu/uTD2lEaYzOFUfgqM6OmFp1D3NmZ7Tyt
 khGZCHLy7rXYRsf53+3q1n2zP/WTIjNjf+0LWT+TYVpZ8tEuVWuzboR/huo7rzrgBzqmV79vR4H
 RniQXnsvyJprkHBlIi10qnfIp4EtibqYKBubIb1BRfYGyZLw0uZqwdILMc0FU/faAxPJq6PadjQ
 ezJOFhrOw4bcb/0avjw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfX2IiBqi9iIx9h
 /6YLI1csUTLAwom1KdmVxRhCBnB3nGHPV5S+VoQ+dSORz9tQ6SXDhw0AtnXs8s+k93s3ga60FkD
 Mu7dzXZc8vJ2GjYPxWSw7jPj2FNJryU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 spamscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020178

Use the devres-managed devm_of_reserved_mem_device_init() instead of
the manual of_reserved_mem_device_init()/of_reserved_mem_device_release()
pair, letting the device resource manager handle cleanup automatically.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
index 444fb53878d1..4a15f45ad077 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
@@ -266,7 +266,7 @@ int cedrus_hw_probe(struct cedrus_dev *dev)
 		return ret;
 	}
 
-	ret = of_reserved_mem_device_init(dev->dev);
+	ret = devm_of_reserved_mem_device_init(dev->dev);
 	if (ret && ret != -ENODEV) {
 		dev_err(dev->dev, "Failed to reserve memory\n");
 
@@ -277,7 +277,7 @@ int cedrus_hw_probe(struct cedrus_dev *dev)
 	if (ret) {
 		dev_err(dev->dev, "Failed to claim SRAM\n");
 
-		goto err_mem;
+		return ret;
 	}
 
 	dev->ahb_clk = devm_clk_get(dev->dev, "ahb");
@@ -340,9 +340,6 @@ int cedrus_hw_probe(struct cedrus_dev *dev)
 	pm_runtime_disable(dev->dev);
 err_sram:
 	sunxi_sram_release(dev->dev);
-err_mem:
-	of_reserved_mem_device_release(dev->dev);
-
 	return ret;
 }
 
@@ -353,6 +350,4 @@ void cedrus_hw_remove(struct cedrus_dev *dev)
 		cedrus_hw_suspend(dev->dev);
 
 	sunxi_sram_release(dev->dev);
-
-	of_reserved_mem_device_release(dev->dev);
 }
-- 
2.55.0

