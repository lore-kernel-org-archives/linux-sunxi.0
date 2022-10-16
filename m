Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71197F
	for <linux-sunxi@lists.linux.dev>; Sun, 16 Oct 2022 18:12:53 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id c20so11564289ljj.7
        for <linux-sunxi@lists.linux.dev>; Sun, 16 Oct 2022 11:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vSRr/j+Evb9BMA2XLUvE7/B7qNHF/qpJdEql+dXYhK8=;
        b=O1fhxdAF8qvfIwtjK6Ez9gV/11wN0p8lVgVvIuYj5OBpkQsM8+0lXbCMJ7ZJgOpumi
         MDo0Ubxh4pse9UXyLDEhsl2RoO9/isoYMONvYusDoJRRBa99G77p/UNnKpHETdvqVGrE
         efOT0lVGsrY8bHvbZ6QzyZ1EEpFJRJrDgSO5R7fsSgYJxbdBtPa7HkWmqJ/zhluEoYmC
         R3NfKAEfIAphn8jXiTl0bHVS+bAqm/Lrab/+AaBV5mokSC9WSfepT0V8+Ae1dFUNwWcI
         tUCVNq9MNJqRGP9fcjj4Ebk7j6QSDbfmLbg7TejANpbnQ3V10kWjLfk/LjfrkRtD2a+i
         iM4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vSRr/j+Evb9BMA2XLUvE7/B7qNHF/qpJdEql+dXYhK8=;
        b=PjitgLzFeCwrZ4Cmu5IdUyoHCmom4uL94oFaFOVgIPjqdpTeM6TC5G+wAjh59bPD77
         C2wjb0W7X9Yp2ykrdmei9sBMSeAWQTNcAy9+Tx3389hRlm0I1fbG4zPTmIRhLv1Il67e
         u6SteF7NqK/hVqwA35/GAUk3/zUeptDjVaJnxwGLvOUZaT3XwZ551AEMiNppgdaCw4AE
         vjBAik/no7yn2d0UXs84J0sgjcfHXGz28vBD1kdyE4PO3A8CtnpE/dgd4663plttDDQq
         E1TQhCd+F6kxrPhXEMxcQx33qlE79BN64Zc/ldjfospq3YbK+OXY23xXCw0gmgxdcQi4
         8pKA==
X-Gm-Message-State: ACrzQf2HSaKBRrF3llrL2VfjX4CFy2922uX81E4rDbljkTP0n6RT0PMi
	U8Mr3m5+QX2WKpTxZh6ysxc=
X-Google-Smtp-Source: AMsMyM6G7or2Zfll1bkzGF3XgYT5NLQwy7/HNt8cKpX2f0lKVqjZvpCuHpkEEnOFiBR1UkEUl448zw==
X-Received: by 2002:a2e:54a:0:b0:26e:1ab:c507 with SMTP id 71-20020a2e054a000000b0026e01abc507mr2807766ljf.215.1665943971567;
        Sun, 16 Oct 2022 11:12:51 -0700 (PDT)
Received: from ?IPV6:2a02:a31a:a240:1700:64bb:87df:aad7:a9f0? ([2a02:a31a:a240:1700:64bb:87df:aad7:a9f0])
        by smtp.googlemail.com with ESMTPSA id 5-20020ac25f05000000b00492e3a8366esm1144735lfq.9.2022.10.16.11.12.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Oct 2022 11:12:50 -0700 (PDT)
From: Mateusz Kwiatkowski <kfyatek@gmail.com>
X-Google-Original-From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Message-ID: <270c4a51-0a03-f048-46da-ab37900f8b91@gmail.com>
Date: Sun, 16 Oct 2022 20:12:48 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
Reply-To: kfyatek+publicgit@gmail.com
Subject: Re: [PATCH v5 19/22] drm/vc4: vec: Check for VEC output constraints
Content-Language: pl
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
 <20220728-rpi-analog-tv-properties-v5-19-d841cc64fe4b@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v5-19-d841cc64fe4b@cerno.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Maxime,

W dniu 13.10.2022 o 15:19, Maxime Ripard pisze:
> From: Mateusz Kwiatkowski > > The VEC can accept pretty much any relatively reasonable mode, but still > has a bunch of constraints to meet. > > Let's create an atomic_check() implementation that will make sure we > don't end up accepting a non-functional mode. > > Acked-by: Noralf Trønnes > Signed-off-by: Mateusz Kwiatkowski > Signed-off-by: Maxime Ripard > --- > drivers/gpu/drm/vc4/vc4_vec.c | 48 +++++++++++++++++++++++++++++++++++++++++++ > 1 file changed, 48 insertions(+) > > diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c > index 90e375a8a8f9..1fcb7baf874e 100644 > --- a/drivers/gpu/drm/vc4/vc4_vec.c > +++ b/drivers/gpu/drm/vc4/vc4_vec.c > @@ -453,6 +453,7 @@ static int vc4_vec_encoder_atomic_check(struct drm_encoder *encoder, > struct drm_crtc_state *crtc_state, > struct drm_connector_state *conn_state) > { > + const struct drm_display_mode *mode = &crtc_state->adjusted_mode; > const struct vc4_vec_tv_mode *vec_mode; > > vec_mode =
&vc4_vec_tv_modes[conn_state->tv.legacy_mode]; > @@ -461,6 +462,53 @@ static int vc4_vec_encoder_atomic_check(struct drm_encoder *encoder, > !drm_mode_equal(vec_mode->mode, &crtc_state->adjusted_mode)) > return -EINVAL; > > + if (mode->crtc_hdisplay % 4) > + return -EINVAL; > + > + if (!(mode->crtc_hsync_end - mode->crtc_hsync_start)) > + return -EINVAL; > + > + switch (mode->vtotal) { > + case 525: > + if (mode->crtc_vtotal > 262) > + return -EINVAL; > + > + if (mode->crtc_vdisplay < 1 || mode->crtc_vdisplay > 253) > + return -EINVAL; > + > + if (!(mode->crtc_vsync_start - mode->crtc_vdisplay)) > + return -EINVAL; > + > + if ((mode->crtc_vsync_end - mode->crtc_vsync_start) != 3) > + return -EINVAL; > + > + if ((mode->crtc_vtotal - mode->crtc_vsync_end) < 4) > + return -EINVAL; > + > + break; > + > + case 625: > + if (mode->crtc_vtotal > 312) > + return -EINVAL; > + > + if (mode->crtc_vdisplay < 1 || mode->crtc_vdisplay > 305) > + return -EINVAL; > + > + if
(!(mode->crtc_vsync_start - mode->crtc_vdisplay)) > + return -EINVAL; > + > + if ((mode->crtc_vsync_end - mode->crtc_vsync_start) != 3) > + return -EINVAL; > + > + if ((mode->crtc_vtotal - mode->crtc_vsync_end) < 2) > + return -EINVAL; > + > + break; > + > + default: > + return -EINVAL; > + } > + > return 0; > } In my original version of this function (https://github.com/raspberrypi/linux/pull/4406/files) the switch is over reference_mode->vtotal, not mode->vtotal. This was intended to explicitly allow a different value of mode->vtotal, to support non-standard modes, such as "fake" 525 lines with SECAM encoding, or the progressive modes. You're switching over mode->vtotal, which makes specifying those impossible. I don't think we should limit the users like that. We're removing reference_mode in patch 20/22, so adding a switch over reference_mode->vtotal is probably not a good idea -- in that case I'd switch over mode->htotal instead: 858 for "NTSC" and 864 for "PAL". This
may seem a bit weird, but any other value of htotal causes the VEC to output garbage anyway. Best regards, Mateusz Kwiatkowski

