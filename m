Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5FC72F28
	for <linux-sunxi@lists.linux.dev>; Sun, 16 Oct 2022 18:56:26 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id bu25so14530258lfb.3
        for <linux-sunxi@lists.linux.dev>; Sun, 16 Oct 2022 11:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:reply-to:subject:user-agent:mime-version:date:message-id:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9R5DRkDar97t7RGa7ZkHbwXUyJ5tEv/b58zZkFRpKIU=;
        b=UqSCa35znTFAW2XjpbRvdh7DaqZHpIJN6v4AXacEElZvxQlvD6nM1NZ8Ag4JRpl3yk
         tQA8VjWsFBR1wJX/Ss+CPqCol92EEvV5Raj+pM0cSuC99zTk0doGl7wmBnhKuxgF1Ygk
         fg/0fyZAwvrTzcQj7VkncMJ+fonMoDA4arz05pgdToty0rBiXkoKPedTqvwmaoXAbTg+
         v3woOrrTfXBCGMASf2KyRUme4mDbwgrtVNogi54B0uEQTGHlblMTfWTbB8IpJkPkXm6d
         e3JS1uHEJHUVESdK67TNOFvIWA7dgP90CYwGzpBFC03lpCGGnnp4EI/sbS04iqDtsz+L
         ezsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:reply-to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9R5DRkDar97t7RGa7ZkHbwXUyJ5tEv/b58zZkFRpKIU=;
        b=e84Yzq1VaEghCnVuWVUaQl/vC2dasjNp3v34N1dCtNnbirj1BcexzLSUOgpPESexg9
         6P4YJTHTLhxsVkp4hyJYYjZaHSQ5Z1w9DxTsSSA3SUSAMIkfc2OgAc8KDt+mthDPRsp5
         6nv8lrEBNZ8rjPUh5bkBK1bxAIHg5ninCDmhYrfPJmuc87D3p9yXazD2zPAxhMLKppYK
         PDCc1UUELfDW2PvLDgfDZFrwdjk3AAxYi8CeXCXUxc0oelsaOveyARmJ7/Cur0JHfQf7
         u/T9e2UPwtyaz3EVfpJpjphf8AkTrYDVY8F1xF7Wxq1dlu0Z4ZtkWB+f9kNDF63kDp6a
         Nu3w==
X-Gm-Message-State: ACrzQf06px1Ks/MV90hDYNOdUIT/+mdHqzNmvA/7VJJpfywxGzpDGn1r
	kF5iAB9Q0NPdlxe3PlijX1I=
X-Google-Smtp-Source: AMsMyM5uYxB/6xJ5gGhOv3WAH6+V6GDD4KbrqZFfIThsPvWDKXTV721fShUokapp2H2agrxIAik1vw==
X-Received: by 2002:ac2:46da:0:b0:4a2:2963:71b0 with SMTP id p26-20020ac246da000000b004a2296371b0mr2564386lfo.600.1665946584951;
        Sun, 16 Oct 2022 11:56:24 -0700 (PDT)
Received: from ?IPV6:2a02:a31a:a240:1700:64bb:87df:aad7:a9f0? ([2a02:a31a:a240:1700:64bb:87df:aad7:a9f0])
        by smtp.googlemail.com with ESMTPSA id p24-20020a2ea4d8000000b0026de7400f3bsm1237043ljm.5.2022.10.16.11.56.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Oct 2022 11:56:24 -0700 (PDT)
From: Mateusz Kwiatkowski <kfyatek@gmail.com>
X-Google-Original-From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Message-ID: <0f2beec2-ae8e-5579-f0b6-a73d9dae1af4@gmail.com>
Date: Sun, 16 Oct 2022 20:56:22 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
Subject: Re: [PATCH v5 20/22] drm/vc4: vec: Convert to the new TV mode
 property
Reply-To: kfyatek+publicgit@gmail.com, kfyatek+publicgit@gmail.com
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
 <20220728-rpi-analog-tv-properties-v5-20-d841cc64fe4b@cerno.tech>
 <c1949248-fb40-682c-492e-bafbd915cee3@gmail.com>
Content-Language: pl
In-Reply-To: <c1949248-fb40-682c-492e-bafbd915cee3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Maxime,

Urgh. I cannot send e-mails apparently today, as I removed the second half of
the previous message. Here goes:

> @@ -454,13 +563,6 @@ static int vc4_vec_encoder_atomic_check(struct drm_encoder *encoder,
>  					struct drm_connector_state *conn_state)
>  {
>  	const struct drm_display_mode *mode = &crtc_state->adjusted_mode;

You could add here something like:

+	const struct vc4_vec_tv_mode *tv_mode =
+		vc4_vec_tv_mode_lookup(conn_state->tv.mode);
+
+	if (!tv_mode)
+		return -EINVAL;

This should explicitly make it impossible to enter the equivalent condition in
vc4_vec_encoder_enable() that causes the problem mentioned in the previous
e-mail.

This is probably basically impossible already, but I triggered that when testing
a follow-up change I'd like to post shortly.

> -	const struct vc4_vec_tv_mode *vec_mode;
> -
> -	vec_mode = &vc4_vec_tv_modes[conn_state->tv.legacy_mode];
> -
> -	if (conn_state->crtc &&
> -	    !drm_mode_equal(vec_mode->mode, &crtc_state->adjusted_mode))
> -		return -EINVAL;

If you're removing the reference mode, then I think you should at least add
checks that the crtc_clock is set to 13.5 MHz (it's otherwise ignored) and that
crtc_htotal is either 858 or 864 (using a switch over reference_mode->htotal as
I proposed in my comment to patch 19/22 would double as such check), as all
other values causes VEC to output garbage.

Best regards,
Mateusz Kwiatkowski

