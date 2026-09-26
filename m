Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com [74.125.231.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D8C36B915
	for <linux-sunxi@lists.linux.dev>; Sat, 26 Sep 2026 15:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790437768; cv=none; b=grnlNlIFuxrjFqOLH04S/7kH7NP6X8D47jQpGVvwI66+wDRAAJnZxBCyP+/hj10HpbQLeiTejRBixSi9DMT3gNxiAPzn7h9JeRuBmXVUFgvKUpjRigQs63rDNurqZM0AAB8leXOPLY5rQq//xebMlsG81GC2fY9+WZRoPuonC1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790437768; c=relaxed/simple;
	bh=M5M3PgGTSsBzpkQ0euUZJ5B4ccey2Neh1h31IhOxfnM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XkXT0w4glC1AaBiXGmZ0NFtSUq4zCKKFlqAmoHvsd90QWyz62UooE0NhvkLuM9euN3CdtVeQol+AoABD7T6v5EXXwWlDAUTEotI+6ADql1jhS/1Z6YmuzORf8X3Lr4+hepZ/55Lub9jagUDjGl/bNouQLOHelIxK4rSGx8+qnzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eJSnoELF; arc=none smtp.client-ip=74.125.231.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eJSnoELF"
Received: by mail-oo2-f43.google.com with SMTP id 46e09a7af769-81b485c8368so89094a34.3
        for <linux-sunxi@lists.linux.dev>; Sat, 26 Sep 2026 08:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790437765; x=1791042565; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z7kcdEW7zqHkGJYzryRmaM6C2T9h9+G3wdmEwpizeis=;
        b=eJSnoELFmkPIbp9UqdIK6GXUZvGSfy4Attu0W8mWlN2RsVGqWTD8+uRbCoUSfD+ByW
         iuSPMf1tEoJkfxCpk/cZfL3eXVjm1mofTc6R5GjClsr7XrLP9bF//bEB35gsp3Hok8XV
         IOv3Jfe6Ohq91Cpm4W4NJEE+p6zdKkVKYWj2xeC7SoY89J0oHehY8SYdX/uSEI9/VH08
         NIv3T4gWyou1RLfBt0+kNzlLTNF20tYwLkHtCbgZQk8RMgI5AKaOyxHBuTPSi1RrizVt
         j2ldr751RrC5tHD/TeAxBCFW05jv7ZgweKBBTeoPvgiQD0IuQXYySukiec067lBopD1w
         ktHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790437765; x=1791042565;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z7kcdEW7zqHkGJYzryRmaM6C2T9h9+G3wdmEwpizeis=;
        b=E8Nn1EMHYXG44fymTIGhcnaZUPNogy+iqsQjbx+nSlVuQRw4aIt7i7xWYZgPTXkum8
         CWWKRZyXkZF28VJrSubfh2quZ+W2cZqPEewRDEV2whnazkQWBB5J7u+PLKySWTeY+bQR
         oKwh3+WQj6bM2HnsQFXkd2vhpXXcrAv/9/FOef4vhIptDKbr60okpAYxvnstjouposAE
         +h87bt/XaqDFc98jzbpCSpoh25IeCQRKTRGVWVQQYxUITpcFyRQcYJu2Z7QT32zzkLNd
         GBF1Q9tzPVJx7yBIaJi5r8sxJWckdSwyoIWCMErH1w3fRuXzkTzIC7gJtOSgwISW3NSJ
         SU/w==
X-Forwarded-Encrypted: i=1; AKwUvBy13e5YWr4m7hy03hTj1+HIFGP4s3PMyWabcMz5OLqtgwi4P2284x5wzOi45xDLNeT5b+Pyaiy3ZTc/Ug==@lists.linux.dev
X-Gm-Message-State: AFuF++lYnZzWbhTCpVBtlhWaCtgATmAQ8DW7YMoix6+0r6KxhPF7XMo/
	vPDGLOB3RVGeyl7JFM4uKUxuy7faJqaUZy564wZT4Y2YGRwbl9voe6oC
X-Gm-Gg: AYBFou3S0I2i48ZeUd3F64YkbzxRFy/SIafxCtyngZN4ugrJGaQh9uqClTjE2wsSjrH
	5Eb3fRxGFtGLKuT/RMWX9AmKokbFkRr1u5U3Mvek9EhsVh6/cO6nUDdZX4lbgdqJXvJ2C8pQ3f1
	DQPyCAOnj8Zoyhlv4xAD2V8jJjRiJX+v5+qrDruwx91lXa8tWf6rB3YFWV/BD1N0Ks1jddLSrD2
	e0W4O568yR59r5cvMhqXQP241WASfBghf+X3Ao/t/7mp59V/mW/zwOuaxa1RkKk9juhWlHrBIfv
	xs2vCTDysCkwSmxBLra7vSXxKfw1Tgfu1Yxx92c59jJtzTjULjKhsGL7JbwRQRMDSRfsk4/uHkO
	lZEqCSDUP2wcS0HrJAxjWOeeakr4rn+WCgupTjW7/M2vRm5BZEqe+M2TAMlPmu+NSqMHfP1vBmL
	4uG0oxtcUq/+3CkXl4dyK/VhBx6hORnjHDfbBJ67xmxFg0oXsXEQZFc/QnUAyp4xts9na3PHesZ
	w3Q4ZidJmck3LmdY/DvVge/fhzWTdtGGwBcZmGK9faOi75u9hV70wV0SbQSnEX2NvWvDqZr03h5
	5y1N3vjCNrI/EoMDZA+oxmbtXog1xqFeyUVUjelbrpR/Pqalvr5w/YnWWn97+3IMgg51YYdz40t
	jqPhd2tBNwTHn0ZTKytRFWN1PSOv60kQ=
X-Received: by 2002:a05:6830:a203:20b0:81b:8032:716d with SMTP id 46e09a7af769-81b8032721cmr86559a34.20.1790437765027;
        Sat, 26 Sep 2026 08:49:25 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-818e98b16d4sm5442366a34.26.2026.09.26.08.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 08:49:24 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 26 Sep 2026 09:48:58 -0600
Subject: [PATCH net v4 03/15] net: phylink: allow stopping a suspended
 instance
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-submit-stmmac-reset-fixes-v1-v4-3-ec1c0250b3c9@gmail.com>
References: <20260926-submit-stmmac-reset-fixes-v1-v4-0-ec1c0250b3c9@gmail.com>
In-Reply-To: <20260926-submit-stmmac-reset-fixes-v1-v4-0-ec1c0250b3c9@gmail.com>
To: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Joakim Zhang <qiangqing.zhang@nxp.com>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Stanislav Fomichev <sdf@fomichev.me>, Serge Semin <fancer.lancer@gmail.com>, 
 Suraj Jaiswal <quic_jsuraj@quicinc.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Joao Pinto <Joao.Pinto@synopsys.com>, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, 
 Ong Boon Leong <boon.leong.ong@intel.com>, 
 Voon Weifeng <weifeng.voon@intel.com>, 
 "Song, Yoong Siang" <yoong.siang.song@intel.com>, 
 Linus Walleij <linusw@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Magnus Karlsson <magnus.karlsson@intel.com>, 
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>, 
 Simon Horman <horms@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Eric Dumazet <edumazet@kernel.org>
Cc: Richard Genoud <richard.genoud@bootlin.com>, 
 Alastair D'Silva <alastair@d-silva.org>, Maxime Ripard <mripard@kernel.org>, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org, 
 ZhaoJinming <zhaojinming@uniontech.com>, 
 Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>, 
 Ding Hui <dinghui1111@163.com>, James Hilliard <james.hilliard1@gmail.com>, 
 linux-tegra@vger.kernel.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.15.2

If a network driver's system resume fails before phylink_resume(), the
network device can remain administratively up with phylink suspended.
Closing the interface then needs to terminate that suspended instance.
Calling phylink_resume() merely to make phylink_stop() work is not a
safe substitute: resume reconfigures the MAC and restarts link
resolution, although the driver has not successfully restored the MAC.

This is a missing suspend-to-stop transition, independent of the reason
hardware restoration failed. No MAC recovery policy belongs in phylink;
the driver still decides whether to retry resume or wait for an ordinary
administrative down/up cycle.

Without MAC Wake-on-LAN, phylink_suspend() has already called
phylink_stop(). Do not repeat PHY, SFP and PCS shutdown. However,
phylink_prepare_resume() may have powered that stopped PHY back up to
provide the receive clock for MAC reset. Suspend it again if WoL
permits, without repeating phy_stop() on a PHY which is already halted.

With MAC Wake-on-LAN, suspend deliberately defers mac_link_down() and
sets PHYLINK_DISABLE_MAC_WOL. Finish that deferred link-down, drain
resolution work and clear the WoL disable bit while retaining
PHYLINK_DISABLE_STOPPED. Otherwise a subsequent start cannot resolve the
link.

Also undo PHY speed control performed by phylink_suspend(). As Andrew
Lunn pointed out, phylink_start() does not restore the advertised speeds
that phylink_resume() normally restores. Track suspend-owned speed
control and restore the saved advertisement from either resume or
suspended stop, including when PHY shutdown has already completed.

An explicit driver speed-down request, such as stmmac's close-time power
saving, must remain in effect until its matching speed-up. Restore any
suspend-owned reduction before applying that request, so it cannot save
the reduced advertisement over the original one. The following stop must
not undo the driver's new reduction.

Document that a suspended instance can be stopped directly. This neither
resumes the PHY nor reconfigures or brings up the MAC.

Fixes: f97493657c63 ("net: phylink: add suspend/resume support")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/phy/phylink.c | 51 ++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 48 insertions(+), 3 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 1bbcf46c8356..b7d30ca34031 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -78,6 +78,7 @@ struct phylink {
 
 	bool link_failed;
 	bool suspend_link_up;
+	bool suspend_speed_down;
 	bool force_major_config;
 	bool major_config_failed;
 	bool mac_supports_eee_ops;
@@ -2498,6 +2499,14 @@ void phylink_start(struct phylink *pl)
 }
 EXPORT_SYMBOL_GPL(phylink_start);
 
+static void phylink_restore_suspend_speed(struct phylink *pl)
+{
+	if (pl->suspend_speed_down) {
+		phylink_speed_up(pl);
+		pl->suspend_speed_down = false;
+	}
+}
+
 /**
  * phylink_stop() - stop a phylink instance
  * @pl: a pointer to a &struct phylink returned from phylink_create()
@@ -2509,11 +2518,30 @@ EXPORT_SYMBOL_GPL(phylink_start);
  *
  * This will synchronously bring down the link if the link is not already
  * down (in other words, it will trigger a mac_link_down() method call.)
+ * A suspended instance may be stopped without first calling phylink_resume().
+ * In particular, closing a device after a failed resume must not restart the
+ * link or reconfigure the MAC just to finish shutting it down.
+ * Any PHY advertisement reduced by phylink_suspend() is restored as part
+ * of this transition.
+ * If phylink_prepare_resume() powered up an already stopped PHY, suspend
+ * it again when Wake-on-LAN permits.
  */
 void phylink_stop(struct phylink *pl)
 {
 	ASSERT_RTNL();
 
+	/* Also undo PHY speed control when terminating a suspended instance. */
+	phylink_restore_suspend_speed(pl);
+
+	if (test_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state)) {
+		/* A failed MAC resume may have called phylink_prepare_resume()
+		 * and powered the stopped PHY back up to supply its RX clock.
+		 */
+		if (pl->phydev)
+			phy_suspend(pl->phydev);
+		return;
+	}
+
 	if (pl->sfp_bus)
 		sfp_upstream_stop(pl->sfp_bus);
 	if (pl->phydev)
@@ -2526,6 +2554,16 @@ void phylink_stop(struct phylink *pl)
 
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
@@ -2657,8 +2695,10 @@ void phylink_suspend(struct phylink *pl, bool mac_wol)
 		phylink_stop(pl);
 	}
 
-	if (phylink_phy_pm_speed_ctrl(pl))
+	if (phylink_phy_pm_speed_ctrl(pl)) {
 		phylink_speed_down(pl, false);
+		pl->suspend_speed_down = true;
+	}
 }
 EXPORT_SYMBOL_GPL(phylink_suspend);
 
@@ -2698,8 +2738,7 @@ void phylink_resume(struct phylink *pl)
 {
 	ASSERT_RTNL();
 
-	if (phylink_phy_pm_speed_ctrl(pl))
-		phylink_speed_up(pl);
+	phylink_restore_suspend_speed(pl);
 
 	if (test_bit(PHYLINK_DISABLE_MAC_WOL, &pl->phylink_disable_state)) {
 		/* Wake-on-Lan enabled, MAC handling */
@@ -3616,6 +3655,12 @@ int phylink_speed_down(struct phylink *pl, bool sync)
 
 	ASSERT_RTNL();
 
+	/* An explicit request takes over from suspend-time speed control.
+	 * Restore the original advertisement before saving it again, so a
+	 * repeated speed-down cannot replace it with the reduced advertisement.
+	 */
+	phylink_restore_suspend_speed(pl);
+
 	if (!pl->sfp_bus && pl->phydev)
 		ret = phy_speed_down(pl->phydev, sync);
 

-- 
2.53.0

