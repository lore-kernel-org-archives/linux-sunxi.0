Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792745066;
	b=N9W0dyeXGPtN53RJHbPW+983zPa6O6c4b5WkpwFX/oE9t2+UO0T6D+4sqsrPktWSB/Np
	 twK01EgFjcloPlVsF1aTONwRKvltzlKDZ2Z/LpkzPeD1rY/rwnKwBlxO61Jm7YQw6i+Yr
	 5SJyYZJzW9rCnrWwP518dVM5X6UbgcOEYfFQifNXJ4HLv9W5mXHQMHX/7Nnf3NRivOXpK
	 Lwp57ZPygJ6Vzuq0wIr9u96udpe+ooBzNKKQGzsFMh8uYBitf4BObvY4aNJjPrcuDcImZ
	 axC3Ew+j9p/jqcHYMAyQdaRXF8Um3RKuo8yIgkraD4eFdIcq4TYc1jnBz8+SplZ73/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792745066;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=K1kTIFoe6i1xDHtfLoz66uWP64coXUajiqWJkaCC3as=;
	b=gk86U3S0UjiX/RTpNIEehjTRXpgKSxJW4q3ZU037R3FZrVvI6/Qed71ZBV01ZJa9qXHA
	 qHkZOUC6YLaEJ8t7VvkZDS951xrCP+baJsESP2D1EV1Gwjm0VnRPSbXoaqf+JRU66M89r
	 DIBMDb6V6K+AQT+hBjUcWvpNjAQfArJuQPgjPeSFyjFXiGTmEZRv5q31JwPaCnDrYO5CB
	 iHp319XaBZALrDOhK2qZRgcpSUAA9I/KA/c+xJVqdjNfiqyt1TfJIQUI4434VIIp0vehM
	 QyGeRpGCtVvNrKhPhqVPP6ojXebdJdNku/93hltkhw9lP+lVvJppU08oMITgzUfiOcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iqwddOac;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D10606A31A
	for <linux-sunxi@lists.linux.dev>; Fri, 23 Oct 2026 08:44:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61D10606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iqwddOac
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792745064; x=1824281064;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OsCnZCSIZp91hbEsolldC49llZuGKebJONP9W/QrldE=;
  b=iqwddOacrUmKNSX56bgwcqmdV/pjJ7F5CEjm/eMFnsg/HZWYDQFX2pKj
   Rtwas0g+hFnKEv2kx2e8DcikpcSt092fBeISN3pFGGhLhbmUvqa1D/E3O
   YRluZGX1C2Gptnt1UL6H0raWBGXvz/dK9GK+o3JKuVKwsDCu1cimLiWY9
   LJFLkYeHSVzBZrNm6T+VqmtNJQ1AAVY/WkrtfORj9041UcdqpZRNgqQ1P
   /DT+DO68D8/lQhaKla4fIpVp2TDfh1gOfX/BhgSGztOAZbVCmQFUoL57q
   Dd5rdXdm6S2sdhJd/427juK1QeAgEehsfdMSW03R7XKbgwgyxRVwgmKLo
   A==;
X-CSE-ConnectionGUID: XNgGt1JJQLeIu7QWltHAmQ==
X-CSE-MsgGUID: hx5ezLiWTgyY3fe/wzHLPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1393236"
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="1393236"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 01:44:24 -0700
X-CSE-ConnectionGUID: 6QZyP2KcSEOiTNAvKkm0rA==
X-CSE-MsgGUID: uXTOKeiJRTuoCZGli0F6TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="5408334"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.100])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 01:44:21 -0700
Date: Fri, 23 Oct 2026 11:44:18 +0300
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
Subject: Re: [PATCH 2/3] serial: 8250_dw: configure the Allwinner H616 UART
Message-ID: <atseYvQUYvpMFEIM@ashevche-desk.local>
References: <20261023-submit-h616-uart-fifo-v1-v1-0-e4a3bae2eba8@gmail.com>
 <20261023-submit-h616-uart-fifo-v1-v1-2-e4a3bae2eba8@gmail.com>
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
In-Reply-To: <20261023-submit-h616-uart-fifo-v1-v1-2-e4a3bae2eba8@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Oct 23, 2026 at 01:33:50AM -0600, James Hilliard wrote:
> H616 has 256-byte transmit and receive FIFOs, but its optional DesignWare
> component parameter register reads as zero. Generic 16550 probing leaves
> the port using the 16-byte FIFO configuration and its trigger-level table.
> DMA attachment also depends on a FIFO size being available during probe,
> so these ports do not reach the existing 8250 DMA path.
> 
> Use a fixed port configuration for the H616 compatible, with a 256-byte
> transmit load and the documented receive thresholds of 1, 64, 128 and 254
> bytes. Select the quarter-full receive trigger by default.
> 
> Skip optional-register probing for this fixed configuration. H616 has
> debug-divisor and RS485 control registers at the offsets used to detect
> DesignWare hardware RS485 and fractional-divisor support. Probing these
> offsets writes unrelated registers and can select incompatible callbacks.
> Keep the BUSY-safe integer divisor hook and software RS485 handling.
> 
> Use the existing SKIP_SET_RATE quirk to keep the UART clock enabled during
> termios changes. Its clock is a gate on the shared APB2 source, rather than
> an independent baud-rate generator.
> 
> Attach DMA from the fixed configuration before registering the port. The
> 8250 core installs its FIFO defaults during registration, after the probe's
> FIFO-size test. Configure single-byte RX and TX bursts because the
> peripheral request can correspond to just one character. The existing
> startup path requests the firmware-described channels and falls back to
> PIO when they are unavailable or the port is a kernel console.

...

>  	/* Internal 8250 only */
>  	UART_PORT_AIROHA		= 124,
>  	UART_PORT_AIROHA_HS		= 125,
> +	UART_PORT_DW_APB_256	= 126,

Why? Besides the poorly chosen name, what prevents us from modifying the
corresponding parameters at probe time by leaving the one of the existing
types?

...

>  struct dw8250_platform_data {
>  	u8 usr_reg;
>  	u32 cpr_value;
> +	/* Use a fixed configuration instead of probing optional registers. */
> +	unsigned int type;
> +	unsigned int dma_maxburst;

This sounds like a hack.  Why do we need type here? The address of platform
data is enough, no?

>  	unsigned int quirks;

-- 
With Best Regards,
Andy Shevchenko


