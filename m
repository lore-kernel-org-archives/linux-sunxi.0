Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 694014C65
	for <linux-sunxi@lists.linux.dev>; Tue,  7 Jun 2022 23:43:07 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D5ECF1FB;
	Tue,  7 Jun 2022 16:43:00 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B51F33F66F;
	Tue,  7 Jun 2022 16:42:59 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Tom Rini <trini@konsulko.com>,
	Marek Vasut <marex@denx.de>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH] usb: host: ehci-generic: Make resets and clocks optional
Date: Wed,  8 Jun 2022 00:42:22 +0100
Message-Id: <20220607234222.2252-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.3
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The generic EHCI binding does not *require* resets and clocks
properties, and indeed for instance the Allwinner A20 SoCs does not
need or define any resets in its DT.

Don't easily give up if clk_get_bulk() or reset_get_bulk() return an
error, but check if that is due to the DT simply having no entries for
either of them.

This fixes USB operation on all boards with an Allwinner A10 or A20 SoC,
which were reporting an error after commit ba96176ab70e2999:
=======================
Bus usb@1c14000: ehci_generic usb@1c14000: Failed to get resets (err=-2)
probe failed, error -2
=======================

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/usb/host/ehci-generic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/ehci-generic.c b/drivers/usb/host/ehci-generic.c
index 4734af03962..15267e9a05a 100644
--- a/drivers/usb/host/ehci-generic.c
+++ b/drivers/usb/host/ehci-generic.c
@@ -69,7 +69,7 @@ static int ehci_usb_probe(struct udevice *dev)
 
 	err = 0;
 	ret = clk_get_bulk(dev, &priv->clocks);
-	if (ret) {
+	if (ret && ret != -ENOENT) {
 		dev_err(dev, "Failed to get clocks (ret=%d)\n", ret);
 		return ret;
 	}
@@ -81,7 +81,7 @@ static int ehci_usb_probe(struct udevice *dev)
 	}
 
 	err = reset_get_bulk(dev, &priv->resets);
-	if (err) {
+	if (ret && ret != -ENOENT) {
 		dev_err(dev, "Failed to get resets (err=%d)\n", err);
 		goto clk_err;
 	}
-- 
2.35.3

