Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880DA33D6FD
	for <linux-sunxi@lists.linux.dev>; Fri,  3 Jul 2026 19:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783108151; cv=none; b=NzpCpXQdo8mFjvyhNiFIl9J3QXBzjkNn2SiCusOOQ8BUrFOjpQK7gs1z2umLxKyFfPIenl9TGFtKLQEMk5kJa2fW8gbyluhB31uNtADw4J+IEPy0FeK6Hq5lnezySdBI+s32OC2TIptT7LupHwVnk8rxfupuIIqU+XaIcKrh0Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783108151; c=relaxed/simple;
	bh=nKUUCUPIco1ip4w7PkPucTmimjJQ87wHPgacKzywqAc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lufEvtXTag0mZQqoEzmuCKCzQY1mDvJzJ79ejrVDiHIKTNBtZWSCl1bILwk6wO5RlyIIaj+dQVmQdNdmjeJ62VmW0rB8aopBQaTOONg5m6ESFYd8/TlzUjvArrUGdWySq1NKCxk+h0VwYxKNZQ40iiJYYXJ/3wcD+cU/WpSchJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S1EkCV5n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YccC0iLs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S1EkCV5n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YccC0iLs"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663Hj0jo676038
	for <linux-sunxi@lists.linux.dev>; Fri, 3 Jul 2026 19:49:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qrLNvvBd1IL
	tTArtQX8hnsFClrmyzhIwysun4St2jcc=; b=S1EkCV5ncADGpatu+eYZt750/gJ
	LNLywLK3880MOVcH/tdC1TcI+OqeOew5eBqmPBQw2WxbhuKJxdDehFccfF1Iw06A
	ah4T8eIEryoVXAk78NJxSVoqTVGOs88jJDt6BItnQh/marGnHSf8MAYdrnL+EvAy
	X6tFzBtTSIu8UyHQ/B433/b2JRqYdep4RBZUNOlTI8pJMS+8R3opxr2x38x/E7Ig
	o3oGK6JEOl8FvcuYjJVxSgdKyDxnHNT4LXiEu6qE8OpEDqKzfYrsezcTm8AvWFnP
	9MSzx/BgCvxY+6M1AZ4K+vK8GI3ISog4BM0DfWHZ8CqfNzkkcsMDn1W9VAg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6ckj1hk4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Fri, 03 Jul 2026 19:49:08 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c8952346bb9so765871a12.2
        for <linux-sunxi@lists.linux.dev>; Fri, 03 Jul 2026 12:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783108147; x=1783712947; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qrLNvvBd1ILtTArtQX8hnsFClrmyzhIwysun4St2jcc=;
        b=YccC0iLs9sSVcJ58RHPqgvp/1cNsNuXJy0TMqVhMP30y9v8uTTmsGSV/WiutZHMA3O
         AeSfl/EHfcjmb2kBlU0jsCP7hanY/ex7d/WP6YyH56+JRr1MSOUNq1PRrziSBK9+gB27
         IXZrr8S46GwrFP5Bv8C3xvd/P2PQ1a+75bAwnAULqQLJOmROklLDl0u3rQpHj59rtdFh
         R9/8P0QyARR7odszzTjzvuU0Upm48nV0PRJWloIa5S1Ple55ZuW16PQcr6K2eAYZbTI+
         iEBIB16EHXT3cH2zip7N5e1C5e+hs782JWbRiWtnhwwFGCNE2BvpFLk6MbgdpK0iNtfS
         phUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783108147; x=1783712947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qrLNvvBd1ILtTArtQX8hnsFClrmyzhIwysun4St2jcc=;
        b=njepvwJ1EW9ZkwM7D1cxP51s/StT2eU7fbj97W6akxy/0FD4xC1OxTDHmQUQ2mP6Ob
         5cWZeLvn69KAAjDCRop8tz0l4MbMtNWVpwAPxjifPQVbI/rBeBxQVNO2cFu10t7dCrjB
         ftytB9/Cib5/rUuchyaDX4XlS0DFxVFoX3dARYskPPz9+Bsf1PcsVfTktkRJW+ZSgHl5
         Hb1nbXqfFEnx7A2SAmDxhphrNhGWIgP55uNVpdSJX2v+VCOqou1aiy7wk66ooY1OSkX3
         gGvIcO77yEtVkYs4h4ksPtXBWLC7dxwNWy/T9Zk97nB352Eod74KhJ69kF8sXQHYGsIw
         Bl5g==
X-Forwarded-Encrypted: i=1; AFNElJ/tShX7RlW3QIOBswtiwoKPhTSQOyrcl78FUo1dwIJjh/3PUVY14hLLRUOSEhDlPfr+puvyRjl43BZvig==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+E8UW39S4Qm3T42wYjQfcVI9VZ0ODk34fgsy376cx2x0tFtHn
	cs8S2xRiHSCxMs7mF7Xk+I2yHK9C7RYsxgOgND9qJ+SuEUJbversDo/meqfrs9Wf1N8UKe+F4G0
	2FX9rrCBtA0qr6eJtLNm7bkj3pw3bfw5qsu3+EMdyJRYPi9ay4C9rDEXfebd4UrQgOw==
X-Gm-Gg: AfdE7clKrDH/DFucnS40/TexXjMcrp1co1snGaCTWSFR/TddAlZRunmve7jg4If7Ag4
	8SH5pQ2fGTvIb2/MDFWaUWXgtBTQTvOKaRo8d8YzOInMQar2g8WgRxH+cr+lpKueOocVwIPVpQS
	OfgHZ8jqzzmUQnnUcz/dNixpe6zbBkRvgqNROeaWlWuK1o7myd2Isr1wwK2CISKLUgooR9u5L61
	vwTbytVMOw9A/dR2sD/CCVR9jwmdY7neL4fs7AkmOSz5Lyp/vu5RqxQfsHG6RJegfR87gxCaAnR
	zURzkGPVY6apfYtJJuD+SyS62QxDngUAbTwhWYxPEdWrUasmnbSvYHhMT9DCJRxRNqWK3xQmG49
	oUrlesI4v76DW9F0Vv5jlWEdWro17wwO31oQLZw==
X-Received: by 2002:a05:6a21:6e48:b0:3bf:6c04:a816 with SMTP id adf61e73a8af0-3c03e4da45cmr721890637.55.1783108146895;
        Fri, 03 Jul 2026 12:49:06 -0700 (PDT)
X-Received: by 2002:a05:6a21:6e48:b0:3bf:6c04:a816 with SMTP id adf61e73a8af0-3c03e4da45cmr721855637.55.1783108146324;
        Fri, 03 Jul 2026 12:49:06 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:49:05 -0700 (PDT)
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
Subject: [PATCH 24/42] remoteproc: ti_k3: Use devm_of_reserved_mem_device_init()
Date: Sat,  4 Jul 2026 01:08:37 +0530
Message-ID: <20260703193855.110619-25-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIwMCBTYWx0ZWRfXzVQY2GcdZX9e
 c7XiajXaeisYhIzHxRaqhfKOpgslrz9QLCit3n8tX1wMANJpW5yu2yUn1VsO5h6furls57hN3li
 eUrLmd4x9KvcgpfREYAhdctc4hMrzL8=
X-Authority-Analysis: v=2.4 cv=E8v9Y6dl c=1 sm=1 tr=0 ts=6a481234 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=7v6Lk8RlztZ-GcM17LUA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: bMDHzqO5Nth_aJSj0VdWxnwELoXlWsgH
X-Proofpoint-GUID: bMDHzqO5Nth_aJSj0VdWxnwELoXlWsgH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIwMCBTYWx0ZWRfXw9TBx0ttf4h6
 0OGecMpwVWDQRPDrKC7UdCUe9WCeMe/3fYR9oYeejvIEWM6fw3gsDp5RqdBh4DKRr1Aj0jrxwNE
 6dWflfvSq8z/AF+j32gYgBzyEetMNDLpLcYByRx24mcRl3Ika/NRYfiCcBwWiZWedaUyjER2Mu0
 Kwc2bcUBGxlBbo58LJy3irre4VUnUexjpHWbqjD/Z4Ie40ePEXLLZTum67UxbmlmtCG4/02Vdpk
 q/I8+VaXM12msTe03PweFt74bdnfUXt1EjOmVLdkz3LYN9lKI8VFEFEDyXkyUHdHyb6yr6gR3S8
 829BCYYfKykbdKTa6K9ahRUxlnHdIWuaCWj/K02zgLJ8x1TS87l+h1kr8FPowvwDRi3n/b3W6uz
 QLud2/1LZ/NZXGVFT7Qkdw2Nn5UbeMv4YWzBoncvLyZuUu3LamUvJAHGXNMfpQRBpF8U/KtlAHL
 62mjh3F4yQ9/Edcsz1w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030200

Replace the hand-rolled devm wrapper (k3_mem_release +
devm_add_action_or_reset) with the standard
devm_of_reserved_mem_device_init(), letting the device resource
manager handle cleanup automatically. Remove the now-unused k3_mem_release
exported symbol.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/ti_k3_common.c | 13 +------------
 drivers/remoteproc/ti_k3_common.h |  1 -
 2 files changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
index 3cb8ae5d72f6..f08b9e373220 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -458,14 +458,6 @@ int k3_rproc_of_get_memories(struct platform_device *pdev,
 }
 EXPORT_SYMBOL_GPL(k3_rproc_of_get_memories);
 
-void k3_mem_release(void *data)
-{
-	struct device *dev = data;
-
-	of_reserved_mem_device_release(dev);
-}
-EXPORT_SYMBOL_GPL(k3_mem_release);
-
 int k3_reserved_mem_init(struct k3_rproc *kproc)
 {
 	struct device *dev = kproc->dev;
@@ -486,14 +478,11 @@ int k3_reserved_mem_init(struct k3_rproc *kproc)
 	}
 
 	/* use reserved memory region 0 for vring DMA allocations */
-	ret = of_reserved_mem_device_init_by_idx(dev, np, 0);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret) {
 		dev_err(dev, "device cannot initialize DMA pool (%d)\n", ret);
 		return ret;
 	}
-	ret = devm_add_action_or_reset(dev, k3_mem_release, dev);
-	if (ret)
-		return ret;
 
 	num_rmems--;
 	kproc->rmem = devm_kcalloc(dev, num_rmems, sizeof(*kproc->rmem), GFP_KERNEL);
diff --git a/drivers/remoteproc/ti_k3_common.h b/drivers/remoteproc/ti_k3_common.h
index aee3c28dbe51..9a58aeb3867c 100644
--- a/drivers/remoteproc/ti_k3_common.h
+++ b/drivers/remoteproc/ti_k3_common.h
@@ -112,7 +112,6 @@ void *k3_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len,
 			bool *is_iomem);
 int k3_rproc_of_get_memories(struct platform_device *pdev,
 			     struct k3_rproc *kproc);
-void k3_mem_release(void *data);
 int k3_reserved_mem_init(struct k3_rproc *kproc);
 void k3_release_tsp(void *data);
 #endif /* REMOTEPROC_TI_K3_COMMON_H */
-- 
2.53.0

