Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8020517564
	for <linux-sunxi@lists.linux.dev>; Fri, 22 Mar 2024 11:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711108018; cv=none; b=tpCSAGh99BEVBh+RELxOZQh468mWxlbYv24j4UIza0kFA0N/CPpF4nBWL47aDr1J2F43oo2mEUG0ib7lmgrPnRqnyUDE0V0Hr6bJsSZhITYO9diuHLw2gHxZA/maD93TzEd2T+w7tdsV8VNUzokgz8qZ4U2Zc+xuwYlN2X+kVRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711108018; c=relaxed/simple;
	bh=medsa2dMRB93xUxNAamarustBHMc8szL/8blQzMu2XM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fEb23FrBKnjEpeF9XXkRglh+Gw4mTOBmhyC0FlOgNlEqmf7skVEMBC1B+UVpqQ3N4INwkHzJOmr7YuzbO9/5w2BZQ8pDqpQf7p0QKb3KUKizD5dUkt31f+TJeLI8t/fV9fQFjOSWoJsi4q/i/y2nM5X6gz0D4N0ZafqhqYjiaOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RnYpRFUX; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RnYpRFUX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711108016; x=1742644016;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=medsa2dMRB93xUxNAamarustBHMc8szL/8blQzMu2XM=;
  b=RnYpRFUXBhtxlEQSrG2flaemR1TmmDRuGq+gpeHY69uvmxFUbLoA3hZK
   72Ta3WUOFSpfSv50e2RI59325+Dq2KXX8HS7gcXhYKLLS3Il/AFVb8gzY
   H/t+dzMpvQzmn+5VHYY5sHBEWP3v6Ca3R/GziR68BZ7us8XbLoitkyFhL
   JTxFLEISjxqBDVWls7zh3f6kHWWKynRxg3c6BYxi7JHD6Okv+hHSgBn8/
   e8LR9D8thOqQbyK7V8vMaF/UTsEYE1jq0iUnStDYFCZMLW18iwFUtC9M8
   bB7mQiEproZjsYI8uf/EzGFWme6qChDvQjw4QLoAp2Xwerz3C0QSTK4I3
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="23604093"
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; 
   d="scan'208";a="23604093"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2024 04:46:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; 
   d="scan'208";a="19349726"
Received: from ghoshsu1-mobl.ger.corp.intel.com (HELO localhost) ([10.252.55.6])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2024 04:46:48 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Sui Jingfeng <sui.jingfeng@linux.dev>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, Sandy Huang
 <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Hans Verkuil <hverkuil@xs4all.nl>, Sebastian Wick
 <sebastian.wick@redhat.com>, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [v10,20/27] drm/connector: hdmi: Add Infoframes generation
In-Reply-To: <20240322-petite-fabulous-bustard-b168ec@houat>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240321-kms-hdmi-connector-state-v10-20-e6c178361898@kernel.org>
 <07125064-2a78-4515-bb48-655f2aec140f@linux.dev>
 <87sf0iliyh.fsf@intel.com> <20240322-petite-fabulous-bustard-b168ec@houat>
Date: Fri, 22 Mar 2024 13:46:42 +0200
Message-ID: <87plvmjxp9.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, 22 Mar 2024, Maxime Ripard <mripard@kernel.org> wrote:
> On Fri, Mar 22, 2024 at 11:22:14AM +0200, Jani Nikula wrote:
>> On Fri, 22 Mar 2024, Sui Jingfeng <sui.jingfeng@linux.dev> wrote:
>> > Hi,
>> >
>> >
>> > On 2024/3/21 23:29, Maxime Ripard wrote:
>> >> Infoframes in KMS is usually handled by a bunch of low-level helpers
>> >> that require quite some boilerplate for drivers. This leads to
>> >> discrepancies with how drivers generate them, and which are actually
>> >> sent.
>> >>
>> >> Now that we have everything needed to generate them in the HDMI
>> >> connector state, we can generate them in our common logic so that
>> >> drivers can simply reuse what we precomputed.
>> >>
>> >> Signed-off-by: Maxime Ripard <mripard@kernel.org>
>> >> ---
>> >>   drivers/gpu/drm/Kconfig                            |   1 +
>> >>   drivers/gpu/drm/drm_atomic_state_helper.c          | 338 +++++++++++++++++++++
>> >>   drivers/gpu/drm/drm_connector.c                    |  14 +
>> >>   .../gpu/drm/tests/drm_atomic_state_helper_test.c   |   1 +
>> >>   drivers/gpu/drm/tests/drm_connector_test.c         |  12 +
>> >>   include/drm/drm_atomic_state_helper.h              |   8 +
>> >>   include/drm/drm_connector.h                        | 109 +++++++
>> >>   7 files changed, 483 insertions(+)
>> >>
>> >> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>> >> index 16029435b750..3d3193c7aa5f 100644
>> >> --- a/drivers/gpu/drm/Kconfig
>> >> +++ b/drivers/gpu/drm/Kconfig
>> >> @@ -97,10 +97,11 @@ config DRM_KUNIT_TEST
>> >>   	  If in doubt, say "N".
>> >>   
>> >>   config DRM_KMS_HELPER
>> >>   	tristate
>> >>   	depends on DRM
>> >> +	select DRM_DISPLAY_HDMI_HELPER
>> >
>> > Should we select DRM_DISPLAY_HELPER here? Otherwise there will have some compile error
>> > emerged with default config.
>> 
>> Can we stop abusing select instead of adding more selects to paper over
>> the issues?
>> 
>> Use select only for non-visible symbols (no prompts anywhere) and for
>> symbols with no dependencies.
>
> I don't really have an opinion there, but it looks like all the other
> helpers Kconfig symbols are using select everywhere, and I don't really
> see how we could turn them into visible symbols with depends on without
> breaking a number of defconfig.
>
> Could you expand a bit what you have in mind here?

Just my standard grumbling about the rampant select abuse.

Maybe one day someone takes the hint and starts fixing things up. :p

See the note under "reverse dependencies" at [1].


BR,
Jani.


[1] https://docs.kernel.org/kbuild/kconfig-language.html#menu-attributes


-- 
Jani Nikula, Intel
