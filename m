Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E515316D9DF
	for <linux-sunxi@lists.linux.dev>; Sat, 18 Jan 2025 10:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737195748; cv=none; b=jjNCue2Uh9mD6FogzgDkM4ZrOGIcxm19WE4oKCrrwg2tNHTQfiMEgxeYcpoQiP5a/pJDlfiFR2Q7rMrwnygMr0YbRo9+KXqOImwzLMVtPtoO4F9UfDYcGbopu6Qt7i5vEX4DYUP1IxTeaa1zkpTa+bLZvqY16lHj0vorxxUBobg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737195748; c=relaxed/simple;
	bh=j8VtiUCaKw8yVdGPJO4EhfqPunuXu3AHJGQvXWTn1uY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=axGk055S774p4daUKteDss5GIIaI7sQfkXwksL9Wlk8ylullA1ydFmBoLbJjWOP5GVvwWXz7Rqf2OQcWZPEPV7DWnVDNqvRIa1MJA8WrwzOj6mm8d+J0ZNCAa+ncKcdFzoa0LRzjsHvlR8mExqHhZ/wbdKh1WQ+z9dc/jZz7Jko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k5gdRozQ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k5gdRozQ"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-436a03197b2so19321345e9.2
        for <linux-sunxi@lists.linux.dev>; Sat, 18 Jan 2025 02:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737195745; x=1737800545; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=g7KYYLVYAzSjQ+OOEOBYCeT9uSdwa/8OaOS+anJ2pbk=;
        b=k5gdRozQbaAUkOWKiMwpdZ3br77+EbpjaGojCj3d/kZNkzTQl4+KxyTXsBfPMEdXhB
         QB5ue8w73M8llWR+b8MiLbaVL0f9uwh6cmscJL9zyA1cw4dPCCXq9jtWAH5dekRVjhkP
         vQHDMxxWafpfVOwH27xYi/No9qpwB6KgAmvTeqppOVfDF15vk4MEqahalIipnyRECj2d
         cGvGpemTeYajAe6DypSr6FwBY1EfzGc8Xx9o5b/gHP8Pgv3lpI6LdocPW9mKNTIT8tjt
         2SHA8DdlqfOEF3ltohVEZb3Z0pXLeFd4tagz2UWBjXt8FsIjbu9GmiVOqNEc0F0DC/kD
         sbcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737195745; x=1737800545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g7KYYLVYAzSjQ+OOEOBYCeT9uSdwa/8OaOS+anJ2pbk=;
        b=l7tV27/nMyuzClJl+VJxbpX/V1dEjR9QolhOFT+CpnryBBqAQQUqQIxN8VDrsFaznq
         ab1LCtaUCMU8mFylCySBTja/PeJqez7MPJMXVObRrTENyRQRimy/opMC93h364BupnJf
         RmoUUr4dButw9bPIh2cCjKcZtiFs8TmxknOTuy85PV1sMQXGRhnI3EUJBp6LAXaXTy/s
         YcKkcAp3rivd+U4D+JoP+BD0/1VKXgNjC7LO4YnoO3kSh94K2Bn3NDMjwzd5iaZBtrno
         T+hNum8nl9Th6z9Egi1hyS1omnCZQNd7uZEE/4/Z2qBo4ZWx6yARicn00TKnQRY0nz9H
         9gBw==
X-Forwarded-Encrypted: i=1; AJvYcCVEPFpNsV6k3Ebnw0ZZ6GGzEDWlo4Zjlyr38/7MAO4H5+lG0os2NSLpDARr62LmZ2gWwJIkz6So5mGTig==@lists.linux.dev
X-Gm-Message-State: AOJu0YyFznAcGO/l5J3Xdgl0zUkRRW7kq0P5I96C/mWpmEglfIJdQwAc
	+202Yebk7Wlh2HL3URjmLKpDMwnMD4/R9t20AGADELl1lK3Cv8x1
X-Gm-Gg: ASbGncsTCYiVCHmZ1uXSBOcqkt56BIJaNA5pAscslqCDgpbxK7H5C99Yol05vxeM0De
	sWB0kHUJsk0TCMBS+Xb3tug0+ua3P/InZ6pN8IHHO6MTELU9lPTd4iXBWASewSy9LWxW6MyczuF
	Oa/iwKxEyT5xFVJUzej7vdbcTT263A118luVNTGt2tvRaxqGNdKhcCsDYYc0jnJmeBbKj0+nClB
	UoKALFRPjpGVsYkAzBlHa1Iqa/Mv2r+fE75UZIs23jcfUU1MtHNriQueDM9BHXQkKOkcaUruV3y
	F2qiyQE346WKQKqDMrokTOgv9CjuuqOhQnpR+bLq0uS5PAE0Iv7ZJJtc
X-Google-Smtp-Source: AGHT+IEC8wg+03HMOeCQYRjaEL4hVw0Oam/RePsv5fuRPjO3sBxgUEwi9m+wMgy/eMHl2a2vGkenKA==
X-Received: by 2002:a7b:c8c9:0:b0:436:fb02:e68 with SMTP id 5b1f17b1804b1-438913bdd6cmr55694025e9.2.1737195744926;
        Sat, 18 Jan 2025 02:22:24 -0800 (PST)
Received: from localhost.localdomain (146.10-240-81.adsl-dyn.isp.belgacom.be. [81.240.10.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438904625f5sm64954515e9.28.2025.01.18.02.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 02:22:24 -0800 (PST)
From: Philippe Simons <simons.philippe@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philippe Simons <simons.philippe@gmail.com>,
	linux-phy@lists.infradead.org (open list:GENERIC PHY FRAMEWORK),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner sunXi SoC support),
	linux-sunxi@lists.linux.dev (open list:ARM/Allwinner sunXi SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [RFC PATCH 1/3] phy: don't let controllers change vbus reg
Date: Sat, 18 Jan 2025 11:22:04 +0100
Message-ID: <20250118102207.9339-1-simons.philippe@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allwinners SoCs share phy0 between the MUSB controller and HCI controller.
If we let these controllers independently power on the vbus on that phy,
peripheral mode is dangerous because HCI never power down the phy, resulting
in 5v being applied against the host 5v.

Override power_on/off for phy0 in that case, and let regulator be enabled/disabled
based on id_det only.

Signed-off-by: Philippe Simons <simons.philippe@gmail.com>
---
 drivers/phy/allwinner/phy-sun4i-usb.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
index b0f19e950..24fbabe7a 100644
--- a/drivers/phy/allwinner/phy-sun4i-usb.c
+++ b/drivers/phy/allwinner/phy-sun4i-usb.c
@@ -465,6 +465,10 @@ static int sun4i_usb_phy_power_on(struct phy *_phy)
 	struct sun4i_usb_phy_data *data = to_sun4i_usb_phy_data(phy);
 	int ret;
 
+	/* phy0 power is controlled by sun4i_usb_phy0_reroute and id_det state */
+	if (phy->index == 0 && data->cfg->phy0_dual_route)
+		return 0;
+
 	if (!phy->vbus || phy->regulator_on)
 		return 0;
 
@@ -493,6 +497,10 @@ static int sun4i_usb_phy_power_off(struct phy *_phy)
 	struct sun4i_usb_phy *phy = phy_get_drvdata(_phy);
 	struct sun4i_usb_phy_data *data = to_sun4i_usb_phy_data(phy);
 
+	/* phy0 power is controlled by sun4i_usb_phy0_reroute and id_det state */
+	if (phy->index == 0 && data->cfg->phy0_dual_route)
+		return 0;
+
 	if (!phy->vbus || !phy->regulator_on)
 		return 0;
 
@@ -573,9 +581,21 @@ static void sun4i_usb_phy0_reroute(struct sun4i_usb_phy_data *data, int id_det)
 	if (id_det == 0) {
 		/* Host mode. Route phy0 to EHCI/OHCI */
 		regval &= ~OTGCTL_ROUTE_MUSB;
+
+		/* Enable VBUS reg */
+		if (phy->vbus && !phy->regulator_on) {
+			regulator_enable(phy->vbus);
+			phy->regulator_on = true;
+		}
 	} else {
 		/* Peripheral mode. Route phy0 to MUSB */
 		regval |= OTGCTL_ROUTE_MUSB;
+		
+		/* Disable VBUS reg */
+		if (phy->vbus && phy->regulator_on) {
+			regulator_disable(phy->vbus);
+			phy->regulator_on = false;
+		}
 	}
 	writel(regval, data->base + REG_PHY_OTGCTL);
 }
@@ -603,6 +623,12 @@ static void sun4i_usb_phy0_id_vbus_det_scan(struct work_struct *work)
 		return;
 	}
 
+	/* Disable internal VBUS reg if there is an external VBUS */
+	if (vbus_det != 0 && phy->vbus && phy->regulator_on) {
+		regulator_disable(phy->vbus);
+		phy->regulator_on = false;
+	}
+
 	force_session_end = data->force_session_end;
 	data->force_session_end = false;
 
-- 
2.47.1

