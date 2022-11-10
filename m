Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A131E9F8
	for <linux-sunxi@lists.linux.dev>; Thu, 10 Nov 2022 23:12:17 +0000 (UTC)
Received: from mx0.riseup.net (mx0-pn.riseup.net [10.0.1.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mx0.riseup.net", Issuer "R3" (not verified))
	by mx1.riseup.net (Postfix) with ESMTPS id 4N7d010lFnzDqWS
	for <linux-sunxi@lists.linux.dev>; Thu, 10 Nov 2022 23:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1668121937; bh=WDNOsswhI+Co4LtZ3k9lTiySfDkNW3OIoOvss+UBGNQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YKV+BcE8hk7CFswajsHw+GDcreRQ0s4oScftArvKtWW04RE4X8fP4mJjNHFHOLwta
	 qHc9Y9WUG6DSHjhzWyYMf3ESsLC2K/rFL47xvPLyCs/olx5k/7sQWp7KNx2OgUWWsG
	 20ncSfyf3Sq9V2/4iv1eNDCwuLotR47gebST3qlg=
Received: from fews2.riseup.net (fews2-pn.riseup.net [10.0.1.84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.riseup.net", Issuer "R3" (not verified))
	by mx0.riseup.net (Postfix) with ESMTPS id 4N7czs1KFTz9sVh;
	Thu, 10 Nov 2022 23:12:09 +0000 (UTC)
X-Riseup-User-ID: 9B8A265925C4F8F51259326AB64322B122A3EBE1E1A7C6C932B19A695E597443
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews2.riseup.net (Postfix) with ESMTPSA id 4N7czh07yzz1yQc;
	Thu, 10 Nov 2022 23:11:59 +0000 (UTC)
Message-ID: <dd41628d-ef9e-4f48-ba88-58cfc0a98458@riseup.net>
Date: Thu, 10 Nov 2022 20:11:57 -0300
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH v8 12/24] drm/connector: Add a function to lookup a TV
 mode by its name
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
 <20220728-rpi-analog-tv-properties-v8-12-09ce1466967c@cerno.tech>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>
In-Reply-To: <20220728-rpi-analog-tv-properties-v8-12-09ce1466967c@cerno.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Maxime,

On 11/10/22 08:07, Maxime Ripard wrote:
> As part of the command line parsing rework coming in the next patches,
> we'll need to lookup drm_connector_tv_mode values by their name, already
> defined in drm_tv_mode_enum_list.
> 
> In order to avoid any code duplication, let's do a function that will
> perform a lookup of a TV mode name and return its value.
> 
> Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
> Tested-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 
> ---
> Changes in v7:
> - Add kunit tests
> ---
>  drivers/gpu/drm/drm_connector.c            | 24 ++++++++
>  drivers/gpu/drm/tests/Makefile             |  1 +
>  drivers/gpu/drm/tests/drm_connector_test.c | 90 ++++++++++++++++++++++++++++++
>  include/drm/drm_connector.h                |  2 +
>  4 files changed, 117 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm/tests/drm_connector_test.c
> new file mode 100644
> index 000000000000..f2272b9df211
> --- /dev/null
> +++ b/drivers/gpu/drm/tests/drm_connector_test.c
> @@ -0,0 +1,90 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Kunit test for drm_modes functions
> + */
> +
> +#include <drm/drm_connector.h>
> +
> +#include <kunit/test.h>
> +
> +struct drm_get_tv_mode_from_name_test {
> +	const char *name;
> +	enum drm_connector_tv_mode expected_mode;
> +};
> +
> +#define TV_MODE_NAME(_name, _mode)		\
> +	{					\
> +		.name = _name,			\
> +		.expected_mode = _mode,		\
> +	}
> +
> +static void drm_test_get_tv_mode_from_name_valid(struct kunit *test)
> +{
> +	const struct drm_get_tv_mode_from_name_test *params = test->param_value;
> +
> +	KUNIT_EXPECT_EQ(test,
> +			drm_get_tv_mode_from_name(params->name, strlen(params->name)),
> +			params->expected_mode);
> +}
> +
> +static const
> +struct drm_get_tv_mode_from_name_test drm_get_tv_mode_from_name_valid_tests[] = {
> +	TV_MODE_NAME("NTSC", DRM_MODE_TV_MODE_NTSC),
> +	TV_MODE_NAME("NTSC-443", DRM_MODE_TV_MODE_NTSC_443),
> +	TV_MODE_NAME("NTSC-J", DRM_MODE_TV_MODE_NTSC_J),
> +	TV_MODE_NAME("PAL", DRM_MODE_TV_MODE_PAL),
> +	TV_MODE_NAME("PAL-M", DRM_MODE_TV_MODE_PAL_M),
> +	TV_MODE_NAME("PAL-N", DRM_MODE_TV_MODE_PAL_N),
> +	TV_MODE_NAME("SECAM", DRM_MODE_TV_MODE_SECAM),
> +};
> +
> +static void
> +drm_get_tv_mode_from_name_valid_desc(const struct drm_get_tv_mode_from_name_test *t,
> +				     char *desc)
> +{
> +	sprintf(desc, "%s", t->name);
> +}

I believe that it should be a blank line here for code style.

> +KUNIT_ARRAY_PARAM(drm_get_tv_mode_from_name_valid,
> +		  drm_get_tv_mode_from_name_valid_tests,
> +		  drm_get_tv_mode_from_name_valid_desc);
> +
> +static void drm_test_get_tv_mode_from_name_invalid(struct kunit *test)
> +{
> +	const char *name = *(const char **)test->param_value;
> +
> +	KUNIT_EXPECT_LT(test,
> +			drm_get_tv_mode_from_name(name, strlen(name)),
> +			0);
> +}
> +
> +static const
> +char *drm_get_tv_mode_from_name_invalid_tests[] = {
> +	/* Truncated */
> +	"NTS",
> +};

Considering that there is only one invalid test, is there a particular
reason to parametrize this test?

> +
> +static void
> +drm_get_tv_mode_from_name_invalid_desc(const char **name, char *desc)
> +{
> +	sprintf(desc, "%s", *name);
> +}
> +KUNIT_ARRAY_PARAM(drm_get_tv_mode_from_name_invalid,
> +		  drm_get_tv_mode_from_name_invalid_tests,
> +		  drm_get_tv_mode_from_name_invalid_desc);
> +
> +static struct kunit_case drm_get_tv_mode_from_name_tests[] = {
> +	KUNIT_CASE_PARAM(drm_test_get_tv_mode_from_name_valid,
> +			 drm_get_tv_mode_from_name_valid_gen_params),
> +	KUNIT_CASE_PARAM(drm_test_get_tv_mode_from_name_invalid,
> +			 drm_get_tv_mode_from_name_invalid_gen_params),
> +	{ }
> +};
> +
> +static struct kunit_suite drm_get_tv_mode_from_name_test_suite = {
> +	.name = "drm_get_tv_mode_from_name",
> +	.test_cases = drm_get_tv_mode_from_name_tests,
> +};
> +
> +kunit_test_suites(
> +	&drm_get_tv_mode_from_name_test_suite
> +);

Considering that there is only one suite, you could use the
kunit_test_suite macro instead.

Best Regards,
- Maíra Canal

> 
