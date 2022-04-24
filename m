Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54862F2F
	for <linux-sunxi@lists.linux.dev>; Sun, 24 Apr 2022 16:26:47 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 0C8705C00D0;
	Sun, 24 Apr 2022 12:26:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Sun, 24 Apr 2022 12:26:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1650817607; x=1650904007; bh=X3
	nfO2+qIHZjcadT9+iWcXRozE5825pqSV9bZL4/rK0=; b=lnLxQOZUs/SwZDs0bf
	8NAIL+Am3ykLhS24HooBKFZTk10oUic8LAbPUpFA2ArjLfBiB/Rv+h3B3UOZRWL6
	fzBnn6NAtSVHU9kGaCyHlmayzG1fjgbCSzrHBZvhDRRJfC7sEk+SCaxR3YK1WUh7
	mp0RKC4OuXQbPgQdB5JyYfQEd56XZa6KpwCx18Od7rsg8fRAi9f4ptxfejh+K3Op
	cP8lJaxFJrx3uYyIDWHxFAu6wBU24xz9NwFXhjLHnFnbvkkw2N9P3UjNxlkmbI50
	psrVZOMKC9SOMCle6W5Wt4qfDZchBIvHkIJet/M2f4W3gZu+y89OZsTLXCInwlsZ
	nWhw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1650817607; x=1650904007; bh=X3nfO2+qIHZjcadT9+iWcXRozE5825pqSV9
	bZL4/rK0=; b=VfxMzzD6WOqJ64/v+5/0fC3oj6wkmgFbFWttPWa1UUL32B/kCIM
	OzpLFeSqE+p3z5cOtQ/QIdpPd+EcJTmAd7av8LsffRVR/G47OQwjyp3gIi2IEVgj
	7zVSlvbsxxwD0pyNUSnb8W751hNfybvAtDPt5PC6Bgcq6KXfu6zxz6O2RgdyM4rx
	EEKENuSpP/65ijOTNxGJgdXRgdzCvfGGgd4qDhfaQ+u0MBvMxUE+QLI3b7j0b9vi
	jEIbxHgQ7vnJzScpUscCDXeoJ/8zg4h4zPX3iOu6SW1QH5B1lT4bl617WLC0NMxS
	PeMRiv2wbS33tgO7WE2I756OaJ6Bhe67O0w==
X-ME-Sender: <xms:RnplYheclYa3Fbl7UjpLjwxP4hijGm0DGU0seuJ_rcvxd375Z-3AHw>
    <xme:RnplYvM7Gtf_Sx-hbzNAA52RYqeb0voUAHVDOyQf52vsVw5ouMLcSkgnqLpuHfac1
    wCyy9tZAX4HIrU-nA>
X-ME-Received: <xmr:RnplYqgwbB2kXY-5S-7ZZzQDpVVUIHgt4oRzeRrd7vLtnR3uO-GTiCqtx0nrmYyc-U_9_i94s-KaLlxmbmQmEf13A8poP5Oead465LWI8gAgKpwgweqKQNpsWewHMdX-uVLlJg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrtdelgddutddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepudekteeuudehtdelteevgfduvddvjefhfedulefgudevgeeghefg
    udefiedtveetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:RnplYq8Ti4o-VyJjzNEwqZhBSnYYXFOKmH7FKgNDJttvFlL-mQyAEg>
    <xmx:RnplYttffhRbcu5fDiEksjyiBTqg-KfNlFNt0lMSo3QeQO590t4v8A>
    <xmx:RnplYpEuuAy4xTQ--VPRFuvuP335Kssy1E6XJqyPZ1RulQH25JqFBg>
    <xmx:R3plYpEHa2MPfzxd1CovWdOSP4rGi0ksNpU3sykrhIDppLH0t4XpSw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 24 Apr 2022 12:26:46 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maxime Ripard <mripard@kernel.org>
Cc: Samuel Holland <samuel@sholland.org>,
	Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@linux.ie>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v3 06/14] sun4i/drm: engine: Add mode_set callback
Date: Sun, 24 Apr 2022 11:26:24 -0500
Message-Id: <20220424162633.12369-7-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220424162633.12369-1-samuel@sholland.org>
References: <20220424162633.12369-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jernej Skrabec <jernej.skrabec@gmail.com>

This optional callback is useful for setting properties which depends
only on current mode. Such properties are width, height and interlaced
output.

These properties are currently set in update layer callback for primary
plane which is less than ideal. More about that in follow up patches,
which will migrate that code to this newly defined callback.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

(no changes since v2)

Changes in v2:
 - Use Jernej's patches for mixer mode setting.

 drivers/gpu/drm/sun4i/sun4i_crtc.c   |  1 +
 drivers/gpu/drm/sun4i/sunxi_engine.h | 27 +++++++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_crtc.c b/drivers/gpu/drm/sun4i/sun4i_crtc.c
index 45d9eb552d86..c06d7cd45388 100644
--- a/drivers/gpu/drm/sun4i/sun4i_crtc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_crtc.c
@@ -146,6 +146,7 @@ static void sun4i_crtc_mode_set_nofb(struct drm_crtc *crtc)
 	struct sun4i_crtc *scrtc = drm_crtc_to_sun4i_crtc(crtc);
 
 	sun4i_tcon_mode_set(scrtc->tcon, encoder, mode);
+	sunxi_engine_mode_set(scrtc->engine, mode);
 }
 
 static const struct drm_crtc_helper_funcs sun4i_crtc_helper_funcs = {
diff --git a/drivers/gpu/drm/sun4i/sunxi_engine.h b/drivers/gpu/drm/sun4i/sunxi_engine.h
index 548710a936d5..ec8cf9b2bda4 100644
--- a/drivers/gpu/drm/sun4i/sunxi_engine.h
+++ b/drivers/gpu/drm/sun4i/sunxi_engine.h
@@ -9,6 +9,7 @@
 struct drm_plane;
 struct drm_device;
 struct drm_crtc_state;
+struct drm_display_mode;
 
 struct sunxi_engine;
 
@@ -108,6 +109,17 @@ struct sunxi_engine_ops {
 	 * This function is optional.
 	 */
 	void (*vblank_quirk)(struct sunxi_engine *engine);
+
+	/**
+	 * @mode_set
+	 *
+	 * This callback is used to set mode related parameters
+	 * like interlacing, screen size, etc. once per mode set.
+	 *
+	 * This function is optional.
+	 */
+	void (*mode_set)(struct sunxi_engine *engine,
+			 const struct drm_display_mode *mode);
 };
 
 /**
@@ -181,4 +193,19 @@ sunxi_engine_disable_color_correction(struct sunxi_engine *engine)
 	if (engine->ops && engine->ops->disable_color_correction)
 		engine->ops->disable_color_correction(engine);
 }
+
+/**
+ * sunxi_engine_mode_set - Inform engine of a new mode
+ * @engine:	pointer to the engine
+ * @mode:	new mode
+ *
+ * Engine can use this functionality to set specifics once per mode change.
+ */
+static inline void
+sunxi_engine_mode_set(struct sunxi_engine *engine,
+		      const struct drm_display_mode *mode)
+{
+	if (engine->ops && engine->ops->mode_set)
+		engine->ops->mode_set(engine, mode);
+}
 #endif /* _SUNXI_ENGINE_H_ */
-- 
2.35.1

