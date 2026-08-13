Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521244746D5
	for <linux-sunxi@lists.linux.dev>; Thu, 13 Aug 2026 13:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786626439; cv=none; b=Z98a4xTyIfk5igEvQUiFHEuxQnGrOWh0AWQ+YFTYs4kdYDzkwUovdCsm7a0bPCTgkFiS+DfR2bjDIGsbZeUwMERu1s1PDWvf25Ry6aW4vsaijvEpP/A4mlA+DIRv0zFPuTdtRMLW8S0pJGLcr8ucWWI9pUys6KndFW4cBs/FaGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786626439; c=relaxed/simple;
	bh=iKlsdRlRYxYc1v0CKgJEbY5DgTP+wXoI6/8725kvTKc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=svviFlxHUwQuWY/I4jX+26kmEvs+hZFSEJWNIOSNqCyME34p0pX5y/WX1hD/SUXZpfzEj7ZNbf9HZTc6u8rOV8bQlP2NtN17QSjk4z38yV8YXQH1DRdSgE7pWk89P+fsMyy1+1CUxYSQ1ziXmhpwsjbx3ZVcDx1QTHRnBKq4boM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=Icyn6c8y; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="Icyn6c8y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1786626376;
	bh=nJ3DjTBgFoGEsLV5b+erjzQOcSw5I5/IyYlcPZdcDEs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Icyn6c8yhdHQAlx4W0szQLanIZtkiDmin71gdpSPyrvseqstoBx/3lutSSjhE90S8
	 GZbfZ2S1RauSutzc7fuyy5YGfq5Aj2ebY5wBgKQKKdyHSc//gthF2A4QW62oNaZoYe
	 VkdeR+IUVzzcuvVy3vbpHo70JmH2RByS/iRVgOVg=
X-QQ-mid: esmtpgz12t1786626355t9ca26cba
X-QQ-Originating-IP: dHhI7VBaezRAp4X4gI1x1FX2IMsrpI09Qjr/PigbalE=
Received: from PEN202512010004 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 13 Aug 2026 21:05:53 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 588101152483150386
EX-QQ-RecipientCnt: 12
From: raoxu <raoxu@uniontech.com>
To: vkoul@kernel.org
Cc: wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	neil.armstrong@linaro.org,
	andre.przywara@arm.com,
	marco.crivellari@suse.com,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	raoxu@uniontech.com
Subject: [PATCH v2] phy: allwinner: sun4i-usb: disable the PHY2 PMU clock after SIDDQ setup
Date: Thu, 13 Aug 2026 21:05:42 +0800
Message-ID: <CE85F490F5646A2C+20260813130542.2425068-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MvyKdZyVtFx3ogxxWRGDkb3wjkVowJkMY7zgE3kzwgOz3wTrVGElr46w
	3Stlq7ADwX6crnNIfcueySAkOPttnBR3+N0tWSpJ+Hf8bILjwodltDfDMAys3dpWJ5A2Sr/
	kzkC6/fws1aw9SZgCdts4gEKQNjSQ/VxciLKeYWzg+FkQbef38BKrY/8HtMgagSH+DyDaUC
	A3Az1uhdWcVii3UHm8GHeDCcFLwNUyz/B4aQkA78dbQl4j/8x49oy4H08kvKj6Nd7xIS8tS
	qhHF9mujbFd8JKTe1XDICdF27ULL1pE/p1xIgDtH5qoNkzHU2V2TES9Z6dV9f+skkLfuN9x
	E/c5PvOI3Y8rByc1gcS6U98anIjR8ToinuSCtecagKaM3CR7ra+CAR7ALMctB57Qe08oKB1
	Cj6uh7xNk+RUl9cxw9xqwEp1Oq6nB7864/6o/fZ5g7Etfj68ZmNLjSM+LtaegcmJ/V2a+Wh
	Aos1SVlPZ3t3JubC8C5c06YAN59cXkmyfRM6ZajPi94c5xnqkVx5N0XWN9TGZ99AMvaD7be
	B0IBl4Wnev9FLc6rWF9IvEVYq+jIslNiR1WENa0ClGt1/hHImu/ZCv706b5Iko4znp6AMdK
	rJagUlF24IeEriPsfY+Nm9MmFjax2O3oWZiRCOCK/sQsrMJpdI9phgMbTEPY9xnv1fItS06
	69hyGvKKHqeK9RIspeXqEOTiWQs2UDZjlqmme1KWokWX2TZhgKeGcYhryy78+Q5k5PfTYDg
	GzIZ7J9SU0/vNnZxzD6W625AV0NmYmsKlWBoGnTv/sPZk0No5biElFnueUOT4UCnuF26Weu
	8ZB8oXUqEOkdQZU6hy6ZwAjgrDR/uccHiJSjrbYbpHuotLsCbhiFDlUJ+eFBLi8UfkZnL+g
	2zL+8mTfbRoNvcc2PTbYQXLNIVEuj8Go9gAVuhA5amJLYWNLnJhLQDurUBtG2vuBa0m7AA6
	F+jBCXCms9N2koilwDDuDkL4a3rHLRUXNQg2Qjw2y3EKz5PizeTUUzS/4FnOygjZalRCwll
	ErQo+qK/vGO565+9eNg1UZ3aWlVkQL9HVdGs50bMUHehIe1YdTDrq0TmOjySWE9Hdu8xA4z
	w==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

From: Xu Rao <raoxu@uniontech.com>

sun4i_usb_phy_init() temporarily enables PHY2's clk2 when a SoC needs
PHY2 SIDDQ setup while initializing another PHY. However, after updating
PHY2's PMU register it disables the clk2 pointer from the PHY currently
being initialized instead.

Only PHY2 on H616 has a clk2 clock. No other PHY on H616 has a clk2
clock, so phy->clk2 is NULL in this path and disabling it is a no-op.
This is why disabling the wrong clock did not cause an additional
functional failure.

The temporary phy2->clk2 enable therefore remains unmatched, leaking a
clock enable reference each time this path is executed.

Disable the same PHY2 clk2 that was enabled for the auxiliary PMU access.

Fixes: b45c6d80325b ("phy: sun4i-usb: Introduce port2 SIDDQ quirk")
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Xu Rao <raoxu@uniontech.com>
---
Changes in v2:
- Explain why disabling phy->clk2 did not cause additional harm: no
  other PHY on H616 has clk2, so phy->clk2 is NULL and the operation is
  a no-op.
- Clarify that the concrete issue is the unmatched PHY2 clk2 enable.
- Add the Fixes tag and Andre's Reviewed-by.

 drivers/phy/allwinner/phy-sun4i-usb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
index e2fbf8ccf99e..839856c09e30 100644
--- a/drivers/phy/allwinner/phy-sun4i-usb.c
+++ b/drivers/phy/allwinner/phy-sun4i-usb.c
@@ -318,7 +318,7 @@ static int sun4i_usb_phy_init(struct phy *_phy)
 			writel(val, phy2->pmu + REG_HCI_PHY_CTL);
 		}

-		clk_disable_unprepare(phy->clk2);
+		clk_disable_unprepare(phy2->clk2);
 	}

 	if (phy->pmu && data->cfg->hci_phy_ctl_clear) {
--
2.50.1
