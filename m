Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794265824;
	b=dKEEFNxicaw/SAAot3o/MrpiAj1sL1BfusJQeuXeElYPmcWF5EtTmgvnQkLOWNhiV/53
	 k7REAJbafU+EF848qwZsm+sw20VgQA34DNet72UgT6EEZKGUnD/F2iR5/GhPbBE3giqsk
	 hJqbbQ2odd7K271oKdl1d9SETW6ljgLR5pUK+IE23712wT/3i5TRflACuGXDlCjDzx+w+
	 SeynxwqyIJXgNZoXyKGr4jyxwXx+3ZLC61aWNj6Lr+lORvT1uUnP0XrOW+4b9IvC2tjWP
	 JxDydG6yH3w/v+/zX75xVY90xjY6ZaRuSbz3eWgREQxMFZIMO3ycvsHWEzf1VEPY0XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794265824;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=WUGyGqN0Xjrr8oyN7PYnUH7fmkjvYC7AdczM08DaAiA=;
	b=H6XlIb2sqvA0OSleJYfFEhQu/M1b/Xl0m5clMr0c8O5nD2Y5gYlnkQj1ZpQxDOEGQ9EE
	 CGxtkyCaM+S22UDWPEOCCcFqFWiauzOvWMFvF1MVvcXK2dyK/jybcF8spsAP+0BjS8sQj
	 IVU/3mDXSYdTX8qPLoRrSKtNyPWbP91zqxh8CFd8KFf2Afb/3cY0n70XPRIhfJGY2tY1T
	 pqVNDwceFGgYQkr0xhRp8q+FQLYEgotREo82rkTkNGwvQk34QTgPaOlhNvAg1yA2ToX0M
	 TsYvpwK431QnSvldJADZWcqHncp0kUI+a392tLOn6gePhqvvu+ZsJfX0sp0JoE9rtFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Pngp7haW;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239D2606A321
	for <linux-sunxi@lists.linux.dev>; Mon,  9 Nov 2026 23:10:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 239D2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Pngp7haW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794265824; x=1825801824;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=af3GDmz7xfwUFmwVL6uIE0r8PVeWfD9yEXjaSn5nujQ=;
  b=Pngp7haWxmR07JODslBy5AAtNCfKbG6kjQjSOeP15DeFP6qb5OS2XfgX
   /4ESlvcTzhMN92reGOkNwcpQUq00DF+YxaHVRGZNMo9RrRLVaTnULF+Ab
   wYffQyEtHuXzYUsOLn7ITFHHHFM4kBk6EQwj8ih9cpp7gXoRUeS6340b1
   1hl5xMu1XetRPZDhg+MJZFf8MvjQ4EZynhtxn2vIRXP+ucJponY30xPnr
   Uraud/WWUNqVTZ0tUu5R2u4MNECjd8uJ66159yY/LuVLznnuSNCd9OM/q
   ZqYtepR4c3s9LPMte53VQSC97gL5ZUUUm7O/TSM3fpnPhMpALfowXFpZx
   w==;
X-CSE-ConnectionGUID: q/whJnGFSPWmpxVJJ3vHxw==
X-CSE-MsgGUID: ql4Bc5e9TLeQN9wDPr7ePQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3001314"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="3001314"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 15:10:24 -0800
X-CSE-ConnectionGUID: Y+J0sHFaQjW4CBkOwp/h0w==
X-CSE-MsgGUID: hpFwZrQwQpWTELres5ey+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="9845397"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 15:10:20 -0800
Date: Tue, 10 Nov 2026 01:10:18 +0200
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
Subject: Re: [PATCH v8 06/11] serial: 8250_dw: derive RX trigger thresholds
 from the FIFO depth
Message-ID: <avJS2vUE-UrPVXqi@ashevche-desk.local>
References: <20261105-submit-h616-uart-fifo-v1-v8-0-14024d2b184b@gmail.com>
 <20261105-submit-h616-uart-fifo-v1-v8-6-14024d2b184b@gmail.com>
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
In-Reply-To: <20261105-submit-h616-uart-fifo-v1-v8-6-14024d2b184b@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Nov 05, 2026 at 01:52:07PM -0700, James Hilliard wrote:
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

> +static int dw8250_set_rxtrig(struct uart_port *p, u16 bytes)
> +{
> +	struct dw8250_port_data *pd = p->private_data;
> +	struct uart_8250_port *up = up_to_u8250p(p);
> +	int fcr, ret;
> +
> +	fcr = serial8250_bytes_to_fcr(pd->rxtrig_bytes, bytes);
> +	if (fcr < 0)
> +		return fcr;
> +
> +	guard(mutex)(&p->state->port.mutex);
> +
> +	PM_RUNTIME_ACQUIRE_IF_ENABLED(p->dev, pm);
> +	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
> +	if (ret)
> +		return ret;
> +
> +	guard(uart_port_lock_irqsave)(p);
> +
> +	up->fcr &= ~UART_FCR_TRIGGER_MASK;
> +	up->fcr |= fcr;

FIELD_MODIFY()

> +	/* Changing the trigger alone preserves the FIFO contents */
> +	serial_port_out(p, UART_FCR, up->fcr);
> +
> +	return 0;
> +}

-- 
With Best Regards,
Andy Shevchenko


