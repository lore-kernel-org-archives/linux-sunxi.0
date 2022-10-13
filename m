Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com [66.111.4.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBEA82C9C
	for <linux-sunxi@lists.linux.dev>; Thu, 13 Oct 2022 13:19:42 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailnew.nyi.internal (Postfix) with ESMTP id E6DA4580361;
	Thu, 13 Oct 2022 09:19:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 13 Oct 2022 09:19:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1665667181; x=
	1665674381; bh=z0OXWHl7ZXnpGXDQYtwuUl6hXegl5+VuHozOBqRQcks=; b=E
	S71f/Pd/dH8o4OCP2chnUqrw8qCzfsZdtoO1mvXoj3JnnuxAx5NiFM1+SlqaHKWy
	zwredet+geEiUeO1Es6HQ5xHamyAIGzwMbgejJ4OQFGOS+z1IR/B7KOZzN1/BwjF
	XIOUn2NwqbZ3gIjMzegcJ2uZpZr9BV04dfIPVggHWB831XAe+4qye2VEJ3G9Y4O8
	2iHrgEi0I+vHnxpu9h0T5IW33TFjKItzlbrn8HFwyHIDxq5JbV1Dos5RvR4qevN3
	0vkcPEay9uN5ku1qeQKCJYAaB+9bHzA7Gs6tJWmtPcXAxnsoA4useYsh/nRxrq+J
	jYmndD+ygF3uWGVenzTLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1665667181; x=
	1665674381; bh=z0OXWHl7ZXnpGXDQYtwuUl6hXegl5+VuHozOBqRQcks=; b=A
	sEJ5xjAFmEkcasfih3XIEwaQofxaQ6/MmCO37MYEOwNWxzOhCYugCOflJADlcBVx
	FzzWb/+/B83Y2CAZ+yhClwOWFNBATpDcvBZCDbOVkrKblupOOUaQIrtDLEmt6PAY
	mlByQgpzP8xXX2P9STkC+QytyPd4zEb1e+oCo9czkcBP3hLgnZlAGxzFlMbAwXb/
	Tw8FhmeDLS97+pnazKl/+626u4mzKLOPQIDp86FxA0DcxHnA+2JqetuwsgVgBMbL
	PjSdyl0w1SaV8W8pdlDKvKJE/82+0TykThsMbvoz07z0PKYEtuf3ikjoOMB67n1i
	9hh/psx48nGVWTUNjbhvw==
X-ME-Sender: <xms:bRBIYxWRHorHDtPxOYXLlno2KEi4b_HF-5iWmeIy_YAYexX1pOei3w>
    <xme:bRBIYxnAroIUpDVgpGFr1s6TSZy2MA2ibdJlo9b4vThy6SnWMudrTorVyFlFRPvj-
    3jBlKpLEPrrtyqmhT4>
X-ME-Received: <xmr:bRBIY9aYamGEH1bz4068SOyfxpd0LO0hxPknZvIIWpVKE2rvnvKVGUZTSHwxAs5MPhaUl8KabvUmuX9pSc8cK51BQTNyM6PfK8xT>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeektddgieehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufgggfgtkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvdfgveejhfdtteevvefhleeiueeutefgvdegveekgedujeffgeffgfet
    tdellefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:bRBIY0XD3v0xHqjDGiSL7ovXvOB-cc5BK8wWudbGy3moNv4NSOT_Pw>
    <xmx:bRBIY7nmKFFqwLwJiR_mFVUkKF876obwaF81hDMQOm8oMJwRwpOcTQ>
    <xmx:bRBIYxcPJ-_q7wRUea6GkaGvjtDl-aJFIh7w0CoWMQZAxgB0WQCWGw>
    <xmx:bRBIY_yNBjVIqFaNmMlqIEK3iTZqr3BGcAZ71sGrCV5yMDBe8dSMCg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Oct 2022 09:19:41 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 13 Oct 2022 15:19:02 +0200
Subject: [PATCH v5 18/22] drm/vc4: vec: Use TV Reset implementation
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v5-18-d841cc64fe4b@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v5-0-d841cc64fe4b@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v5-0-d841cc64fe4b@cerno.tech>
To: Karol Herbst <kherbst@redhat.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, David Airlie <airlied@linux.ie>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Lyude Paul <lyude@redhat.com>, Maxime Ripard <mripard@kernel.org>,
 Emma Anholt <emma@anholt.net>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Ben Skeggs <bskeggs@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Dom Cobley <dom@raspberrypi.com>, Maxime Ripard <maxime@cerno.tech>, linux-sunxi@lists.linux.dev,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, Noralf Trønnes <noralf@tronnes.org>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-arm-kernel@lists.infradead.org, Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 dri-devel@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>, Phil Elwell <phil@raspberrypi.com>
X-Mailer: b4 0.11.0-dev-7da52
X-Developer-Signature: v=1; a=openpgp-sha256; l=1563; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=6QTCuhxSwU/zFGvIlKtnq3tv/dSlBBSEnBrOyUAJMx8=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMkeAu7LnLN5bn/Nv/g//Am7HfduD48t51q+6ib6Hn/GpLVz
 seDnjlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEwk14ORYcsNf6nad0adDRPFtp6rk1
 wh/a7hsz7Tbv7fR4WaT7wLsWb4H1jumCvKn7R5/q0aZ5/6Y5uX3/k855YrS6CnluwN309RTAA=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The analog TV properties created by the drm_mode_create_tv_properties() are
not properly initialised at reset. Let's switch our implementation to call
drm_atomic_helper_connector_tv_reset().

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_vec.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index adc9bf99e3fd..90e375a8a8f9 100644
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
b4 0.11.0-dev-7da52
