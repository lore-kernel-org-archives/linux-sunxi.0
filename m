Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B647D39DBC5
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Aug 2026 05:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785734147; cv=none; b=C75Mwc1+2NH+m0RY7ZLxpaZo5Sq4VqasQrvK653CIsoTUVK5oknop7m4dEFcmKNVZE0y5V/JDcj2IeiqR8q75+lxoPARjqTl+mKErVcGmoSIJsaz/nt+6FrB1SABcf6Lcu/yeBDki3ObHEzLZz5q6FDlGglHC8lTgx5tnFBam58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785734147; c=relaxed/simple;
	bh=z1D09xijThRsRnsDX/ozKwmhi7sR7kyQDCuYiAXqUqg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YGkVLxubUw2TqM2Cw+wlHNTYFcYjI3zNxxXn97NG5AEvbzV64rntS+mAIc6HESnnf5f3e4hwSRcN+1HiKrJh9Au9wwGBGKk0Yj/ZVN7nY5+Svvr6T45JOLNor59A8VPscm7Bjlgm3+X7z1u49NIhYAMRGIeCD7/ZCerzEnfpJu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nueuBIvO; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nueuBIvO"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7eb61bbeb25so2152011a34.1
        for <linux-sunxi@lists.linux.dev>; Sun, 02 Aug 2026 22:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785734143; x=1786338943; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S/5/uq1wl03WMsz5ualIqMKCury9OUeuYtebMNsXO2w=;
        b=nueuBIvOgLEPeqQ3Vt0Q6TBxQfOd4bZQGdc7ZKku/U9WOmMRW5ZFTwC2/CeyYDUArV
         BfLgfw6oiwMUNaHyUMV8tMsLZV9FWKJpjcVOi9FwRA9OJ4gNbVFDCpKmPFoG806NN9zF
         yW1LECQqC3MN3feRj9Nees/AhCFXwug0PVz3Xy4Q5MC2oYCQ0Iqgt2JMvkSA1kMzQa2h
         bvDrLJ5Rpl8lWGlcco32H9srHsiz4rKccm8xQ3V2q6O6oDfVfCkNJ6025GymuCimtAjS
         LLcg1j/7qnRFSBP2j9ZVpp/bQbiGim58yoNY5qY7zP5Mlrh5XqkEhnU64JfjhsLpH1Dg
         NnlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785734143; x=1786338943;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S/5/uq1wl03WMsz5ualIqMKCury9OUeuYtebMNsXO2w=;
        b=gkYmRrsvMJk/0zQNJ/eUkVKFuTewPqilRc/DTdsL09EyD75YUmeFXw0xkpMaCJQTap
         NXkH1wQuTnBHqPmzl2wrTYfTvczUswsDDZ1idZp8rRAU+MkyJUsukhx86VGaKNqPXDem
         YTnBkcyfDaG0ONU8O6NyqBIpn3lRcqrIkWkY9hTNTWNAZs9Eq3NdMSBEI5SDu1lnmIxI
         Go0A+5+7HsPWRTUw/wW/9YN3skZzm+KndnxAROJYDgnDQGIavHAatotQAyiJJRCKOHfy
         iehev6En9xraReUZssyaOi4ppx1nmZjbT/2P0xS1IuvcEyXIAoBuecb+2JIwWZomQQHi
         PpMw==
X-Forwarded-Encrypted: i=1; AHgh+Rqy3D4BbcZCNo76ojioY4wLf7jtzpHHHm8S6JegMSSN4u7wXuqai03Pw2T5XYhawPPKeYTnFxhFityCKg==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywp1MuxIZIAH0/YcZQbMjTcdpF0oOkAWzOefXeqWq5xbCvYleEa
	X2HoY08vNLiqgCqA7aj1xnNfVq8j3DXZzmgmKCXmDmkk0/ptX2XXZTbU
X-Gm-Gg: AR+sD10tFn+InCE9e0aOButJg9ua3HkB3/xXWQ9fqAVcHIvO0DLuoqoDBVeGzb3tdfS
	yhLN9BqBZb99YuS1oxh+9ALDDc71zOAw85IYeFyFLbfWe53Nr7qX4TJmq033U6yaBmc7eV5YK4k
	vxf0MzMLIskWKaaqiJspWjL0c7f34H6+WQtFTbB8WGt3wLXMx7fRdHOngNWM7o7/Z7PuSQ0qtvu
	rs4T2WH7CCeNJUiW1NvSOTEM1ARDNXayhANkZwYEUZWt7OWZ402MZxbJyY5FVm0uExfu3A0AMMp
	Tn50bG2EmgfqosJdqv7M4zClf0nJgF0N5FHaulZxiV1n5v/5xVhBUFM4tAkRp/r9enV9JrWEage
	KpooqZ9PCcX8OiTMe5RsUfWDC5mMVzB3a3rlkI//iFPBrAhh73sOgj+UGufsLQ3yN4zRc0VATEf
	El+xThTpbXaRX54i8DY3FZDfAoxuQOR+w0/DpKRJl1qf7M/jSAekiDRtG19LFgMK1xYcLxil7+X
	S+5PLPekoEh868r6VZpitq09eoSbCLtN/9nzEEbpWtXbcsBgvOuupoBnbfBsw4Yu0UYh9W6V55R
	J9v+UaFnete4S0GCJcjmoYE1nLQCDc52Luip8r9cNNJhG8osJ22g0J/MVwspclEQ8hixLX7iHyJ
	b2SSYrz/lk0D0I1EV
X-Received: by 2002:a05:6830:4114:b0:7e9:bd00:c6ad with SMTP id 46e09a7af769-7f196f29291mr14805744a34.16.1785734143562;
        Sun, 02 Aug 2026 22:15:43 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f18f07a5e3sm6787108a34.15.2026.08.02.22.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 22:15:42 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 02 Aug 2026 23:14:24 -0600
Subject: [PATCH 14/21] net: phy: support configuring PHY-autonomous Tx LPI
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-submit-acx00-of-dynamic-v1-v1-14-0a53cd9e21cc@gmail.com>
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

The ethtool Tx LPI fields currently update phylib software state and
notify an attached MAC, but they do not configure PHYs which generate LPI
autonomously. This can make a successful ethtool request leave the PHY
hardware unchanged.

Add a PHY driver callback for applying the Tx LPI enable state and timer.
Call it before updating EEE advertisement, and attempt to restore the old
hardware state if either the callback itself or the advertisement update
fails. Use the callback to disable autonomous LPI when phy_support_eee()
hands LPI control to the MAC, and reapply that state after PHY reset.

Drivers without the new callback retain the existing behavior in which
the Tx LPI fields configure phylib and the attached MAC. Existing drivers
which only implement disable_autonomous_eee() therefore need no changes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/phy/phy.c        | 35 +++++++++++++++++++++++++++++++++--
 drivers/net/phy/phy_device.c | 25 ++++++++++++++++++++-----
 include/linux/phy.h          | 18 ++++++++++++++++++
 3 files changed, 71 insertions(+), 7 deletions(-)

diff --git a/drivers/net/phy/phy.c b/drivers/net/phy/phy.c
index fce9bc7be330..c76d5baa1f84 100644
--- a/drivers/net/phy/phy.c
+++ b/drivers/net/phy/phy.c
@@ -1996,6 +1996,8 @@ static void phy_ethtool_set_eee_noneg(struct phy_device *phydev,
 int phy_ethtool_set_eee(struct phy_device *phydev, struct ethtool_keee *data)
 {
 	struct eee_config old_cfg;
+	bool tx_lpi_cfg_attempted = false;
+	bool tx_lpi_cfg_changed;
 	int ret;
 
 	if (!phydev->drv)
@@ -2005,16 +2007,45 @@ int phy_ethtool_set_eee(struct phy_device *phydev, struct ethtool_keee *data)
 
 	old_cfg = phydev->eee_cfg;
 	eee_to_eeecfg(&phydev->eee_cfg, data);
+	tx_lpi_cfg_changed = phydev->eee_cfg.tx_lpi_enabled !=
+			     old_cfg.tx_lpi_enabled ||
+			     phydev->eee_cfg.tx_lpi_timer !=
+			     old_cfg.tx_lpi_timer;
+
+	if (tx_lpi_cfg_changed && !phydev->autonomous_eee_disabled &&
+	    phydev->drv->set_tx_lpi) {
+		ret = phydev->drv->set_tx_lpi(phydev, &phydev->eee_cfg);
+		tx_lpi_cfg_attempted = true;
+		if (ret)
+			goto restore_tx_lpi;
+	}
 
 	ret = genphy_c45_ethtool_set_eee(phydev, data);
 	if (ret == 0)
 		phy_ethtool_set_eee_noneg(phydev, &old_cfg);
 	else if (ret < 0)
-		phydev->eee_cfg = old_cfg;
+		goto restore_tx_lpi;
 
 	mutex_unlock(&phydev->lock);
 
-	return ret < 0 ? ret : 0;
+	return 0;
+
+restore_tx_lpi:
+	if (tx_lpi_cfg_attempted) {
+		int rollback_ret;
+
+		rollback_ret = phydev->drv->set_tx_lpi(phydev, &old_cfg);
+		if (rollback_ret)
+			phydev_warn(phydev,
+				    "Failed to restore autonomous Tx LPI: %pe\n",
+				    ERR_PTR(rollback_ret));
+	}
+
+	phydev->eee_cfg = old_cfg;
+
+	mutex_unlock(&phydev->lock);
+
+	return ret;
 }
 EXPORT_SYMBOL(phy_ethtool_set_eee);
 
diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index f7472a743185..30929b0354b6 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -1357,6 +1357,21 @@ static int phy_poll_reset(struct phy_device *phydev)
 	return 0;
 }
 
+static int phy_disable_autonomous_tx_lpi(struct phy_device *phydev)
+{
+	struct eee_config config = phydev->eee_cfg;
+
+	if (phydev->drv->set_tx_lpi) {
+		config.tx_lpi_enabled = false;
+		return phydev->drv->set_tx_lpi(phydev, &config);
+	}
+
+	if (phydev->drv->disable_autonomous_eee)
+		return phydev->drv->disable_autonomous_eee(phydev);
+
+	return 0;
+}
+
 int phy_init_hw(struct phy_device *phydev)
 {
 	int ret = 0;
@@ -1395,9 +1410,8 @@ int phy_init_hw(struct phy_device *phydev)
 	}
 
 	/* Re-apply autonomous EEE disable after soft reset */
-	if (phydev->autonomous_eee_disabled &&
-	    phydev->drv->disable_autonomous_eee) {
-		ret = phydev->drv->disable_autonomous_eee(phydev);
+	if (phydev->autonomous_eee_disabled) {
+		ret = phy_disable_autonomous_tx_lpi(phydev);
 		if (ret)
 			return ret;
 	}
@@ -2973,8 +2987,9 @@ void phy_support_eee(struct phy_device *phydev)
 	 * manage LPI signaling instead. The flag is stored so it can be
 	 * re-applied after a PHY soft reset (e.g. suspend/resume).
 	 */
-	if (phydev->drv && phydev->drv->disable_autonomous_eee) {
-		int ret = phydev->drv->disable_autonomous_eee(phydev);
+	if (phydev->drv && (phydev->drv->set_tx_lpi ||
+			    phydev->drv->disable_autonomous_eee)) {
+		int ret = phy_disable_autonomous_tx_lpi(phydev);
 
 		if (ret)
 			phydev_warn(phydev, "Failed to disable autonomous EEE: %pe\n",
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 2eba54e068f6..55053b914144 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -1391,6 +1391,24 @@ struct phy_driver {
 	 */
 	int (*disable_autonomous_eee)(struct phy_device *dev);
 
+	/**
+	 * @set_tx_lpi: Configure PHY-autonomous Tx LPI
+	 * @dev: PHY device to configure
+	 * @config: Requested Tx LPI enable state and idle timer
+	 *
+	 * The presence of this callback advertises that the driver supports
+	 * configuring PHY-autonomous LPI through the ethtool EEE Tx LPI fields.
+	 * It is not used for userspace configuration after phylib has handed LPI
+	 * control to the MAC. Drivers without this callback retain the legacy
+	 * behavior in which those fields only configure phylib and the attached
+	 * MAC. A request with Tx LPI disabled must be accepted regardless of the
+	 * timer, since the timer has no meaning while the transmitter is disabled.
+	 *
+	 * Return: 0 on success, negative errno on failure.
+	 */
+	int (*set_tx_lpi)(struct phy_device *dev,
+			  const struct eee_config *config);
+
 	/* Get and Set PHY tunables */
 	/** @get_tunable: Return the value of a tunable */
 	int (*get_tunable)(struct phy_device *dev,

-- 
2.53.0

