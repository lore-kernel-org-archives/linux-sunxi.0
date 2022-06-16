Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC97C4C77
	for <linux-sunxi@lists.linux.dev>; Thu, 16 Jun 2022 14:35:10 +0000 (UTC)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25GC0DJT015765;
	Thu, 16 Jun 2022 09:34:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=uY14+QEFQEizEt6ccSxDQhzZtgLZGOD04zjlJ9Wfhgk=;
 b=elX3wuUszBskP0ctiHnMDU/KWGK9xT1VvDe6RRqTqLh6Ubvq01lsOZzRMpN8/om1c0gx
 PrQOgp5EHOi5KItBEMTdoj/92dFA/kK4N7Vkf6MT2jhV427oON/0XZf7lG5FZG6BNI/M
 BD8xV4K8S8DK5Uqdl1WMXKa9yi8hLxU5i1Z6DPFz8zW1aBiX211iwModDObaZRlwL9gz
 JnCn+6O0VtxEV8DRwC46zwjITpYjM+U5UnEHmm2UPJHBTL7DCrjninYjGWxl6IFAche1
 m9eyHv/680YzaVgLW85ZsAPXJPgEMqzsz4mSXJJd6I0XEpskuuzg2Y2IQQ4XiUzAocSV 7A== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3gmqfq5w3h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 16 Jun 2022 09:34:31 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 16 Jun
 2022 15:34:30 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Thu, 16 Jun 2022 15:34:30 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id F354811D1;
	Thu, 16 Jun 2022 14:34:29 +0000 (UTC)
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
Subject: [PATCH 01/96] ASoC: soc-component: Add legacy_dai_naming flag
Date: Thu, 16 Jun 2022 15:32:54 +0100
Message-ID: <20220616143429.1324494-2-ckeepax@opensource.cirrus.com>
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
X-Proofpoint-ORIG-GUID: -Mw-yks2UadTKCOkHQiTbAmfsz0KRh4K
X-Proofpoint-GUID: -Mw-yks2UadTKCOkHQiTbAmfsz0KRh4K
X-Proofpoint-Spam-Reason: safe

Historically, the legacy DAI naming scheme was applied to platform
drivers and the newer scheme to CODEC drivers. During componentisation
the core lost the knowledge of if a driver was a CODEC or platform, they
were all now components. To continue to support the legacy naming on
older platform drivers a flag was added to the snd_soc_component_driver
structure, non_legacy_dai_naming, to indicate to use the new scheme and
this was applied to all CODECs as part of the migration.

However, a slight issue appears to be developing with respect to this
flag being opt in for the non-legacy scheme, which presumably we want to
be the primary scheme used. Many codec drivers appear to forget to
include this flag:

  grep -l -r "snd_soc_component_driver" sound/soc/codecs/*.c |
  xargs grep -L "non_legacy_dai_naming" | wc
     48      48    556

It would seem more sensible to change the flag to legacy_dai_naming
making the new scheme opt out. As a first step this patch adds a new
flag for this so that the users can be updated.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/soc-component.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 5c4cfa70b018c..96c2f5fffc51e 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -179,6 +179,7 @@ struct snd_soc_component_driver {
 	 * analogue).
 	 */
 	unsigned int endianness:1;
+	unsigned int legacy_dai_naming:1;
 	unsigned int non_legacy_dai_naming:1;
 
 	/* this component uses topology and ignore machine driver FEs */
-- 
2.30.2

