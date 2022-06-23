Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06691FB2
	for <linux-sunxi@lists.linux.dev>; Thu, 23 Jun 2022 12:54:17 +0000 (UTC)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25NBNlqj015665;
	Thu, 23 Jun 2022 07:53:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=4uqNUGf6HvGyrALyQ2b9y5JkJHvBo6YEo+XEvqJ14h8=;
 b=R5jQOHlorNP67NtCxlObpr0ktD1FJahoVHaLoiK8S1ro6pKxbw+Msp/fKGgI59ipXUrX
 4TMB+2KSSOfOnUoSVYTN1AW/2EuPwMQRsiaxEqZFdXcV+BohIz1k2elmVt7aB+meMUlU
 p6WmOi6wOSjUMn9lcMtR8/3zD06XuNfpFRV94IWsqNUR6xqlqWP+2Nv4Q44A9Q7p6JWG
 ET8g8p9xanvqR/0IS63j1XtTgifjlzREj3Xgs6MG3E7zTmLUlCAzc7Y/5pWNzqvdr/ga
 ja0t2V0yyug3UaSceXMz6M02zB0YM1oogKPE3a0pzF8QwKWRZHoulf66giU2BDC1TeW5 3A== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gsc41fa4j-16
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 23 Jun 2022 07:53:05 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 23 Jun
 2022 13:52:55 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Thu, 23 Jun 2022 13:52:55 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 52DDD11D1;
	Thu, 23 Jun 2022 12:52:55 +0000 (UTC)
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
Subject: [PATCH v2 51/96] ASoC: es*: Remove now redundant non_legacy_dai_naming flag
Date: Thu, 23 Jun 2022 13:52:05 +0100
Message-ID: <20220623125250.2355471-52-ckeepax@opensource.cirrus.com>
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
X-Proofpoint-GUID: JWMBwq82031UkQgIfWERpxYmtHShjrcR
X-Proofpoint-ORIG-GUID: JWMBwq82031UkQgIfWERpxYmtHShjrcR
X-Proofpoint-Spam-Reason: safe

The ASoC core has now been changed to default to the non-legacy DAI
naming, as such drivers using the new scheme no longer need to specify
the non_legacy_dai_naming flag.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/es7134.c | 1 -
 sound/soc/codecs/es7241.c | 1 -
 sound/soc/codecs/es8316.c | 1 -
 sound/soc/codecs/es8328.c | 1 -
 4 files changed, 4 deletions(-)

diff --git a/sound/soc/codecs/es7134.c b/sound/soc/codecs/es7134.c
index f443351677dfe..f5150d2f95da6 100644
--- a/sound/soc/codecs/es7134.c
+++ b/sound/soc/codecs/es7134.c
@@ -213,7 +213,6 @@ static const struct snd_soc_component_driver es7134_component_driver = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static struct snd_soc_dai_driver es7154_dai = {
diff --git a/sound/soc/codecs/es7241.c b/sound/soc/codecs/es7241.c
index 0baa86241cf93..339553cfbb48e 100644
--- a/sound/soc/codecs/es7241.c
+++ b/sound/soc/codecs/es7241.c
@@ -232,7 +232,6 @@ static const struct snd_soc_component_driver es7241_component_driver = {
 	.num_dapm_routes	= ARRAY_SIZE(es7241_dapm_routes),
 	.idle_bias_on		= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static void es7241_parse_fmt(struct device *dev, struct es7241_data *priv)
diff --git a/sound/soc/codecs/es8316.c b/sound/soc/codecs/es8316.c
index 4407166bb3388..eb15be9095e77 100644
--- a/sound/soc/codecs/es8316.c
+++ b/sound/soc/codecs/es8316.c
@@ -769,7 +769,6 @@ static const struct snd_soc_component_driver soc_component_dev_es8316 = {
 	.num_dapm_routes	= ARRAY_SIZE(es8316_dapm_routes),
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_range es8316_volatile_ranges[] = {
diff --git a/sound/soc/codecs/es8328.c b/sound/soc/codecs/es8328.c
index dd53dfd87b04e..160adc706cc69 100644
--- a/sound/soc/codecs/es8328.c
+++ b/sound/soc/codecs/es8328.c
@@ -844,7 +844,6 @@ static const struct snd_soc_component_driver es8328_component_driver = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 int es8328_probe(struct device *dev, struct regmap *regmap)
-- 
2.30.2

