Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268A91FA6
	for <linux-sunxi@lists.linux.dev>; Thu, 23 Jun 2022 12:53:23 +0000 (UTC)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25N5mxl6032604;
	Thu, 23 Jun 2022 07:53:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=JmkHTSCH/Vzo0UL/hxDhsbzieslKfnK4gSF844vPDiQ=;
 b=AK5ZvusCpI4cZuRLaaIcdLA0KXmNoT3kbBThcEHrVAkOEBpQN6SobFBxNxDiJ1KjGjGW
 mZBD97EiBqH2Xo9esoEQWb7JlCdQDNmj7v8pYSVksg1CvV/OEWj8G04bDxY7Fx0av/EZ
 0L3RvTCFAwWo2xEy/W/HArdveWwc14xZlXiWwbGEGt9L5stKPlq7lx2jXVLjdB+x2QXy
 DIECCOGHNFhUg8MSqhrWhRIfUKz2L95cHlQbWTLQXLeF2Vf3mRmHt0EIXafSjq+4Ntbw
 jlBtyUYZP/D/k9TFeGXUOzST3+QerRa6eG3c5/0cYNyIUPg6ioPOfgE4ECednfLWza+W Tw== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3gsb4p6wvu-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 23 Jun 2022 07:53:01 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 23 Jun
 2022 13:52:52 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Thu, 23 Jun 2022 13:52:52 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B65B611D1;
	Thu, 23 Jun 2022 12:52:52 +0000 (UTC)
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
Subject: [PATCH v2 22/96] ASoC: adi: Migrate to new style legacy DAI naming flag
Date: Thu, 23 Jun 2022 13:51:36 +0100
Message-ID: <20220623125250.2355471-23-ckeepax@opensource.cirrus.com>
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
X-Proofpoint-GUID: scsfREw1y04SpNc1YjmV2z0HuOIAoK_0
X-Proofpoint-ORIG-GUID: scsfREw1y04SpNc1YjmV2z0HuOIAoK_0
X-Proofpoint-Spam-Reason: safe

Change the legacy DAI naming flag from opting in to the new scheme
(non_legacy_dai_naming), to opting out of it (legacy_dai_naming).
These drivers appear to be on the CPU side of the DAI link and
currently uses the legacy naming, so add the new flag.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/adi/axi-i2s.c   | 1 +
 sound/soc/adi/axi-spdif.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/sound/soc/adi/axi-i2s.c b/sound/soc/adi/axi-i2s.c
index 1289cb4e2988c..b1342351bff43 100644
--- a/sound/soc/adi/axi-i2s.c
+++ b/sound/soc/adi/axi-i2s.c
@@ -161,6 +161,7 @@ static struct snd_soc_dai_driver axi_i2s_dai = {
 
 static const struct snd_soc_component_driver axi_i2s_component = {
 	.name = "axi-i2s",
+	.legacy_dai_naming = 1,
 };
 
 static const struct regmap_config axi_i2s_regmap_config = {
diff --git a/sound/soc/adi/axi-spdif.c b/sound/soc/adi/axi-spdif.c
index 8d4a6cb4e5c55..51b968ea21daa 100644
--- a/sound/soc/adi/axi-spdif.c
+++ b/sound/soc/adi/axi-spdif.c
@@ -167,6 +167,7 @@ static struct snd_soc_dai_driver axi_spdif_dai = {
 
 static const struct snd_soc_component_driver axi_spdif_component = {
 	.name = "axi-spdif",
+	.legacy_dai_naming = 1,
 };
 
 static const struct regmap_config axi_spdif_regmap_config = {
-- 
2.30.2

