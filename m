Received: from smtpbg604.qq.com (smtpbg604.qq.com [59.36.128.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF2C29D6
	for <linux-sunxi@lists.linux.dev>; Thu, 22 Jul 2021 06:33:05 +0000 (UTC)
X-QQ-mid: bizesmtp46t1626935429tosji8g5
Received: from localhost.localdomain (unknown [14.154.30.9])
	by esmtp6.qq.com (ESMTP) with 
	id ; Thu, 22 Jul 2021 14:30:28 +0800 (CST)
X-QQ-SSF: 01100000002000104000B00A0000000
X-QQ-FEAT: L8+aRVORnLnrFLAFA+1B87dzVHR2K7OmxXiuYRYzcmEY4sOrOFYobQUKAx/Yg
	8BFaW+i2/gkLxkS2557KZGRwzGM/EEyQzn5alZANkFdsiNNQMhJsd+ULYjGhUnpgTKmY57S
	JXLg7Cm3TYPHc6q8hg29Ty9D4YOMr2gyV/UqEW09q1sYIxcxJHFfeWh16QfXXAtnqH6ljfo
	hXtLeC1FGK+nAOT2tnV8REzAlfg6oPRSuAR1gPlXhuCPb1QZrBGvwOBCnK+F5QEzUdyexwE
	wXfkWfRreijLphJJ+RjFFEUdfs8GuNj+Kk7FVLXYhnHLA1m3h+Rr5TJOrhJyJxI+knpyDW5
	NQoxBEhnlYck6bFpng=
X-QQ-GoodBg: 0
From: Icenowy Zheng <icenowy@sipeed.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Jernej Skrabec <jernej.skrabec@siol.net>,
	Samuel Holland <samuel@sholland.org>
Cc: u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Icenowy Zheng <icenowy@sipeed.com>
Subject: [RFC PATCH 03/13] mmc: sunxi: conditionally include MMC2 initialization code
Date: Thu, 22 Jul 2021 14:30:05 +0800
Message-Id: <20210722063015.421923-4-icenowy@sipeed.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210722063015.421923-1-icenowy@sipeed.com>
References: <20210722063015.421923-1-icenowy@sipeed.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:sipeed.com:qybgspam:qybgspam4

Allwinner R329 has no MMC2.

Only include the code of MMC2 if the base address of it is defined.

Signed-off-by: Icenowy Zheng <icenowy@sipeed.com>
---
 drivers/mmc/sunxi_mmc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mmc/sunxi_mmc.c b/drivers/mmc/sunxi_mmc.c
index 178b8cf106..6b809c001f 100644
--- a/drivers/mmc/sunxi_mmc.c
+++ b/drivers/mmc/sunxi_mmc.c
@@ -73,10 +73,12 @@ static int mmc_resource_init(int sdc_no)
 		priv->reg = (struct sunxi_mmc *)SUNXI_MMC1_BASE;
 		priv->mclkreg = &ccm->sd1_clk_cfg;
 		break;
+#ifdef SUNXI_MMC2_BASE
 	case 2:
 		priv->reg = (struct sunxi_mmc *)SUNXI_MMC2_BASE;
 		priv->mclkreg = &ccm->sd2_clk_cfg;
 		break;
+#endif
 #ifdef SUNXI_MMC3_BASE
 	case 3:
 		priv->reg = (struct sunxi_mmc *)SUNXI_MMC3_BASE;
-- 
2.30.2

