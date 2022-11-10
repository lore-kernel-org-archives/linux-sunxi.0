Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A59B1E9F8
	for <linux-sunxi@lists.linux.dev>; Thu, 10 Nov 2022 23:22:19 +0000 (UTC)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-13d9a3bb27aso3807978fac.11
        for <linux-sunxi@lists.linux.dev>; Thu, 10 Nov 2022 15:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WTsHZbpz3r5TSBiZ8Duso7cKW7h6bP2qiZJWu5aAceg=;
        b=gA80x5Inh8pnbYQCdkgl/+QGlxZR4kAiUKQYrH1GHLjqtoSHZQZaQ6KP+Xo32TXiKa
         70fnToNyrjJcQm0lWVDGsvJtk4dap4t3sHBTUVFN5u/2Q9brkuBPPTFq+EMeFiCqYiCm
         ILPhMos9wHca7Zu/KOhXPD8ck8dQ5Vu0MgFV+Hf8v4WZN3+RBH41DRvAEuXxw7Be1CsC
         icj+TJ7fRx2oEJfUDFn05lIKhG7SVlwbcEAbVcArVNQttE8w92AZ6LLr/SdWXaVLdU84
         ErctRB8iXQuFRsKivFBFNjyqFwlKjd9EdYcIYnRMaJ5c9WVzzRCsgq88gRLAvylqxh5+
         p4RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WTsHZbpz3r5TSBiZ8Duso7cKW7h6bP2qiZJWu5aAceg=;
        b=UdIjAtnxUaZ1Zzn85hKqarfF5r7wioQkSWepofuuhzlucXp5m0qmpa8VOpkjGhHTuo
         P0/94L7Q1HD2GEaj753bMFnUE/XJMb0wF2kxlB+NXfUU5rZn1sh978Tdiphf3mcZ8krA
         O8ysEiBzAu8z3tHaM8e40G76WXKgPKV6vFNf1OPstscaQHeAa+OO5CSOd9M0rftsz2R2
         1aajPtkS6NdHQef9veDaz+BPH0KyQt2EpawW78IZQfKlObCF3p8H7gHmz2DkwfZdn605
         aKaB42gxcX9AjGBy4qgEqvrWPBaGeNOevpsyC+HyF/SdU4Xr39PXWmvnEDu5rql2nzn7
         rTcw==
X-Gm-Message-State: ACrzQf3q0KHfrBC5fmdQVXAbIkUPwzhtMnRGhxCfpKep0faY0zccNK5s
	2AsbA9HEDLPYTAV/D1T6YFQCZg==
X-Google-Smtp-Source: AMsMyM4AP92chJNKRFJq0mHkoCSo8vs0uuTTJ15oRQLmlOVBcUQEYYqmZdvTpWjowK3JTlcJSJargw==
X-Received: by 2002:a05:6870:2e0e:b0:132:8335:64ba with SMTP id oi14-20020a0568702e0e00b00132833564bamr2475140oab.284.1668122538912;
        Thu, 10 Nov 2022 15:22:18 -0800 (PST)
Received: from ?IPV6:2804:14d:8084:84c6:fe26:c42d:aab9:fa8a? ([2804:14d:8084:84c6:fe26:c42d:aab9:fa8a])
        by smtp.gmail.com with ESMTPSA id 128-20020a4a0d86000000b004805b00b2cdsm283380oob.28.2022.11.10.15.22.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 15:22:18 -0800 (PST)
Message-ID: <cb0a7e11-da00-ee3c-bf51-c007d16550a7@usp.br>
Date: Thu, 10 Nov 2022 20:22:09 -0300
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v8 16/24] drm/modes: Introduce more named modes
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Karol Herbst
 <kherbst@redhat.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lyude Paul <lyude@redhat.com>,
 Samuel Holland <samuel@sholland.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>
Cc: Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20220728-rpi-analog-tv-properties-v8-0-09ce1466967c@cerno.tech>
 <20220728-rpi-analog-tv-properties-v8-16-09ce1466967c@cerno.tech>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <maira.canal@usp.br>
In-Reply-To: <20220728-rpi-analog-tv-properties-v8-16-09ce1466967c@cerno.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Maxime,

On 11/10/22 08:07, Maxime Ripard wrote:
> Now that we can easily extend the named modes list, let's add a few more
> analog TV modes that were used in the wild, and some unit tests to make
> sure it works as intended.
> 
> Tested-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 
> ---
> Changes in v6:
> - Renamed the tests to follow DRM test naming convention
> 
> Changes in v5:
> - Switched to KUNIT_ASSERT_NOT_NULL
> ---
>  drivers/gpu/drm/drm_modes.c                     |  2 +
>  drivers/gpu/drm/tests/drm_client_modeset_test.c | 54 +++++++++++++++++++++++++
>  2 files changed, 56 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
> index d3f0a3559812..855569a269b8 100644
> --- a/drivers/gpu/drm/drm_modes.c
> +++ b/drivers/gpu/drm/drm_modes.c
> @@ -2272,7 +2272,9 @@ struct drm_named_mode {
>  
>  static const struct drm_named_mode drm_named_modes[] = {
>  	NAMED_MODE("NTSC", 13500, 720, 480, DRM_MODE_FLAG_INTERLACE, DRM_MODE_TV_MODE_NTSC),
> +	NAMED_MODE("NTSC-J", 13500, 720, 480, DRM_MODE_FLAG_INTERLACE, DRM_MODE_TV_MODE_NTSC_J),
>  	NAMED_MODE("PAL", 13500, 720, 576, DRM_MODE_FLAG_INTERLACE, DRM_MODE_TV_MODE_PAL),
> +	NAMED_MODE("PAL-M", 13500, 720, 480, DRM_MODE_FLAG_INTERLACE, DRM_MODE_TV_MODE_PAL_M),
>  };
>  
>  static int drm_mode_parse_cmdline_named_mode(const char *name,
> diff --git a/drivers/gpu/drm/tests/drm_client_modeset_test.c b/drivers/gpu/drm/tests/drm_client_modeset_test.c
> index 768e8efb2f52..cf38e7cf0f08 100644
> --- a/drivers/gpu/drm/tests/drm_client_modeset_test.c
> +++ b/drivers/gpu/drm/tests/drm_client_modeset_test.c
> @@ -133,6 +133,32 @@ static void drm_test_pick_cmdline_named_ntsc(struct kunit *test)
>  	KUNIT_EXPECT_TRUE(test, drm_mode_equal(drm_mode_analog_ntsc_480i(drm), mode));
>  }
>  
> +static void drm_test_pick_cmdline_named_ntsc_j(struct kunit *test)
> +{
> +	struct drm_client_modeset_test_priv *priv = test->priv;
> +	struct drm_device *drm = priv->drm;
> +	struct drm_connector *connector = &priv->connector;
> +	struct drm_cmdline_mode *cmdline_mode = &connector->cmdline_mode;
> +	struct drm_display_mode *mode;
> +	const char *cmdline = "NTSC-J";
> +	int ret;
> +
> +	KUNIT_ASSERT_TRUE(test,
> +			  drm_mode_parse_command_line_for_connector(cmdline,
> +								    connector,
> +								    cmdline_mode));
> +
> +	mutex_lock(&drm->mode_config.mutex);
> +	ret = drm_helper_probe_single_connector_modes(connector, 1920, 1080);
> +	mutex_unlock(&drm->mode_config.mutex);
> +	KUNIT_ASSERT_GT(test, ret, 0);
> +
> +	mode = drm_connector_pick_cmdline_mode(connector);
> +	KUNIT_ASSERT_NOT_NULL(test, mode);
> +
> +	KUNIT_EXPECT_TRUE(test, drm_mode_equal(drm_mode_analog_ntsc_480i(drm), mode));
> +}
> +
>  static void drm_test_pick_cmdline_named_pal(struct kunit *test)
>  {
>  	struct drm_client_modeset_test_priv *priv = test->priv;
> @@ -159,10 +185,38 @@ static void drm_test_pick_cmdline_named_pal(struct kunit *test)
>  	KUNIT_EXPECT_TRUE(test, drm_mode_equal(drm_mode_analog_pal_576i(drm), mode));
>  }
>  
> +static void drm_test_pick_cmdline_named_pal_m(struct kunit *test)
> +{
> +	struct drm_client_modeset_test_priv *priv = test->priv;
> +	struct drm_device *drm = priv->drm;
> +	struct drm_connector *connector = &priv->connector;
> +	struct drm_cmdline_mode *cmdline_mode = &connector->cmdline_mode;
> +	struct drm_display_mode *mode;
> +	const char *cmdline = "PAL-M";
> +	int ret;
> +
> +	KUNIT_ASSERT_TRUE(test,
> +			  drm_mode_parse_command_line_for_connector(cmdline,
> +								    connector,
> +								    cmdline_mode));
> +
> +	mutex_lock(&drm->mode_config.mutex);
> +	ret = drm_helper_probe_single_connector_modes(connector, 1920, 1080);
> +	mutex_unlock(&drm->mode_config.mutex);
> +	KUNIT_ASSERT_GT(test, ret, 0);
> +
> +	mode = drm_connector_pick_cmdline_mode(connector);
> +	KUNIT_ASSERT_NOT_NULL(test, mode);
> +
> +	KUNIT_EXPECT_TRUE(test, drm_mode_equal(drm_mode_analog_ntsc_480i(drm), mode));
> +}
> +
>  static struct kunit_case drm_test_pick_cmdline_tests[] = {
>  	KUNIT_CASE(drm_test_pick_cmdline_res_1920_1080_60),
>  	KUNIT_CASE(drm_test_pick_cmdline_named_ntsc),
> +	KUNIT_CASE(drm_test_pick_cmdline_named_ntsc_j),
>  	KUNIT_CASE(drm_test_pick_cmdline_named_pal),
> +	KUNIT_CASE(drm_test_pick_cmdline_named_pal_m),

As the tests drm_test_pick_cmdline_named_ntsc,
drm_test_pick_cmdline_named_ntsc_j, drm_test_pick_cmdline_named_pal and
drm_test_pick_cmdline_named_pal_m follow a pretty similar structure, it
would be nice to parametrize those tests.

Best Regards,
- Maíra Canal


>  	{}
>  };
>  
> 
