Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E3613B2B4
	for <linux-sunxi@lists.linux.dev>; Sat,  9 Nov 2024 07:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731136414; cv=none; b=GiGYo9Qg6OOIb0Y4yd9iAOpk+RecKbc09lwao5VT6h0ykO0OSlZOIpdO6U1awmmCwC7EwOsuao/LEosQs3WgmjUdJA2vlGGr8HOPar2ioD2K/aEP3DIfM/vFT0mFxcWTjSG3B827FOEwSDVidUR19yQPHn3+ue3Q6FpTLyRdcCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731136414; c=relaxed/simple;
	bh=fw0t7F43BCDmKFgkQLLpKFHdfhjFZH2PaDqUrdOyHv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tCycSQsqeDRbJBxCmgWpzSIcFk+6gj2pkU0fnW5RgWg/E31GfOvlMeUDJVMJaPqHv+4GSaa960qPc0F6CuBOdnjc9aSY2Hcyzy77o06Oxozf6rLAFZazWBsMz8FS6r4v8okR7SZy5Y8MXWl7bAZ8JC8ReBRHNJtUHa8SoIzROvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kgXKoFfu; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kgXKoFfu"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53d8c44476cso216433e87.0
        for <linux-sunxi@lists.linux.dev>; Fri, 08 Nov 2024 23:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731136410; x=1731741210; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zNUHUNW3N94KhZGI0JJqHmpslwXn3uHqqi//pMXWTvY=;
        b=kgXKoFfuDwii4z/Ebx3P1tLnEKdFUGjh/X+Dz9LRMymM/Jh7Ow/gFiCx4+qMSDawuF
         IXHEfp6zQ0J0+gq3DL0lxhv2Ciwnmq40qi8/ZtNgELYB1lY+kpjojEt4hZqa/fTEdfmg
         EaBIEsny3/e/03uVtjE9xstW7BbGKSEzIycd1R+/21oIsz45G1BiUPmM638JEMhj/HVn
         NTLj8ihRweioVmAneUVMUsLkI0Ndk5KAAimG9R1dVkVv9/WYUkMoNT8dk/5yroR8cX8Y
         SSh7pyyguW6oHPjumGzj9HbVpeMsJprPo5XBH3ypbBCvBNtkUXPw7WqfSOY154OMEKDP
         vynw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731136410; x=1731741210;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zNUHUNW3N94KhZGI0JJqHmpslwXn3uHqqi//pMXWTvY=;
        b=CBF21bZJC2v4LszBKzu3/q2x7vOsGWqHwm7Anyv3/bP7wgW2ggaTil19Qf8kph4eWR
         3i46G4KAfNanWQB6n+hP5MAHse86nXK2I+3z5dnoNTZdq6j3KtmlfP/0lC87C0VhCX2c
         yL0ZOUnJsVZinedxiexasDZbwGirk7Tc9xz9sZHZDsHL4v0baFq9eq5Zb/tZ1BB2YrCj
         ZIXYg36yL8fdf+RDjPpsWNc7qWLqXA0K/2YoB2RSERsOsiyJ9r6EI4wfectu1A5G9mxM
         34cox3b2g6oA8mbKI0ZQaBW1g3GUZ6l/o1I3AoAlwJ06Kl1sQcGt+nPmtwKArDCurNO6
         oJbQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+0w/S+wwyvuN/Awwn6Cmw+mWsMILkuioOqa+H12ySemwWqxmeq8QPHPU+Gw31cddhO6Hrj9rAbAVYfQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzJDVPQ8LstCtR3QGutatPRGuL7Hkxw8apTUITWyokpPZ2k2TlS
	AdC9DcF0qR8dWyB6lwzhAPsP3BP8OvPdC9xt9G2mkgxN8E9PlcPlPNG0l3GqxBo=
X-Google-Smtp-Source: AGHT+IELVyqCmpJuWdmxqNJGcDVWXJacjDsFRR3SZdVXZ+ml1eAxfT8jopEjNHnnwf1zbuasIuxsXg==
X-Received: by 2002:a05:6512:401d:b0:539:f922:bd4e with SMTP id 2adb3069b0e04-53d86231852mr2709861e87.23.1731136409613;
        Fri, 08 Nov 2024 23:13:29 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d8267847fsm861315e87.2.2024.11.08.23.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 23:13:29 -0800 (PST)
Date: Sat, 9 Nov 2024 09:13:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 1/6] drm/display: hdmi: add generic mode_valid helper
Message-ID: <vilmhcvixztpseh2uo5sdc7zzhfmexctfnd4aeahy2pui76ntr@kbswbxi347zg>
References: <20241101-hdmi-mode-valid-v2-0-a6478fd20fa6@linaro.org>
 <20241101-hdmi-mode-valid-v2-1-a6478fd20fa6@linaro.org>
 <20241108-certain-kickass-goshawk-a3c596@houat>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241108-certain-kickass-goshawk-a3c596@houat>

On Fri, Nov 08, 2024 at 03:17:22PM +0100, Maxime Ripard wrote:
> Hi,
> 
> On Fri, Nov 01, 2024 at 02:25:04AM +0200, Dmitry Baryshkov wrote:
> > Add drm_hdmi_connector_mode_valid(), generic helper for HDMI connectors.
> > It can be either used directly or as a part of the .mode_valid callback.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/display/drm_hdmi_helper.c          |  45 ++++++
> >  drivers/gpu/drm/display/drm_hdmi_helper_internal.h |  11 ++
> >  drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  26 +---
> >  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 168 ++++++++++++++++++++-
> >  include/drm/display/drm_hdmi_helper.h              |   4 +
> >  5 files changed, 229 insertions(+), 25 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/display/drm_hdmi_helper.c b/drivers/gpu/drm/display/drm_hdmi_helper.c
> > index 74dd4d01dd9bb2c9e69ec1c60b0056bd69417e8a..560c5d4365ca54d3f669395349cedfd6f75fa033 100644
> > --- a/drivers/gpu/drm/display/drm_hdmi_helper.c
> > +++ b/drivers/gpu/drm/display/drm_hdmi_helper.c
> > @@ -9,6 +9,8 @@
> >  #include <drm/drm_print.h>
> >  #include <drm/drm_property.h>
> >  
> > +#include "drm_hdmi_helper_internal.h"
> > +
> >  static inline bool is_eotf_supported(u8 output_eotf, u8 sink_eotf)
> >  {
> >  	return sink_eotf & BIT(output_eotf);
> > @@ -256,3 +258,46 @@ drm_hdmi_compute_mode_clock(const struct drm_display_mode *mode,
> >  	return DIV_ROUND_CLOSEST_ULL(clock * bpc, 8);
> >  }
> >  EXPORT_SYMBOL(drm_hdmi_compute_mode_clock);
> > +
> > +enum drm_mode_status
> > +__drm_hdmi_connector_clock_valid(const struct drm_connector *connector,
> > +				 const struct drm_display_mode *mode,
> > +				 unsigned long long clock)
> > +{
> > +	const struct drm_connector_hdmi_funcs *funcs = connector->hdmi.funcs;
> > +	const struct drm_display_info *info = &connector->display_info;
> > +
> > +	if (info->max_tmds_clock && clock > info->max_tmds_clock * 1000)
> > +		return MODE_CLOCK_HIGH;
> > +
> > +	if (funcs && funcs->tmds_char_rate_valid) {
> > +		enum drm_mode_status status;
> > +
> > +		status = funcs->tmds_char_rate_valid(connector, mode, clock);
> > +		if (status != MODE_OK)
> > +			return status;
> > +	}
> > +
> > +	return MODE_OK;
> > +}
> > +
> > +/**
> > + * drm_hdmi_connector_mode_valid() - Check if mode is valid for HDMI connector
> > + * @connector: DRM connector to validate the mode
> > + * @mode: Display mode to validate
> > + *
> > + * Generic .mode_valid implementation for HDMI connectors.
> > + */
> > +enum drm_mode_status
> > +drm_hdmi_connector_mode_valid(struct drm_connector *connector,
> > +			      struct drm_display_mode *mode)
> > +{
> > +	unsigned long long clock;
> > +
> > +	clock = drm_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_RGB);
> > +	if (!clock)
> > +		return MODE_ERROR;
> > +
> > +	return __drm_hdmi_connector_clock_valid(connector, mode, clock);
> > +}
> > +EXPORT_SYMBOL(drm_hdmi_connector_mode_valid);
> 
> It's not clear to me why you want to place it in drm_hdmi_helper? It's
> relying quite heavily on the HDMI infrastructure, so it would make more
> sense to me that it would be part of drm_hdmi_state_helper.c.

Yeah, I hesitated a bit. I selected drm_hdmi_helper.c because it doesn't
use state-related functions. As such it is usable even by the drivers
which imlement just the basic HDMI Connector functions and don't use the
reset of the framework.

ANyway, I'll move it to drm_hdmi_state_helper.c.

> 
> > diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> > index 34ee95d41f2966ab23a60deb37d689430f6b0985..8640e7280053bd95852f53b92159f493b141f2bf 100644
> > --- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> > +++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> > @@ -43,10 +43,12 @@ struct drm_atomic_helper_connector_hdmi_priv {
> >  static struct drm_display_mode *find_preferred_mode(struct drm_connector *connector)
> >  {
> >  	struct drm_device *drm = connector->dev;
> > -	struct drm_display_mode *mode, *preferred;
> > +	struct drm_display_mode *mode, *preferred = NULL;
> >  
> >  	mutex_lock(&drm->mode_config.mutex);
> > -	preferred = list_first_entry(&connector->modes, struct drm_display_mode, head);
> > +	if (!list_empty(&connector->modes))
> > +		preferred = list_first_entry(&connector->modes, struct drm_display_mode, head);
> > +
> 
> What is this fixing?

If connector->modes is empty (e.g. because of the tmds_char_rate_valid()
rejecting all of them) then just list_first_entry() will result in an
invalid mode being assigned to preferred.

> 
> >  	list_for_each_entry(mode, &connector->modes, head)
> >  		if (mode->type & DRM_MODE_TYPE_PREFERRED)
> >  			preferred = mode;
> > @@ -125,6 +127,18 @@ static const struct drm_connector_hdmi_funcs reject_connector_hdmi_funcs = {
> >  	.tmds_char_rate_valid	= reject_connector_tmds_char_rate_valid,
> >  };
> >  
> > +static enum drm_mode_status
> > +reject_100MHz_connector_tmds_char_rate_valid(const struct drm_connector *connector,
> > +					     const struct drm_display_mode *mode,
> > +					     unsigned long long tmds_rate)
> > +{
> > +	return (tmds_rate > 100ULL * 1000 * 1000) ? MODE_BAD : MODE_OK;
> > +}
> > +
> > +static const struct drm_connector_hdmi_funcs reject_100_MHz_connector_hdmi_funcs = {
> > +	.tmds_char_rate_valid	= reject_100MHz_connector_tmds_char_rate_valid,
> > +};
> > +
> >  static int dummy_connector_get_modes(struct drm_connector *connector)
> >  {
> >  	struct drm_atomic_helper_connector_hdmi_priv *priv =
> > @@ -147,6 +161,33 @@ static int dummy_connector_get_modes(struct drm_connector *connector)
> >  static const struct drm_connector_helper_funcs dummy_connector_helper_funcs = {
> >  	.atomic_check	= drm_atomic_helper_connector_hdmi_check,
> >  	.get_modes	= dummy_connector_get_modes,
> > +	.mode_valid		= drm_hdmi_connector_mode_valid,
> > +};
> > +
> > +static int dummy_connector_get_modes_100MHz_max_clock(struct drm_connector *connector)
> > +{
> > +	struct drm_atomic_helper_connector_hdmi_priv *priv =
> > +		connector_to_priv(connector);
> > +	const struct drm_edid *edid;
> > +	unsigned int num_modes;
> > +
> > +	edid = drm_edid_alloc(priv->current_edid, priv->current_edid_len);
> > +	if (!edid)
> > +		return -EINVAL;
> > +
> > +	drm_edid_connector_update(connector, edid);
> > +	connector->display_info.max_tmds_clock = 100 * 1000;
> > +	num_modes = drm_edid_connector_add_modes(connector);
> > +
> > +	drm_edid_free(edid);
> > +
> > +	return num_modes;
> > +}
> > +
> > +static const struct drm_connector_helper_funcs dummy_connector_helper_funcs_max_tmds_clock = {
> > +	.atomic_check	= drm_atomic_helper_connector_hdmi_check,
> > +	.get_modes	= dummy_connector_get_modes_100MHz_max_clock,
> > +	.mode_valid		= drm_hdmi_connector_mode_valid,
> >  };
> >  
> >  static void dummy_hdmi_connector_reset(struct drm_connector *connector)
> > @@ -1734,9 +1775,132 @@ static struct kunit_suite drm_atomic_helper_connector_hdmi_reset_test_suite = {
> >  	.test_cases	= drm_atomic_helper_connector_hdmi_reset_tests,
> >  };
> >  
> > +static void drm_test_check_mode_valid(struct kunit *test)
> > +{
> > +	struct drm_atomic_helper_connector_hdmi_priv *priv;
> > +	struct drm_connector *conn;
> > +	struct drm_display_mode *preferred;
> > +
> > +	priv = drm_atomic_helper_connector_hdmi_init(test,
> > +						     BIT(HDMI_COLORSPACE_RGB),
> > +						     8);
> > +	KUNIT_ASSERT_NOT_NULL(test, priv);
> > +
> > +	conn = &priv->connector;
> > +	preferred = find_preferred_mode(conn);
> > +	KUNIT_ASSERT_NOT_NULL(test, preferred);
> > +
> > +	KUNIT_EXPECT_EQ(test, preferred->hdisplay, 1920);
> > +	KUNIT_EXPECT_EQ(test, preferred->vdisplay, 1080);
> > +	KUNIT_EXPECT_EQ(test, preferred->clock, 148500);
> > +}
> > +
> > +static void drm_test_check_mode_valid_reject(struct kunit *test)
> > +{
> > +	struct drm_atomic_helper_connector_hdmi_priv *priv;
> > +	struct drm_connector *conn;
> > +	struct drm_display_mode *preferred;
> > +	struct drm_device *drm;
> > +	int ret;
> > +
> > +	priv = drm_atomic_helper_connector_hdmi_init(test,
> > +						     BIT(HDMI_COLORSPACE_RGB),
> > +						     8);
> > +	KUNIT_ASSERT_NOT_NULL(test, priv);
> > +
> > +	conn = &priv->connector;
> > +
> > +	/* You shouldn't be doing that at home. */
> > +	conn->hdmi.funcs = &reject_connector_hdmi_funcs;
> > +
> > +	priv->current_edid = test_edid_hdmi_1080p_rgb_max_200mhz;
> > +	priv->current_edid_len = ARRAY_SIZE(test_edid_hdmi_1080p_rgb_max_200mhz);
> > +
> > +	drm = &priv->drm;
> > +
> > +	mutex_lock(&drm->mode_config.mutex);
> > +	ret = conn->funcs->fill_modes(conn, 4096, 4096);
> > +	mutex_unlock(&drm->mode_config.mutex);
> > +	KUNIT_ASSERT_EQ(test, ret, 0);
> > +
> > +	preferred = find_preferred_mode(conn);
> > +	KUNIT_ASSERT_NULL(test, preferred);
> > +}
> > +
> > +static void drm_test_check_mode_valid_reject_rate(struct kunit *test)
> > +{
> > +	struct drm_atomic_helper_connector_hdmi_priv *priv;
> > +	struct drm_connector *conn;
> > +	struct drm_display_mode *preferred;
> > +	int ret;
> > +
> > +	priv = drm_atomic_helper_connector_hdmi_init(test,
> > +						     BIT(HDMI_COLORSPACE_RGB),
> > +						     8);
> > +	KUNIT_ASSERT_NOT_NULL(test, priv);
> > +
> > +	conn = &priv->connector;
> > +
> > +	/* You shouldn't be doing that at home. */
> > +	conn->hdmi.funcs = &reject_100_MHz_connector_hdmi_funcs;
> > +
> > +	ret = set_connector_edid(test, conn,
> > +				 test_edid_hdmi_1080p_rgb_max_200mhz,
> > +				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_max_200mhz));
> > +	KUNIT_ASSERT_EQ(test, ret, 0);
> > +
> > +	preferred = find_preferred_mode(conn);
> > +	KUNIT_ASSERT_NOT_NULL(test, preferred);
> > +	KUNIT_EXPECT_EQ(test, preferred->hdisplay, 640);
> > +	KUNIT_EXPECT_EQ(test, preferred->vdisplay, 480);
> > +	KUNIT_EXPECT_EQ(test, preferred->clock, 25200);
> > +}
> > +
> > +static void drm_test_check_mode_valid_reject_max_clock(struct kunit *test)
> > +{
> > +	struct drm_atomic_helper_connector_hdmi_priv *priv;
> > +	struct drm_connector *conn;
> > +	struct drm_display_mode *preferred;
> > +	int ret;
> > +
> > +	priv = drm_atomic_helper_connector_hdmi_init(test,
> > +						     BIT(HDMI_COLORSPACE_RGB),
> > +						     8);
> > +	KUNIT_ASSERT_NOT_NULL(test, priv);
> > +
> > +	conn = &priv->connector;
> > +
> > +	drm_connector_helper_add(conn, &dummy_connector_helper_funcs_max_tmds_clock);
> > +
> > +	ret = set_connector_edid(test, conn,
> > +				 test_edid_hdmi_1080p_rgb_max_200mhz,
> > +				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_max_200mhz));
> > +	KUNIT_ASSERT_EQ(test, ret, 0);
> > +
> > +	preferred = find_preferred_mode(conn);
> > +	KUNIT_ASSERT_NOT_NULL(test, preferred);
> > +	KUNIT_EXPECT_EQ(test, preferred->hdisplay, 640);
> > +	KUNIT_EXPECT_EQ(test, preferred->vdisplay, 480);
> > +	KUNIT_EXPECT_EQ(test, preferred->clock, 25200);
> > +}
> > +
> > +static struct kunit_case drm_atomic_helper_connector_hdmi_mode_valid_tests[] = {
> > +	KUNIT_CASE(drm_test_check_mode_valid),
> > +	KUNIT_CASE(drm_test_check_mode_valid_reject),
> > +	KUNIT_CASE(drm_test_check_mode_valid_reject_rate),
> > +	KUNIT_CASE(drm_test_check_mode_valid_reject_max_clock),
> > +	{ }
> > +};
> > +
> > +static struct kunit_suite drm_atomic_helper_connector_hdmi_mode_valid_test_suite = {
> > +	.name		= "drm_atomic_helper_connector_hdmi_mode_valid",
> > +	.test_cases	= drm_atomic_helper_connector_hdmi_mode_valid_tests,
> > +};
> > +
> 
> We need some documentation for these tests too, and what you're trying
> to test exactly with that 100MHz cutout.

I'll add a comment. Basically, I'm checking that
drm_hdmi_connector_mode_valid() actually rejects modes based on the
tmds_char_rate_valid() or on the info->max_tmds_clock.

> 
> Maxime



-- 
With best wishes
Dmitry
