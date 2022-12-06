Received: from sender4-op-o16.zoho.com (sender4-op-o16.zoho.com [136.143.188.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07E420EC
	for <linux-sunxi@lists.linux.dev>; Tue,  6 Dec 2022 05:53:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1670306004; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bOJVzM1mCf/q6YgpYL0S9bwVSnEDutixt55QYLDc6L9NJEOrs3ZdP9wCKQuVoqOiAMmcvnzrGsJk/eBRafvTG4F4KaOkeZ57hPuIepErLMOVE/qtyg0XKQutnsl7bJ7aQjjiC664H11T31SdcEE1N2gZd61NTTcy5Wo4lUMJIV4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1670306004; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=sHOF3TnzHZw0V45RTpvLywHN3uvsUJ95l1ZKet1nhw8=; 
	b=bNlzX62+GtE6mglu/Lmzh16ZTker1h/w5KZ6rDh7OiVvqQHSXxAIXE0K5WfldqXb/5xj483woHL6gXwlUYXxEFEPXZrnJDUHmhrkG+YIcIrTxysUJ6vSFFDJcR6+joF9zoZFgTbZE5JeyTmqg9hsIXFvszjzpcRisIeUqI3DQ8A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1670306004;
	s=zmail; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=sHOF3TnzHZw0V45RTpvLywHN3uvsUJ95l1ZKet1nhw8=;
	b=fQqAhkGDjoV36ub2QrIa5MucBnNXYh2NrHnJaNGhf1zw/w34Ok5IyJsdo+jbTPvm
	ruaGI/2teRuhix3vpc16qsfivBuYrTuwfjojRyJBr5Xac2OuClpMONmv8Pv7pTqUWHL
	P0KLIi4tAlFa0dvxdA1HRmc/yz/Db8AlEDwiiGyY=
Received: from edelgard.fodlan.icenowy.me (120.85.99.143 [120.85.99.143]) by mx.zohomail.com
	with SMTPS id 1670306003064295.21778497328853; Mon, 5 Dec 2022 21:53:23 -0800 (PST)
From: Icenowy Zheng <uwu@icenowy.me>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthias Kaehlcke <mka@chromium.org>,
	Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH v3 3/6] usb: misc: onboard_usb_hub: add Genesys Logic GL850G hub support
Date: Tue,  6 Dec 2022 13:52:25 +0800
Message-Id: <20221206055228.306074-4-uwu@icenowy.me>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221206055228.306074-1-uwu@icenowy.me>
References: <20221206055228.306074-1-uwu@icenowy.me>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Genesys Logic GL850G is a 4-port USB 2.0 STT hub that has a reset pin to
toggle and a 3.3V core supply exported (although an integrated LDO is
available for powering it with 5V).

Add the support for this hub, for controlling the reset pin and the core
power supply.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
Acked-by: Matthias Kaehlcke <mka@chromium.org>
---
Changes in v3:
- Add Matthias's ACK.
Changes in v2:
- Sort things, by names or vendor IDs.

 drivers/usb/misc/onboard_usb_hub.c | 2 ++
 drivers/usb/misc/onboard_usb_hub.h | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/usb/misc/onboard_usb_hub.c b/drivers/usb/misc/onboard_usb_hub.c
index d63c63942af1..94e7966e199d 100644
--- a/drivers/usb/misc/onboard_usb_hub.c
+++ b/drivers/usb/misc/onboard_usb_hub.c
@@ -331,6 +331,7 @@ static struct platform_driver onboard_hub_driver = {
 
 /************************** USB driver **************************/
 
+#define VENDOR_ID_GENESYS	0x05e3
 #define VENDOR_ID_MICROCHIP	0x0424
 #define VENDOR_ID_REALTEK	0x0bda
 #define VENDOR_ID_TI		0x0451
@@ -407,6 +408,7 @@ static void onboard_hub_usbdev_disconnect(struct usb_device *udev)
 }
 
 static const struct usb_device_id onboard_hub_id_table[] = {
+	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0608) }, /* Genesys Logic GL850G USB 2.0 */
 	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x2514) }, /* USB2514B USB 2.0 */
 	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x0411) }, /* RTS5411 USB 3.1 */
 	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x5411) }, /* RTS5411 USB 2.1 */
diff --git a/drivers/usb/misc/onboard_usb_hub.h b/drivers/usb/misc/onboard_usb_hub.h
index 34beab8bce3d..62129a6a1ba5 100644
--- a/drivers/usb/misc/onboard_usb_hub.h
+++ b/drivers/usb/misc/onboard_usb_hub.h
@@ -22,10 +22,15 @@ static const struct onboard_hub_pdata ti_tusb8041_data = {
 	.reset_us = 3000,
 };
 
+static const struct onboard_hub_pdata genesys_gl850g_data = {
+	.reset_us = 3,
+};
+
 static const struct of_device_id onboard_hub_match[] = {
 	{ .compatible = "usb424,2514", .data = &microchip_usb424_data, },
 	{ .compatible = "usb451,8140", .data = &ti_tusb8041_data, },
 	{ .compatible = "usb451,8142", .data = &ti_tusb8041_data, },
+	{ .compatible = "usb5e3,608", .data = &genesys_gl850g_data, },
 	{ .compatible = "usbbda,411", .data = &realtek_rts5411_data, },
 	{ .compatible = "usbbda,5411", .data = &realtek_rts5411_data, },
 	{ .compatible = "usbbda,414", .data = &realtek_rts5411_data, },
-- 
2.38.1

