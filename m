Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794265624;
	b=Dkn8vt3DD/sD/SZhzQR0xwL1fi9j+alg8VfhSBBMrguVXJnWIHNV8C8QFVz4GfvA5y00
	 dtXbGTYqo01spY+jqa7VX7dtuvALKDdNwcweVoNSgixPa/Ht1N88wi2o9UmHi2jWjQj6e
	 +iQzTr8szBATkL6QmMcLFLW0XxXxP8E4s4voKeK7WEnQF4T5e2bXCwBtW0gKGcz8EjmwJ
	 6zU0zleF3mMeIFEQdz8FjIrwoVHUu5B1OPwf8y2xgnaF88OcUbZrlljs6A5CoqXFHYLk5
	 kbw601Yk3UO7D2NiuS+DX14M7YY89crjeWuK45IdvublrV8fR3JTVyUw6vSDRAFguZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794265624;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=cce/9RXAeZ7GCno3/183y+2YRTDy6KkvbogDyDUbNIA=;
	b=DT3JMrqVQyhmgPkBNt9cK5skPw8JJd+I88EozR/jdR4Eh3jTTnGSoKVOQG2f/qOiccbs
	 XQscrBEWq97UlR/0tCr90GDdu1zA7SXplKKZX2fF92JOGpiRwJR2sX9+wAwDn33hRLSv/
	 /X8QfKhlJRbhRT/blLmAh/xl8A+QwF67JliFNnbeZgpwmkOcOY556HEHPKSWlM/44n/c7
	 FAWjqgWAfeaxSMhKPiNLf20xBuzO+lziqt7SnIp0T5NDFR9jmP7IL3Zr6EYFj4RHGNBvz
	 4AJQdWL1VSAlJ/k6+v+k+kcXpTQkWuLOpPRNL0ctYFs2hymViiJ6cE6W3vaDmhPy6/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="Q/llW0h2";
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7B2606A31C
	for <linux-sunxi@lists.linux.dev>; Mon,  9 Nov 2026 23:07:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA7B2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Q/llW0h2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794265623; x=1825801623;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7pmup5JwHroklabp2D5twn2dbPMnGh/ztW33CBS2YQw=;
  b=Q/llW0h2hdc+2u+rt77U2KyqPtvEz9EX9nmwtMthTtQUBQTBVZmaTElU
   hECzRTHKHKOkgAEOwfMPQ41TIQ96wjJGrfzeTrq1rCMYQaJHTS299hqPS
   KH+/u2BfIKYD51IsMhZ7bq5ydDWAPQXJnYQcW/hpmbAULm4cxXUsdHc9V
   odPZSdvefu6bvenoIruqkslKqMSdTOhicSgArk3TouDAXRpLAWvSNlH5a
   am6o/yJ3dopaVexuobtX+eYVZ5KVXXQP2jBPscPa3OF6BRT7CpRvhlPxy
   YWvkh2weX1eAX/6UqkPIYByoqIhrf7JXqMyIaZ1wA0lR0slcaOwQEknWP
   A==;
X-CSE-ConnectionGUID: VcAJelV1T0SIzJPt3wj0aw==
X-CSE-MsgGUID: Vyd/OqWlRaKZA8br0q5UdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2998121"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="2998121"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 15:07:02 -0800
X-CSE-ConnectionGUID: YE0vm8kqRGqbaS24Yp0OKw==
X-CSE-MsgGUID: +wxkWmm0Q3CUyhw4YfOevQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="8424973"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 15:06:59 -0800
Date: Tue, 10 Nov 2026 01:06:57 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v8 01/11] serial: 8250_dw: allow port setup to report
 errors
Message-ID: <avJSEbiZx7cU3ONt@ashevche-desk.local>
References: <20261105-submit-h616-uart-fifo-v1-v8-0-14024d2b184b@gmail.com>
 <20261105-submit-h616-uart-fifo-v1-v8-1-14024d2b184b@gmail.com>
 <avJRsij5P7Ch3tqE@ashevche-desk.local>
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
In-Reply-To: <avJRsij5P7Ch3tqE@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Nov 10, 2026 at 01:05:28AM +0200, Andy Shevchenko wrote:
> On Thu, Nov 05, 2026 at 01:52:02PM -0700, James Hilliard wrote:
> > Return a status from dw8250_setup_port() and propagate failures through
> > the DW and LPSS probe paths before registering the UART. Use the existing
> > LPSS cleanup path to release board resources and IRQ vectors on failure.
> > 
> > Keep the current setup behavior by returning zero on both successful
> > paths. This separates error propagation from the configuration validation
> > that will use it.
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> after addressing below piece.

...

> > -	if (!data->skip_autocfg)
> > -		dw8250_setup_port(p);
> > +	if (!data->skip_autocfg) {
> > +		err = dw8250_setup_port(p);
> > +		if (err)
> > +			return err;
> > +	}
> 
> No, don't change it here, the return value will be simply ignored until the
> change that will make use of it.

Alternatively to minimize the churn do it like

	if (!data->skip_autocfg)
		err = dw8250_setup_port(p);
	if (err)
		return err;

-- 
With Best Regards,
Andy Shevchenko


