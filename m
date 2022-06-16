Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B35915A4
	for <linux-sunxi@lists.linux.dev>; Thu, 16 Jun 2022 14:35:08 +0000 (UTC)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25G8o9fa009500;
	Thu, 16 Jun 2022 09:34:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=8tSPP1RTMjwN9/fm7e1xi82dPxSMcLxVZ0qD6znQAiU=;
 b=ZREMjiilmbtSjP/ytOkfU2OKJK1sPvkC04jU3ES7c+EfQ/NwXAF0KsyGIFEGCmMKygsR
 wg5tr9z13rk7/AU6Pl4hFBKpFEtTRP5JmEEafrlGaHnThnr5+i/f09XlbmjdAx71cWYB
 HiSuWncG1jrFgnAGx3vm8//RqPdrZZQvXEdy/Wcn7PAugtDhBHdRdMB7XtZSFpncs+QB
 UxuT9+Mjykli+8MoqKH4nWLOMieobVtkpGDVxM4TnbzK8dTE9figMB6/cgt0bpMp9Yh3
 mANlsu1SzrHhXFeyAMrfqoUdh9teIwsB0DxpwBV5EjIWEcEnLO4Oy8ODiZ35Qs5fVW0T rw== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3gmqfq5w3u-8
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 16 Jun 2022 09:34:52 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 16 Jun
 2022 15:34:36 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Thu, 16 Jun 2022 15:34:36 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id C298B11DA;
	Thu, 16 Jun 2022 14:34:36 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <kuninori.morimoto.gx@renesas.com>,
        <mripard@kernel.org>, <airlied@linux.ie>, <daniel@ffwll.ch>,
        <vkoul@kernel.org>, <nicolas.ferre@microchip.com>, <nsaenz@kernel.org>,
        <shawnguo@kernel.org>, <linux-imx@nxp.com>,
        <cezary.rojewski@intel.com>, <pierre-louis.bossart@linux.intel.com>,
        <linux-mips@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
        <daniel@zonque.org>, <srinivas.kandagatla@linaro.org>,
        <linux-rockchip@lists.infradead.org>, <krzk@kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-sunxi@lists.linux.dev>, <linux-tegra@vger.kernel.org>,
        <linux-omap@vger.kernel.org>, <linux-xtensa@linux-xtensa.org>,
        <peter.ujfalusi@gmail.com>, <jarkko.nikula@bitmer.com>,
        <heiko@sntech.de>, <jbrunet@baylibre.com>, <kernel@pengutronix.de>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <dri-devel@lists.freedesktop.org>,
        <linux-rpi-kernel@lists.infradead.org>
Subject: [PATCH 85/96] ASoC: lochnagar: Remove now redundant non_legacy_dai_naming flag
Date: Thu, 16 Jun 2022 15:34:18 +0100
Message-ID: <20220616143429.1324494-86-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
References: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: CQhjCtEelBg-Ip53g70SpnvrDeSHBSET
X-Proofpoint-GUID: CQhjCtEelBg-Ip53g70SpnvrDeSHBSET
X-Proofpoint-Spam-Reason: safe

The ASoC core has now been changed to default to the non-legacy DAI
naming, as such drivers using the new scheme no longer need to specify
the non_legacy_dai_naming flag.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/lochnagar-sc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/lochnagar-sc.c b/sound/soc/codecs/lochnagar-sc.c
index 54a8ba7ed3c20..13fbd8830b09f 100644
--- a/sound/soc/codecs/lochnagar-sc.c
+++ b/sound/soc/codecs/lochnagar-sc.c
@@ -217,7 +217,6 @@ static const struct snd_soc_component_driver lochnagar_sc_driver = {
 	.dapm_routes = lochnagar_sc_routes,
 	.num_dapm_routes = ARRAY_SIZE(lochnagar_sc_routes),
 
-	.non_legacy_dai_naming = 1,
 	.endianness = 1,
 };
 
-- 
2.30.2

