Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com [64.147.123.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600E13C26
	for <linux-sunxi@lists.linux.dev>; Thu, 22 Sep 2022 14:29:07 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailnew.west.internal (Postfix) with ESMTP id ECF1E2B05B41;
	Thu, 22 Sep 2022 10:29:03 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Thu, 22 Sep 2022 10:29:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1663856943; x=
	1663864143; bh=bqaynxS1Oq35hJTEKdYTdlLLZ2nj+HwILv/fqb4eFcY=; b=E
	Xm4TD96uPEjvzbl9Bgo3jchOSzniLjv6WvVeKzNq+KrHSj0x7Fb4Rfu4R5jp+rBZ
	FUCp6mwTIfBHtfzXoNBoVL70QwViadGBaYY1BxbbmpOZSzcLYUAYkWNQF9gVQ2nO
	0AWQmES9MybuTGvLxvsIX0PYdJiKEhIHUb2i0XehbOg2WwYYdNJLuSLjaDULzi6Z
	wQpcJvTUyxZ98V7lL5s6Dj+G08wVszEpkJv9k7cBhJjroNccdhwQgF2FtyvMG62B
	XZrkeMKImhq1QF+44Ra4xUbdvokScPEv8Q/gcdLWQNOGaUdpdGQPNIZAalhd9/xA
	+nGFpwGiQqvRkTpQjUl9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1663856943; x=
	1663864143; bh=bqaynxS1Oq35hJTEKdYTdlLLZ2nj+HwILv/fqb4eFcY=; b=0
	0mgSIZbPbgSgkmov/dQnkPbwt6QNMOnLlMNUPzoO/cXpvidbl1vmtnMt2E7lKEFM
	gsbooqz/C+HmsaXeG9DshL+GHSGFQ3Spa2N02rAqb2qVE9qws5Mp+aowiBtIB+Ei
	mTRc0+sWxsR2wFon6gGSKfnXqmZPcEcHqwQaMUvVxTJI1uKbC88KF8fGcBFn36Xv
	aYdb+qkmYYXy1KpBPuMuNiDHFeUXWjYI9nNwFIBqIVP2SpsexIqrxQaM8QY6xsHt
	E838+OF3obmFoh0Np3drZJeOpL4Bvy4w2tJhb5jcIsyJZ3Sm2SkaYLWR9qo6XAwq
	5678YXV37iBaV6ul2qCKw==
X-ME-Sender: <xms:L3EsY1lKyKkitqwLFDbai3ingsorAopt5zugiKRuCnAfvl4kWOlQOQ>
    <xme:L3EsYw26FT0e5R6mJ5ufQT_T9fnPCcAMWzS1gH2Cxpn-0E4naDiIdZ1SvmS-m9NLC
    nN1V_2IsoDsh5MR58c>
X-ME-Received: <xmr:L3EsY7o9xEgisa-JrJhbKt5PYhEL-pnBrAZBI26GKT8DTtZZSmyS6DLjuo8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeefgedgudejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufgggfgtkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvdfgveejhfdtteevvefhleeiueeutefgvdegveekgedujeffgeffgfet
    tdellefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:L3EsY1nQXsOfP0wmtrmrZA4e0qNjLXJeTimMsTwwkLZlX9npIOJTMg>
    <xmx:L3EsYz1w3tpBhDVcSRmAPtLVGt93VdpRskCLloodJlb5LmMEP_3zFA>
    <xmx:L3EsY0s0r-jk6qKkjGfahLE9XHQ-_Ka6TPTZLGdX2eaEGPdriCUGKQ>
    <xmx:L3EsYyB_Jdsre2xSN_kEeqDphODeJRD5eOtMpzbzNdUt7c0Edp1WMZTkAC8>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Sep 2022 10:29:01 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 22 Sep 2022 16:25:46 +0200
Subject: [PATCH v2 29/33] drm/vc4: vec: Use TV Reset implementation
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v2-29-f733a0ed9f90@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1454; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=B5ugvjxaRYF46qAXVJXIzpYiW47aK3hZcW0sYJuF1G8=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk6BYFHVy4w1tki+Sy67+cb0RrLWX9UhVW/l7s+O3UhOksk
 L/dKRykLgxgXg6yYIkuMsPmSuFOzXney8c2DmcPKBDKEgYtTACZyvYXhf/JvF6s4Eb4drya/nTvl7B
 PrBn25bYdq1GrTn7lzBTFtmsPwT5Fvupb942dP2pn1Rb97Mb5s7Q6NrQ6LV58XHarx9VMPDwA=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The analog TV properties created by the drm_mode_create_tv_properties() are
not properly initialised at reset. Let's switch our implementation to call
drm_atomic_helper_connector_tv_reset().

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index 5ec3a12359b1..baa29067a1ff 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -268,6 +268,12 @@ vc4_vec_connector_detect(struct drm_connector *connector, bool force)
 	return connector_status_unknown;
 }
 
+static void vc4_vec_connector_reset(struct drm_connector *connector)
+{
+	drm_atomic_helper_connector_reset(connector);
+	drm_atomic_helper_connector_tv_reset(connector);
+}
+
 static int vc4_vec_connector_get_modes(struct drm_connector *connector)
 {
 	struct drm_connector_state *state = connector->state;
@@ -288,7 +294,7 @@ static int vc4_vec_connector_get_modes(struct drm_connector *connector)
 static const struct drm_connector_funcs vc4_vec_connector_funcs = {
 	.detect = vc4_vec_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.reset = drm_atomic_helper_connector_reset,
+	.reset = vc4_vec_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };

-- 
b4 0.10.0
