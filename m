Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180415;
	b=P8lFqp3POpFpiZQXajwj4sf3a9D78G8+YqewltQ8vKYxexw0WodhkJDu5OtG0dP36feT
	 K6bxWIFM//Enw7LCpBTr9l0XR+W5kInx01sOXktE5uzVDYJ/pMTyBRyAP2y0/QCxTC3WU
	 4sQKIynZfienxWFnoN5GUOD1i61rEE+/ZaqjEw4t3Jk9gR6MjdrdgF7n3wdyU4TF0VRRD
	 FiSBpdJcF2w0tdQ/KdaD6usUUFTsz4rh5a4UkuUoeemI+My5Z6iqCq4bOv4RydgAu3Dxn
	 E+zHZpYUnMVj7mihY4bM2tUd7a1DucD8F3a+5JgIGAMCJgsiHpRIo3N6pSSl1lqpBFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180415;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=Yr7vo+fVBon7I3trLOUfnB9wqi3Kp5C3SbSgaKixCUs=;
	b=uuLwbWc3mdahv+4hsLJ5X06LHyt0SSCmLM5ZO8zAWPMZvQYDM1lzdiB9PPcZc6XW6xcz
	 KfC9xQG10ph5sCeShysnhmCqHM4CK/iO8ViRvlnIhc/kvR+gKU+XlXnAUwx6eaqI1pIRt
	 wIOTMMNtwVfQRg+VuV70aj+sTDswRloUGS+MHbC6zYS9SyAIuqp1+dMB/XO53M3j58fd0
	 mEqk7MPlBCTHGlH5vmkQXtS3OEN6UtBkgG8RLX9IJgcmH7ehhHeuOCXQk/d7RF9i7BdxQ
	 H/jXdeIWVeRDzxhWRbFpNJh2DFgRfSnX1HaKFcEqv8VVTsjAdgl8jow3YQbsEW0bSDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Arekhof0;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E5A606A31A
	for <linux-sunxi@lists.linux.dev>; Wed, 28 Oct 2026 09:40:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95E5A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Arekhof0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793180414; x=1824716414;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EmTJDFG1OVFNRYcrPeKwvBgsRAc5MJM+e8SIzVNVGsA=;
  b=Arekhof0NLjSbUnWLUxbSK3WUK7Dzn1xXtfgMOkXDyMM/WZZvElkCXxA
   tuJNRyRALAYV1X3dZMRz40AbBmy1qmansYR2HBAHFKWdKSSGWWcj2fqDt
   L3Lor/EKMpYxjHkXR8ZDS70rNHqDTXas9MPGcd+FCq/HKNJ4s9bEDuciV
   62E5cLrFK3JG74br7Z6i3aCqUAp577v2zvSuPVkgvxr4B/dTa8PAQzxm+
   rZvdawhS7x4ci4PXsjWZeEnQxz2oVqmcWNvDfnOeEj34OcjN2AQ/g/s6G
   BjZr8Wrd01kCletO64oylPr+2c3q+j2IAMPEsp4sNP9X0AW7pEr9CvyS0
   A==;
X-CSE-ConnectionGUID: 5cP6AQMzS5OjlSdOjHYakg==
X-CSE-MsgGUID: 1JDD/LI+SbKYGwIKfSMVNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1788421"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1788421"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 02:40:14 -0700
X-CSE-ConnectionGUID: PKQU2Xj1T3m4vmaxgjChxw==
X-CSE-MsgGUID: hrIrWirVSpeNIiBVTI7E7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4805839"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost) ([10.245.244.117])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 02:40:10 -0700
Date: Wed, 28 Oct 2026 11:40:07 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v4 1/5] serial: 8250_dw: select port setup through
 platform data
Message-ID: <auHC9-louZoF5Nlk@ashevche-desk.local>
References: <20261027-submit-h616-uart-fifo-v1-v4-0-d37e018fd0a6@gmail.com>
 <20261027-submit-h616-uart-fifo-v1-v4-1-d37e018fd0a6@gmail.com>
 <auG4rIHPQZXKOd6j@ashevche-desk.local>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auG4rIHPQZXKOd6j@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Oct 28, 2026 at 10:56:20AM +0200, Andy Shevchenko wrote:
> On Tue, Oct 27, 2026 at 05:05:29PM -0600, James Hilliard wrote:

...

> > +	if (!IS_ENABLED(CONFIG_64BIT))
> > +		dw8250_setup_port(p);
> 
> I believe the Cavium OCTEON  is 64-bit only platform, so you can just drop this
> conditional altogether.

Yes, confirmed. The only single ifdef is required when we use __raw_readq().
The second can be dropped. I will send a patch for that.

-- 
With Best Regards,
Andy Shevchenko


