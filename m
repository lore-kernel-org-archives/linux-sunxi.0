Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7B618B488
	for <linux-sunxi@lists.linux.dev>; Mon,  4 Nov 2024 08:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730709480; cv=none; b=DeI/mY1/GxYrK9aAW3kJIMX7HBHKpRoKpTyw1jjFKmVHE19DZG3NQGpOF1ew/sIL7Xtw5AF+kPAm7zM7XeA+B2H5YyAETW9hTRE8tgxDSR5IzAwlZP1LBghrVIDSoef+8TD0/2Itn8Q6RPS4uwc8ntizjoB7+iBCZY7yWZMpCno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730709480; c=relaxed/simple;
	bh=ML6JuLR5aGTGkpWrKYsMlJoQ/UheugXHDbe7zvn2E4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=az6dubjUhbR5aUUGQ6AzG6r5Jypiw9WwjnDhqyvG7kI/IgiCYEdbcT5WpPVCo37vJhnGc4BP03m6CET4osdbE6yc1+T9yzkMaL3JWPqcyELvP9XlvQJtZ6hBgAd4a2KVjWKkl4jbw1ltf37vJOIJX/Q1OgBWjwir+lAvPpGhB2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jul8vXfO; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jul8vXfO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730709480; x=1762245480;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ML6JuLR5aGTGkpWrKYsMlJoQ/UheugXHDbe7zvn2E4g=;
  b=Jul8vXfOa42IhPeIxMaKAfw28LwfGzPP+B76rsMtrXEg3fQV6WVflnhS
   e4/nvcwrQVlItPGxGYUZhAt1UzTHNNPZoB38eDTbvJJQgpCX/1Lnqrndv
   ytv208C2kApvZgAlHkWyHZXUFMHz/o1cWDu+6f/IS8Lr5hBcEziTYtjF1
   WHAQ+/G6MdOUC2I+CtJd+gRjeN0wmHlBPJVr//FpipTgqAnvB4Qriqn6x
   U89mVORdC8BFMZzAEEEheOvQCMvy37mMieXCF/aWBP5TdiS3nLFXDOpZl
   PlIqihqQw5OareqPSKsDNTgwkPNe8AJK/ohw3IULmPQoIkqGs6NCdJvlI
   w==;
X-CSE-ConnectionGUID: dfdBNjq5SviTUurKp8MshQ==
X-CSE-MsgGUID: shuL4QUvS0W1q8Sw/UJpTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41502025"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="41502025"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 00:37:58 -0800
X-CSE-ConnectionGUID: VctOKoJRQM2VqqPSh3Rvkg==
X-CSE-MsgGUID: +3dMFlo4Q2icgewC0wY8Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="88166032"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 00:37:53 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t7sas-0000000Az4Q-200R;
	Mon, 04 Nov 2024 10:37:50 +0200
Date: Mon, 4 Nov 2024 10:37:50 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Aren <aren@peacevolution.org>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Kaustabh Chakraborty <kauschluss@disroot.org>,
	=?iso-8859-1?B?QmFybmFi4XMgQ3rpbeFu?= <trabarni@gmail.com>,
	Ondrej Jirman <megi@xff.cz>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, Dragan Simic <dsimic@manjaro.org>,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v4 3/6] iio: light: stk3310: Implement vdd and leda
 supplies
Message-ID: <ZyiH3lkMZoAS-toj@smile.fi.intel.com>
References: <20241102195037.3013934-3-aren@peacevolution.org>
 <20241102195037.3013934-9-aren@peacevolution.org>
 <20241103112933.60f96f97@jic23-huawei>
 <cx5bvcqfabsptn37uzscooh73j73dsoqadmfaibzxrzjk3byx4@ofwu7qa6ht4f>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cx5bvcqfabsptn37uzscooh73j73dsoqadmfaibzxrzjk3byx4@ofwu7qa6ht4f>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sun, Nov 03, 2024 at 11:11:13AM -0500, Aren wrote:
> On Sun, Nov 03, 2024 at 11:31:03AM +0000, Jonathan Cameron wrote:
> > On Sat,  2 Nov 2024 15:50:39 -0400
> > Aren Moynihan <aren@peacevolution.org> wrote:

...

> > For this Andy was asking for consistency.  Generally we don't insist on a
> > particular ordering in IIO drivers, but we do prefer them to be the same.
> > Your new ordering is inconsistent between resume and suspend.  Whilst
> > existing code may be inconsistent, you can still pick most common ordering
> > and use that for your new code.
> > 
> > If the existing driver is inconsistent then feel free to tidy that up but
> > do it in a precursor patch so there is a consistent style for you to then
> > carry on.
> 
> Oh right, the order of declarations in stk3310_suspend also needs to be
> flipped. Is that simple enough that you can fix it when applying this?
> 
> Apparently I was being dense, I checked the rest of the driver to see
> what it did (it's consistent about putting shorter lines & ones without
> an assignment first), and fixed the case Andy pointed out to match that,
> but failed to check the rest of the patch.

Thanks!

You may ignore my comment about RCT order if it's not that one that being
commonly used in the driver.

-- 
With Best Regards,
Andy Shevchenko


