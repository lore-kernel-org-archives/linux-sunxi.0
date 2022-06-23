Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784331FAB
	for <linux-sunxi@lists.linux.dev>; Thu, 23 Jun 2022 12:54:18 +0000 (UTC)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25N5mxlK032604;
	Thu, 23 Jun 2022 07:53:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=QP+ZBUYAIdt6LRCHim/xoQUoHPNHrMxphXy99QAQmFo=;
 b=qJUErP65voIUtcTO4xtmk3U40tPY6FwTHyGWSpNHToHXGk8rB+2DMdbeYYxTkpiUul54
 d8o1ucKTy5ix9OaOWPrxxQ9Qn4D3/bM1K8SkxiKE9Dk0e42Ltd53E76rlkQS1QDKzDNF
 IA++2cj/7ItyYQmss/PbCTZxLgYNrmOFFK0J68/2xw/BeEVXdN+JdjJYyD3O/vDSlyNa
 uKvp9luiwoXV6iA4mz/Fc6yxHpy0uR9wYnbM286Sek5ZE6ToJLSCJJPK2ecT0Yxj7XML
 +ZzWKFc4tZ6FAkNXvxW5xP0tuFuo6mBEnd/0tY6xJvJV/hqonSeZrKOd68wbUg0eUp5B RQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3gsb4p6wvu-19
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 23 Jun 2022 07:53:12 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 23 Jun
 2022 13:52:58 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Thu, 23 Jun 2022 13:52:58 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id F111B11D1;
	Thu, 23 Jun 2022 12:52:57 +0000 (UTC)
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
Subject: [PATCH v2 81/96] ASoC: Intel: avs: Remove now redundant non_legacy_dai_naming flag
Date: Thu, 23 Jun 2022 13:52:35 +0100
Message-ID: <20220623125250.2355471-82-ckeepax@opensource.cirrus.com>
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
X-Proofpoint-GUID: wP7WrUXuLRCuSLsi-QeDc0DOxbcs5dpd
X-Proofpoint-ORIG-GUID: wP7WrUXuLRCuSLsi-QeDc0DOxbcs5dpd
X-Proofpoint-Spam-Reason: safe

The ASoC core has now been changed to default to the non-legacy DAI
naming, as such drivers using the new scheme no longer need to specify
the non_legacy_dai_naming flag.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/intel/avs/pcm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 668f533578a69..f21b0cdd32063 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -846,7 +846,6 @@ static const struct snd_soc_component_driver avs_component_driver = {
 	.pcm_construct		= avs_component_construct,
 	.module_get_upon_open	= 1, /* increment refcount when a pcm is opened */
 	.topology_name_prefix	= "intel/avs",
-	.non_legacy_dai_naming	= true,
 };
 
 static int avs_soc_component_register(struct device *dev, const char *name,
@@ -1172,7 +1171,6 @@ static const struct snd_soc_component_driver avs_hda_component_driver = {
 	.remove_order		= SND_SOC_COMP_ORDER_EARLY,
 	.module_get_upon_open	= 1,
 	.topology_name_prefix	= "intel/avs",
-	.non_legacy_dai_naming	= true,
 };
 
 int avs_hda_platform_register(struct avs_dev *adev, const char *name)
-- 
2.30.2

