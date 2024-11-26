Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFC916F8F5
	for <linux-sunxi@lists.linux.dev>; Tue, 26 Nov 2024 12:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732623863; cv=none; b=dzyw9ataLvLFx4el7iygIzCWEafyZVhmw26E0NXW6Qh2JgSkl2knymzfgIe2+VN/d8h3W+Rq3j/6AFDTv+0tEPpvefw3bE9yXuUrVFxRJCp6L/XLY04zA5ZEb+6NV2ovIaR6UtfD0FSctDAb/ibA8WbLT5zncJCMi3Ru6nCkQsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732623863; c=relaxed/simple;
	bh=ZTHfXgFGRlIILfuHL+qBGlAm9C8PxmMo8Z9AFzfvBdw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dSy9hKSE+fXvsxtB/3bI8rHtFQhhNusuB9HF7WDFUMZIhB7hSQymFfNZ6IkiAOzg/Tg69Abgw2dI5mu/Ay8zYUXAOQA5kNMXwgkiVWg8Dic4+2ouIEstG90+Zzs+ctrHwKq98+fG5J5KFPFuOgPSRaYOUcDwKjW3gpCfTdefUY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mnh/O4oi; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mnh/O4oi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732623862; x=1764159862;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=ZTHfXgFGRlIILfuHL+qBGlAm9C8PxmMo8Z9AFzfvBdw=;
  b=mnh/O4oiXq+T4TKhBnSOYeEt1fuyU4SjKO6VaT2zQjI37a+wSYDXtDye
   /p72QAMT1n02mVzIpBkJCFS9OV1FBgncKWDXXGCi8cr9AIptqXEPR7BoM
   znummhB9lagQByjOrZLvZq9m4eSxfabtCXiD+qTWA6zx5vXKMMGOujb0q
   TaqAoBwi1jMeahV1da2cWU+xMgM+vnjIlEuMwjBkmfC0V+EhmhceCehR4
   x5QNFz0NeXjT9s/b9xn/Cal4hxShTOdooglCr5xN6MzW2YvWyua4CsEpm
   3BHof8Hjm22m/Z9nDGxyKq2JyCVie5E2nzrgCnuufXcSUm2qbTIhQurbF
   g==;
X-CSE-ConnectionGUID: lckDTat3SgGmsLsjq+q3aw==
X-CSE-MsgGUID: qXQMMkLITw+RtMRG7T4dPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="55278913"
X-IronPort-AV: E=Sophos;i="6.12,185,1728975600"; 
   d="scan'208";a="55278913"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 04:24:22 -0800
X-CSE-ConnectionGUID: p7mmBzIqQaSRBB7X5+uHcw==
X-CSE-MsgGUID: wzxtY/mSSE24Fp3vXFkb0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="96661073"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.49])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 04:24:15 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Sean Nyekjaer <sean@geanix.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Yannick
 Fertre <yannick.fertre@foss.st.com>, Raphael Gallais-Pou
 <raphael.gallais-pou@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 1/3] drm/modes: introduce drm_mode_validate_mode()
 helper function
In-Reply-To: <20241126-spry-wildebeest-of-cubism-da0a9e@houat>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241125-dsi-relax-v2-0-9113419f4a40@geanix.com>
 <20241125-dsi-relax-v2-1-9113419f4a40@geanix.com>
 <20241125-gleaming-anteater-of-perfection-42bd2b@houat>
 <874j3uxptp.fsf@intel.com>
 <20241126-spry-wildebeest-of-cubism-da0a9e@houat>
Date: Tue, 26 Nov 2024 14:24:12 +0200
Message-ID: <871pyyxjwz.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, 26 Nov 2024, Maxime Ripard <mripard@kernel.org> wrote:
> On Tue, Nov 26, 2024 at 12:16:34PM +0200, Jani Nikula wrote:
>> On Mon, 25 Nov 2024, Maxime Ripard <mripard@kernel.org> wrote:
>> > I wonder about the naming though (and prototype). I doesn't really
>> > validates a mode, but rather makes sure that a given rate is a good
>> > approximation of a pixel clock. So maybe something like
>> > drm_mode_check_pixel_clock?
>> 
>> Quoting myself from a few weeks back:
>> 
>> """
>> Random programming thought of the day: "check" is generally a terrible
>> word in a function name.
>> 
>> Checking stuff is great, but what do you expect to happen if the check
>> passes/fails? Do you expect the function to return on fail, or throw an
>> exception? Or just log about it? If you return a value, what should the
>> return value mean? It's hard to know without looking it up.
>> 
>> Prefer predicates instead, is_stuff_okay() is better than
>> check_stuff(). Or assert_stuff() if you don't return on failures.
>> """
>
> Both is_stuff_okay() or assert_stuff() return a boolean in my mind. If
> you want to return a mode status enum, I don't think they are better
> names.

Most functions returning enum drm_mode_status are called
something_something_mode_valid(). Not check something.

BR,
Jani.


-- 
Jani Nikula, Intel
