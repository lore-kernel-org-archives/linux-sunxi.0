Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792939767;
	b=JfMIskOJJwzFFRWIUqC038N1G4vMy4yfM5QbS50PO6VpDOKgHHiqLo25RrXONKhkc1OE
	 rMnEtoirhzOoHkKi7QolRHbNtTQAlq75mQCX5BTq81WEfkkaZDWrBHg/B+Ihryw/7zX9K
	 e2hWlcRIsRs2+L0zjWhBA4O/5SwtMqOXcNtid9U1qHwLJXnLOZgg6JBby7QSGmid5W4jc
	 /wM7uurIyyV9sngOA/O/tzfZ8YjQtm1w/DQfw/EWeUBxSvcto4SJ1nSrqb0y/IBGvuQrt
	 atr80dCGPBxiTOl1JwLyh/Vu9tNwCudUchu22PG9b11m+08smlgvaBbCXt1nyiF0sww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792939767;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 Organization;
	bh=hG/4IjfT07Q6Afx12UtU9nDqugWqc6o8tThzxSfg8ek=;
	b=mL74MuIpr/tqUKdsH62aSq3lFZ743zJL232VgIqNUJ7gopKutkAM2ErCvqI+BfJuuzGK
	 8FV9YfjqUw9sf5Pu+SGKGU5/L+/gTPyN5fWkjJNhOsUqJmuZOvHhKNRnDNYDbzA/dN9Ep
	 f6nB7ECxWjGJLnaV7xSgAOGTkASA1x0//Wgtizvx5UmRyvuuI7Y78BmWURHL1fu2eRcxV
	 oC3vqK1haPC3yD1fWBoPWjMGIHvRJvtpeyhJfUV0eErayEHptu/AeQ7y+/2HvqOgZrC+X
	 kflUwCKBPB8njvt5q4+fTsMmmRVgb9RLc2JA1b9RYu2pJmU2eYY374z+t6YECd9JqsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=X+3xomyt;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D75D606A31D
	for <linux-sunxi@lists.linux.dev>; Sun, 25 Oct 2026 14:49:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D75D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=X+3xomyt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792939766; x=1824475766;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=wuyAVWzNlf4WMUq3kPSPErfH5dgjJuFGGL+u8KZMwqg=;
  b=X+3xomyt2vP8d8w0q0olPpINvwuaSjrqtFB0HeMBN0I0wIdQfm2nmhMd
   GM8w9xLAdYuD0ZuzT3k235NQKDcc/BletsihwLaHV2EF6LLpZz+i8JVzY
   dQibHAlKlGjPaIWtpH2tdporqJMBjoGx4XPQvL6EzxlrxkiUU3xpUAak/
   WUlnei04MCItCQa/A94sbutHRHyieOz4cwf+Kikxr6yLgMYbnx9k4/0I4
   aYvDOOZ3/Vatyqk9uDns0g25bUTMrgNsuv26raJQhVqQheUt2aj3lCB3T
   Krx+MFYzlSz1nC2odf7HnF/DFvZNqwJpVCMpSa2Elzd2iReRLpR/trQm9
   Q==;
X-CSE-ConnectionGUID: y06ry3MXQRKF1JY6Ed76lw==
X-CSE-MsgGUID: WIwB6rxcRF+UkQDTA5Rjww==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1524418"
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="1524418"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 07:49:11 -0700
X-CSE-ConnectionGUID: eYmjATg5S1KYkRpA6TtrFQ==
X-CSE-MsgGUID: PrP7FVEiS6+DW/v+rR1Cow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="4147140"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.10])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 07:49:06 -0700
Date: Sun, 25 Oct 2026 16:49:04 +0200
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
Message-ID: <at4WnVkovotMBmFe@ashevche-desk.local>
References: <20261023-submit-h616-uart-fifo-v1-v1-0-e4a3bae2eba8@gmail.com>
 <20261023-submit-h616-uart-fifo-v1-v1-2-e4a3bae2eba8@gmail.com>
 <atseYvQUYvpMFEIM@ashevche-desk.local>
 <CADvTj4pRW9q6VyQ=nLi8q0mMF8LgccfO4eqAeqgzzgOkDno1dw@mail.gmail.com>
 <CAGb2v65LVm1GV2kV4bVO8YJd16tkubHOvXUtbJ3uuBw2O3TBsA@mail.gmail.com>
 <atywVnHU5NsP_gOP@ashevche-desk.local>
 <CAGb2v64P2rM0VnFh0NfNhi+3_xGPYkxt2j+2hmBMu5ZvugHRow@mail.gmail.com>
 <aty37_xHO-QRa7hQ@ashevche-desk.local>
 <CAGb2v66jqrrix903k2OT-z0kV-9XWm6LpXmHQsCyLL5P6uXD7Q@mail.gmail.com>
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
In-Reply-To: <CAGb2v66jqrrix903k2OT-z0kV-9XWm6LpXmHQsCyLL5P6uXD7Q@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Oct 24, 2026 at 11:10:40PM +0900, Chen-Yu Tsai wrote:
> On Sat, Oct 24, 2026 at 10:51 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Sat, Oct 24, 2026 at 10:41:55PM +0900, Chen-Yu Tsai wrote:
> > > On Sat, Oct 24, 2026 at 10:19 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > On Sat, Oct 24, 2026 at 10:10:33PM +0900, Chen-Yu Tsai wrote:

...

> > > Ah, that's nice. I hacked up something [1] in the past to get it to
> > > work, but that was probably before you added the helper. I never got
> > > around to splitting up the commits and sending it out.
> >
> > Hmm... The helper is in the kernel for the past 2.5 years.
> > Maybe you rebased it and it lost original dates?
> 
> I had been carrying the changes locally without committing them. I only
> committed them recently to back them up remotely. So yeah, the dates are
> not accurate.
> 
> > But if it's not working, we need to address that, I believe it should work out
> > of the box, because the same function is used across dozen of serial drivers.
> 
> The new helper probably works fine. I can rework my code to use the values
> given by the helpers and give it a try sometime next week.

Would be nice, but I assume there is no hurry.

> > It might be an issue in 8250_dw.c, but I can't tell for sure.
> >
> > > [1] https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git/commit/?id=e7e0741fa04f349ad9f94a4059e32467a30ef5d9

-- 
With Best Regards,
Andy Shevchenko


