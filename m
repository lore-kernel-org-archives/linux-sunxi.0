Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A4A1DB350
	for <linux-sunxi@lists.linux.dev>; Mon, 28 Oct 2024 14:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730126683; cv=none; b=VOKwa270W2+w+CrQq4zweDr7iKWEFUqWboZkfeKrTjNwQzJIt3cJViiCOt/D7DyKGsE0XULDq3rT+dEfLpSOduosVyuI+VRmlhNhhiIsxgRreDNeiYzT4Na+PpWDHNtBz8Lk5uqt3c+N88SNALUE5CXsUr733ahRfuZTyzTso80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730126683; c=relaxed/simple;
	bh=Bfgx/pN4+ZpmTPUi9k1nDEyQyXcONpELcSCUR7eiAy0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b4vacbgGiE9ofsmMS9pfCTq1hkDanZhxTx9EH8tiJFiU+RapYDxIazI+3uPLkYGCR1wMLn6nZfA6eooEKjb5RODrot0/i6iLnM6AtW7wujFW1vFvE+L2/q+nAdTad/RZIdtINEEb2K2MFvdH14YgmPLAL+Ojes1+9Wj67cdbV1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oK0MZU44; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oK0MZU44"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730126682; x=1761662682;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Bfgx/pN4+ZpmTPUi9k1nDEyQyXcONpELcSCUR7eiAy0=;
  b=oK0MZU44DL9HwJ8ZlmJ5NrYiG0Wx4KnqW6KY3+pNpbuI4vwImMTmdAVj
   XtDCEzAwDM04v+E6g/1W6Z/nKQ/zts8VF48jUKkG+5H5xDovv9Blpjxko
   8WqnkOCgF4/Pm+CRc7vGt20+0L6PTnQTfFyyNtbsf1C0rQ9iw1aP0LUTA
   EHVdb7m+yQuIWq037NTVVeWKLV0T8XVgUL1HrYhA3WTUW4oB0mSoRf0x4
   o5iAWU7meJE7ZAkm8mWkLiBSYWWAWtvLvlbD8h4EuPkEmmsPuqbM2qlSY
   oFisjuIDmU3S4Uu5Wh5YCbE3xc6jtTMSCOOSwvHjECZ0nRWfcRvvmmDTE
   g==;
X-CSE-ConnectionGUID: QB/yEeEzSSCNy1CgNtPhbw==
X-CSE-MsgGUID: zFdunafhSJqMEX+UyuiknA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40824952"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="40824952"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 07:44:42 -0700
X-CSE-ConnectionGUID: Ys/a85DwTkujR009Uj6D1A==
X-CSE-MsgGUID: HVRckoVjRQaYZ+L5JfieUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; 
   d="scan'208";a="81216495"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 07:44:38 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t5Qyv-000000085jT-3zhr;
	Mon, 28 Oct 2024 16:44:33 +0200
Date: Mon, 28 Oct 2024 16:44:33 +0200
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
	Ondrej Jirman <megi@xff.cz>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, Dragan Simic <dsimic@manjaro.org>,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 4/6] iio: light: stk3310: use dev_err_probe where
 possible
Message-ID: <Zx-jUeQ9UbZt48ss@smile.fi.intel.com>
References: <20241028142000.1058149-1-aren@peacevolution.org>
 <20241028142000.1058149-5-aren@peacevolution.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028142000.1058149-5-aren@peacevolution.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Oct 28, 2024 at 10:19:58AM -0400, Aren Moynihan wrote:
> Using dev_err_probe instead of dev_err and return makes the errors
> easier to understand by including the error name, and saves a little
> code.

...

>  		data->reg_##name =					    \
>  			devm_regmap_field_alloc(&client->dev, regmap,	    \
>  				stk3310_reg_field_##name);		    \
> -		if (IS_ERR(data->reg_##name)) {				    \
> -			dev_err(&client->dev, "reg field alloc failed.\n"); \
> -			return PTR_ERR(data->reg_##name);		    \
> -		}							    \
> +		if (IS_ERR(data->reg_##name))				    \
> +			return dev_err_probe(&client->dev,		    \
> +				PTR_ERR(data->reg_##name),		    \
> +				"reg field alloc failed.\n");		    \
>  	} while (0)

Same remark, if client is not used here, supply struct device pointer directly
and make these all lines better to read.

-- 
With Best Regards,
Andy Shevchenko


