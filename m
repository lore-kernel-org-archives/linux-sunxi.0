Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com [66.111.4.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD7EA44
	for <linux-sunxi@lists.linux.dev>; Thu, 29 Sep 2022 16:31:55 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailnew.nyi.internal (Postfix) with ESMTP id 67D125807D7;
	Thu, 29 Sep 2022 12:31:54 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Thu, 29 Sep 2022 12:31:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1664469114; x=
	1664476314; bh=HeTs54yGfJcuWDWpIXgjp2EtWnqzAACladqtoOYJ5Iw=; b=4
	QsN+ZEY8mWRq9g5Pd0t02kHb883t7D1L9vgNNQkGeY/UrWbF0IdD8C69/+/8lRzT
	MrMzqAjRukrzydlOIEWvyQuSw1KjUB2QRJUF+Ho/duMia4xZeCf4VvRqgZZ7aqCf
	2lD59wWEXrbRjalGgGUtTD2V61W0mFiiP7cv+giLpp7ElAgaM9yzzRUPxwMOqcfU
	xyWAgp3+SDx6YKBu/vNohqDBXaYX9wri07XDL98Zb+pgwIrjWshA/V2ZldhOncER
	EvuiSNHXbBuaQQtDl6ByODy934f6DxEKqgOAFPzCNIkJm+SkZbl5BSQ+tKI250wq
	0r4PZunDQZCkyoigi9qdw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1664469114; x=
	1664476314; bh=HeTs54yGfJcuWDWpIXgjp2EtWnqzAACladqtoOYJ5Iw=; b=L
	D76K3Q9nYZXFKsXc+LlE5WUbuFtNG9iZrUY/2C5aferzPmcQq6Cnc/Dp56nw/zIH
	gWCJRMNcpRUJ0Wa/aOC03E7sqZLLbFQWwrDmm0ked8uC8bZl1ym1qLP9Wkr44bP6
	fsqyfcPQqxpeypTxvq/F9OwfnaCMMj2y1VoedgrMUH5n5qHhNkGwPwVJ/bfx4V5f
	irfDc302f39SQ4P82R/n0HVYj96tAF+Q1iIhC95h6PXa+UsPi4cGG/SIAol4WPLu
	upklcywQQlBzYnXZwB7o+/TFZRdq5nDCgVOay8qlAuMuUX4B+o38JTyvGiQXhozB
	YwfE59lvip5R8l+xj51qg==
X-ME-Sender: <xms:dMg1YyXhv8FhwEcPiUVTIjRUWW-gLeFzjA3hM4j_jLL-RKJV9U7zOQ>
    <xme:dMg1Y-k2DM8YkdSZr-p1aFNIR_oPq50f4DlvDQfsn1txfElAWfsu2SyR8jpO9YTtL
    PMlT94jHqjjI08Ww_o>
X-ME-Received: <xmr:dMg1Y2YPtcX6BGMoYrPpPpo0alXPOjXtUK_YVx0UlTMvG0UKFyLSH2A4xTzS>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeehtddguddtvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgr
    gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
    frrghtthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveet
    hfejledtveenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:dcg1Y5We2MTwL62OSf7TOH7zIqB5vPhmjPR4fWf6mrzqQ2avo46_bg>
    <xmx:dcg1Y8knVRKDHn2Ewrp6E52DgtGPAFvxi3ul0Y4pQJUOjKhrngE44w>
    <xmx:dcg1Y-ciM8yVpfoWlIGwz-cwu0eF0A4tjgC6FSr40Ho9Aa-DG7DJQA>
    <xmx:esg1Y4zl5ss7RNqLpmkq-fdN0A7XnH4SWxBcigvdx8quKt0FUMQrlw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Sep 2022 12:31:48 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 29 Sep 2022 18:31:11 +0200
Subject: [PATCH v4 17/30] drm/modes: Fill drm_cmdline mode from named modes
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220728-rpi-analog-tv-properties-v4-17-60d38873f782@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v4-0-60d38873f782@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v4-0-60d38873f782@cerno.tech>
To: Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Karol Herbst <kherbst@redhat.com>,
 Samuel Holland <samuel@sholland.org>, Lyude Paul <lyude@redhat.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, intel-gfx@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 Hans de Goede <hdegoede@redhat.com>, nouveau@lists.freedesktop.org, Noralf Trønnes <noralf@tronnes.org>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>,
 linux-kernel@vger.kernel.org, Dom Cobley <dom@raspberrypi.com>, Phil Elwell <phil@raspberrypi.com>
X-Mailer: b4 0.11.0-dev-7da52
X-Developer-Signature: v=1; a=openpgp-sha256; l=1755; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=eK4mvg+/Vgt1Y5yuflrP/Rh+1orwahkzuADXYnjtlew=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmmJ9yZNkXNjzfasnf7gxTVWxOv+PG6JAb5mwbE97ey/Bdx
 W3G6o5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABOZ/IeR4ZmQzZq0NR9c921YdaJpyf
 cFcVIMZzbXr3HcYJIRVVSz7hEjw7kVmuEFjSXsOpVhX7XFvuq47J74ZvPvvbVb47n1Pl85xQ4A
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The current code to deal with named modes will only set the mode name, and
then it's up to drivers to try to match that name to whatever mode or
configuration they see fit.

The plan is to remove that need and move the named mode handling out of
drivers and into the core, and only rely on modes and properties. Let's
start by properly filling drm_cmdline_mode from a named mode.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_modes.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index 7ed3fb839db7..99453aca9a83 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -2226,11 +2226,22 @@ static int drm_mode_parse_cmdline_options(const char *str,
 
 struct drm_named_mode {
 	const char *name;
+	unsigned int xres;
+	unsigned int yres;
+	unsigned int flags;
 };
 
+#define NAMED_MODE(_name, _x, _y, _flags)		\
+	{						\
+		.name = _name,				\
+		.xres = _x,				\
+		.yres = _y,				\
+		.flags = _flags,			\
+	}
+
 static const struct drm_named_mode drm_named_modes[] = {
-	{ "NTSC", },
-	{ "PAL", },
+	NAMED_MODE("NTSC", 720, 480, DRM_MODE_FLAG_INTERLACE),
+	NAMED_MODE("PAL", 720, 576, DRM_MODE_FLAG_INTERLACE),
 };
 
 static int drm_mode_parse_cmdline_named_mode(const char *name,
@@ -2275,6 +2286,9 @@ static int drm_mode_parse_cmdline_named_mode(const char *name,
 			continue;
 
 		strcpy(cmdline_mode->name, mode->name);
+		cmdline_mode->xres = mode->xres;
+		cmdline_mode->yres = mode->yres;
+		cmdline_mode->interlace = !!(mode->flags & DRM_MODE_FLAG_INTERLACE);
 		cmdline_mode->specified = true;
 
 		return 1;

-- 
b4 0.11.0-dev-7da52
