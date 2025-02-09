Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9691E517
	for <linux-sunxi@lists.linux.dev>; Sun,  9 Feb 2025 14:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739112474; cv=none; b=FURhujNX2khpEfSX4jjtem7g68SF84X+37usam+a8ykfuQsSc4OHwBW1vp6T29dOO7oa0Jam4dK/bqff3qSgGXwnMoVPVQvjIEZr8SblHHVCDNG1Ii6mPsKf+R1utEbEJ5PDcD5co1vpl3zc2tnQCvHsxOFbnwWQz9vVO+gkehc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739112474; c=relaxed/simple;
	bh=mfm0fzgHcJqEKVxh9uCNABxYv9pkHhFHRmLF/klPJB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NCnOmfEtJbfrSVTnUPUMKNxJVx8NcHT/mTjNld2SBtV7nL9Dm4zbfMmdg8Guvu1gbg1m1Q3V8x9R1yM2dExx+ViDVNsUe3saQ6ZcRNK0jRfBfwJfPbhfwdEDLy5T8xiOm6QelxAVJb0dtcSeYvB9oKq1/t7XNsxEkEsIOE8VcY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S5HMaPku; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S5HMaPku"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739112473; x=1770648473;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mfm0fzgHcJqEKVxh9uCNABxYv9pkHhFHRmLF/klPJB0=;
  b=S5HMaPkukeljyyuw6SkbH0orrPN11joTddwOi3eEo3Y0+yrRwKjVxH7y
   tpqdU7osPfMTvKzWe3+368D7U+x4IxbdjbXFmXw6y1YfYcOfsZbkAoOR2
   0bY/weYLecwlvLzKQaJR/Wu3WaOo642yp57c1Ngphb72+qj5VEotjIZYQ
   /KxoOMjCInpUZJbh8K/xvwSQ+AB2o1Xubk20OIIn6wyPIgDTrWTZGZOns
   7PsI0vxkGYUrvYaZy4ukgbAaLa6d16J17qLHA2a3trop7S2Z61XjxLvtx
   VGcRB0mgYQ+PxNiMWF/X3LhCVA+XWmuSzV0fQWs7TflGHmZCu7v4n7oWd
   Q==;
X-CSE-ConnectionGUID: /R4uRJhBRe2TSz2xGxkgeg==
X-CSE-MsgGUID: 6+sOk47UR7COy3lJtOaAbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="39814471"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="39814471"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2025 06:47:53 -0800
X-CSE-ConnectionGUID: aiO4+LsNRneHiuvh2xmPZQ==
X-CSE-MsgGUID: olmz5DBrQCayHBuyQLFg9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116039181"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2025 06:47:48 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1th8b2-00000009qVD-1xjG;
	Sun, 09 Feb 2025 16:47:44 +0200
Date: Sun, 9 Feb 2025 16:47:44 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Aren Moynihan <aren@peacevolution.org>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Kaustabh Chakraborty <kauschluss@disroot.org>,
	=?iso-8859-1?B?QmFybmFi4XMgQ3rpbeFu?= <trabarni@gmail.com>,
	Julien Stephan <jstephan@baylibre.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, Ondrej Jirman <megi@xff.cz>,
	Dragan Simic <dsimic@manjaro.org>, phone-devel@vger.kernel.org
Subject: Re: [PATCH v5 6/8] iio: light: stk3310: use dev_err_probe where
 possible
Message-ID: <Z6jAEEU2dqn_FJVp@smile.fi.intel.com>
References: <20250208211325.992280-2-aren@peacevolution.org>
 <20250208211325.992280-8-aren@peacevolution.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250208211325.992280-8-aren@peacevolution.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sat, Feb 08, 2025 at 04:13:24PM -0500, Aren Moynihan wrote:
> Using dev_err_probe instead of dev_err and return makes the errors

Use dev_err_probe()
dev_err()

> easier to understand by including the error name, and saves a little
> code.

I believe this patch will make more sense before switching to local 'dev'
variable. Then the previous one will have an additional justification as
the "struct device *dev = ...;" lines in some cases will be added already
by this patch.

...

>  	indio_dev = devm_iio_device_alloc(dev, sizeof(*data));
> -	if (!indio_dev) {
> -		dev_err(&client->dev, "iio allocation failed!\n");
> -		return -ENOMEM;
> -	}
> +	if (!indio_dev)
> +		return dev_err_probe(dev, -ENOMEM, "iio allocation failed!\n");

We don't issue the messages for -ENOMEM.

If it's in the current code, add a new patch to drop this message and return an
error code directly.

...

> +	if (ret < 0)

Perhaps, while at it, drop these ' < 0' parts where they are not hinting about
anything.

> +		return dev_err_probe(dev, ret, "device_register failed\n");

-- 
With Best Regards,
Andy Shevchenko


