Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com [64.147.123.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8681F3C26
	for <linux-sunxi@lists.linux.dev>; Thu, 22 Sep 2022 14:29:15 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailnew.west.internal (Postfix) with ESMTP id 60AD92B05B42;
	Thu, 22 Sep 2022 10:29:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 22 Sep 2022 10:29:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1663856951; x=
	1663864151; bh=a0B4b9odzBRPdDXC/syLESeWmwxTaesfuTcxlPyeaA8=; b=H
	NNzoj7vbwIrsMBcGQ0ZQohcqX0m7r97HkxhS1vOYTk/LBCwo3zh743FTDT1HaP5n
	yIETIMw0x6XLUMy+HwKuH0hXugA3mxCZEXU4piZt418UsQsyBJyjj1wAkEuzRpc9
	vAvoqEJHhYjbwWq1HCOXQQXf0Hn+UaHAhQXz3eC+CPLyKDBII6Fkwuqeel1lBuQQ
	vEpYsr9LwkrVtxU5zKcEUztjzzdhKucUUvHKnPBktmyXHZjzWl+mFsrdV8e1/fdb
	9XBkuytVMUNwHQe7K0xYF73YMn6hzWdrxHPnB9xGGmryWWaLYiMkZZU6XA3x07jd
	syRKfITbibn7tmkUyMUyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1663856951; x=
	1663864151; bh=a0B4b9odzBRPdDXC/syLESeWmwxTaesfuTcxlPyeaA8=; b=N
	Uk/pIXQJQu0ZaZiqlSTOcp/OvjRwP6BPO0TlamPPOCY6VTS79tzeuWJHuzjcqhGC
	+rL96q5Unn6UYKIhpANUsNQFAGd6H7aKsYuFbwo/M3+LTP4ZJicjfQwFIBGh2QRy
	WOUBIyn7qA+gLwv6j/330k6yM/ypLB4jSuaC8bj5MPB5MC2Sm6RPxZbSmpJS7KuL
	IaXDsH9Om35pmfgXWSmNcLpATDvs8wld+QfBUGQhgrn0/otwM2EHqN2TIR2A0F0e
	FTdiPJgPe5NhFsd+VNBS4hWDL0kyLFvwRzJWUHat1+sUO6a5bzRjGNg4Vm1nIOLH
	ECRYw22eSi0Pp/x6KRYMQ==
X-ME-Sender: <xms:N3EsY5Yk12XynEMPHOBwSjKBTz_xMIrU7vflIEzpKXNNEU2BV1FJCQ>
    <xme:N3EsYwZ0t73-i2kbxSG1Q_jynD-9pGPE-K5UcSitVGW7_erWmu0kzL15rZ8foSRCL
    BBw7Ux0xxeW9V593sg>
X-ME-Received: <xmr:N3EsY78iQrpMrPzmKHOQuVq5iQN9-6CbL0Y7KbAHWhCYTRny7yKlZqtWYfQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeefgedgudejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepudduudfhveejteefgedvffdvvedvjedugedukeejhedtlefhffevtefh
    jeeltdevnecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:N3EsY3rRV6gNigqN8FqiKBoajm1RD-K9KGt93ut2mFvN1szrFywp3w>
    <xmx:N3EsY0qRU7i2ldjV9xd44uZUrgJedQft9HtQYMtllhie9YesMY5AjA>
    <xmx:N3EsY9T0Oy2Ycort3NUFboSgCzAw_yyLQGuX_FlClY6u58E0O6ib-w>
    <xmx:N3EsY_Vd2rxI2vowOIsz-0__lWxv0czv-ycFKW_P6Ed3WNg4wimOwGEe58w>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Sep 2022 10:29:10 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 22 Sep 2022 16:25:47 +0200
Subject: [PATCH v2 30/33] drm/vc4: vec: Check for VEC output constraints
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220728-rpi-analog-tv-properties-v2-30-f733a0ed9f90@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech>
To: Jernej Skrabec <jernej.skrabec@gmail.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Ben Skeggs <bskeggs@redhat.com>,
 David Airlie <airlied@linux.ie>, Maxime Ripard <mripard@kernel.org>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Emma Anholt <emma@anholt.net>, Karol Herbst <kherbst@redhat.com>, Samuel Holland <samuel@sholland.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 Lyude Paul <lyude@redhat.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Chen-Yu Tsai <wens@csie.org>
Cc: Hans de Goede <hdegoede@redhat.com>, nouveau@lists.freedesktop.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>, intel-gfx@lists.freedesktop.org, Noralf Trønnes <noralf@tronnes.org>,
 Dom Cobley <dom@raspberrypi.com>, linux-sunxi@lists.linux.dev, Maxime Ripard <maxime@cerno.tech>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, dri-devel@lists.freedesktop.org
X-Mailer: b4 0.10.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2156; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=rft+zeCfJDk1ujED/+8Q5b6Ac7Wf2ehimxyM529KH5c=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk6BYFMYa4LTEJ3BC4VXaP+ib+E07lOTvnrfaU8hahDfvud
 eK07SlkYxLgYZMUUWWKEzZfEnZr1upONbx7MHFYmkCEMXJwCMBGv+YwMszo3cubUf3//d2rWG5vCLs
 2JSmy/bxYffNnw9GqSt6hUH8P/LAU5rzdGT+tathge3b/JsdXGKsb9cuAV+XelnwI2TTnGAAA=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>

The VEC can accept pretty much any relatively reasonable mode, but still
has a bunch of constraints to meet.

Let's create an atomic_check() implementation that will make sure we
don't end up accepting a non-functional mode.

Signed-off-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index baa29067a1ff..6828b79a1001 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -453,6 +453,7 @@ static int vc4_vec_encoder_atomic_check(struct drm_encoder *encoder,
 					struct drm_crtc_state *crtc_state,
 					struct drm_connector_state *conn_state)
 {
+	const struct drm_display_mode *mode = &crtc_state->adjusted_mode;
 	const struct vc4_vec_tv_mode *vec_mode;
 
 	vec_mode = &vc4_vec_tv_modes[conn_state->tv.legacy_mode];
@@ -461,6 +462,53 @@ static int vc4_vec_encoder_atomic_check(struct drm_encoder *encoder,
 	    !drm_mode_equal(vec_mode->mode, &crtc_state->adjusted_mode))
 		return -EINVAL;
 
+	if (mode->crtc_hdisplay % 4)
+		return -EINVAL;
+
+	if (!(mode->crtc_hsync_end - mode->crtc_hsync_start))
+		return -EINVAL;
+
+	switch (mode->vtotal) {
+	case 525:
+		if (mode->crtc_vtotal > 262)
+			return -EINVAL;
+
+		if (mode->crtc_vdisplay < 1 || mode->crtc_vdisplay > 253)
+			return -EINVAL;
+
+		if (!(mode->crtc_vsync_start - mode->crtc_vdisplay))
+			return -EINVAL;
+
+		if ((mode->crtc_vsync_end - mode->crtc_vsync_start) != 3)
+			return -EINVAL;
+
+		if ((mode->crtc_vtotal - mode->crtc_vsync_end) < 4)
+			return -EINVAL;
+
+		break;
+
+	case 625:
+		if (mode->crtc_vtotal > 312)
+			return -EINVAL;
+
+		if (mode->crtc_vdisplay < 1 || mode->crtc_vdisplay > 305)
+			return -EINVAL;
+
+		if (!(mode->crtc_vsync_start - mode->crtc_vdisplay))
+			return -EINVAL;
+
+		if ((mode->crtc_vsync_end - mode->crtc_vsync_start) != 3)
+			return -EINVAL;
+
+		if ((mode->crtc_vtotal - mode->crtc_vsync_end) < 2)
+			return -EINVAL;
+
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
 	return 0;
 }
 

-- 
b4 0.10.0
