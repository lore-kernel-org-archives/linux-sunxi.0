Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4539E5B5B9
	for <linux-sunxi@lists.linux.dev>; Thu, 14 Dec 2023 15:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="aZ/5Pbni"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-5d2d0661a8dso83011907b3.2
        for <linux-sunxi@lists.linux.dev>; Thu, 14 Dec 2023 07:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1702566191; x=1703170991; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7GPW7ASfN74rjpX0yjIvwEOj4Z6A4Vz+3oxubPbP0Jc=;
        b=aZ/5PbniPxn+cshRxquoU62BVurTMfoo+QzfCgGANyskdRIrH4W1gslc7XbK0awfOo
         bFYvp9fFfcQGM/NhiHOHGA7TmKpYhNXaf3VHGtdyr+9AudMT90PyFEjIzNkLe8cRiRx+
         3hVFSxx9LF608m+VOLFlD3Sw2PnuUqZpNEbtUa9gB2vvKiY/CXRJsPMFlU5m0Svb5qNo
         n9/vqIpNdyiyGLKXUwH1jLPlkH/zxOll8WqHqWVcEQFRyrA2dioCxveyjaX4acNzbJNE
         ZZro5Dl7RPunGq0pTsp/EIpmX/c44Q8yvSz4+yZiYrk9DOkaKWg/OES6oprtLJqr7CCK
         FIdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702566191; x=1703170991;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7GPW7ASfN74rjpX0yjIvwEOj4Z6A4Vz+3oxubPbP0Jc=;
        b=crmVy2JTzCwQgp2UlBPcNJKAsWLQ6lxaItSamr0bw60eI8gjTp0Y8821LB93cHvNlZ
         TcWh1hplSbgVANpBlT7zljnuKBo8D5WcdRnFIj05FKAMqJNHTIR8e0JMkInnNVgr81U/
         q+DHwNqR92RI7DvzzycpQ5PNkcOKorQCaDdzPHuHdHbIrKL3St7cz5bdhLcvhfEmJHa3
         a6yPfVNznHhUNLVHSL4LwbRY/LcGPOm40A0wenm5yS+RtA9s6Le9ZcOmihOUzyt0BJWE
         05QP4fDiiGBgkZtpf7RfuTgmvmQMiDr9drtbBbMd0dQ4MSwLsfOBi9Ox4gbIMRlsorba
         JKBA==
X-Gm-Message-State: AOJu0YzmE7ZWnqApLWzutIIyP5OUgn2+RYFPxVQoX9s9UDgmT5vZrpwt
	/q+lrHHPTgHI3T4FUmcyU84/RFf/SN1tO6lOTuVbEw==
X-Google-Smtp-Source: AGHT+IFSvx75tZRghKUoo6Uahu1XWx14a1yLiOPfadIawFqDns+Co6ySb3wgwgdAqgJjKa5z8vYD8VvGs3+4fNnBPdY=
X-Received: by 2002:a81:df06:0:b0:5d4:b7a:ebfc with SMTP id
 c6-20020a81df06000000b005d40b7aebfcmr8726362ywn.22.1702566191165; Thu, 14 Dec
 2023 07:03:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231207-kms-hdmi-connector-state-v5-0-6538e19d634d@kernel.org> <20231207-kms-hdmi-connector-state-v5-12-6538e19d634d@kernel.org>
In-Reply-To: <20231207-kms-hdmi-connector-state-v5-12-6538e19d634d@kernel.org>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 14 Dec 2023 15:02:54 +0000
Message-ID: <CAPY8ntDdmgc+k17T=kRXBWDAcN_Kww4L=0JRmiuupkKcy6tgzg@mail.gmail.com>
Subject: Re: [PATCH v5 12/44] drm/connector: hdmi: Add HDMI compute clock helper
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Emma Anholt <emma@anholt.net>, Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Hans Verkuil <hverkuil@xs4all.nl>, linux-rockchip@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 7 Dec 2023 at 15:50, Maxime Ripard <mripard@kernel.org> wrote:
>
> A lot of HDMI drivers have some variation of the formula to calculate
> the TMDS character rate from a mode, but few of them actually take all
> parameters into account.
>
> Let's create a helper to provide that rate taking all parameters into
> account.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_connector.c            |  59 ++++++
>  drivers/gpu/drm/tests/drm_connector_test.c | 323 +++++++++++++++++++++++++++++
>  include/drm/drm_connector.h                |   5 +
>  3 files changed, 387 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index a72f38b6dbc8..667326b09acc 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -2973,6 +2973,65 @@ void drm_connector_update_privacy_screen(const struct drm_connector_state *conne
>  }
>  EXPORT_SYMBOL(drm_connector_update_privacy_screen);
>
> +/**
> + * drm_connector_hdmi_compute_mode_clock() - Computes the TMDS Character Rate
> + * @mode: Display mode to compute the clock for
> + * @bpc: Bits per character
> + * @fmt: Output Pixel Format used
> + *
> + * Returns the TMDS Character Rate for a given mode, bpc count and output format.
> + *
> + * RETURNS:
> + * The TMDS Character Rate, in Hertz, or 0 on error.
> + */
> +unsigned long long
> +drm_connector_hdmi_compute_mode_clock(const struct drm_display_mode *mode,
> +                                     unsigned int bpc,
> +                                     enum hdmi_colorspace fmt)
> +{
> +       unsigned long long clock = mode->clock * 1000ULL;
> +       unsigned int vic = drm_match_cea_mode(mode);
> +
> +       /*
> +        * CTA-861-G Spec, section 5.4 - Color Coding and Quantization
> +        * mandates that VIC 1 always uses 8 bpc.
> +        */
> +       if (vic == 1 && bpc != 8)
> +               return 0;
> +
> +       /*
> +        * HDMI 2.0 Spec, section 7.1 - YCbCr 4:2:0 Pixel Encoding
> +        * specifies that YUV420 encoding is only available for those
> +        * VICs.
> +        */
> +       if (fmt == HDMI_COLORSPACE_YUV420 &&
> +           !(vic == 96 || vic == 97 || vic == 101 ||
> +             vic == 102 || vic == 106 || vic == 107))
> +               return 0;
> +
> +       /*
> +        * HDMI 1.4b Spec, section 6.2.3 - Pixel Encoding Requirements
> +        * specifies that YUV422 is 36-bit only.
> +        */
> +       if (fmt == HDMI_COLORSPACE_YUV422 && bpc != 12)
> +               return 0;
> +
> +       if (fmt == HDMI_COLORSPACE_YUV420)
> +               clock = clock / 2;
> +
> +       if (mode->flags & DRM_MODE_FLAG_DBLCLK)
> +               clock = clock * 2;
> +
> +       if (fmt == HDMI_COLORSPACE_YUV422)
> +               bpc = 8;

Possibly a comment on why we have these munges for 420 and 422 as they
aren't immediately obvious.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> +
> +       clock = clock * bpc;
> +       do_div(clock, 8);
> +
> +       return clock;
> +}
> +EXPORT_SYMBOL(drm_connector_hdmi_compute_mode_clock);
> +
>  int drm_connector_set_obj_prop(struct drm_mode_object *obj,
>                                     struct drm_property *property,
>                                     uint64_t value)
> diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm/tests/drm_connector_test.c
> index fa6fe8084107..0a838924a546 100644
> --- a/drivers/gpu/drm/tests/drm_connector_test.c
> +++ b/drivers/gpu/drm/tests/drm_connector_test.c
> @@ -8,7 +8,9 @@
>  #include <drm/drm_atomic_state_helper.h>
>  #include <drm/drm_connector.h>
>  #include <drm/drm_drv.h>
> +#include <drm/drm_edid.h>
>  #include <drm/drm_kunit_helpers.h>
> +#include <drm/drm_modes.h>
>
>  #include <kunit/test.h>
>
> @@ -719,10 +721,331 @@ static struct kunit_suite drm_connector_attach_broadcast_rgb_property_test_suite
>         .test_cases = drm_connector_attach_broadcast_rgb_property_tests,
>  };
>
> +/*
> + * Test that for a given mode, with 8bpc and an RGB output the TMDS
> + * character rate is equal to the mode pixel clock.
> + */
> +static void drm_test_drm_connector_hdmi_compute_mode_clock_rgb(struct kunit *test)
> +{
> +       struct drm_connector_init_priv *priv = test->priv;
> +       const struct drm_display_mode *mode;
> +       unsigned long long rate;
> +       struct drm_device *drm = &priv->drm;
> +
> +       mode = drm_display_mode_from_cea_vic(drm, 16);
> +       KUNIT_ASSERT_NOT_NULL(test, mode);
> +
> +       KUNIT_ASSERT_FALSE(test, mode->flags & DRM_MODE_FLAG_DBLCLK);
> +
> +       rate = drm_connector_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_RGB);
> +       KUNIT_ASSERT_GT(test, rate, 0);
> +       KUNIT_EXPECT_EQ(test, mode->clock * 1000ULL, rate);
> +}
> +
> +/*
> + * Test that for a given mode, with 10bpc and an RGB output the TMDS
> + * character rate is equal to 1.25 times the mode pixel clock.
> + */
> +static void drm_test_drm_connector_hdmi_compute_mode_clock_rgb_10bpc(struct kunit *test)
> +{
> +       struct drm_connector_init_priv *priv = test->priv;
> +       const struct drm_display_mode *mode;
> +       unsigned long long rate;
> +       struct drm_device *drm = &priv->drm;
> +
> +       mode = drm_display_mode_from_cea_vic(drm, 16);
> +       KUNIT_ASSERT_NOT_NULL(test, mode);
> +
> +       KUNIT_ASSERT_FALSE(test, mode->flags & DRM_MODE_FLAG_DBLCLK);
> +
> +       rate = drm_connector_hdmi_compute_mode_clock(mode, 10, HDMI_COLORSPACE_RGB);
> +       KUNIT_ASSERT_GT(test, rate, 0);
> +       KUNIT_EXPECT_EQ(test, mode->clock * 1250, rate);
> +}
> +
> +/*
> + * Test that for the VIC-1 mode, with 10bpc and an RGB output the TMDS
> + * character rate computation fails.
> + */
> +static void drm_test_drm_connector_hdmi_compute_mode_clock_rgb_10bpc_vic_1(struct kunit *test)
> +{
> +       struct drm_connector_init_priv *priv = test->priv;
> +       const struct drm_display_mode *mode;
> +       unsigned long long rate;
> +       struct drm_device *drm = &priv->drm;
> +
> +       mode = drm_display_mode_from_cea_vic(drm, 1);
> +       KUNIT_ASSERT_NOT_NULL(test, mode);
> +
> +       rate = drm_connector_hdmi_compute_mode_clock(mode, 10, HDMI_COLORSPACE_RGB);
> +       KUNIT_EXPECT_EQ(test, rate, 0);
> +}
> +
> +/*
> + * Test that for a given mode, with 12bpc and an RGB output the TMDS
> + * character rate is equal to 1.5 times the mode pixel clock.
> + */
> +static void drm_test_drm_connector_hdmi_compute_mode_clock_rgb_12bpc(struct kunit *test)
> +{
> +       struct drm_connector_init_priv *priv = test->priv;
> +       const struct drm_display_mode *mode;
> +       unsigned long long rate;
> +       struct drm_device *drm = &priv->drm;
> +
> +       mode = drm_display_mode_from_cea_vic(drm, 16);
> +       KUNIT_ASSERT_NOT_NULL(test, mode);
> +
> +       KUNIT_ASSERT_FALSE(test, mode->flags & DRM_MODE_FLAG_DBLCLK);
> +
> +       rate = drm_connector_hdmi_compute_mode_clock(mode, 12, HDMI_COLORSPACE_RGB);
> +       KUNIT_ASSERT_GT(test, rate, 0);
> +       KUNIT_EXPECT_EQ(test, mode->clock * 1500, rate);
> +}
> +
> +/*
> + * Test that for the VIC-1 mode, with 12bpc and an RGB output the TMDS
> + * character rate computation fails.
> + */
> +static void drm_test_drm_connector_hdmi_compute_mode_clock_rgb_12bpc_vic_1(struct kunit *test)
> +{
> +       struct drm_connector_init_priv *priv = test->priv;
> +       const struct drm_display_mode *mode;
> +       unsigned long long rate;
> +       struct drm_device *drm = &priv->drm;
> +
> +       mode = drm_display_mode_from_cea_vic(drm, 1);
> +       KUNIT_ASSERT_NOT_NULL(test, mode);
> +
> +       rate = drm_connector_hdmi_compute_mode_clock(mode, 12, HDMI_COLORSPACE_RGB);
> +       KUNIT_EXPECT_EQ(test, rate, 0);
> +}
> +
> +/*
> + * Test that for a mode with the pixel repetition flag, the TMDS
> + * character rate is indeed double the mode pixel clock.
> + */
> +static void drm_test_drm_connector_hdmi_compute_mode_clock_rgb_double(struct kunit *test)
> +{
> +       struct drm_connector_init_priv *priv = test->priv;
> +       const struct drm_display_mode *mode;
> +       unsigned long long rate;
> +       struct drm_device *drm = &priv->drm;
> +
> +       mode = drm_display_mode_from_cea_vic(drm, 6);
> +       KUNIT_ASSERT_NOT_NULL(test, mode);
> +
> +       KUNIT_ASSERT_TRUE(test, mode->flags & DRM_MODE_FLAG_DBLCLK);
> +
> +       rate = drm_connector_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_RGB);
> +       KUNIT_ASSERT_GT(test, rate, 0);
> +       KUNIT_EXPECT_EQ(test, (mode->clock * 1000ULL) * 2, rate);
> +}
> +
> +/*
> + * Test that the TMDS character rate computation for the VIC modes
> + * explicitly listed in the spec as supporting YUV420 succeed and return
> + * half the mode pixel clock.
> + */
> +static void drm_test_connector_hdmi_compute_mode_clock_yuv420_valid(struct kunit *test)
> +{
> +       struct drm_connector_init_priv *priv = test->priv;
> +       const struct drm_display_mode *mode;
> +       struct drm_device *drm = &priv->drm;
> +       unsigned long long rate;
> +       unsigned int vic = *(unsigned int *)test->param_value;
> +
> +       mode = drm_display_mode_from_cea_vic(drm, vic);
> +       KUNIT_ASSERT_NOT_NULL(test, mode);
> +
> +       KUNIT_ASSERT_FALSE(test, mode->flags & DRM_MODE_FLAG_DBLCLK);
> +
> +       rate = drm_connector_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_YUV420);
> +       KUNIT_ASSERT_GT(test, rate, 0);
> +       KUNIT_EXPECT_EQ(test, (mode->clock * 1000ULL) / 2, rate);
> +}
> +
> +static const unsigned int drm_connector_hdmi_compute_mode_clock_yuv420_vic_valid_tests[] = {
> +       96, 97, 101, 102, 106, 107,
> +};
> +
> +static void drm_connector_hdmi_compute_mode_clock_yuv420_vic_desc(const unsigned int *vic, char *desc)
> +{
> +       sprintf(desc, "VIC %u", *vic);
> +}
> +
> +KUNIT_ARRAY_PARAM(drm_connector_hdmi_compute_mode_clock_yuv420_valid,
> +                 drm_connector_hdmi_compute_mode_clock_yuv420_vic_valid_tests,
> +                 drm_connector_hdmi_compute_mode_clock_yuv420_vic_desc);
> +
> +/*
> + * Test that trying to compute the TMDS char rate with the YUV420 format
> + * for a mode that doesn't support the YUV420 encoding returns an error.
> + *
> + * TODO: We should probably test this with all the VIC but the
> + * explicitly supported ones. Since the list of VIC is quite long and
> + * not linear, the best way to support it at the moment would be to
> + * create a custom gen_params function that would only return valid
> + * VICs. At the moment, that function expects to get a pointer back
> + * however, and compilers don't really like casting between integer and
> + * pointers.
> + */
> +static void drm_test_connector_hdmi_compute_mode_clock_yuv420_invalid(struct kunit *test)
> +{
> +       struct drm_connector_init_priv *priv = test->priv;
> +       const struct drm_display_mode *mode;
> +       struct drm_device *drm = &priv->drm;
> +       unsigned long long rate;
> +
> +       mode = drm_display_mode_from_cea_vic(drm, 42);
> +       KUNIT_ASSERT_NOT_NULL(test, mode);
> +
> +       KUNIT_ASSERT_FALSE(test, mode->flags & DRM_MODE_FLAG_DBLCLK);
> +
> +       rate = drm_connector_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_YUV420);
> +       KUNIT_EXPECT_EQ(test, rate, 0);
> +}
> +
> +/*
> + * Test that for a given mode listed supporting it and an YUV420 output
> + * with 10bpc, the TMDS character rate is equal to 0.625 times the mode
> + * pixel clock.
> + */
> +static void drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc(struct kunit *test)
> +{
> +       struct drm_connector_init_priv *priv = test->priv;
> +       const struct drm_display_mode *mode;
> +       struct drm_device *drm = &priv->drm;
> +       unsigned int vic =
> +               drm_connector_hdmi_compute_mode_clock_yuv420_vic_valid_tests[0];
> +       unsigned long long rate;
> +
> +       mode = drm_display_mode_from_cea_vic(drm, vic);
> +       KUNIT_ASSERT_NOT_NULL(test, mode);
> +
> +       KUNIT_ASSERT_FALSE(test, mode->flags & DRM_MODE_FLAG_DBLCLK);
> +
> +       rate = drm_connector_hdmi_compute_mode_clock(mode, 10, HDMI_COLORSPACE_YUV420);
> +       KUNIT_ASSERT_GT(test, rate, 0);
> +
> +       KUNIT_EXPECT_EQ(test, mode->clock * 625, rate);
> +}
> +
> +/*
> + * Test that for a given mode listed supporting it and an YUV420 output
> + * with 12bpc, the TMDS character rate is equal to 0.75 times the mode
> + * pixel clock.
> + */
> +static void drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc(struct kunit *test)
> +{
> +       struct drm_connector_init_priv *priv = test->priv;
> +       const struct drm_display_mode *mode;
> +       struct drm_device *drm = &priv->drm;
> +       unsigned int vic =
> +               drm_connector_hdmi_compute_mode_clock_yuv420_vic_valid_tests[0];
> +       unsigned long long rate;
> +
> +       mode = drm_display_mode_from_cea_vic(drm, vic);
> +       KUNIT_ASSERT_NOT_NULL(test, mode);
> +
> +       KUNIT_ASSERT_FALSE(test, mode->flags & DRM_MODE_FLAG_DBLCLK);
> +
> +       rate = drm_connector_hdmi_compute_mode_clock(mode, 12, HDMI_COLORSPACE_YUV420);
> +       KUNIT_ASSERT_GT(test, rate, 0);
> +
> +       KUNIT_EXPECT_EQ(test, mode->clock * 750, rate);
> +}
> +
> +/*
> + * Test that for a given mode, the computation of the TMDS character
> + * rate with 8bpc and a YUV422 output fails.
> + */
> +static void drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc(struct kunit *test)
> +{
> +       struct drm_connector_init_priv *priv = test->priv;
> +       const struct drm_display_mode *mode;
> +       struct drm_device *drm = &priv->drm;
> +       unsigned long long rate;
> +
> +       mode = drm_display_mode_from_cea_vic(drm, 16);
> +       KUNIT_ASSERT_NOT_NULL(test, mode);
> +
> +       KUNIT_ASSERT_FALSE(test, mode->flags & DRM_MODE_FLAG_DBLCLK);
> +
> +       rate = drm_connector_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_YUV422);
> +       KUNIT_EXPECT_EQ(test, rate, 0);
> +}
> +
> +/*
> + * Test that for a given mode, the computation of the TMDS character
> + * rate with 10bpc and a YUV422 output fails.
> + */
> +static void drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc(struct kunit *test)
> +{
> +       struct drm_connector_init_priv *priv = test->priv;
> +       const struct drm_display_mode *mode;
> +       struct drm_device *drm = &priv->drm;
> +       unsigned long long rate;
> +
> +       mode = drm_display_mode_from_cea_vic(drm, 16);
> +       KUNIT_ASSERT_NOT_NULL(test, mode);
> +
> +       KUNIT_ASSERT_FALSE(test, mode->flags & DRM_MODE_FLAG_DBLCLK);
> +
> +       rate = drm_connector_hdmi_compute_mode_clock(mode, 10, HDMI_COLORSPACE_YUV422);
> +       KUNIT_EXPECT_EQ(test, rate, 0);
> +}
> +
> +/*
> + * Test that for a given mode, the computation of the TMDS character
> + * rate with 12bpc and a YUV422 output succeeds and returns a rate equal
> + * to the mode pixel clock.
> + */
> +static void drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc(struct kunit *test)
> +{
> +       struct drm_connector_init_priv *priv = test->priv;
> +       const struct drm_display_mode *mode;
> +       struct drm_device *drm = &priv->drm;
> +       unsigned long long rate;
> +
> +       mode = drm_display_mode_from_cea_vic(drm, 16);
> +       KUNIT_ASSERT_NOT_NULL(test, mode);
> +
> +       KUNIT_ASSERT_FALSE(test, mode->flags & DRM_MODE_FLAG_DBLCLK);
> +
> +       rate = drm_connector_hdmi_compute_mode_clock(mode, 12, HDMI_COLORSPACE_YUV422);
> +       KUNIT_ASSERT_GT(test, rate, 0);
> +       KUNIT_EXPECT_EQ(test, mode->clock * 1000, rate);
> +}
> +
> +static struct kunit_case drm_connector_hdmi_compute_mode_clock_tests[] = {
> +       KUNIT_CASE(drm_test_drm_connector_hdmi_compute_mode_clock_rgb),
> +       KUNIT_CASE(drm_test_drm_connector_hdmi_compute_mode_clock_rgb_10bpc),
> +       KUNIT_CASE(drm_test_drm_connector_hdmi_compute_mode_clock_rgb_10bpc_vic_1),
> +       KUNIT_CASE(drm_test_drm_connector_hdmi_compute_mode_clock_rgb_12bpc),
> +       KUNIT_CASE(drm_test_drm_connector_hdmi_compute_mode_clock_rgb_12bpc_vic_1),
> +       KUNIT_CASE(drm_test_drm_connector_hdmi_compute_mode_clock_rgb_double),
> +       KUNIT_CASE_PARAM(drm_test_connector_hdmi_compute_mode_clock_yuv420_valid,
> +                        drm_connector_hdmi_compute_mode_clock_yuv420_valid_gen_params),
> +       KUNIT_CASE(drm_test_connector_hdmi_compute_mode_clock_yuv420_invalid),
> +       KUNIT_CASE(drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc),
> +       KUNIT_CASE(drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc),
> +       KUNIT_CASE(drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc),
> +       KUNIT_CASE(drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc),
> +       KUNIT_CASE(drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc),
> +       { }
> +};
> +
> +static struct kunit_suite drm_connector_hdmi_compute_mode_clock_test_suite = {
> +       .name = "drm_test_connector_hdmi_compute_mode_clock",
> +       .init = drm_test_connector_init,
> +       .test_cases = drm_connector_hdmi_compute_mode_clock_tests,
> +};
> +
>  kunit_test_suites(
>         &drmm_connector_hdmi_init_test_suite,
>         &drmm_connector_init_test_suite,
>         &drm_connector_attach_broadcast_rgb_property_test_suite,
> +       &drm_connector_hdmi_compute_mode_clock_test_suite,
>         &drm_get_tv_mode_from_name_test_suite,
>         &drm_hdmi_connector_get_broadcast_rgb_name_test_suite,
>         &drm_hdmi_connector_get_output_format_name_test_suite
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 74db5ce47e01..0cc5a8732664 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -38,6 +38,7 @@ struct drm_connector_helper_funcs;
>  struct drm_modeset_acquire_ctx;
>  struct drm_device;
>  struct drm_crtc;
> +struct drm_display_mode;
>  struct drm_encoder;
>  struct drm_panel;
>  struct drm_property;
> @@ -2136,6 +2137,10 @@ void drm_connector_attach_privacy_screen_properties(struct drm_connector *conn);
>  void drm_connector_attach_privacy_screen_provider(
>         struct drm_connector *connector, struct drm_privacy_screen *priv);
>  void drm_connector_update_privacy_screen(const struct drm_connector_state *connector_state);
> +unsigned long long
> +drm_connector_hdmi_compute_mode_clock(const struct drm_display_mode *mode,
> +                                     unsigned int bpc,
> +                                     enum hdmi_colorspace fmt);
>
>  /**
>   * struct drm_tile_group - Tile group metadata
>
> --
> 2.43.0
>
