Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793788807;
	b=L7mUq+DMbsx2pJZ6uyGavQDu/3AlqC5TdqlRmgxxuZIIWIFPM06rhxUCn2OmBzj/k29l
	 njp9A5bw3MWQamtv0gcr2UA/Fk8BUQFMiWcX49kDm0u93OvVckzbvt+CbaXct5ZJU79q0
	 boksExNl4iMEfcTDsrjAPk88pxj6iS/0BXgoaG8tRxu/kA/7iGCGq4G9N4uqoFbndz50r
	 /IRJQWoUUPgkA88zuGaV8Irie+Ecp7k3ADHVlSkvWfJk1tQHnUi1gV2oc3aHOY8rIGrIr
	 /iwC4lcpMUkXOSX1afmq2MvZIE/f3m8JDvRGP9FZbctPL69vBixLl3NWu6P/+PZHT0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793788807;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=9nviUxxklDz1e7RQotS+S5xXIzfCLzTAm+63a1Agefo=;
	b=XhkBwqaFQvPslddv2gRlQHKVRKgmK5pCdq13aABdfBIfph+nh1bbvVdAxsMNt9yKtyKf
	 1ly4o2rnc8g0J0Mo9dHHTvhrTpJtm4VfngZMWTYqYmbXgyuL0wA/9YBb0a1mxkEle28SC
	 +orFij9MYKjS7oj1/Qspyb67FG5TgI44T+96+0yHVpLEgrP9U7qaFD3lStZF1x7vSrDuu
	 WlStVZedwsotK+LkZS+gnl33wUiLFLPwCMIWSR0PofWmvx5b222qTeCbgAXHXApF0pRt6
	 dywEpW/J6NRG+8ZHcNbev41iDfdpZbOF8Ns7ebO07Feg5J1DHzSEPAxCLDO5SIsUzUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A4GS76s4;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A709606A326
	for <linux-sunxi@lists.linux.dev>; Wed,  4 Nov 2026 10:40:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A709606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A4GS76s4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793788807; x=1825324807;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gS4Z3hxrWiNXk0PZbDdWd9RFAdHS8/Nmmvft9Q2f1Dg=;
  b=A4GS76s4sQTRmC8reuCQpfR+h5NxcBgdDdlBGugjr4nHs/Hi2jIiwyMg
   BrDI6Ta2xdtZRrjXNlFcCqJVn684CbwIa3ermOgVwPefAibPDCOjM/+gc
   DJX1s9qKyEHQNsQ7jpgeMDEUgi2mhTQKcVHUJkGcnQgc1jsNIUA0/myiJ
   8+q2q6jhJLkB5RkF29IZtCZ8Gnoqjobmf+1h8MKyHzA7XaFfKNULLL5/Z
   ZRrn663t1gwQFSla9CN2o4kBkjV3IhwWTokY+GNkPJESyqkkIPU4il0E+
   nAO9e9UAI97xFlee4SBGm7xDHHOLed4E80g8exMPNVLnakKbtCt0CsNRp
   Q==;
X-CSE-ConnectionGUID: swtztMFISrKNvtnT0zreQQ==
X-CSE-MsgGUID: hoZWlUESQYqezbStwUkIOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2436336"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2436336"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 02:40:06 -0800
X-CSE-ConnectionGUID: xHuM0kqnRyy5PTiMdZKYlw==
X-CSE-MsgGUID: IJOAm2dLQRCs+ce9hVyt8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="7007981"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 02:40:03 -0800
Date: Wed, 4 Nov 2026 12:40:01 +0200
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
Subject: Re: [PATCH v7 05/12] serial: 8250_dw: derive RX trigger thresholds
 from the FIFO depth
Message-ID: <ausLge5yYc2W00zi@ashevche-desk.local>
References: <20261103-submit-h616-uart-fifo-v1-v7-0-c9e248d685c1@gmail.com>
 <20261103-submit-h616-uart-fifo-v1-v7-5-c9e248d685c1@gmail.com>
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
In-Reply-To: <20261103-submit-h616-uart-fifo-v1-v7-5-c9e248d685c1@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Nov 03, 2026 at 02:39:58PM -0700, James Hilliard wrote:
> DW_apb_uart uses receive thresholds of one byte, one quarter full,
> one half full and two bytes below full. The generic 16550A table describes
> these encodings only for a 16-byte FIFO. For example, the half-full setting
> on a 64-byte DW FIFO is reported as eight bytes instead of 32, and a sysfs
> request for 32 bytes selects the 62-byte encoding.
> 
> Build a per-port threshold table from the discovered FIFO depth in dwlib
> and install receive-trigger callbacks for CPR-described FIFOs, including
> LPSS ports. Keep the setup helper available to integrations which obtain
> the depth without probing the optional DW registers. Validate that each
> threshold is positive and representable before constructing the table.
> 
> Serialize FCR updates with termios and the port lock, acquire a runtime PM
> reference before accessing the device, and propagate resume errors without
> changing the shadow or hardware. Update only the trigger field so changing
> the threshold preserves the FIFO contents.
> 
> The FCR mapping is documented in the DW_apb_uart databook, section 6,
> FIFO Control Register. The existing default FCR encoding is unchanged.

...

>  static int dw8250_setup(struct uart_port *p)
>  {
> -	dw8250_setup_port(p);
> +	int ret;
> +
> +	ret = dw8250_setup_port(p);
> +	if (ret)
> +		return ret;
> +
>  	return dw8250_setup_dma(p);
>  }

Split out a change that moves from void to int for _setup_port() and do it
before the patch that creates _setup_dma(), so it will be less churn overall.

...

> struct dw8250_port_data {

>  	/* Hardware configuration */
>  	u32			cpr_value;
>  	u8			dlf_size;
> +	u16			rxtrig_bytes[UART_FCR_R_TRIG_MAX_STATE];

Put it first after the above comment. Check with `pahole` before and after
results.

>  	/* RS485 variables */
>  	bool			hw_rs485_support;

-- 
With Best Regards,
Andy Shevchenko


