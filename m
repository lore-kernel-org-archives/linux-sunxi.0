Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC78B23C7
	for <linux-sunxi@lists.linux.dev>; Fri, 30 Sep 2022 11:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
	; s=ds202112; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7Di28lWOOvJdb7/KJIOtxHafXM6u5ojd9FOh8YHDwCU=; b=tk8OCpw79AlGWFAmVnxYVlB+F0
	LBPcXRDMb/vz/ERMFSH8Hl8ySWNc96e9C+AogFh+UjMU34GJHp9P7bzomGLe8Rk/zSPKkU+7wkhSo
	99uZzMlp23oyplax2bgnxnx/ZREvU0mQIl+6OB/e+F+0xGw74ASB2sVpbn9iklF8iJj3jq/APAQQ1
	QagX1o/tzUk1VOCvdqNj9NvJfx0g35oEw2Y1b748DsOKi58Q/j3abQWZgblEuoASeTW/qHWtGt0E/
	HOvhI++NcKviGTCoNzDYWDfH5oSdlnSflPa+2XHeejXGdEpl/lSMMSMMEx3HWNAzlwCr3kdja81NI
	gK2xqamg==;
Received: from [2a01:799:961:d200:c807:6849:43f8:dd23] (port=54733)
	by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <noralf@tronnes.org>)
	id 1oeEIM-0002yg-BL; Fri, 30 Sep 2022 13:35:06 +0200
Message-ID: <f3ae391f-2656-549e-ee73-f7efc547c0be@tronnes.org>
Date: Fri, 30 Sep 2022 13:34:58 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v4 01/30] drm/docs: Remove unused TV Standard property
To: Maxime Ripard <maxime@cerno.tech>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Karol Herbst <kherbst@redhat.com>, Samuel Holland <samuel@sholland.org>,
 Lyude Paul <lyude@redhat.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Emma Anholt <emma@anholt.net>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, intel-gfx@lists.freedesktop.org,
 linux-sunxi@lists.linux.dev, Hans de Goede <hdegoede@redhat.com>,
 nouveau@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 linux-kernel@vger.kernel.org, Dom Cobley <dom@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?=
 <noralf@tronnes.org>
References: <20220728-rpi-analog-tv-properties-v4-0-60d38873f782@cerno.tech>
 <20220728-rpi-analog-tv-properties-v4-1-60d38873f782@cerno.tech>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220728-rpi-analog-tv-properties-v4-1-60d38873f782@cerno.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



Den 29.09.2022 18.30, skrev Maxime Ripard:
> That property is not used or exposed by any driver in the kernel. Remove
> it from the documentation.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 
> ---
> Changes in v4:
> - New patch
> ---
>  Documentation/gpu/kms-properties.csv | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/Documentation/gpu/kms-properties.csv b/Documentation/gpu/kms-properties.csv
> index 07ed22ea3bd6..45c12e3e82f4 100644
> --- a/Documentation/gpu/kms-properties.csv
> +++ b/Documentation/gpu/kms-properties.csv
> @@ -91,7 +91,6 @@ omap,Generic,“zorder”,RANGE,"Min=0, Max=3","CRTC, Plane",TBD
>  qxl,Generic,"“hotplug_mode_update""",RANGE,"Min=0, Max=1",Connector,TBD
>  radeon,DVI-I,“coherent”,RANGE,"Min=0, Max=1",Connector,TBD
>  ,DAC enable load detect,“load detection”,RANGE,"Min=0, Max=1",Connector,TBD
> -,TV Standard,"""tv standard""",ENUM,"{ ""ntsc"", ""pal"", ""pal-m"", ""pal-60"", ""ntsc-j"" , ""scart-pal"", ""pal-cn"", ""secam"" }",Connector,TBD

This property is listed under radeon and it is used in
drivers/gpu/drm/radeon/radeon_display.c

Noralf.

>  ,legacy TMDS PLL detect,"""tmds_pll""",ENUM,"{ ""driver"", ""bios"" }",-,TBD
>  ,Underscan,"""underscan""",ENUM,"{ ""off"", ""on"", ""auto"" }",Connector,TBD
>  ,,"""underscan hborder""",RANGE,"Min=0, Max=128",Connector,TBD
> 
