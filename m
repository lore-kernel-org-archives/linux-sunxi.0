Received: from m12-12.163.com (m12-12.163.com [220.181.12.12])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23528177
	for <linux-sunxi@lists.linux.dev>; Thu,  1 Jul 2021 02:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=hbrzA4//vaT6dZt0dD
	Gxz+KUPoa7VTMDtHjkCieaV0s=; b=Yap3mjmtX3zr/UL+mmqgUHvMzQ8piylnE5
	j2q1Er1k5PsW6cYceRq1xigBFNv1SZkU6LScdb9L/UpiCBZgMOQ3gUGoCxPWYXvT
	I6yZlZnF3SK5V6QOvJUMaYUYG3YFFVQu0c2koFCj5rBgrHRTf4t4P6s9k7zG3Do0
	HYuM5DmQU=
Received: from localhost.localdomain (unknown [218.201.129.20])
	by smtp8 (Coremail) with SMTP id DMCowABXPVpUH91g0KifMg--.33338S4;
	Thu, 01 Jul 2021 09:50:14 +0800 (CST)
From: qianfanguijin@163.com
To: linux-sunxi@lists.linux.dev
Cc: mripard@kernel.org,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	qianfan Zhao <qianfanguijin@163.com>
Subject: [PATCH 1/3] phy-sun4i-usb: Fix sun8i_r40_cfg
Date: Thu,  1 Jul 2021 09:50:07 +0800
Message-Id: <20210701015009.13985-1-qianfanguijin@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:DMCowABXPVpUH91g0KifMg--.33338S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xr43Jw1fZF17Wr1rtF4kXrb_yoW3twc_uF
	W8Xrs7XFZ8ur98JF12qr45Z3y09a18XF1kWw48tFy5A3W2qa1S93WjqrsrurW5GrWYkas8
	Ja45ZF15C3929jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbYsj7UUUUU==
X-Originating-IP: [218.201.129.20]
X-CM-SenderInfo: htld0w5dqj3xxmlqqiywtou0bp/xtbBzhbC7VQHNEvYkwAAsQ
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

From: qianfan Zhao <qianfanguijin@163.com>

the r40 has the same configurations with a33, disable enable_pmu_unk1 and
phy0_dual_route feature.

Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
---
 drivers/phy/allwinner/phy-sun4i-usb.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
index 788dd5cdbb7d..8c4136e72947 100644
--- a/drivers/phy/allwinner/phy-sun4i-usb.c
+++ b/drivers/phy/allwinner/phy-sun4i-usb.c
@@ -935,8 +935,6 @@ static const struct sun4i_usb_phy_cfg sun8i_r40_cfg = {
 	.disc_thresh = 3,
 	.phyctl_offset = REG_PHYCTL_A33,
 	.dedicated_clocks = true,
-	.enable_pmu_unk1 = true,
-	.phy0_dual_route = true,
 };
 
 static const struct sun4i_usb_phy_cfg sun8i_v3s_cfg = {
-- 
2.17.1


