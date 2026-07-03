Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5E733F584
	for <linux-sunxi@lists.linux.dev>; Fri,  3 Jul 2026 19:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783108081; cv=none; b=NUTfjco3lNRtj7KxuFE1Mpg3Hzza0sleazMN2cSqJV+Y9jYaT9wzVtVv8xqdrQ9a52ItuuKAtZI+UsTsQXa1b2kHCmg9Njn/0oax7cAWcsl75h1n3rCFUXlFglNRboMlYMVkUV8ekhJtfD3z29qM83n11BBjYGnFPa/UyGBZHbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783108081; c=relaxed/simple;
	bh=0AzNxG8vWTQCmH86VPR5fCzyLSK7mXuSOy8qPDSRxr4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ef8Yn8GPW4OA2nmjF7QDmL+wAdaEcZvUvs9E3fkkw+IJy+ThJIJGJw5nRGHZ+lWLx3te/33R4pl/+vFHTo4ZkFnkUdsYEIEr6K24+1LcHOw7UNiD01R7fcXKqBm/cYb/yxeE+Gb0l66n+9Wfb9UKkztL5uOebi9+Npqfo/Ioh2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hZRbqGsB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XFVMRMbW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hZRbqGsB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XFVMRMbW"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663HjGJf686162
	for <linux-sunxi@lists.linux.dev>; Fri, 3 Jul 2026 19:47:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xuYKB9E0hzF
	7S0N0QAKalkDHkk7g7cDoVCzqqk7pGeI=; b=hZRbqGsBRWL/VYFCQeXeHyQYRPi
	GCEQKMaidc29Zyn17PyPi9mLE8M/gFX2q0clAuvqWEMCi5m86/yq0yfMwm66+xQg
	Yof60+ODe2We/1xeDUT/7wgvqLLDAuqKr9nVQmVGU09S2WsL2G0wpZggA032DX2b
	1cZwFSAZJtbX6Yg5dpbk4CTusF2kY8mw+okp6PnErHmqIt9fiWUIYpZW1vkWg8mz
	kdCzNTjJvN1F2Ng4/ZvC/o/W0wBPVJ1xiIAyQ87K1oHGDx6soXMwbve9EDpAugEF
	jr3ipdr+eYULxOuL+KdU7t1704r0d+uX7wy8p3c36wO+CwmF+RyFLO7Y8sg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f65qckfdv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Fri, 03 Jul 2026 19:47:55 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36d97a4e08fso1425600a91.0
        for <linux-sunxi@lists.linux.dev>; Fri, 03 Jul 2026 12:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783108074; x=1783712874; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xuYKB9E0hzF7S0N0QAKalkDHkk7g7cDoVCzqqk7pGeI=;
        b=XFVMRMbWh5RIw1odg4ZXCjMHbcWrDGWblQLlHzTcZokj5eUyXsF1Jpu5encE33pXZU
         Ez5hGStr2uUYQBFsw6iCPlOJ3+WO0NuSUd8JA3XQNdYt5x6eSCEbJ/tk0Wg+9Gh7TdRi
         dy1eYVRDMCyTwgo3Q/tfTyIIbVr/7Y3lb0GgY0iY2avUVZR8x2l/7p9ot8ECLROeay+V
         6eC1VEs7fng+3pntTV2PcHGJeyz++FT7uUjf5nfkcQ9XQbdfJYNrbMhdGMCTTnbbgrbS
         97vN7K+YHR3GNBMuBHz8UoicmHjrIGIsdF2/TLPjVPWFoXwxTKETe1umMTti2MM0PRCH
         MSdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783108074; x=1783712874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xuYKB9E0hzF7S0N0QAKalkDHkk7g7cDoVCzqqk7pGeI=;
        b=YcqQFXINL5xsPFvffzxlFSmAIzWteWN8f56kBMdQTpi2nJxt2spl6kilRIbfiJ65Nu
         wL/0iUWsc2zN/DrKKrFn2Pnx3fBTrR1eBBG9EPezCk7aKVCENCWv6YXODUTLc4zvVChs
         iMzWXak22qI3mceyyEw5PWgBUU3hn70rmpUOOYlC7OfQgSEXBybF/6owG57GM1qwulpd
         0sCeuB8Tc5MuPag0GYaKEOHrEdCA3X7joojeoeWIcZcjNrYJdEf+44+2a00hXT34W1OA
         jtz3+3GdycLW/JI/4mjgQtNdHoavR0fv2lQr/h/J8C1FR5+B+BEf+dJWiWohePX/06Xu
         xcTg==
X-Forwarded-Encrypted: i=1; AHgh+Rqx5WZUe2UYus520Oo1Jmiv3EyAGD67RoqSNEL7QEa2mawbduV1nqspvPVgEa3cXvI/dvZLnCAWVeXaFw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxYFB4ITqFWk6/otgZ6tAWPGgbCH4+4EHNQBxxHDnb2umceCTjx
	UPZIX9Jkzb4YyrDxi2pAmaWCLbwW1mCy7JqU2w7VoMSIdWt9wE++vkiAY05c3uETg6jkCwhP53k
	C2B7MCzOfsutftCrcsrDZIzcqfNWOvLOyh3+D7EylZCcobZXimKHGpwaoPzKbgnsY2w==
X-Gm-Gg: AfdE7ckyCPi1YF8/fm2FU9wTuIfzBcO59e4NATYCsee3qwZLR30H9iMb9KBmhLFf1ym
	g7LksdrXX/qA2cpgC3lPaKUTda455+jMW7zF86rpzI1BTS4OVna7Jvf+PFdywIRy7+m0dWyeD0n
	mgJdNp6CAJY4UhYS2J0X2G+TW+92S8lyzu37U2/K+G2iBIKTC7fvtnByPkTxceosAat+OE5YnJQ
	pfUDc9RhXd113W0aQQaAXBEtyruG3Wey7XU30DT+d6oUWB5/k6J9uYY6JwfdmsK91Zzg5ocT8jS
	XlxXmjDRaR5eDQKkmGtAN+5fzCLVRsbX79c9HuZWLVV/IpkbMqlaPZoeKLXVr1KBuY0pExJb+Gf
	Hicp+rLWImzgLmHkLStlXgGC/H1NQjbnpZ6TfOA==
X-Received: by 2002:a17:90b:17d1:b0:37f:9ce2:3489 with SMTP id 98e67ed59e1d1-3829f7ed7ffmr730916a91.26.1783108074083;
        Fri, 03 Jul 2026 12:47:54 -0700 (PDT)
X-Received: by 2002:a17:90b:17d1:b0:37f:9ce2:3489 with SMTP id 98e67ed59e1d1-3829f7ed7ffmr730822a91.26.1783108073506;
        Fri, 03 Jul 2026 12:47:53 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:47:52 -0700 (PDT)
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
Subject: [PATCH 21/42] media: arm: mali-c55: Use devm_of_reserved_mem_device_init()
Date: Sat,  4 Jul 2026 01:08:34 +0530
Message-ID: <20260703193855.110619-22-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-GUID: yi_ouxF7wYI-Lh0JKWujrc4vU9kzoYLR
X-Authority-Analysis: v=2.4 cv=Bb7oFLt2 c=1 sm=1 tr=0 ts=6a4811eb cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=NKxwcvIfb8AsFCMGSgUA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: yi_ouxF7wYI-Lh0JKWujrc4vU9kzoYLR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE5OSBTYWx0ZWRfXxhOtTg8TMyfM
 nMCnri4tQocXXgRbPDT4pe6aIp1e++4KFdifY0Kvgx4485Xw0H463V04NfnoBcGjq3JKarXXKk9
 4shnbssTcMixLOdKiL1noo3InN755T4ReRQ4xlWzRSzmbpXFjQhPaKx4lcarrIyeDas9A1r/I51
 iULRQp3zP+HwQZPEZs88eO7P121pzBUlVtd6WR59tscNZHnfx9DwIrRSL4OIRB/pOwccnDxu7qA
 5hB1eywh7cfX7abmMf84YUpnVz9Tdd5/uYP6t+P85c+0Gw3xu9/K0rBfeVlmnSke+G0lgsvACTC
 Cr2DXnLFH6FG4RnhhSoXbMoDSBx5NWPwjCW2IeJvdal8d49asyWH5XAaLG91j2PGsmwPp01PY3e
 e2bzefbeQbJFFku3Ncp+5bPpvcXQ2vcMlha9OumztMbsvtxNr3KbRJc0Rmp4hJZdo9XAAIAL7EO
 U27pJ3HyYDkxFxcRGWw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE5OSBTYWx0ZWRfX6uNcqgBtGV8/
 eGEzeiuRCq+N4meG5HrRRFUHOFzSbSf/xqvPswkmSQjdsTFqR9cdRTo1jN/kuV7NRAAcpWcIeyX
 bqJDWyTUB+5k+qyh9pKIU0B18apWP/c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030199

Use the devres-managed devm_of_reserved_mem_device_init() instead of
the manual of_reserved_mem_device_init()/of_reserved_mem_device_release()
pair, letting the device resource manager handle cleanup automatically.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/media/platform/arm/mali-c55/mali-c55-core.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
index 94a389b3f833..afbec11f69f8 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
@@ -801,14 +801,12 @@ static int mali_c55_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to acquire resets\n");
 
-	of_reserved_mem_device_init(dev);
+	devm_of_reserved_mem_device_init(dev);
 	vb2_dma_contig_set_max_seg_size(dev, UINT_MAX);
 
 	ret = __mali_c55_power_on(mali_c55);
-	if (ret) {
-		dev_err_probe(dev, ret, "failed to power on\n");
-		goto err_release_mem;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to power on\n");
 
 	ret = mali_c55_check_hwcfg(mali_c55);
 	if (ret)
@@ -847,9 +845,6 @@ static int mali_c55_probe(struct platform_device *pdev)
 	kfree(mali_c55->context.registers);
 err_power_off:
 	__mali_c55_power_off(mali_c55);
-err_release_mem:
-	of_reserved_mem_device_release(dev);
-
 	return ret;
 }
 
@@ -864,7 +859,6 @@ static void mali_c55_remove(struct platform_device *pdev)
 	}
 	pm_runtime_disable(&pdev->dev);
 	kfree(mali_c55->context.registers);
-	of_reserved_mem_device_release(&pdev->dev);
 }
 
 static const struct of_device_id mali_c55_of_match[] = {
-- 
2.53.0

