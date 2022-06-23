Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076881FA6
	for <linux-sunxi@lists.linux.dev>; Thu, 23 Jun 2022 12:54:24 +0000 (UTC)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25NAKUtJ006859;
	Thu, 23 Jun 2022 07:53:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=BgbBX9Efb8K0LJNikCHrznq2RAOzoLRPZllxMCU4hQg=;
 b=BlSXO39AK6ILlrMGhditR/qvxvAwY1jMLgZ0oQIUcRy2EMQB0Kp7rUM8XGWn88LqGtTa
 PZRH18Key0WntsJs3vZcCHbOvT4x0RcEi1W7OqmcnQTV+y2QZoKJx+PwwuH63H7JyvZd
 0EWp/duQ0UF0mXlLqm24AyhoQnTKEKSNTq+ofEfY+3LDviMhvjeUOciUfR0TX2+DkwVW
 MuBa3NqryCLshfuxNZH7VFlp8g1R9duzcaL6gAii2V3ORRcrxPYfXkUBowqIaXbH8ZIE
 XEyuJmcKAbEajkuvGtsSSirzDPkeNMJfPJ86f+GocycR10QTqaGGUKa2NdKZQ/ccQfPp 9w== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gsc41fa4u-17
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 23 Jun 2022 07:53:15 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 23 Jun
 2022 13:52:59 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Thu, 23 Jun 2022 13:52:59 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 53DC811D1;
	Thu, 23 Jun 2022 12:52:59 +0000 (UTC)
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
Subject: [PATCH v2 96/96] ASoC: soc-component: Remove non_legacy_dai_naming flag
Date: Thu, 23 Jun 2022 13:52:50 +0100
Message-ID: <20220623125250.2355471-97-ckeepax@opensource.cirrus.com>
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
X-Proofpoint-GUID: fUGTb7dJJMOmVmNkY5DMbA2EPSxXxxUM
X-Proofpoint-ORIG-GUID: fUGTb7dJJMOmVmNkY5DMbA2EPSxXxxUM
X-Proofpoint-Spam-Reason: safe

Now all the users are moved over to the new legacy_dai_naming flag,
remove the now unused old flag.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/soc-component.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 96c2f5fffc51e..c26ffb033777a 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -180,7 +180,6 @@ struct snd_soc_component_driver {
 	 */
 	unsigned int endianness:1;
 	unsigned int legacy_dai_naming:1;
-	unsigned int non_legacy_dai_naming:1;
 
 	/* this component uses topology and ignore machine driver FEs */
 	const char *ignore_machine;
-- 
2.30.2

