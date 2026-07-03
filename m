Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B4433C536
	for <linux-sunxi@lists.linux.dev>; Fri,  3 Jul 2026 19:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783108028; cv=none; b=ueJV/4f0aXtzVgu25hRKi8rnPz8wBt6babDieNyUhk1L0oO0ZrkH/TSAGAuXm0h2nt0KRzz/BeT1zjxwWkv4S4GAjaWY5eL1H28bnb2Vz1RMTRPP6zjI9yygDIw+E9o/y0SL3jfROHbcht/XND+E9vHycLtrpLdI9q8eqSdUsC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783108028; c=relaxed/simple;
	bh=1ag8CKt4fCTEhLmKmRXCXehyNPJpiTr6k9RPpRFt92k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PUS7eCOVyVwm7KFM+i/IrbbNyF9pu05h81HmZpsZwXoGtkfKdLN7y2S8bZsHuTu/FhOGVz+uJlh8zoN6U09Nd7NLt6Vo9ifIpJhDggs9P1QvsQbeo1qYDxHhAksYvwg/SvhuleZVHxFguCaHzuqjJ+GSDx4dxxmnCzl0rIa/qxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DY4QvfxB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WL18tgiY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DY4QvfxB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WL18tgiY"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663HjDUT496646
	for <linux-sunxi@lists.linux.dev>; Fri, 3 Jul 2026 19:47:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=TQ2PuvPwxYk
	Wt/yOA3YLy/RG2quNv49+20ByVVAjYo8=; b=DY4QvfxBiKqNUjE+FO+PvI+2fN/
	tWkhy2AkYZlVHf5nAR/ui7uQa+iRBuLntvRwgE0dQFPkqzoLgEMw0zeqlayJ/Gel
	onjx03ASz3rWePMh+qGM/a04eeA80fikGiR1H9p8mrt2w/n2sWBvv1DztzavFtXL
	/XeeldILoOCBesxiNfgJ+C4BADjhG2L6FEbE1s+veZRH1J/q5MN7YvhlEZTBrt1i
	tgodfKGbcSEh9Oqr/vvq610x+ieI1FDFMT4rZr2sB2q1M3/nEMAHspCXkJy5Qnpy
	5vg2JXZqEzbKmYlRZWLE71DuByFP/kvnxPtKLGkBzFPdFWg8Hz/Jm6Zj7cQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68jytma8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Fri, 03 Jul 2026 19:47:06 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38112fd8b48so980244a91.2
        for <linux-sunxi@lists.linux.dev>; Fri, 03 Jul 2026 12:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783108026; x=1783712826; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TQ2PuvPwxYkWt/yOA3YLy/RG2quNv49+20ByVVAjYo8=;
        b=WL18tgiYa3zucF6JLKtHehLK0nCNl5rxjC5W7CvHWwJ1k7Ksab+NZXrPALK8kFV8nd
         RdRwjRycwx5P0xC6BmfrpVLot54wQPgMQiytI5PtmRJLlO5yXU3aJMVqkLNktT4PUIye
         UbEK609l4/CfDSMUBn+uc3S7KLT4Uh3/rpnq4fL6+Mnf4kevOHCJ1I5V/3Gd+D4R2eBW
         dwtnDapk96deRRN7zEZQsJ3zWs9M5i8Fz2ld8aZg+FS0CHqs/0NWEjcB9qkXL5SqiDhB
         wNkG9g+/WnogWfRmLo5NxWTWlzvLAOV8zuIX50Ab9uwVAD5DkcJ5Zutdx3xe6Ze15234
         M9oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783108026; x=1783712826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TQ2PuvPwxYkWt/yOA3YLy/RG2quNv49+20ByVVAjYo8=;
        b=q+JTHl+DMEOX6Yx4OjGBVkhqwRAtkes+AAmNQ18HjG8ki235s/NAamxMXNSnS5HYGX
         emjY6vN9ZYGBI5ByBcFdGsCVOwX4clPVOq+BH97/6Ln4VAwByvagxUl+m+FjfwgvWHpG
         EJfqltlWVOrlnYiLzXujhmbOqWJC8yT/UtWtFbD3OAd2XfUu3boEjd1YVHJVV3WoJwdj
         WSlHFm5X7iBBVykVREhvWFiCyu5STguZYNVcRqo/MLhtEdGOsU6aa0rE8breY4s2xAF4
         5MfetXbfzDIaa05Y+XT+pYWN0+47nqy3jnjdIAQ9u0MIvgmaNZN7qFyk25p6ZPg2eEzI
         A08Q==
X-Forwarded-Encrypted: i=1; AHgh+RpXyMh334m6hvigFsYv8yvdoqid9QJwhmWXwwB7zgW4+Z+cTrfNnA1wY22RmDYlpLvkBlMoKocP8ybW5Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwfpKk8X2+fjg1c03rM6xp2ih/TjizBHCyg4wvm+icmj8J28HHH
	lVwJRaFk7qOxYAM/Fg2sbEZQ+nM1s+lzQjugVt8chfxhpLVI3/IM/rmttroz/HYvKubicxnMQe/
	JFP6PPBOs56Ag7iM8dc1YrWF6tO0A1hZkKjj97+PxUBBd5U/sOpwoTAUWieePUEQVIg==
X-Gm-Gg: AfdE7clyfPlk6m3SyI+KvQQbpowzRcWALaS3HOlaRsIbhZk0WmcPmfndMHpNFoPN2tB
	HPPPNY5QVB/Bdb/EjxJhE+gO6S9aFk2gFKtaimHTVIyvfGDepQRE5+J3DI6OxB3ewpWVVYmOOGj
	c58t8wvEsxTAcWtPjSME1IZzo8zlrxYUYot2n6AqCoaoX9PVQuThpCukcRk9bOoWQG7AmeBdh88
	Lsc1NO2PZ9tc142+asdiONHG/kZvn0Dzez/gOgHdxfAIFtjGRSQhkraqA91w4sEv07jY2EQTVZZ
	CRffLODyTirnEhItQPlvVF6O+NukHlVLs9MOzOuwl1iFG7c8qrg3rdepKL8jnWN/tbOSqvJoXKS
	/e1r5/t7je+5HXncQIS/bfCcVb/89zNqFsTxANw==
X-Received: by 2002:a17:90b:1e48:b0:37f:d262:1e0a with SMTP id 98e67ed59e1d1-38280d999c9mr747520a91.12.1783108025409;
        Fri, 03 Jul 2026 12:47:05 -0700 (PDT)
X-Received: by 2002:a17:90b:1e48:b0:37f:d262:1e0a with SMTP id 98e67ed59e1d1-38280d999c9mr747443a91.12.1783108024778;
        Fri, 03 Jul 2026 12:47:04 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:47:04 -0700 (PDT)
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
Subject: [PATCH 19/42] drm: sun4i: Use devm_of_reserved_mem_device_init()
Date: Sat,  4 Jul 2026 01:08:32 +0530
Message-ID: <20260703193855.110619-20-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE5OSBTYWx0ZWRfX9ACVGBpbeNSF
 pdcUgoJ3XcTajhW8qJRimnB7tbkcGv3LgODAWlKXH8Molf5jSkoNgo67P0XRTuHQKm7F+kgodAi
 jVVeZMRHk38Tv/pTmCZqGoNq9IM6pDaW3LM6PE4TP6QHhWgZaMBNg6CAIEiY2f6gZ9+AMRk1HRt
 9tqIkCZxpvlPNHcdn9hqpQPpBfyxGALD6vGRiZt6s4e6BaFxIRyGUD5HY5RqSs3tWpwUTFasOKk
 vP9mUEQK4rCOS+P6sGFfFPVzSf6XQbNOhxDOb423yQ4iNe+MWE4475XLSgfEkLkhnwDUipoiKrx
 6kNuQNAgH0iPgEGhDq1NvrbOliNO+M5f5/SG7aHEyFv48ykakFVJ1ZT7RoYj5Tb8ImcqYiXBubu
 4pprQTz0mONAFeeROf2+B5RpvG1t4oknei1Gq7H91l4lprZHMTTwY9ymJgjrovJykvpzX/7dcjA
 bvzWwB4A2CmJxwWMfPA==
X-Proofpoint-GUID: 4w4WB6C1HehyIthJ_RAHQq-X-R_UGUrb
X-Authority-Analysis: v=2.4 cv=QbFWeMbv c=1 sm=1 tr=0 ts=6a4811ba cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=UuaWy5wPpgFSIu4BNl0A:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 4w4WB6C1HehyIthJ_RAHQq-X-R_UGUrb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE5OSBTYWx0ZWRfXx5HBVUHm1U6R
 ejzOgAg79L2vNLFMDIcBi1jwsNHwS4i9kMovpXwtfZdw4Eer8t1yp+ibapGzgU1oZnbFo5WPsxX
 bqqP16EGQVFcMcW4+sXZn9QIyYVEVTA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030199

Use the devres-managed devm_of_reserved_mem_device_init() instead of
the manual of_reserved_mem_device_init()/of_reserved_mem_device_release()
pair, letting the device resource manager handle cleanup automatically.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/sun4i/sun4i_drv.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
index 8a409eee1dca..5ca7b6f4764b 100644
--- a/drivers/gpu/drm/sun4i/sun4i_drv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
@@ -80,7 +80,7 @@ static int sun4i_drv_bind(struct device *dev)
 	INIT_LIST_HEAD(&drv->engine_list);
 	INIT_LIST_HEAD(&drv->tcon_list);
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret && ret != -ENODEV) {
 		dev_err(drm->dev, "Couldn't claim our memory region\n");
 		goto free_drm;
@@ -125,7 +125,6 @@ static int sun4i_drv_bind(struct device *dev)
 	component_unbind_all(dev, NULL);
 cleanup_mode_config:
 	drm_mode_config_cleanup(drm);
-	of_reserved_mem_device_release(dev);
 free_drm:
 	drm_dev_put(drm);
 	return ret;
@@ -142,7 +141,6 @@ static void sun4i_drv_unbind(struct device *dev)
 	drm_mode_config_cleanup(drm);
 
 	component_unbind_all(dev, NULL);
-	of_reserved_mem_device_release(dev);
 
 	drm_dev_put(drm);
 }
-- 
2.53.0

