Received: from s2.avantea.pl (s2.avantea.pl [46.242.128.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249E82D838B;
	Sun, 16 Nov 2025 13:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.242.128.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763300931; cv=none; b=tngT7mhUTYvOBK+K8lyWZu2yCB418B5CQkpkybHLrn/+kcVCyLFMNTzuS2ZI5Ks+wvlD2UnsQfCs6+A9K3idSEfv4C2jDNvboBj9kIK+OfQ2WYCdTZhOzKVwN+T7fl2Fnvm8Nsu7AQ8v5OTRBJa8XNY8c2CjyL0gPwVaMJcCL3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763300931; c=relaxed/simple;
	bh=TEr+ujnpLZapoxLfzFbhpfSVZDeusyh2Iu9mSJzQzWA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qrbHDORONUVEUiQWdFL3Zb9a0grcrHaC70uzGZ647wqXecDe3bj5J/EfZ2NNRxPkDSRx/S7rmxxcJ/9n0GLc510ebei7VcVYFydKFiOa/uiZKQi9VbGZTbIk1qzBCwLOGwQnDNU8psB/+kId+GaqOjtaCMl/0EImHI8jREq18s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=szczodrzynski.pl; spf=pass smtp.mailfrom=szczodrzynski.pl; dkim=pass (2048-bit key) header.d=szczodrzynski.pl header.i=@szczodrzynski.pl header.b=uM3oxU8f; arc=none smtp.client-ip=46.242.128.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=szczodrzynski.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szczodrzynski.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=szczodrzynski.pl header.i=@szczodrzynski.pl header.b="uM3oxU8f"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=szczodrzynski.pl; s=x; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=xsxQS9uMu2ulj3kK3D36meG/HO1FCmilYNNF+TdhSOQ=; b=uM3oxU8f2UEcgSSoKB30Yri+pI
	qxJkxjqM8QzxIg/gUJTG7m+7XkqL0APmwByGqRbNF9Hc1inYgAa7y+cQrmniRs/8dA3g601Rzhinn
	ml3/LANfdSZDo//IUPNcf6FqRXoPCHrWeHBfB0tHuQJcNqFEYOnWjgSRrGCGayOTcqfejxXq7Hcz3
	kkcELdrGdtOEe0pTNcMUFNYHYyY5W2JuDgUYyytx+3IaShchEHfpdkX9GL4XzJe+vgIs5ED1PzUlT
	RTMJr87j/D0aLEFpZoL1x2yEd8xeS5/DbdFYSfzxtR0izAi1oqlyUK0gUT4M6kjA7UW345KUqgxRP
	1KHdbRyw==;
Received: from [62.171.184.96] (helo=buildhost.contaboserver.net)
	by s2.avantea.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <kuba@szczodrzynski.pl>)
	id 1vKd7P-0000000FXPf-0iOX;
	Sun, 16 Nov 2025 14:48:39 +0100
From: =?UTF-8?q?Kuba=20Szczodrzy=C5=84ski?= <kuba@szczodrzynski.pl>
To: Maxime Ripard <mripard@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	parthiban@linumiz.com,
	paulk@sys-base.io
Subject: [PATCH v3 3/6] drm/sun4i: Enable LVDS output on sun20i D1s/T113
Date: Sun, 16 Nov 2025 14:48:35 +0100
Message-Id: <20251116134835.447357-1-kuba@szczodrzynski.pl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251116134609.447043-1-kuba@szczodrzynski.pl>
References: <20251116134609.447043-1-kuba@szczodrzynski.pl>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: kuba@szczodrzynski.pl

The Allwinner D1s/T113 needs to use the combo D-PHY to enable LVDS
output.

Enable LVDS support in the TCON and configure it using the PHY.

Abort PHY setup/teardown early if it fails.

Signed-off-by: Kuba Szczodrzyński <kuba@szczodrzynski.pl>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 38 ++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 247400785..e072ecc6d 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -171,6 +171,40 @@ static void sun6i_tcon_setup_lvds_phy(struct sun4i_tcon *tcon,
 			  SUN6I_TCON0_LVDS_ANA0_EN_DRVD(val));
 }
 
+static void sun20i_tcon_setup_lvds_dphy(struct sun4i_tcon *tcon,
+					const struct drm_encoder *encoder)
+{
+	union phy_configure_opts opts = { };
+
+	if (!tcon->quirks->has_combo_dphy || !tcon->dphy)
+		return;
+
+	if (phy_init(tcon->dphy))
+		return;
+
+	if (phy_set_mode(tcon->dphy, PHY_MODE_LVDS))
+		return;
+
+	if (phy_configure(tcon->dphy, &opts))
+		return;
+
+	if (phy_power_on(tcon->dphy))
+		return;
+}
+
+static void sun20i_tcon_teardown_lvds_dphy(struct sun4i_tcon *tcon,
+					  const struct drm_encoder *encoder)
+{
+	if (!tcon->quirks->has_combo_dphy || !tcon->dphy)
+		return;
+
+	if (phy_power_off(tcon->dphy))
+		return;
+
+	if (phy_exit(tcon->dphy))
+		return;
+}
+
 static void sun4i_tcon_lvds_set_status(struct sun4i_tcon *tcon,
 				       const struct drm_encoder *encoder,
 				       bool enabled)
@@ -1550,8 +1584,12 @@ static const struct sun4i_tcon_quirks sun9i_a80_tcon_tv_quirks = {
 
 static const struct sun4i_tcon_quirks sun20i_d1_lcd_quirks = {
 	.has_channel_0		= true,
+	.has_combo_dphy		= true,
+	.supports_lvds		= true,
 	.dclk_min_div		= 1,
 	.set_mux		= sun8i_r40_tcon_tv_set_mux,
+	.setup_lvds_phy		= sun20i_tcon_setup_lvds_dphy,
+	.teardown_lvds_phy	= sun20i_tcon_teardown_lvds_dphy,
 };
 
 /* sun4i_drv uses this list to check if a device node is a TCON */
-- 
2.25.1

