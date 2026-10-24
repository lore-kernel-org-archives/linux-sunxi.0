Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792847965;
	b=SxC+ssMmiN+32OcfGjwICs5A7Xz72+dnHnWUneikcV+qSxYXNZJpANxpQcOlkPm+jl3w
	 qa8f+HmV//Bee85puWoITmC3H4vqXdAnGf2gM5fb9KHMIQF1V+qjIkccGAxdezR82HEQi
	 vKPlmT5+mDcYbbwaPNY06TB9l8+HIZIh4gsU5yfVFO7fhzJBeGZ2RXK7+Sg6KlXxH4Ar9
	 j1jlUtB3RoVVApw0HOcyjpohftPk0vz5dz4uZ6wmuKqRdzrMp66nuS7SV0Oe8f0ECMUXr
	 EB+CZTqGC3A+R5xZA3hUIUR0iqnIXY5dKZ/natpDCSs/dj7kN3Tc85JLug9xTZk2F/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792847965;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 Organization;
	bh=+eTq2RouSMP57iyX/xKgxw3blvHVYyiPPERedc75Hk0=;
	b=X8jyztuvlwqs3RHwAwvgzBiVmlc1VMvrGSRKwgGR8+T7qtmth4ceyHiWuJReK19yE53b
	 BntdaZi7yMQuULt7AhioRJF6GurmicyDeAbGbKOCKFjHIcSOTQUb0QBAftH3dRtoZcTAJ
	 r+yeeW5P3AOrkAcfFNpejaTywW4GEPQ/VbzyHXw+NWXwYC9fjo2Yf2j0fx2Mo0TG6acK0
	 P6CrUNxsFE3u+qNu4IZqDotl5a1OVETa/1JQNte1W4SoOKL80/sos2sVV6rGsWFr2/1FE
	 KmoOgDgxjqzoHoioAlFXXpkhO67tVgjO/xLtPlM+WsNIkBrOxrYMRGf/XoAVN4ztInA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WjnNZkOf;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D17606A31A
	for <linux-sunxi@lists.linux.dev>; Sat, 24 Oct 2026 13:19:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5D17606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WjnNZkOf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792847964; x=1824383964;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=CYtQ0z2b8nAxy7Z61dsDKTufFY11coH1fY1mN0AgzEU=;
  b=WjnNZkOfHldTfFycNeL7jvmMhrrcrEkLn/bk7+hAwTnm4Sb84c1h72qz
   C7xSv8ATdEidUAkVTF2oljURe3f3G2Vnx8HoKFoz8ycUCTzKbCY84p7Ml
   xm94blQcc9QuwSfRgaGOT/FNt8HAIPXd7mvLWBSGQQgoCIsP4hn6AsgQA
   +OtdMigSTEC9zLOtZPW2H63ppdPXlIhzz6YaQwdA/4N/evL1KaYZZZsQX
   DgPZyUlpyntDL4u56DEOStZNfKPFUClAZjiUJhm3M/jZrY7pBjz1chfrS
   F1VQdNz1cwKQbVcYnoku9Y0+i+U7w0mNFU6BcDhhDg0zc1/geC+jbh2dD
   w==;
X-CSE-ConnectionGUID: xdAICAD7Q4ehNtlOZoO5bg==
X-CSE-MsgGUID: WEavO9n3SQicUfZvHzUGgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1485036"
X-IronPort-AV: E=Sophos;i="6.27,176,1787036400"; 
   d="scan'208";a="1485036"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2026 06:19:24 -0700
X-CSE-ConnectionGUID: mClJgBpfQtCb9H9Y4xRoUg==
X-CSE-MsgGUID: J3izvhnITo6KSugqa4/SpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,176,1787036400"; 
   d="scan'208";a="5714256"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.221])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2026 06:19:20 -0700
Date: Sat, 24 Oct 2026 16:19:18 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: James Hilliard <james.hilliard1@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 2/3] serial: 8250_dw: configure the Allwinner H616 UART
Message-ID: <atywVnHU5NsP_gOP@ashevche-desk.local>
References: <20261023-submit-h616-uart-fifo-v1-v1-0-e4a3bae2eba8@gmail.com>
 <20261023-submit-h616-uart-fifo-v1-v1-2-e4a3bae2eba8@gmail.com>
 <atseYvQUYvpMFEIM@ashevche-desk.local>
 <CADvTj4pRW9q6VyQ=nLi8q0mMF8LgccfO4eqAeqgzzgOkDno1dw@mail.gmail.com>
 <CAGb2v65LVm1GV2kV4bVO8YJd16tkubHOvXUtbJ3uuBw2O3TBsA@mail.gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGb2v65LVm1GV2kV4bVO8YJd16tkubHOvXUtbJ3uuBw2O3TBsA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Oct 24, 2026 at 10:10:33PM +0900, Chen-Yu Tsai wrote:
> On Sat, Oct 24, 2026 at 12:12 AM James Hilliard
> <james.hilliard1@gmail.com> wrote:
> > On Fri, Oct 23, 2026 at 2:44 AM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Fri, Oct 23, 2026 at 01:33:50AM -0600, James Hilliard wrote:

...

> > > >       /* Internal 8250 only */
> > > >       UART_PORT_AIROHA                = 124,
> > > >       UART_PORT_AIROHA_HS             = 125,
> > > > +     UART_PORT_DW_APB_256    = 126,
> > >
> > > Why? Besides the poorly chosen name, what prevents us from modifying the
> > > corresponding parameters at probe time by leaving the one of the existing
> > > types?
> >
> > The new type was primarily a way to reuse the core's FIFO configuration
> > table, including the RX trigger mapping. H616 uses thresholds of 1, 64,
> > 128 and 254 bytes, whereas PORT_16550A maps the same FCR bits to 1, 4, 8
> > and 14 bytes. Overriding only fifosize and tx_loadsz would leave
> > rx_trig_bytes reporting and selecting the wrong thresholds.
> >
> > The core already has get_rxtrig/set_rxtrig callbacks, though. I'll rework
> > this to retain PORT_16550A, supply the H616 FIFO parameters during setup,
> > and use those callbacks for the correct trigger mapping.
> 
> Please consider just taking the FIFO size from the DT. On some chips
> not every UART has the same size FIFO, so we already need to deal with
> it.
> 
> Also, FIFO size is a standard UART DT property, though somehow not included
> for dw-uart.

FWIW, it supports all standard properties for UART.
Check what uart_read_port_properties() does.


-- 
With Best Regards,
Andy Shevchenko


