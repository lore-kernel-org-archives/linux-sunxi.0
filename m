Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793085959;
	b=oWy0tEcdnF61L7Mhshg+N4D1VmVW8NEzJktL0VnwGpUOMS2rUu+0IOSMQFkDYosiQjvd
	 YXppRuF13YQwvZdWC4BjFSd/Wry3xz0r7XIkioOWUvPJ+5rLlK6ggMb77udL391bJzb+E
	 ynHl/q5EnNyOT98Bxyf753pZy5695kdHvwksl82C3rJ2DOUe00bShfuYMQn37VEJbSiAs
	 C8BIz8m6X5DkdQZEtcsC1I/uctF9gd1KyQ+dZ41kjC0udl0oWz7+TGQUt+gibpjrOMFQY
	 bquPPzx4gdjs0Mbch3uSVLdITtxTOQYxuYwjpx9/9Lwk3ZwvqgJ/LdtwAShBnh4leEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793085959;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=Qd/5lb2CY+C9moNEfnfMYyvO1d2LW0AM03zWz1R1+xE=;
	b=BRwAZDUInRPmnA/Si6xn1L0sl/1JGlrL9DjkSIKd4RplRVNN4PYGbwpg1DOXfRvuyIHK
	 xwWlUOsNNUcxfXZ9YnH78GEenbvttFVDle8BMqWhnlcQstdy2tGOdsS7AzftTUrhtyw9H
	 v49QfTsXMj46m0gZ1q10h8CRaOtOFciKV8yE2aJ0kMMh7gsaLJnNIGARCx+H0qcWgMTAH
	 tzuoXKV20M3vWh6De0gC5ZNC8VqZhxsETm3y9b6APPCc+3smjeUJ3MajrwmlcqMc6t73V
	 9ExfW7faqhL+a7NvG2vjJbrE6QKu+DSUQWxGOJxtfvZdJhIw7Q0xFjjRoOyYm+ZIJPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aR058ypB;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1107606A31B
	for <linux-sunxi@lists.linux.dev>; Tue, 27 Oct 2026 07:25:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1107606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aR058ypB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793085959; x=1824621959;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=r5hxiYwKE4osvI84HGJH8mSrHPipdV0Nlqi1ddY2Xq4=;
  b=aR058ypBCFeh8Y2hYdevopotXh9BeaO7CAJwb+ox1lvMUr/vnbaIwsOu
   iYk1Gi+w8PzJfMwPu8BguK0Te82XtD9QNoNiOA9N/kMSj5OYONqX6rJmS
   +yM+gI9dMiHM/gbyoq73aAUkB69EfvoJ2vUxzufdQftheGvu3DnPCalJV
   u6a/TB0wwZwIxEgdO73HxmFU0Uta76DGIrXiprRT1bNiXaKFxumpUNL5Q
   zAdb+KYr0p+/z8vjcszZU11mZ0Y+J8Y6Fphr7+cpWinOPVRZFAAyKt6Rr
   w9HtWpTmgjr9SNlzx2PJxrcA0jHg3gFHzREzixO1K/vZUW/1P2WmV+88u
   A==;
X-CSE-ConnectionGUID: eO4WUPmmTDmDx4VhGLQDxQ==
X-CSE-MsgGUID: 92swLjhlQzqCZHC7R44+jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1674372"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1674372"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 00:25:58 -0700
X-CSE-ConnectionGUID: Op8EKmWpTe2Dg6J55hx/ZQ==
X-CSE-MsgGUID: PTuUsTGxS7CobRS55FyWEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4431277"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.196])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 00:25:54 -0700
Date: Tue, 27 Oct 2026 09:25:51 +0200
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
Subject: Re: [PATCH v3 3/4] serial: 8250_dw: configure the Allwinner H616 UART
Message-ID: <auBR__5g021tMvQR@ashevche-desk.local>
References: <20261024-submit-h616-uart-fifo-v1-v3-0-286fc1b8c3c1@gmail.com>
 <20261024-submit-h616-uart-fifo-v1-v3-3-286fc1b8c3c1@gmail.com>
 <auBRD7Ny6u_a9X7p@ashevche-desk.local>
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
In-Reply-To: <auBRD7Ny6u_a9X7p@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Oct 27, 2026 at 09:21:57AM +0200, Andy Shevchenko wrote:
> On Sat, Oct 24, 2026 at 02:22:25PM -0600, James Hilliard wrote:

...

> > +static int dw8250_sunxi_set_rxtrig(struct uart_port *p, unsigned char bytes)
> > +{
> > +	struct uart_8250_port *up = up_to_u8250p(p);
> > +	unsigned int i;
> > +	int ret;
> > +
> > +	/* Use the nearest lower threshold, as the generic 8250 implementation does. */
> > +	for (i = 1; i < UART_FCR_R_TRIG_MAX_STATE; i++)
> > +		if (bytes < dw8250_sunxi_rxtrig_bytes(p, i))
> > +			break;
> 
> Can we provide an array of the possible values and deduplicate this loop?
> 
> drivers/tty/serial/8250/8250.h:
> 
> static inline int serial8250_bytes_to_fcr(unsigned char *rxtrig_bytes, unsigned char bytes)
> {
> 	for (unsigned int i = 1; i < UART_FCR_R_TRIG_MAX_STATE; i++) {
> 		if (bytes < rxtrig_bytes[i])
> 			/* Use the nearest lower value */
> 			return (--i) << UART_FCR_R_TRIG_SHIFT;
>         }
> 
>         return UART_FCR_R_TRIG_11;
> }
> 
> drivers/tty/serial/8250/8250_port.c:
> 
> static int bytes_to_fcr_rxtrig(struct uart_8250_port *up, unsigned char bytes)
> {
>         const struct serial8250_config *conf_type = &uart_config[up->port.type];

>         if (!conf_type->rxtrig_bytes[UART_FCR_R_TRIG_BITS(UART_FCR_R_TRIG_00)])
>                 return -EOPNOTSUPP;

Even this probably should be moved above as well.

> 	return serial8250_bytes_to_fcr(conf_type->rxtrig_bytes, bytes);
> }

> (this split should be done in a separate preparatory change).

-- 
With Best Regards,
Andy Shevchenko


