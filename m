Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0538E3C05
	for <linux-sunxi@lists.linux.dev>; Fri, 23 Sep 2022 11:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663934390; x=1695470390;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=YaUg750lJnggz6KWmfaPEF4rvlW5TvJZSCMSaU800rA=;
  b=mTJ8gU3jHrC38YTyB/Huy/j4dsacF1+pDMrneyMvmXYH3v3po1hQXSSA
   wysOPVvLxJ5BAHgBfu3Jy5DqwIUpC6kPS9hcpBLUvCywl2ZPFsZAe/Hjc
   eC37z58TlmkfDMZ75KtKzTsEjN6fMMwLMQ+NFdp8NKFz6WSCFGzhfhPps
   +KUev76YLSRepbmV314VQi5ZRKpTAfNgeDmJUsXvDfF3Q4ic2O8xR9cRA
   c/tR1TAEUCVyIrw/mgLrvHVs65kuxbVc9evQqC5B4f0aR/5vax6jmLB35
   YB4ntSD/R/EyHaPCwoR4oX6cbgM1f3iw6okPJ+WyknvhAD8MAuvIqWzWH
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="301458093"
X-IronPort-AV: E=Sophos;i="5.93,339,1654585200"; 
   d="scan'208";a="301458093"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2022 04:59:49 -0700
X-IronPort-AV: E=Sophos;i="5.93,339,1654585200"; 
   d="scan'208";a="865270599"
Received: from armannov-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.61.93])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2022 04:59:42 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maxime Ripard <maxime@cerno.tech>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Ben
 Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Maxime
 Ripard <mripard@kernel.org>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Emma Anholt <emma@anholt.net>, Karol
 Herbst <kherbst@redhat.com>, Samuel Holland <samuel@sholland.org>, Thomas
 Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>, Lyude
 Paul <lyude@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>, Chen-Yu Tsai <wens@csie.org>
Cc: Hans de Goede <hdegoede@redhat.com>, nouveau@lists.freedesktop.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 intel-gfx@lists.freedesktop.org, Noralf =?utf-8?Q?Tr=C3=B8nnes?=
 <noralf@tronnes.org>, Dom
 Cobley <dom@raspberrypi.com>, linux-sunxi@lists.linux.dev, Maxime Ripard
 <maxime@cerno.tech>, Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 13/33] drm/client: Add some tests for
 drm_connector_pick_cmdline_mode()
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-13-f733a0ed9f90@cerno.tech>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-13-f733a0ed9f90@cerno.tech>
Date: Fri, 23 Sep 2022 14:59:23 +0300
Message-ID: <875yhe47z8.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, 22 Sep 2022, Maxime Ripard <maxime@cerno.tech> wrote:
> drm_connector_pick_cmdline_mode() is in charge of finding a proper
> drm_display_mode from the definition we got in the video= command line
> argument.
>
> Let's add some unit tests to make sure we're not getting any regressions
> there.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>
> diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
> index bbc535cc50dd..d553e793e673 100644
> --- a/drivers/gpu/drm/drm_client_modeset.c
> +++ b/drivers/gpu/drm/drm_client_modeset.c
> @@ -1237,3 +1237,7 @@ int drm_client_modeset_dpms(struct drm_client_dev *client, int mode)
>  	return ret;
>  }
>  EXPORT_SYMBOL(drm_client_modeset_dpms);
> +
> +#ifdef CONFIG_DRM_KUNIT_TEST
> +#include "tests/drm_client_modeset_test.c"
> +#endif
> diff --git a/drivers/gpu/drm/tests/drm_client_modeset_test.c b/drivers/gpu/drm/tests/drm_client_modeset_test.c
> new file mode 100644
> index 000000000000..46335de7bc6b
> --- /dev/null
> +++ b/drivers/gpu/drm/tests/drm_client_modeset_test.c

[snip]

> +MODULE_AUTHOR("Maxime Ripard <mripard@kernel.org>");
> +MODULE_LICENSE("GPL");

I think these annotations are incompatible with including the unit test,
and, in this case, affect drm.ko.

And we'll have two kinds of tests, those that get built via
tests/Makefile, and those that get included, like this one, which should
not be mentioned in tests/Makefile.

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
