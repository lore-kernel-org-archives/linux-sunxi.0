Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792486316;
	b=VDYp+BnMpoCg9B4T5zGFdzuMZ0ncg35WrIaWmwsHRRjLlf5JL+cPPplBBQgUwq6Kkhzs
	 ezVZTwloQP/TCbXpO+gcwlWw2vkhgaqacBhGyanpzuvHuUpRB/eGI4wpAGy2bP6xMmmMY
	 lTsDAhJLdpIebvBEULkEcfB9uK1/suQjXVgffTDuO3IlSJwM1hSCZIdoY5K9aMiRcOPb6
	 /hbB9IXhsUKREf0+zXvIxIw42G04Kr2EF5pZtAHxH/uQ1WVvU/kjISfFMEWkg6sKlp6iw
	 LRx78N9scJmKXBDLUzcRMYnMLv3GNFfLGFsEdO0QV4k/zQgEfNjf5+dNjE6uVZn6tvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792486316;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=K5zPCjhtiYgbSzoQkdk7jJnCY7I6uAqcp7kPNPB6WFM=;
	b=SOcV4LOyYyhovjAM1ynZNsm+uOCAzvZvysZ3nTqqxGPA4tCUud/UlJsJzHMbhjWCkEYA
	 BYNgGVWOg70Eji1tkvsjZoEIgJlwiIaE/8TPizHXbHMtwxGFSb41H/iyIWOvb7pqh/pFQ
	 OgQgMDgiinoLd8HvpQcxS4/q7+A/yVmA9wNxJOyufh1tjWdlXqdSE8bG8LyMJg0Gz+bsf
	 JWexJWE0n2JWoQB3u8jMkfqCSAFozlKEl5N1FLD06nzsKtfp2msGUTGO8S6vmVuRcCrVV
	 SHgos1qpPu8v54dv1Ulu2o14dSGG8uawDt2RzMMQMYI+6P1IAEKggqAKJ9WPfA0CCqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mXBQFzVy;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4602C606A319
	for <linux-sunxi@lists.linux.dev>; Tue, 20 Oct 2026 08:51:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4602C606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mXBQFzVy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792486316; x=1824022316;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eKzxlT0yG5FunvgfNGhCleVugyVb5jhMClq+OxxbpME=;
  b=mXBQFzVyzSEwwjARMT64iotOnCydBoSQKrHu4iiIVfelQh2qT90rIsn4
   qzqLC6Wm2M12DevI5aJKBBye/+cmKbut+b3IbxsdO+izjTzaL7PDFZ8Q2
   bOouABCrBF+yvJcG9KB7sZ7NcIXGFMgyis4UfIrS1s1JtPghehOvyQvHf
   4UtOulHcPWIHd/cfEUHApwB7D+yTSGw2uRBLlLyBVwTnKwam1wGacqR16
   e4lxZ89rMNuXN4IOnn76XFCFz/aTQwUpRxaoXXDWJb1iyQ/1CbrOo+pak
   7dDsETqWOiOiCHooCNAwynjwZmDz1MKmHhP8WAel5oDPOILuiVqpO/aeI
   A==;
X-CSE-ConnectionGUID: rGrb+V1jQ06a9W85H2Rcyw==
X-CSE-MsgGUID: BkppSOWFSUuDMnTc04C/6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1285021"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1285021"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 01:51:56 -0700
X-CSE-ConnectionGUID: FJ6CBaMOQmSasr/frxTWmA==
X-CSE-MsgGUID: G7Vb0dqQQGu/0Txavvu7Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2823950"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.72])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 01:51:53 -0700
Date: Tue, 20 Oct 2026 11:51:49 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Cc: linux-serial@vger.kernel.org, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, ilpo.jarvinen@linux.intel.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Andre Przywara <andre.przywara@arm.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/4] serial: 8250_dw: Keep the BUSY-safe divisor hook
 when DLF is present
Message-ID: <atcrpTI_R4kRM8pb@ashevche-desk.local>
References: <cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com>
 <cc358c2be6b0b4ea0323e4f694a581ffb667112d.1792439398.git.vinicius.eduardo.pedrosa@gmail.com>
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
In-Reply-To: <cc358c2be6b0b4ea0323e4f694a581ffb667112d.1792439398.git.vinicius.eduardo.pedrosa@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Oct 19, 2026 at 05:06:10PM -0300, Vinicius Pedrosa wrote:

...

> @@ -218,7 +228,9 @@ void dw8250_setup_port(struct uart_port *p)
>  	if (reg) {
>  		pd->dlf_size = fls(reg);
>  		p->get_divisor = dw8250_get_divisor;

In the case of existing _set_divisor, do we want to keep the possible set
_get_divisor as well? Shouldn't we introduce a respective _get_divisor in 8250_dw.c?

> -		p->set_divisor = dw8250_set_divisor;
> +		/* Keep a hook the driver has already installed */
> +		if (!p->set_divisor)
> +			p->set_divisor = dw8250_set_divisor;
>  	}

On top of my previous reply, why is this hunk needed?

...

But now I see that we have same function name in two files. Can we rename those
in dwlib to, for example,
dw8250_get_divisor --> dw8250_get_dfl_divisor
dw8250_set_divisor --> dw8250_set_dfl_divisor

?

-- 
With Best Regards,
Andy Shevchenko


