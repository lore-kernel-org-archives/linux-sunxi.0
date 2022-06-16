Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B632F4D
	for <linux-sunxi@lists.linux.dev>; Thu, 16 Jun 2022 14:35:07 +0000 (UTC)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25G4igBZ030693;
	Thu, 16 Jun 2022 09:34:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=2rO2csJgitEQs3OC7sxGlM+d50Sg1X6iLqCuhVLcybA=;
 b=CoEtyYAmL9GtOap1UiaIKtynAGoc94M2RhtZduMVLXZU+HQwlVVQCmnh+oqcDMKOo19J
 JVLbmX8r55SFYSTzF+ja0ar94jIas8GZfaUyOTSY1kONezkwYWxu+FxJtOwwIhPPxWDZ
 kWNcovn+Jb3lUDT8wF1HHes5/L6IdUWCM9CNQ/8yVb8mOYLoSNC21qDzVhWyloxIQDFQ
 2L2BWKDl8vlgnsRVtKnIAvyWkA/YwiqkdR5w/PmNQh77LxvKHqjXqPvB/YEctccjTxOd
 e8n9pgmcdwY1WPwzAmIIGU73sFBCkRGKa2v01IVJXVl3t3DPXeA7GLYjRx72Ae46NnGC 6A== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gmrf35vuw-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 16 Jun 2022 09:34:39 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 16 Jun
 2022 15:34:32 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Thu, 16 Jun 2022 15:34:32 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 1A74711D4;
	Thu, 16 Jun 2022 14:34:32 +0000 (UTC)
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
Subject: [PATCH 27/96] ASoC: au1x: Migrate to new style legacy DAI naming flag
Date: Thu, 16 Jun 2022 15:33:20 +0100
Message-ID: <20220616143429.1324494-28-ckeepax@opensource.cirrus.com>
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
X-Proofpoint-GUID: cu72FF8zL6hScIpqECZnPeTc5fEXSo1R
X-Proofpoint-ORIG-GUID: cu72FF8zL6hScIpqECZnPeTc5fEXSo1R
X-Proofpoint-Spam-Reason: safe

Change the legacy DAI naming flag from opting in to the new scheme
(non_legacy_dai_naming), to opting out of it (legacy_dai_naming).
These drivers appear to be on the CPU side of the DAI link and
currently uses the legacy naming, so add the new flag.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/au1x/ac97c.c    | 3 ++-
 sound/soc/au1x/i2sc.c     | 3 ++-
 sound/soc/au1x/psc-ac97.c | 3 ++-
 sound/soc/au1x/psc-i2s.c  | 3 ++-
 4 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/sound/soc/au1x/ac97c.c b/sound/soc/au1x/ac97c.c
index 3b1700e665f52..0320513942774 100644
--- a/sound/soc/au1x/ac97c.c
+++ b/sound/soc/au1x/ac97c.c
@@ -223,7 +223,8 @@ static struct snd_soc_dai_driver au1xac97c_dai_driver = {
 };
 
 static const struct snd_soc_component_driver au1xac97c_component = {
-	.name		= "au1xac97c",
+	.name			= "au1xac97c",
+	.legacy_dai_name	= 1,
 };
 
 static int au1xac97c_drvprobe(struct platform_device *pdev)
diff --git a/sound/soc/au1x/i2sc.c b/sound/soc/au1x/i2sc.c
index 45bb7851e75d7..b15c8baa9ee45 100644
--- a/sound/soc/au1x/i2sc.c
+++ b/sound/soc/au1x/i2sc.c
@@ -227,7 +227,8 @@ static struct snd_soc_dai_driver au1xi2s_dai_driver = {
 };
 
 static const struct snd_soc_component_driver au1xi2s_component = {
-	.name		= "au1xi2s",
+	.name			= "au1xi2s",
+	.legacy_dai_naming	= 1,
 };
 
 static int au1xi2s_drvprobe(struct platform_device *pdev)
diff --git a/sound/soc/au1x/psc-ac97.c b/sound/soc/au1x/psc-ac97.c
index 05eb36991f147..b536394b9ca08 100644
--- a/sound/soc/au1x/psc-ac97.c
+++ b/sound/soc/au1x/psc-ac97.c
@@ -356,7 +356,8 @@ static const struct snd_soc_dai_driver au1xpsc_ac97_dai_template = {
 };
 
 static const struct snd_soc_component_driver au1xpsc_ac97_component = {
-	.name		= "au1xpsc-ac97",
+	.name			= "au1xpsc-ac97",
+	.legacy_dai_naming	= 1,
 };
 
 static int au1xpsc_ac97_drvprobe(struct platform_device *pdev)
diff --git a/sound/soc/au1x/psc-i2s.c b/sound/soc/au1x/psc-i2s.c
index 530a072d74274..79b5ae4e494cb 100644
--- a/sound/soc/au1x/psc-i2s.c
+++ b/sound/soc/au1x/psc-i2s.c
@@ -286,7 +286,8 @@ static const struct snd_soc_dai_driver au1xpsc_i2s_dai_template = {
 };
 
 static const struct snd_soc_component_driver au1xpsc_i2s_component = {
-	.name		= "au1xpsc-i2s",
+	.name			= "au1xpsc-i2s",
+	.legacy_dai_naming	= 1,
 };
 
 static int au1xpsc_i2s_drvprobe(struct platform_device *pdev)
-- 
2.30.2

