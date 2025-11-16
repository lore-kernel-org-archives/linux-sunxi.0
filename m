Received: from s2.avantea.pl (s2.avantea.pl [46.242.128.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DF42EAB6E;
	Sun, 16 Nov 2025 13:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.242.128.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763300914; cv=none; b=YrDZnGhJM3zZ9QjP+0Kju5W79f2anktnTA/ffMwllJb4/2I1NWtMFPeWEBokUYQCNdAUlxKX9sksfQSxbBtCDFkwQ9spvV0uipY+gpqdjH4QX+DEfTdRUfU6xj7wJOtSYeIuNK+1JzA70+XK5tqMTQrzCu4BwH6EEjsW+31GRMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763300914; c=relaxed/simple;
	bh=fz8fUcTjwBz+58mze8lroRkBxKWZWRoYijIJuiuabfU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vz+AZkbaqsTmfTh6XWW9JQYr88rsjFCNf1dD2iYh76ZJZ7GEoJsHY6EFhPKnzlOVZtghh78SzlQI4qPeZFsH1yRQrFKe/UA9rgoSP/WorpAN4GcEsQOstwk0La74NPn5b2S/3u1CKNPNU05s9Z44Fb4QfezREO6LscMcLacSNww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=szczodrzynski.pl; spf=pass smtp.mailfrom=szczodrzynski.pl; dkim=pass (2048-bit key) header.d=szczodrzynski.pl header.i=@szczodrzynski.pl header.b=vmNalNjf; arc=none smtp.client-ip=46.242.128.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=szczodrzynski.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szczodrzynski.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=szczodrzynski.pl header.i=@szczodrzynski.pl header.b="vmNalNjf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=szczodrzynski.pl; s=x; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=AnluJ6Mta9yYcmtq3aOb9bOnNMSPyiKv709+YjBCRsY=; b=vmNalNjfG+z3PNdpOoQ5ip9Eas
	7XMmR+waCSwCZOHwa6EECAbFYPGNTicbyAkCAAasLQTeNDRmPkUxO1vJ/lNQbSQ3YAc2fdIUAAjDa
	k5lMuc3LuK1ioLmUz1xM490yb0CnRKcgwkqF1kKVU8fsRZrRLR4jxKDh+A0HxrCvu2bJwk6M/ok9q
	DxVa934oFRRjsas1CDniLrbmQakKsb6VxRcHfrhkIGNiosZ/uVQEMySntgDuAjTPpKJmuk3HZ/6yo
	sC60wT6EOb1PdXaoJeJ+RWj4nsekYAaGab09cKt7IVu5cB1x+pcI+h6oSeU5Q53FSksx9tNx7KFSR
	wN1Gc8hg==;
Received: from [62.171.184.96] (helo=buildhost.contaboserver.net)
	by s2.avantea.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <kuba@szczodrzynski.pl>)
	id 1vKd7C-0000000FXPA-2jbh;
	Sun, 16 Nov 2025 14:48:26 +0100
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
Subject: [PATCH v3 2/6] drm/sun4i: Support LVDS using MIPI DSI combo D-PHY
Date: Sun, 16 Nov 2025 14:48:21 +0100
Message-Id: <20251116134821.447272-1-kuba@szczodrzynski.pl>
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

On Allwinner chips with a combo D-PHY, the TCON LCD0 should fetch it
from device tree in order to enable LVDS. Since the PHY also needs to
be powered off to disable LVDS, add a function to the quirks.

Signed-off-by: Kuba Szczodrzyński <kuba@szczodrzynski.pl>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 12 ++++++++++++
 drivers/gpu/drm/sun4i/sun4i_tcon.h |  6 ++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 960e83c82..247400785 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -12,6 +12,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
+#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
@@ -183,6 +184,8 @@ static void sun4i_tcon_lvds_set_status(struct sun4i_tcon *tcon,
 	} else {
 		regmap_update_bits(tcon->regs, SUN4I_TCON0_LVDS_IF_REG,
 				   SUN4I_TCON0_LVDS_IF_EN, 0);
+		if (tcon->quirks->teardown_lvds_phy)
+			tcon->quirks->teardown_lvds_phy(tcon, encoder);
 	}
 }
 
@@ -1245,6 +1248,15 @@ static int sun4i_tcon_bind(struct device *dev, struct device *master,
 		goto err_free_dclk;
 	}
 
+	if (tcon->quirks->has_combo_dphy) {
+		tcon->dphy = devm_phy_get(dev, "combo-phy");
+		if (IS_ERR(tcon->dphy)) {
+			dev_err(dev, "Couldn't get the combo D-PHY\n");
+			ret = PTR_ERR(tcon->dphy);
+			goto err_free_dclk;
+		}
+	}
+
 	if (tcon->quirks->has_channel_0) {
 		/*
 		 * If we have an LVDS panel connected to the TCON, we should
diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.h b/drivers/gpu/drm/sun4i/sun4i_tcon.h
index fa23aa23f..82b65a2e6 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.h
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.h
@@ -239,6 +239,7 @@ struct sun4i_tcon_quirks {
 	bool	has_channel_0;	/* a83t does not have channel 0 on second TCON */
 	bool	has_channel_1;	/* a33 does not have channel 1 */
 	bool	has_lvds_alt;	/* Does the LVDS clock have a parent other than the TCON clock? */
+	bool	has_combo_dphy; /* Is the D-PHY used for LVDS output? */
 	bool	needs_de_be_mux; /* sun6i needs mux to select backend */
 	bool    needs_edp_reset; /* a80 edp reset needed for tcon0 access */
 	bool	supports_lvds;   /* Does the TCON support an LVDS output? */
@@ -250,6 +251,8 @@ struct sun4i_tcon_quirks {
 	/* handler for LVDS setup routine */
 	void	(*setup_lvds_phy)(struct sun4i_tcon *tcon,
 				  const struct drm_encoder *encoder);
+	void	(*teardown_lvds_phy)(struct sun4i_tcon *tcon,
+				     const struct drm_encoder *encoder);
 };
 
 struct sun4i_tcon {
@@ -282,6 +285,9 @@ struct sun4i_tcon {
 	/* Associated crtc */
 	struct sun4i_crtc		*crtc;
 
+	/* Associated D-PHY */
+	struct phy			*dphy;
+
 	int				id;
 
 	/* TCON list management */
-- 
2.25.1

