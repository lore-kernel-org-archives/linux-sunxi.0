Received: from a.peacevolution.org (a.peacevolution.org [206.189.193.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122E3175BE
	for <linux-sunxi@lists.linux.dev>; Tue,  6 Feb 2024 19:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=206.189.193.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707246179; cv=none; b=nMC2K+rF14S7xR7UyKsSz6Hk8DcLr9zS8mcoVMmh3a47iuApDs7+ZUTTTI1HcQtS6sJ1nsJ91QA7yqTuCmzdqGHI/LI16zSXi9waCpgIGyQ0x7z6OHANwgIZ9xdp2XIKs8WOCn4B+O8x1boAOw4FfK3r6/1vwl41za1JLWt6LYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707246179; c=relaxed/simple;
	bh=qXVPXyupoi6y4mfGDfx6l8JDOF1+lMDDn4mbVnSTzr0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hl48PLWz9XSAQOEwRUqYChQ4tfauQ+IBmIXjr5Au+sXIfeGXzSDAf+NsExlbn0GjtCgcY1lIwMhOTLF7nuRiNSFRJ9nCRKo8hGKUtcPzuPP2j+0T6nO35zr3mT98nuwFZ99amiPurxcioazmvWwPPnjqMChXYDpqJVF2o1q/vxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=peacevolution.org; spf=pass smtp.mailfrom=peacevolution.org; dkim=pass (1024-bit key) header.d=peacevolution.org header.i=@peacevolution.org header.b=AD8RDoDq; arc=none smtp.client-ip=206.189.193.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=peacevolution.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=peacevolution.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=peacevolution.org header.i=@peacevolution.org header.b="AD8RDoDq"
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
	by a.peacevolution.org (Postfix) with ESMTPA id DD9644583E;
	Tue,  6 Feb 2024 19:02:48 +0000 (UTC)
From: Aren Moynihan <aren@peacevolution.org>
To: linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Ondrej Jirman <megi@xff.cz>,
	linux-sunxi@lists.linux.dev,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@ucw.cz>,
	linux-arm-kernel@lists.infradead.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-leds@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Miles Alan <m@milesalan.com>,
	Samuel Holland <samuel@sholland.org>,
	Aren Moynihan <aren@peacevolution.org>
Subject: [PATCH v2 1/4] leds: rgb: leds-group-multicolor: allow leds to stay on in suspend
Date: Tue,  6 Feb 2024 13:13:17 -0500
Message-ID: <20240206185400.596979-1-aren@peacevolution.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: auth=pass smtp.auth=aren@peacevolution.org smtp.mailfrom=aren@peacevolution.org
X-Spam-Level: ****
X-Spamd-Bar: ++++
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=peacevolution.org;
	s=dkim; t=1707246170;
	h=from:subject:date:message-id:to:cc:mime-version:content-transfer-encoding;
	bh=NQIirmVOCAxOql2DLF2KDYdkndurgToAOXdUzzfrUao=;
	b=AD8RDoDqSuMzuW8WjS6hsO4Ihd7f8WOWW5QsXpSI7G+B3S/ZAOv9zFcgzVMoPwDLVcGvsZ
	3jyUXi4dQD42GwETLjspanbyyc4gtnAGlP9du/NQeqpq3AQNfhm+zqS098d0N0cu3STJr2
	Os7WmPNxQ97X0MQofjfo76Zlw56NSU0=

If none of the managed leds enable LED_CORE_SUSPENDRESUME, then we
shouldn't need to set it here. This makes it possible to use multicolor
groups with gpio leds that enable retain-state-suspended in the device
tree.

Signed-off-by: Aren Moynihan <aren@peacevolution.org>
---

Changes in v2:
 - make sure count gets initialized
 - send the patch to (hopefully) all the correct people this time

 drivers/leds/rgb/leds-group-multicolor.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/rgb/leds-group-multicolor.c b/drivers/leds/rgb/leds-group-multicolor.c
index 39f58be32af5..b6c7679015fd 100644
--- a/drivers/leds/rgb/leds-group-multicolor.c
+++ b/drivers/leds/rgb/leds-group-multicolor.c
@@ -69,7 +69,7 @@ static int leds_gmc_probe(struct platform_device *pdev)
 	struct mc_subled *subled;
 	struct leds_multicolor *priv;
 	unsigned int max_brightness = 0;
-	int i, ret, count = 0;
+	int i, ret, count = 0, common_flags = 0;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -91,6 +91,7 @@ static int leds_gmc_probe(struct platform_device *pdev)
 		if (!priv->monochromatics)
 			return -ENOMEM;
 
+		common_flags |= led_cdev->flags;
 		priv->monochromatics[count] = led_cdev;
 
 		max_brightness = max(max_brightness, led_cdev->max_brightness);
@@ -114,12 +115,15 @@ static int leds_gmc_probe(struct platform_device *pdev)
 
 	/* Initialise the multicolor's LED class device */
 	cdev = &priv->mc_cdev.led_cdev;
-	cdev->flags = LED_CORE_SUSPENDRESUME;
 	cdev->brightness_set_blocking = leds_gmc_set;
 	cdev->max_brightness = max_brightness;
 	cdev->color = LED_COLOR_ID_MULTI;
 	priv->mc_cdev.num_colors = count;
 
+	/* we only need suspend/resume if a sub-led requests it */
+	if (common_flags & LED_CORE_SUSPENDRESUME)
+		cdev->flags = LED_CORE_SUSPENDRESUME;
+
 	init_data.fwnode = dev_fwnode(dev);
 	ret = devm_led_classdev_multicolor_register_ext(dev, &priv->mc_cdev, &init_data);
 	if (ret)
-- 
2.43.0

