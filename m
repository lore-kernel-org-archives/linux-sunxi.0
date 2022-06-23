Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0E01FB3
	for <linux-sunxi@lists.linux.dev>; Thu, 23 Jun 2022 12:54:18 +0000 (UTC)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25NAKUt2006859;
	Thu, 23 Jun 2022 07:53:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=w2elvprt/NPXLmHM0bB06m5qSNTTQZOMLvUvMKNQ3w8=;
 b=VUGCFPp7ufZwssSe0nog3VemZ5RZEV3zlj3d0WzDQgfpZyV5udJlT8haWEWT7+slekz/
 y+oxkRwtiU0g/91EF457/bfpRfq6KnZDD8imLzuF8SjjFbWzcUufx5TW3ObX3xMznVVj
 FFdD9owpJbL+bqSORpnggmhAPh2KUR/hqNNHpig14/w9jFHSAgrsl4dVoRvsMI0jQZNW
 5KzLe8mcneml1u6GPxf85YN1i++148WBqtA9aOGpwHQ9AI8Wu32uoG8D1260oxRtjokr
 YEB3o1MBlqrsHaHTbIqOufIUGnfOEtwAPEpHaYfTqire2wZU3mLfJVSz4SmpnaGWlPLR EQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gsc41fa4u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 23 Jun 2022 07:53:01 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 23 Jun
 2022 13:52:53 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Thu, 23 Jun 2022 13:52:53 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 0A0E011D1;
	Thu, 23 Jun 2022 12:52:53 +0000 (UTC)
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
        <linux-rpi-kernel@lists.infradead.org>, <frattaroli.nicolas@gmail.com>
Subject: [PATCH v2 25/96] ASoC: test-component: Migrate to new style legacy DAI naming flag
Date: Thu, 23 Jun 2022 13:51:39 +0100
Message-ID: <20220623125250.2355471-26-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
References: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 6uBOnnVdRRLfo531GfkxBDbTIoScnY5m
X-Proofpoint-ORIG-GUID: 6uBOnnVdRRLfo531GfkxBDbTIoScnY5m
X-Proofpoint-Spam-Reason: safe

Change the legacy DAI naming flag from opting in to the new scheme
(non_legacy_dai_naming), to opting out of it (legacy_dai_naming).
This driver appears to be on the CPU side of the DAI link and
currently uses the legacy naming, so add the new flag.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/generic/test-component.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/generic/test-component.c b/sound/soc/generic/test-component.c
index d28712fabe3f6..e2a009bc69af2 100644
--- a/sound/soc/generic/test-component.c
+++ b/sound/soc/generic/test-component.c
@@ -564,6 +564,7 @@ static int test_driver_probe(struct platform_device *pdev)
 		cdriv->pcm_construct		= test_component_pcm_construct;
 		cdriv->pointer			= test_component_pointer;
 		cdriv->trigger			= test_component_trigger;
+		cdriv->legacy_dai_naming	= 1;
 	} else {
 		cdriv->name			= "test_codec";
 		cdriv->idle_bias_on		= 1;
-- 
2.30.2

