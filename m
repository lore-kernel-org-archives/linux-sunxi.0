Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60627C
	for <linux-sunxi@lists.linux.dev>; Tue, 30 Aug 2022 10:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661856203; x=1693392203;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=1JuE3MlMyluva+oTcotxIb88e/kWe/AXbzFxNtVjZ48=;
  b=ZPqfZqh9kdZL496Ur0JCehwqJi1G0tc2+qDvcTklIgdLwBpDkPOOgYhf
   5M5ipuSPOnFQHg9tm8m1AFYeSB6xsbvGB6D+mhKHBhMxDAsRouB1Yv3u/
   Pm56NHCxBkJW/MhGnX5vC/AEKCh6PF9uUiuzgtcD7zdOvcN4r0xG58NNA
   qJMQKaSsiMV11gO9bcBzeqTYe8rtco1D346odGxS2KjJbiAAMj8pLAbyc
   8kd7FpnV68i2gAgJtyqfXWIa/nI3oKagteHhWEW0u7ldRYAen8NBhkswf
   r1HqJK4Mo/JuJ4StBZnG8U5hH8NC/EUo5HxdE1ZHbxCLaq6NHpPwZJnDP
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10454"; a="275542467"
X-IronPort-AV: E=Sophos;i="5.93,274,1654585200"; 
   d="scan'208";a="275542467"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2022 03:43:23 -0700
X-IronPort-AV: E=Sophos;i="5.93,274,1654585200"; 
   d="scan'208";a="672807662"
Received: from amrabet-mobl.ger.corp.intel.com (HELO localhost) ([10.252.41.211])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2022 03:43:15 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard
 <maxime@cerno.tech>
Cc: Maxime Ripard <mripard@kernel.org>, Ben Skeggs <bskeggs@redhat.com>,
 David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>, Thomas
 Zimmermann <tzimmermann@suse.de>, Lyude Paul <lyude@redhat.com>, Philipp
 Zabel <p.zabel@pengutronix.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Karol Herbst <kherbst@redhat.com>, Noralf
 =?utf-8?Q?Tr=C3=B8nnes?=
 <noralf@tronnes.org>, Emma Anholt <emma@anholt.net>, Daniel Vetter
 <daniel@ffwll.ch>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Hans
 de Goede <hdegoede@redhat.com>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, Phil Elwell
 <phil@raspberrypi.com>, Intel Graphics Development
 <intel-gfx@lists.freedesktop.org>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, DRI Development
 <dri-devel@lists.freedesktop.org>, Dom Cobley <dom@raspberrypi.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Nouveau Dev
 <nouveau@lists.freedesktop.org>, linux-sunxi@lists.linux.dev, Mateusz
 Kwiatkowski <kfyatek+publicgit@gmail.com>
Subject: Re: [PATCH v2 14/41] drm/modes: Move named modes parsing to a
 separate function
In-Reply-To: <CAMuHMdV9wVgHFfwHoqtBoYzJDnjDmKTfaZkAKvTVKh1Y-2x1pA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-14-459522d653a7@cerno.tech>
 <CAMuHMdV9wVgHFfwHoqtBoYzJDnjDmKTfaZkAKvTVKh1Y-2x1pA@mail.gmail.com>
Date: Tue, 30 Aug 2022 13:43:07 +0300
Message-ID: <87czcidnb8.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, 30 Aug 2022, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Mon, Aug 29, 2022 at 3:13 PM Maxime Ripard <maxime@cerno.tech> wrote:
>> +#define STR_STRICT_EQ(str, len, cmp) \
>> +       ((strlen(cmp) == len) && !strncmp(str, cmp, len))
>
> This is not part of the move, but newly added.

The same construct is also duplicated elsewhere in the series, and I
kept being confused by it. The above is precisely the same as:

	str_has_prefix(str, cmp) == len

Which is more intuitive and available in string.h instead of being a
local duplicate.


BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
