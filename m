Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCEB15B3
	for <linux-sunxi@lists.linux.dev>; Fri,  2 Feb 2024 13:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706882332; cv=none; b=oh0dIgwWY3z0V1BCsXnqHuftwbX2Hiy0WypMqgsoN5mn+PQJsRpv/ynzOf9dX8OIfYzei9dRebueMkD5Ux8xLz64+plSmEyPQsT0Shuta+4zbGtMQJIiY24EIQLVm4XsKIore5TRJm0ORnHXOnf2m5CZfMRWiSgKUJBUPr9ZQac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706882332; c=relaxed/simple;
	bh=tgr1j4EzwrF68qG4xANL4ri8EhdYwVBBDxE0H3P5pG4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=a3N20qG5uP9k0onNHRKNzDG+cTIZQIhU0YKKAn2bT+dzAqIQhSh+796sCMxFDRsrf5wgoHpt5AmT3QH4VZpV+7ZBoYHe/CAXwFj85GJrzCbC/HovZPyD8ZVm+xNoOrwyqnGKd6mj0GltyKfpE93nX86iJYKtak0weEqNJUuh6zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cRqdA5E5; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cRqdA5E5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706882331; x=1738418331;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=tgr1j4EzwrF68qG4xANL4ri8EhdYwVBBDxE0H3P5pG4=;
  b=cRqdA5E5VvMEvq1BnxJvqo/0+XuTeypYw/6SkWC7hI7l2UTAaBbEqHb/
   IDXLKDKRLwMWnpXWVWnFegXha6L6joMtRw0lipMT5HxBYGKLMh6vOIilT
   C8/Cx80WE/sZWP+nOt/UaDmUP26O7IVvgIZ1MKoYQBEo3VYvAXorKjdxT
   95iN4sTo+y7Q+U1L4z1Ca1K8ZIHCETy0FzjYABQhEtbIfrB2CR7imm1q5
   gceqk+txJYEXFZQ9iIcO3lQKg/DSJBi/fhlrpA55AusyVt/l6U9CYjwQH
   JaDkNylCFcgmFAfCfPXZQ0zNQUJLOiudZ0NeBpeDwQGVMDY6vTLHuXB0L
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="22645138"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="22645138"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2024 05:58:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="31182993"
Received: from mmermeza-mobl3.ger.corp.intel.com (HELO localhost) ([10.252.59.198])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2024 05:58:43 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>, Jonathan Corbet
 <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>, Heiko =?utf-8?Q?St?=
 =?utf-8?Q?=C3=BCbner?=
 <heiko@sntech.de>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: Re: Re: [PATCH v5 15/44] drm/connector: hdmi: Compute bpc and
 format automatically
In-Reply-To: <vydlftxen23kd2odwegxbtpaz73sy2lgpv7nlynfjr3p2xvc2b@7lkdkaw3gp5q>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231207-kms-hdmi-connector-state-v5-0-6538e19d634d@kernel.org>
 <20231207-kms-hdmi-connector-state-v5-15-6538e19d634d@kernel.org>
 <CAPY8ntBQ+qY9441-rMzq_JAoYAaY_r+E-ADv7Wry0tJNTzKpwg@mail.gmail.com>
 <jlkoofv7nszj2uqmo2672yo4wjd3yjqarge2l2hxofixcchu6a@j72pa4iybitd>
 <CAPY8ntAmXyKtebMeM7rLtgRR+QwL1H+UCwSO=bLBQN4TsgwsDg@mail.gmail.com>
 <vydlftxen23kd2odwegxbtpaz73sy2lgpv7nlynfjr3p2xvc2b@7lkdkaw3gp5q>
Date: Fri, 02 Feb 2024 15:58:39 +0200
Message-ID: <87y1c3dl2o.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, 01 Feb 2024, Maxime Ripard <mripard@kernel.org> wrote:
> We've discussed that on IRC today. I'm not sure there was a conclusion
> other than "well this doesn't seem right". I think we should at least
> provide different EDIDs depending on the connector type indeed, but
> there was also a few discussions that arose:
>
>   - Is it useful to have embedded EDIDs in the kernel at all, and could
>     we just get rid of it?
>
>   - Should we expose those EDIDs to userspace, and what happens to the
>     compositor when we do?
>
>   - The current way to generate those EDIDs isn't... optimal? Should we
>     get rid of that as well?
>
> Anyway, all of those issues have been here for a while so I don't really
> expect this series to fix that.

IMO the direction should be towards deprecating and removing the builtin
firmware EDIDs from the kernel instead of adding more or expanding on
them. They were only ever meant to be the immediate aid to get something
on screen so the user could provide a proper EDID via userspace.

BR,
Jani.


-- 
Jani Nikula, Intel
