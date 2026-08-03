Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864F23ACA4C
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Aug 2026 05:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785734162; cv=none; b=nwl2XspceTh5JgLuG87ebsnSZCGbe1UiMuZYRmEOKfpPi2qm2hr3BP7eWNERLktGpSZu0ETl/U1sBXNxKd9bGVfVwoRNq6uWOtqzV6Am4JdxrTMwRQqgP+1F9haJKFJft4ppYkMe9KXkx7wcmh2+LbrY9oj48s753QKxpC+duSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785734162; c=relaxed/simple;
	bh=GJHoT3sGNBaHJutusjqByQrs0uUzgfDmspxJwWo+2Fw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JYwXv+XQN9YU98ShtHxw6xxovk29AQO4j736z6etIuhGUojCDS0Iwm/APFtmLO1x3rH/fp/A+9YKT9o8q1vourHkIUiRnH2PimzGiXRPrR73VbZkQJ5Dv5ehcDusygOvwuD1eS6NAzuFG85F+eDI0fc7dvygnDF1qCDV3bOvDmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r0B5R/1j; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r0B5R/1j"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7eb6573bd52so2068286a34.3
        for <linux-sunxi@lists.linux.dev>; Sun, 02 Aug 2026 22:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785734159; x=1786338959; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V3THAfFmoIZwxbw2uyAABLxKH+fs/K6w42J64CA1198=;
        b=r0B5R/1jRND4rSMHZwMlN749RtmPM2mh03SpUigttDhvTz8FHqcT26QBE2UsAXPmwR
         a2WuttEnYCYvR+z7Zt+6V84OyGNIkl/+8THr6groX579IH+3fmO32FB+Pz5kSPoR46Yo
         RwbdmNgKDnHAxlntpvkba/8BqteTWPhopjpPbwb0gToi/3Da54BuEkTztM3I0RoJpzDF
         9m2FKpl253EZA7dYn9+IoCexp4bjjByC/iscf1y8v9CuNZCpHtnXQTlt+0616xy6lsAx
         2dVYoLZNqOyts0KFvonvT9Y5TiHCDup35lmc3ujfBs1AniRbYA1uo1+j1z/QEhJdZuJE
         r+jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785734159; x=1786338959;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V3THAfFmoIZwxbw2uyAABLxKH+fs/K6w42J64CA1198=;
        b=S9HlI2EI0HDzvFCb4pCmZBXUcnpLjfN64ryyK+MD+N3qVMOpymXrQZ1yJQyWmoDSX2
         /9tNdKqqmfNYE1JSgDjR6K2qO+hGQkRWZIKOB2hlUClqe8iAlrGXKyjKoyrUDLSCvQ4W
         SS6JJcmWBZVz2uU3N8q7bcrjXqQVZ9bZ8+ZgHurlpS9t/s8bmVnfy+deJWuwpMnePBX1
         hpR8ObHMGtBk1zMp5Zu9xsR2l1xpgFW2R8iHiCvn9BUomSjP/R7XvKAQGiwFiiRWpE2C
         mNAUxOcllab5sc3jnG1I4TdV3QC6WyR+v3foLyEccWgbowPA3T1VzBYn5knq908L7B0S
         s+SA==
X-Forwarded-Encrypted: i=1; AHgh+RqjJoyMQQ0/4HLyu/giuQRMpQbiZR8X0IFVvXHLZ2SXiBpeKI3Q5sYs3mJuYgdy3FPhXZoP4mztix91FA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwH9R+JMQrjC9PR1oB1nD89+qnjJBd8H623xVFJ6889wf7TSmC8
	BNq6tk31gzBdQENTvy9KGrZBLcpadEg1vkyq8M2D6gddelLHiJYF31lU
X-Gm-Gg: AR+sD10zno5sCDF96Otr85r3oI3RCR4hrA3ByYSn8trPnbnBO4umGp64DY9OZIqLwTg
	f/HwQQ+TNKfedIfk/bW6DpS4+QBnL0tSjHJeXwilICGVdbg9s6U3r0NR+++H124Mt+RHn6yfkDW
	e0+pDVMP2u4NFbE/R/Qx8OOzhNJ4AhCRkb38cGccu6Mea5hl1UJMXeVZF+ZD8Bbn5/IGVGSK8yV
	oL9dg7SNhCKBIC7a/Vh8CMoetOb0noVEJpCEhI0xwBiFR8rs1HY6l9iNcJu3JsSPieSKdns2md3
	3KrE7qUzv6OUrotCd3BRabtV6DWZwIctiYOAUtfsKCIDvKnHnE7aUCEUeif8frXBL66uxjnGDre
	GeyULRiM7YCMEJea5KYlDvxpUBe6ZKDIljM+4JqwRe9F3ZgtGSzCkO+jsZReppDppuSszA9ovtJ
	NVlWEHgvtJgZCB58Ki4LISH/nNkmOhifsz82gt7YzpMgfhqFM6vm43+rGryHFNqKwM2eN4s9kqj
	mWKtYdBvtj4KPxYAubwcL1ZUkyMjewBHFuK1jsJWsios94S8BjAzgd/01prQC0Em8TsXkshRLjx
	4n7wbSpDVgjSq1mZ57Edzw8f5yQr+9h7BakuAYbVntDQHzYTuKUnwZlNsp6bRBLdRzI3NwcJgLT
	i52+Ed078JWp7Fn+dzoUw0ljTizKLs29+bqdK
X-Received: by 2002:a05:6830:2a8b:b0:7e6:f7fb:9678 with SMTP id 46e09a7af769-7f196cb65a7mr14526881a34.1.1785734154482;
        Sun, 02 Aug 2026 22:15:54 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f18f07a5e3sm6787108a34.15.2026.08.02.22.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 22:15:54 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 02 Aug 2026 23:14:31 -0600
Subject: [PATCH 21/21] arm64: defconfig: enable X-Powers ACx00 Ethernet
 support
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-submit-acx00-of-dynamic-v1-v1-21-0a53cd9e21cc@gmail.com>
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
In-Reply-To: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 mfd@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Build the H616 PWM clock provider, AC200 MFD, both variant-specific
EPHY control drivers and the shared link-PHY driver as modules. Enable the
netdev LED trigger as a module so DT-described PHY LEDs can use hardware
offload.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 arch/arm64/configs/defconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 654a102cb5bc..53f6b8edaf33 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -475,6 +475,9 @@ CONFIG_DP83869_PHY=m
 CONFIG_DP83TD510_PHY=y
 CONFIG_DP83TG720_PHY=m
 CONFIG_VITESSE_PHY=y
+CONFIG_XPOWERS_AC200_PHY_CTL=m
+CONFIG_XPOWERS_AC300_PHY_CTL=m
+CONFIG_XPOWERS_ACX00_PHY=m
 CONFIG_XILINX_GMII2RGMII=m
 CONFIG_CAN_FLEXCAN=m
 CONFIG_CAN_XILINXCAN=m
@@ -828,6 +831,7 @@ CONFIG_BCM7038_WDT=m
 CONFIG_MFD_ADP5585=m
 CONFIG_MFD_ALTERA_SYSMGR=y
 CONFIG_MFD_BD9571MWV=y
+CONFIG_MFD_AC200=m
 CONFIG_MFD_AXP20X_I2C=y
 CONFIG_MFD_AXP20X_RSB=y
 CONFIG_MFD_MACSMC=m
@@ -1325,6 +1329,7 @@ CONFIG_LEDS_TRIGGER_HEARTBEAT=y
 CONFIG_LEDS_TRIGGER_CPU=y
 CONFIG_LEDS_TRIGGER_DEFAULT_ON=y
 CONFIG_LEDS_TRIGGER_PANIC=y
+CONFIG_LEDS_TRIGGER_NETDEV=m
 CONFIG_EDAC=y
 CONFIG_EDAC_GHES=y
 CONFIG_EDAC_LAYERSCAPE=m
@@ -1726,6 +1731,7 @@ CONFIG_PWM_SAMSUNG=y
 CONFIG_PWM_SL28CPLD=m
 CONFIG_PWM_STM32=m
 CONFIG_PWM_SUN4I=m
+CONFIG_PWM_SUN8I=m
 CONFIG_PWM_TEGRA=m
 CONFIG_PWM_TIECAP=m
 CONFIG_PWM_TIEHRPWM=m

-- 
2.53.0

