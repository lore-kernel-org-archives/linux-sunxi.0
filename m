Received: from s2.avantea.pl (s2.avantea.pl [46.242.128.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603D92DAFBA;
	Sun, 16 Nov 2025 13:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.242.128.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763299262; cv=none; b=rMO12hZyzKIyA82cZM/W9bBxU4rg/ZSpeB/BOuO+CEwqD/0xsjvPjAJ8G8dCresjUt3PMBMG3/RryRP3UUeQ0ZOhpu+gxu26ufHpeb/Xbi96HpNWykK0j09FNp070mzwXJfsNClwbn8yXAvZmZpa/Utp4f2r9vImXPsoL3ZzuZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763299262; c=relaxed/simple;
	bh=TEr+ujnpLZapoxLfzFbhpfSVZDeusyh2Iu9mSJzQzWA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iJByhGjLguogvEPIJNUrpHrySRLqSWxSyMtBOabsrlg8Kg21NA49pOB1Hz5qPJ+L42GgfRNr+R/Wj2wFIPR0R/o3RnZt14kb06gUq99RAGWX5Rr6H4B/sddhEIhnzgMn5NkBWibZrHxMwT2OK3jgbCfKarKnO9qtQ/cp6bgRqXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=szczodrzynski.pl; spf=pass smtp.mailfrom=szczodrzynski.pl; dkim=pass (2048-bit key) header.d=szczodrzynski.pl header.i=@szczodrzynski.pl header.b=6UChbVw/; arc=none smtp.client-ip=46.242.128.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=szczodrzynski.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szczodrzynski.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=szczodrzynski.pl header.i=@szczodrzynski.pl header.b="6UChbVw/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=szczodrzynski.pl; s=x; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=xsxQS9uMu2ulj3kK3D36meG/HO1FCmilYNNF+TdhSOQ=; b=6UChbVw/2lffs3K5mwy8WYcLGi
	wNl/qURRl8EbLMAI/i5XS1UDgfWHXCUZ7Nz1BP64h33job7MvPEMxBJWywI6M75zO1XIGP6tn1Baf
	gJGBaihergzZC6S36FtLnHtMfO4kL05mPnMDLIFMrk43xqOciQvvzpmLP4IU6w3Rdx+bt82iG+6e8
	hRHiBZ+tG+Cj17f8hujzG75TaqDRnwDFEv2qcjrhzVUFmbfMuBzhGfRR54oW5cVlKEYN9Y+9IgkWl
	Ry37Ztct/zRFsc9LgBEwkM4RNhwXlKB1MLL9TRjxEi4tAim5STcMY5mIIlej1GYHW/vCtW+elUXJv
	OSnHWg1g==;
Received: from [62.171.184.96] (helo=buildhost.contaboserver.net)
	by s2.avantea.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <kuba@szczodrzynski.pl>)
	id 1vKcga-0000000FW4E-0cRY;
	Sun, 16 Nov 2025 14:20:56 +0100
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
Subject: [PATCH v2 3/6] drm/sun4i: Enable LVDS output on sun20i D1s/T113
Date: Sun, 16 Nov 2025 14:18:50 +0100
Message-Id: <20251116131853.440863-4-kuba@szczodrzynski.pl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251116131853.440863-1-kuba@szczodrzynski.pl>
References: <20250221161751.1278049-1-kuba@szczodrzynski.pl>
 <20251116131853.440863-1-kuba@szczodrzynski.pl>
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

