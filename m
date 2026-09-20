Received: from mail-oi2-f43.google.com (mail-oi2-f43.google.com [74.125.231.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE8848381E
	for <linux-sunxi@lists.linux.dev>; Sun, 20 Sep 2026 19:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789933544; cv=none; b=G6B1F9HhcMcZsXXbEhPWHn3loX/TgxPo/zgfwitxCC8NeWARXoOrGmK78sl/ns3iaaWFi7gYIABUNe+HnW+NmOv8J/0LIQewxuqKN5r09f9EbUkHC3fYkT/FRACJWEMqQPCceJd1XP7aXGM+Vh//sLsTAr8ap6Kbfbg8JJgSMrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789933544; c=relaxed/simple;
	bh=gUKFbHeEcxx83+tKppsK/7X6MwKFaPl4J3HQSaFfj00=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B38RgE2sfk+HE8TqNYNY+5PdIkzs9IOFHxsmZFX7Ogkg0x3RK24pUUeVYyTBTCo5yYZ4M95D+K/HeDZ8kyqVzF1KewRDjAroRYwhcPeHIo4yS8R9yJGUX+b3/IL2vkomAXBFBpmBsLb9XfzyVcDhgIdPDOCTqNudeGz0sdlKy1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I6qheEJX; arc=none smtp.client-ip=74.125.231.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I6qheEJX"
Received: by mail-oi2-f43.google.com with SMTP id 46e09a7af769-81201ed7d35so435350a34.0
        for <linux-sunxi@lists.linux.dev>; Sun, 20 Sep 2026 12:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789933541; x=1790538341; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cfe0VVZFX+0RXygGXnYE+LZWMLMgO2pSV2be59Az8jU=;
        b=I6qheEJXQk/ysmt52dHQAM/d5jyKHdkfAHk9aik3IDe9jyXez7WMfebOlb36eXoPep
         aTaLu8INBk1241KT7He3WGpSmVbWKncjG55f/px99sHS1zXiOECQ3S5KZhfeyjC6dx+z
         MSD2nz8R/ORtQbdiLp6+VKy3DzefCeJcOHspfe1dbJ/YpPxSnXCBEODIFo/y7wRx0RXt
         JkZYR6BhGu7QH1PRkwemt+nCI4zuQkUtoPqw0cTFkMWvUN7f0kASnkEIPdyVHRror/I6
         6wPkAtAhOW6DpVsQJGuCVsPyXwtSf7rJQ1PYJJj/3R5kiV3Pee14XSb6a0+6FWim9YM7
         EV4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789933541; x=1790538341;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cfe0VVZFX+0RXygGXnYE+LZWMLMgO2pSV2be59Az8jU=;
        b=n1sHB7iaO7/lUfmemR7MCVecPHOsm8ttW4feQH0Z/F8o5Ro1bXQAQUPFSDMF0bPgLx
         HWTb1tnDjKm76Fo70kXjUZJguljnVs1GGi0myAs1CVmhyDBnSRSAc0rPlote2g2Lo3qG
         yN84eWHiDPHw7IkvkFpHVCfCcs/LJrxYV0XPvJgswnZUUmzy3IFiMRIDWk8CVhcnklOR
         qxPzkT0J3R88KCKjRQjZyzA6GSj7Er/8WINJ4yQoTlcBF/0rI7wwuulCaChJrjQF57PC
         PFIOsJkjMfpTwDGl5yYMh9Jve/izbdhxgtifOhVPv86kUCxs4urk2Q4vaZI8bmH8wTEZ
         ihgQ==
X-Forwarded-Encrypted: i=1; AKwUvBy9UWLsqtHZSBwF1XngIJe4bcNg3UMlsuX2+gQxeSwfU8IEtU9Uvk4mzo3puI+w4ALisjQC0GK5o3rUpQ==@lists.linux.dev
X-Gm-Message-State: AFuF++mWkSVzwmZhln/5r026PbGntSK6F5OVW2hcl2TLtEe/M27hd50g
	CZ3YeTrhReGTWeiIqIPQOsF7bOiu0AV3lmy+21p+HX9N/rDbcOBcG7DH
X-Gm-Gg: AYBFou11ns6TD5GK/SPNKFDWMDpEBYv6kRlYNdCsEhrwCBajRGZivgSLpIpAj+X6hIZ
	sujsrKXyySkoR7G7BinSXx4f0+/8xteZRsMJmsqOYvA4D17w3fWq/Po2eWDj00vikN6cIGDRV6t
	SmEVdCXaRc7eY6Acj/J82e+HYVoTQkI2qVEl9dJw1S31sPFPweQJtTubdX3+oJ6hQpOhUNCSEk8
	mdWkGxSjXpGFNrB0ct1OJLaNd2t7k5Go6QOTyuWIDvfSEhD3SPQQUSW2oG+m5XyIlHWV2p+/Njj
	v5TR5W0zVyzT2sareDMC8qLgpG6+LguISuNPHB2QPsKEncMZQik1DV+T2As0uHkTZJirJ96BGBx
	jvxh2UiN3Z6bja+XnZ470nmMHUeeFJQI/1QBZ9yh6UP1gkSOt0v84J0Z6ueJmlfOre7gTuK+zLC
	G3ojrx4n+cNfQH6YHmqv2cfrazIq/gnx/dWV9VGZP0q5aTUXwv394eEKzjVOPZI37sPlptfoYoX
	Z2cURVTVIA1JG/DteHO1YTDwhQtL6qkXvQHi3anh6RMN7GN8hOIqrouk3P6WXDyyJilAdj3OKbx
	okPJa6jDetD2O5cG4sy2Fya4xauKq7yWb/BseCbLuzROZgFMC6rRA857fbamNwWuRHOeQvcc3r8
	aKZFvTHhZd8+cnZxPuAds
X-Received: by 2002:a05:6820:4b86:b0:6c3:2a60:63c with SMTP id 006d021491bc7-6ca9aa41ef5mr8971692eaf.22.1789933540913;
        Sun, 20 Sep 2026 12:45:40 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4881f4d7861sm6103834fac.1.2026.09.20.12.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 12:45:40 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 20 Sep 2026 13:45:27 -0600
Subject: [PATCH net-next v4 1/6] net: phylink: allow stopping a suspended
 instance
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-submit-h616-emac1-v1-v4-1-8347dfe2eb7d@gmail.com>
References: <20260920-submit-h616-emac1-v1-v4-0-8347dfe2eb7d@gmail.com>
In-Reply-To: <20260920-submit-h616-emac1-v1-v4-0-8347dfe2eb7d@gmail.com>
To: Richard Genoud <richard.genoud@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Christian Marangi <ansuelsmth@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, 
 Alastair D'Silva <alastair@d-silva.org>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

A MAC which cannot restore its hardware after system sleep may need to
close the network device instead of calling phylink_resume(). Without MAC
Wake-on-LAN, phylink_suspend() has already stopped the PHY and PCS, so
another phylink_stop() repeats their shutdown. With MAC Wake-on-LAN, the
saved link-up state still needs a matching mac_link_down(), and leaving
PHYLINK_DISABLE_MAC_WOL set prevents a subsequent start from resolving
the link.

Allow phylink_stop() to finish shutdown directly from either suspended
state. Leave an already stopped instance alone. For MAC Wake-on-LAN,
stop resolution, drain pending resolve work, complete the deferred
link-down and clear the WoL disable bit while retaining the stopped bit.
This does not restart the PHY, reconfigure the MAC or bring its link up.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/phy/phylink.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 390d3eb3e6f7..8ecf2dec3a7d 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -2615,11 +2615,17 @@ EXPORT_SYMBOL_GPL(phylink_start);
  *
  * This will synchronously bring down the link if the link is not already
  * down (in other words, it will trigger a mac_link_down() method call.)
+ * It may also be called after phylink_suspend() if the MAC cannot resume
+ * and the network device must be closed instead.
  */
 void phylink_stop(struct phylink *pl)
 {
 	ASSERT_RTNL();
 
+	/* phylink_suspend() already stops the link without MAC WoL. */
+	if (test_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state))
+		return;
+
 	if (pl->sfp_bus)
 		sfp_upstream_stop(pl->sfp_bus);
 	if (pl->phydev)
@@ -2632,6 +2638,16 @@ void phylink_stop(struct phylink *pl)
 
 	phylink_run_resolve_and_disable(pl, PHYLINK_DISABLE_STOPPED);
 
+	if (test_bit(PHYLINK_DISABLE_MAC_WOL, &pl->phylink_disable_state)) {
+		/* Finish the link-down deferred by MAC WoL, without restarting. */
+		flush_work(&pl->resolve);
+		mutex_lock(&pl->state_mutex);
+		if (pl->suspend_link_up)
+			phylink_link_down(pl);
+		__clear_bit(PHYLINK_DISABLE_MAC_WOL, &pl->phylink_disable_state);
+		mutex_unlock(&pl->state_mutex);
+	}
+
 	pl->pcs_state = PCS_STATE_DOWN;
 
 	phylink_pcs_disable(pl->pcs);

-- 
2.53.0

