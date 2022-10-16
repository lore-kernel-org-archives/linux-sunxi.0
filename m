Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809242F28
	for <linux-sunxi@lists.linux.dev>; Sun, 16 Oct 2022 19:46:54 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id i21so8914975ljh.12
        for <linux-sunxi@lists.linux.dev>; Sun, 16 Oct 2022 12:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:reply-to:subject:user-agent:mime-version:date:message-id:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rdVj1UN0o7hBjGsw3GcLX/7HhNhpR9GEsvnCZKA7nWc=;
        b=eVN1P5+2pEF2Kv5B+7kulfpYcRS0ij67wC56op/K7MTJ9oxjts1NiTMiIXhKUDDNWi
         pClfrmUFwjCqFPiUh9t2aylgpS617BHukulA8IRkFt9jDfyhzBKacR80dEuWIW7uIlru
         /7BkEkGFXjpHuS1qNFxkES8QosHRpMbXUy57JWaDtK7v16WG53LkwTEneJfdabTIa/BN
         tiKFs3N7vSqtH+nQdskgF32wMLK/xbHFx7HwRH0BnJoukpb40vsXARUD3MnEbG+bDYhz
         DATYteNjfpgFflZS3rzy15d+9+CYLsfO1pfLasECYyV6UjYiuhHDXbmsrtY0P6dvd6aq
         O6Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:reply-to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rdVj1UN0o7hBjGsw3GcLX/7HhNhpR9GEsvnCZKA7nWc=;
        b=d0vE71X493p2YslEZk+cya0AbY9LfoPigEQhyio67RkbJOa0kHMaybOofbVJlrdD1g
         9w9Qr9L9LMIslO/szav8rval1ncv3O0D60ul46EGckB2tYAn52T+aF9xXUnE8Zbfq7+X
         XC5mHyztmuqGzbpa/RWCYdol7VimzLv85C9yHdxkfaXvApwv6E1mCpDb+PPW7DGttHvZ
         BvNvizoBoR32F9j4n0HFjDSJZMuc0GsrzsvuCiV7OiwRyuisA/NH1nvsYC2a3WFbS7Al
         cfS4qEjwxU08ONVqkksXrNHGrt8J6itNYLV4r40o6Z3YZnzvTxjx+zyexZCM230nkqtw
         aINw==
X-Gm-Message-State: ACrzQf2kfCtICxG1qviu/KYU92SKU4hVr85PvLY2dL4savfqViEnlQFY
	2Nl2ul+GRiRQP5/RbGz+Myc=
X-Google-Smtp-Source: AMsMyM4GQhxxpcYSAKIRWoVA3HWWO1eDjPQvlqSV0CxKc0sMPg+zXfwUuwDFiB7tEbVlutMrJsz5sg==
X-Received: by 2002:a05:651c:198a:b0:26f:b54d:e239 with SMTP id bx10-20020a05651c198a00b0026fb54de239mr2691447ljb.421.1665949612500;
        Sun, 16 Oct 2022 12:46:52 -0700 (PDT)
Received: from ?IPV6:2a02:a31a:a240:1700:64bb:87df:aad7:a9f0? ([2a02:a31a:a240:1700:64bb:87df:aad7:a9f0])
        by smtp.googlemail.com with ESMTPSA id k14-20020ac2456e000000b004948378080csm1141576lfm.290.2022.10.16.12.46.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Oct 2022 12:46:51 -0700 (PDT)
From: Mateusz Kwiatkowski <kfyatek@gmail.com>
X-Google-Original-From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Message-ID: <93bf9fcc-c645-b042-011f-8f1fc957af48@gmail.com>
Date: Sun, 16 Oct 2022 21:46:49 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
Subject: [PATCH] drm/vc4: vec: Add support for PAL-60
Reply-To: kfyatek+publicgit@gmail.com
To: Maxime Ripard <maxime@cerno.tech>, Karol Herbst <kherbst@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@linux.ie>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>, Maxime Ripard <mripard@kernel.org>,
 Emma Anholt <emma@anholt.net>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Ben Skeggs <bskeggs@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Dom Cobley <dom@raspberrypi.com>, linux-sunxi@lists.linux.dev,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, Phil Elwell <phil@raspberrypi.com>
References: <20220728-rpi-analog-tv-properties-v5-0-d841cc64fe4b@cerno.tech>
 <20220728-rpi-analog-tv-properties-v5-21-d841cc64fe4b@cerno.tech>
Content-Language: pl
In-Reply-To: <20220728-rpi-analog-tv-properties-v5-21-d841cc64fe4b@cerno.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Add support for the PAL-60 mode. Because there is no separate TV mode
property value for PAL-60, this requires matching the settings based on
the modeline in addition to just that property alone.

Signed-off-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
---
This patch depends on patch
'[PATCH v5 21/22] drm/vc4: vec: Add support for more analog TV standards'
submitted by Maxime Ripard
(https://lore.kernel.org/dri-devel/20220728-rpi-analog-tv-properties-v5-21-d841cc64fe4b@cerno.tech/).

To Maxime: if you decide to post v6, feel free to include this in your patchset
instead if you want.
---
 drivers/gpu/drm/vc4/vc4_vec.c | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index 88b4330bfa39..bbc41e502cc3 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -235,6 +235,7 @@ enum vc4_vec_tv_mode_id {
 
 struct vc4_vec_tv_mode {
 	unsigned int mode;
+	u16 expected_htotal;
 	u32 config0;
 	u32 config1;
 	u32 custom_freq;
@@ -270,37 +271,52 @@ static const struct debugfs_reg32 vec_regs[] = {
 static const struct vc4_vec_tv_mode vc4_vec_tv_modes[] = {
 	{
 		.mode = DRM_MODE_TV_MODE_NTSC,
+		.expected_htotal = 858,
 		.config0 = VEC_CONFIG0_NTSC_STD | VEC_CONFIG0_PDEN,
 		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
 	},
 	{
 		.mode = DRM_MODE_TV_MODE_NTSC_443,
+		.expected_htotal = 858,
 		.config0 = VEC_CONFIG0_NTSC_STD,
 		.config1 = VEC_CONFIG1_C_CVBS_CVBS | VEC_CONFIG1_CUSTOM_FREQ,
 		.custom_freq = 0x2a098acb,
 	},
 	{
 		.mode = DRM_MODE_TV_MODE_NTSC_J,
+		.expected_htotal = 858,
 		.config0 = VEC_CONFIG0_NTSC_STD,
 		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
 	},
 	{
 		.mode = DRM_MODE_TV_MODE_PAL,
+		.expected_htotal = 864,
 		.config0 = VEC_CONFIG0_PAL_BDGHI_STD,
 		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
 	},
+	{
+		/* PAL-60 */
+		.mode = DRM_MODE_TV_MODE_PAL,
+		.expected_htotal = 858,
+		.config0 = VEC_CONFIG0_PAL_M_STD,
+		.config1 = VEC_CONFIG1_C_CVBS_CVBS | VEC_CONFIG1_CUSTOM_FREQ,
+		.custom_freq = 0x2a098acb,
+	},
 	{
 		.mode = DRM_MODE_TV_MODE_PAL_M,
+		.expected_htotal = 858,
 		.config0 = VEC_CONFIG0_PAL_M_STD,
 		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
 	},
 	{
 		.mode = DRM_MODE_TV_MODE_PAL_N,
+		.expected_htotal = 864,
 		.config0 = VEC_CONFIG0_PAL_N_STD,
 		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
 	},
 	{
 		.mode = DRM_MODE_TV_MODE_SECAM,
+		.expected_htotal = 864,
 		.config0 = VEC_CONFIG0_SECAM_STD,
 		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
 		.custom_freq = 0x29c71c72,
@@ -308,14 +324,15 @@ static const struct vc4_vec_tv_mode vc4_vec_tv_modes[] = {
 };
 
 static inline const struct vc4_vec_tv_mode *
-vc4_vec_tv_mode_lookup(unsigned int mode)
+vc4_vec_tv_mode_lookup(unsigned int mode, u16 htotal)
 {
 	unsigned int i;
 
 	for (i = 0; i < ARRAY_SIZE(vc4_vec_tv_modes); i++) {
 		const struct vc4_vec_tv_mode *tv_mode = &vc4_vec_tv_modes[i];
 
-		if (tv_mode->mode == mode)
+		if (tv_mode->mode == mode &&
+		    tv_mode->expected_htotal == htotal)
 			return tv_mode;
 	}
 
@@ -394,6 +411,7 @@ vc4_vec_connector_set_property(struct drm_connector *connector,
 		break;
 
 	case VC4_VEC_TV_MODE_PAL:
+	case VC4_VEC_TV_MODE_PAL_60:
 		state->tv.mode = DRM_MODE_TV_MODE_PAL;
 		break;
 
@@ -551,13 +569,16 @@ static void vc4_vec_encoder_enable(struct drm_encoder *encoder,
 	struct drm_connector *connector = &vec->connector;
 	struct drm_connector_state *conn_state =
 		drm_atomic_get_new_connector_state(state, connector);
+	struct drm_display_mode *adjusted_mode =
+		&encoder->crtc->state->adjusted_mode;
 	const struct vc4_vec_tv_mode *tv_mode;
 	int idx, ret;
 
 	if (!drm_dev_enter(drm, &idx))
 		return;
 
-	tv_mode = vc4_vec_tv_mode_lookup(conn_state->tv.mode);
+	tv_mode = vc4_vec_tv_mode_lookup(conn_state->tv.mode,
+					 adjusted_mode->htotal);
 	if (!tv_mode)
 		goto err_dev_exit;
 

base-commit: e16415e3ddae9abb14a00793554a162403f9af6d
-- 
2.34.1

