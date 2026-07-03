Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36950331EBC
	for <linux-sunxi@lists.linux.dev>; Fri,  3 Jul 2026 19:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783107883; cv=none; b=egwk1aiH28JGfHez09ql0s0e54Id2A2Y88X1vMrEZVGc047DvyvNrtyDamPFV0I3fHc6YXytimfsY+L1qSPHen+7cNEKABEntT8tUz2uyzWBU6RSoYBK47zaMixcd0buqeA29uSX5itcKFEvSzRier/8rCBlGmavJRB1ovIpiek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783107883; c=relaxed/simple;
	bh=9VHUN3wrrOaDoWZFUjd59Z16/VB9m0n20/OUvZSYBsc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HDpuNvT5EwfVbQop8cVkOqceBnKMPlhEpHaEuJD01HcI80OT4Gqs8DrUr4XkySENhw1S+EObcmjAOIlaED4oK6ndYJGg0f9o6Ieg+WF+XD3p8E9zlT/E2Be/yjaDbzY+D9Lq9L95kYnqhtj+n0VwfYUhk5nFZPLWQZZ6cVe4VBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iY4Qnsy8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GepotVvP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iY4Qnsy8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GepotVvP"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663HiQ1B530581
	for <linux-sunxi@lists.linux.dev>; Fri, 3 Jul 2026 19:44:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Lv1Bj12YhLZ
	GN3CgybKSi/9TGsT3eAHwNaLR1ZhFDGs=; b=iY4Qnsy8abrOAIAfFH+8FxIw6mq
	Qv62w0poHuMw3XeKHTxiiEV2i9vgpiWUQnAMxg15qwpuMbCD5LHMmPAbxups9U6+
	8Kxg3VkqFs14Nvi5hRkCGUDPNnOZSfE9BVxjERFNOsf8El+epCrhEeCuyT5bWuEx
	xVZiMuzcNy/l+EOoJk0aX1Nx3Nv9PBByY67N2PgW8n4JUwsFXE0n25h4bFlL+ioR
	1v/6f5QLgOyzaQa8dDpqtELNoL7m4lg79GgByHgwIpYh0c/MZ5ZJFB7t/TSt75zB
	Hq0jvgAaxsGIXA6rrVFftF0Whkpojf4qBmtL0jrhsU2GaWU1Wh0ht1sDqrg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f648n3s70-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Fri, 03 Jul 2026 19:44:40 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3810960140eso1449432a91.2
        for <linux-sunxi@lists.linux.dev>; Fri, 03 Jul 2026 12:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783107879; x=1783712679; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lv1Bj12YhLZGN3CgybKSi/9TGsT3eAHwNaLR1ZhFDGs=;
        b=GepotVvPEAlS5gNCeykvmtd6yaPLRQ0+3bLHoPYWaSSIj8hG91buHD/vXtApBffaNl
         vgfqbsUr8ktzlM/kMr8Au+dhN39BE50rZ8Wi9iHa+dmVtuV/Yl17ygFLrcIL7wB3hK7t
         PJyBu203i+ToNwFjUyVlyq1JW9cEsVoAjM52+6FYUiFGp3rKGNeCEnqDHAEDZHNdRvZl
         U7/QKv0Lt7txRbFKhVclfGvnmTWlCDfSYlvxs2CJj2xQ3fWClMDveyWU9UMIZKn1MGla
         /2xHESMYSG0ns37rpHKuVnivjhULR4tKU1+Vzvszr0w11wlPLTwYo0Q/kyItjQ/4qPOW
         mexg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783107879; x=1783712679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lv1Bj12YhLZGN3CgybKSi/9TGsT3eAHwNaLR1ZhFDGs=;
        b=BwSxzH1NCcqNwZE+HSoPHZBkdJDkA0L1aCw3fkDyPPCZuUBy3XZSoLwLDrnZbRxr2U
         6fgOVIjZFtPmd5OVwdBpLlFiJkTfvO+QazwUPyxwje1H+8K4POBT/+aazJvP5qho2lYC
         LVlyMj8okGg2mFKyOrxovy/iz36I9mnqt0WxlPJc5Qni5GL7J+dE/iA3frGMLd5p/9ni
         eheXCXX2SEyOTCgNcbiWAE3cZ15oY7HIdV66l8yQ7LCFP07ZwtBGXoMVQvbYVc656IV5
         kp3/EFl+vNbLEeGf25SY3i4rP+nEpaHW8hYo0MBkfxYSa6hbYwDRc+zBrszSr2J5sQmN
         bXuQ==
X-Forwarded-Encrypted: i=1; AHgh+Roj7YxI3PT/XUICw9uXzcGsTLOKLpRkGebDUVgpxALYg+umiEXjg9De+MtNpr/tJACLq/KQ8OTHmgJlgg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/McYQ2P+5JtoS8GinN2ewzWkmpeWuLjLl6Z8oySkijke4BbX1
	tjKz5ON8G2JoaIKgia4vRnPFVIMOJc9DxfwDAzo9QtwYK0rEHCUK9SZIYEiZlAayI4p9tpVj5g2
	EoAmaQiJL5HFUTM7fhblarZ7dJquPLW7pP94PrnuEH6r7osTS3PjsAYO7RpWR/I1miw==
X-Gm-Gg: AfdE7cktlcDJ6Px4oW0HIVsoGNtTxpaUZHU3vtQ6nr3UyzhvBEFC32N23KMXZ0+QW5V
	fMpS7iR/Ip3EhiGYOpyXI68B0578Svu5iouvPGFOYkS0+bb5byDAwQoktw04wdVo3rVbo6wPdLd
	cS9e0jO91IY+g59z83Q/Hl4gaePhdYOv9saMO2gT3a28wLHWmDFsFLljK95DNe644b+7iDv19Up
	LYUzLcxtfZAuxzheZ+qHxVfISqjxce82JzM5O7bf7F4xSvqt9rSeOZbeBEGVaclQVkuZdWG7LM5
	FBT1mFwUzgZHVuwz6vt3fkHheTRu3HN5E1o0ejUu4ZsvgUD+sx6jT5ei/ozMKylPDQHfhN89gFF
	5CZ8DaFbBtJZpoFCCylxHbAR2tYEn7TyQpZ1uhw==
X-Received: by 2002:a17:90b:2886:b0:368:d839:28d5 with SMTP id 98e67ed59e1d1-3829f0074b6mr775688a91.18.1783107878956;
        Fri, 03 Jul 2026 12:44:38 -0700 (PDT)
X-Received: by 2002:a17:90b:2886:b0:368:d839:28d5 with SMTP id 98e67ed59e1d1-3829f0074b6mr775603a91.18.1783107878394;
        Fri, 03 Jul 2026 12:44:38 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:44:37 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Paul Cercueil <paul@crapouillou.net>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Michal Simek <michal.simek@amd.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Eddie James <eajames@linux.ibm.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ge Gordon <gordon.ge@bst.ai>, Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Shengjiu Wang <shengjiu.wang@gmail.com>,
        Xiubo Li <Xiubo.Lee@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Peter Chen <peter.chen@cixtech.com>,
        Fugang Duan <fugang.duan@cixtech.com>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        BST Linux Kernel Upstream Group <bst-upstream@bstai.top>,
        Fabio Estevam <festevam@gmail.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-aspeed@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-media@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-mediatek@lists.infradead.org,
        kernel@collabora.com, linux-tegra@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        imx@lists.linux.dev, sound-open-firmware@alsa-project.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 13/42] media: nuvoton: npcm-video: Use devm_of_reserved_mem_device_init()
Date: Sat,  4 Jul 2026 01:08:26 +0530
Message-ID: <20260703193855.110619-14-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE5OSBTYWx0ZWRfX3t3UYpBwss2U
 jnMvwfUhQ7IQ8teKJ1UIYKS7bI2GAyFCY1FOm0ya+68L/TZFk/4CdiBdT6LEhzp2ShukhML6xB6
 cLeVO1w5gVPQkvP0eaiiyx1iwG1jt78=
X-Proofpoint-ORIG-GUID: 1EhMBXpi8qnGAHDXjnKlvsfOMqQGIL3z
X-Authority-Analysis: v=2.4 cv=O4wJeh9W c=1 sm=1 tr=0 ts=6a481128 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=iFm4xv_JmjgOdRhw77YA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 1EhMBXpi8qnGAHDXjnKlvsfOMqQGIL3z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE5OSBTYWx0ZWRfX5faasGN5Rk7l
 WBKdsWeMNjlA1OdNAtP+4PDMGqjuBO343qFVnBfL7p/3B5YH8vcKG2UHP5PQ8Iv+eWc4V4s5ZEY
 gAMBboIj2CTtGautYSSA0GG9k9OMT2v8/58VmUotDvaTqVcz2eBByAKkGV7UF17PhBrQJPzFMkd
 +i6zQA+AaDchVxFPvrDQewv2VVd5kUHox6xH1l7/nQTCSUuZmVQ9q85ofooZk1L9xyy0eibVF+c
 7SknmL8y4uLou/qlHIvKNLM8GNLFHUz8gg0WGygSeFUbeEFtk0S2qfkDIYwydqz7r2qy26rK8r8
 kiy9GwiL7vuP83WxRypSOf04aR0aMp11sAf+VxlUHmOTdW9kqOGHm0WTphoJhlW9aa2zLLUOdBo
 rtDxrlE1Bffg76ccqO8zdofiMJo1s463+9vJlGnp5IEa4hgdqm/Zxa69fHEaDjnemGGeKmTrF8m
 1CDxfy8G+dbyyH+yHbw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030199

Switch to devm_of_reserved_mem_device_init() so the reserved memory
region is released automatically on probe failure or device removal.
Remove the four explicit of_reserved_mem_device_release() calls and
collapse the now-empty err_release_mem label into err_free.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/media/platform/nuvoton/npcm-video.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/nuvoton/npcm-video.c b/drivers/media/platform/nuvoton/npcm-video.c
index 52505af35c08..6786736c8f07 100644
--- a/drivers/media/platform/nuvoton/npcm-video.c
+++ b/drivers/media/platform/nuvoton/npcm-video.c
@@ -1715,17 +1715,15 @@ static int npcm_video_init(struct npcm_video *video)
 		return rc;
 	}
 
-	of_reserved_mem_device_init(dev);
+	devm_of_reserved_mem_device_init(dev);
 	rc = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
 	if (rc) {
 		dev_err(dev, "Failed to set DMA mask\n");
-		of_reserved_mem_device_release(dev);
 		return rc;
 	}
 
 	rc = npcm_video_ece_init(video);
 	if (rc) {
-		of_reserved_mem_device_release(dev);
 		dev_err(dev, "Failed to initialize ECE\n");
 		return rc;
 	}
@@ -1789,13 +1787,11 @@ static int npcm_video_probe(struct platform_device *pdev)
 
 	rc = npcm_video_setup_video(video);
 	if (rc)
-		goto err_release_mem;
+		goto err_free;
 
 	dev_info(video->dev, "NPCM video driver probed\n");
 	return 0;
 
-err_release_mem:
-	of_reserved_mem_device_release(&pdev->dev);
 err_free:
 	kfree(video);
 	return rc;
@@ -1814,7 +1810,6 @@ static void npcm_video_remove(struct platform_device *pdev)
 	if (video->ece.enable)
 		npcm_video_ece_stop(video);
 	kfree(video);
-	of_reserved_mem_device_release(dev);
 }
 
 static const struct of_device_id npcm_video_match[] = {
-- 
2.53.0

