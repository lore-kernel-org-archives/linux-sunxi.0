Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681E328EE
	for <linux-sunxi@lists.linux.dev>; Thu, 19 May 2022 15:44:13 +0000 (UTC)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J6k11w002261;
	Thu, 19 May 2022 10:43:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=M2IDrEb5l2+llrK3AWp4NytfJMdMlvgjjqfAQyTGOFY=;
 b=Hvf/VWWuJTxL/QeMVXtUWD9CdqbYQldrSJlKQnKSCLiMvKOM4CQOLMTKR5TkUxS18vej
 3gK7LDtO28l91Fa4owOa/Xh2fxF1/3OqFCrjS9vQVeej0K+ACQudoK6BWiPWSdDZTBUF
 V2X73VOv26SQiGDJKeuSxP4JXBJgvlD/0GXIgGQ3x/3h4Tj0Y1IkX4oJSxkzRLiZeSwQ
 rGl5AoHf1kBBSpyRO2PrSKmaCeG1SQvrO1bZnCt6Bxz2Pmd//glzWxbYUhgCcCB+ECKJ
 s3oqpa3VEQPF2AP0GfIYaaxfciBzN4CEoOcQdk7bHcq7Kb6Xe3oMKJpa8HmdZmmp0YUd Jg== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3g29u37mcf-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 19 May 2022 10:43:35 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:20 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via Frontend
 Transport; Thu, 19 May 2022 16:43:20 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6425711D1;
	Thu, 19 May 2022 15:43:20 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <kuninori.morimoto.gx@renesas.com>,
        <nicolas.ferre@microchip.com>, <nsaenz@kernel.org>,
        <shawnguo@kernel.org>, <linux-imx@nxp.com>,
        <cezary.rojewski@intel.com>, <pierre-louis.bossart@linux.intel.com>,
        <linux-mips@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
        <linux-amlogic@lists.infradead.org>, <daniel@zonque.org>,
        <srinivas.kandagatla@linaro.org>, <linux-rockchip@lists.infradead.org>,
        <krzk@kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-sunxi@lists.linux.dev>, <linux-tegra@vger.kernel.org>,
        <linux-omap@vger.kernel.org>, <linux-xtensa@linux-xtensa.org>,
        <peter.ujfalusi@gmail.com>, <jarkko.nikula@bitmer.com>,
        <heiko@sntech.de>, <jbrunet@baylibre.com>, <kernel@pengutronix.de>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>
Subject: [PATCH 28/56] ASoC: core: Always send the CPU DAI a direct clock specifier
Date: Thu, 19 May 2022 16:42:50 +0100
Message-ID: <20220519154318.2153729-29-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Kv30fN5Me0SIZP34T-2FsGb4QLZ3P59w
X-Proofpoint-ORIG-GUID: Kv30fN5Me0SIZP34T-2FsGb4QLZ3P59w
X-Proofpoint-Spam-Reason: safe

All CPU drivers are now updated to accept a direct indication of
whether they are clock provider or consumer, rather than being told
if the CODEC is clock provider. As such update the core to always
pass this direct indication rather than only if the new set_fmt_new
callback is defined. Note this makes no difference to the CODEC
side of the DAI link as it was already being directly told if it
was clock provider under the old system.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/soc-core.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 90f4265bea501..227540851dedf 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1214,7 +1214,6 @@ int snd_soc_runtime_set_dai_fmt(struct snd_soc_pcm_runtime *rtd,
 {
 	struct snd_soc_dai *cpu_dai;
 	struct snd_soc_dai *codec_dai;
-	unsigned int inv_dai_fmt;
 	unsigned int i;
 	int ret;
 
@@ -1227,19 +1226,11 @@ int snd_soc_runtime_set_dai_fmt(struct snd_soc_pcm_runtime *rtd,
 			return ret;
 	}
 
-	/*
-	 * Flip the polarity for the "CPU" end of a CODEC<->CODEC link
-	 */
-	inv_dai_fmt = snd_soc_daifmt_clock_provider_flipped(dai_fmt);
+	/* Flip the polarity for the "CPU" end of link */
+	dai_fmt = snd_soc_daifmt_clock_provider_flipped(dai_fmt);
 
 	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
-		unsigned int fmt = dai_fmt;
-
-		if (cpu_dai->driver->ops->set_fmt_new ||
-		    snd_soc_component_is_codec(cpu_dai->component))
-			fmt = inv_dai_fmt;
-
-		ret = snd_soc_dai_set_fmt(cpu_dai, fmt);
+		ret = snd_soc_dai_set_fmt(cpu_dai, dai_fmt);
 		if (ret != 0 && ret != -ENOTSUPP)
 			return ret;
 	}
-- 
2.30.2

