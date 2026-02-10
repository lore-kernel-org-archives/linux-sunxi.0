Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D2737FF50
	for <linux-sunxi@lists.linux.dev>; Tue, 10 Feb 2026 15:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770736458; cv=none; b=heoWQNXN4mno5x5zk6mzLHhwgl6WeIpgmouTazeF/LV6c7TD49WMsGfuwU2IYCTNwzGMiqYCuDogGduOftI4i3xqWFeAg49iRrtgdpJE1YUzNFqBYUrYwwdlKNj7oKJpZ26xnMlY4yvFLXDsdi0n3O+kkV6LdMi6NSRXK4oUQE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770736458; c=relaxed/simple;
	bh=5XHstcK3GNmPCCnMCyYj61+dg73mEfAPf1RQMlNT978=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J+wGropnpKZWPJKmR3p27aKG47OnVrpergeOvAoIU3K7FsvWVPYKoDDLXQ0c5lhvPwnqh8RaLkcPQTvg6hei3dOENsDzgVf5UZX7AwkpsPE3p9piV8V9Tv/V+qhMgDLoEuz9ZfFvc3gaLsFbpwET1pcZpoBFN9LULPHViQMHeSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oa0TkH6k; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oa0TkH6k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770736457; x=1802272457;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5XHstcK3GNmPCCnMCyYj61+dg73mEfAPf1RQMlNT978=;
  b=Oa0TkH6kL0q0x8tNbpyOzdW0M6X/n7ROSHTA/Q8/bi1p316pcE8u2ojk
   xQ6eVqxBfpBoOAqgB89UuatpmKBsiMn+Hs0A81iFSxO/shHDuv5sGl5cT
   e8Hr/Zw9cD+EJjkZbK7vipR3+KogHtJbnAwv+Asr4Vxd3XguVZTf5bF+e
   X8iokmN0CjfrfrSmfDXWMteBMSnTmH+qqijrEFvVZjiK5NgK1Qf0YS5a5
   19E0iGRv7VVG3m56yZ3eqQ0uNPpShByoyq3gr9Dc9u8/Wv51X6xMw4gsa
   kDizz9JVGmQwvUW2c/7otyWuXmV0/lxGuIq4RxUoWOI6RaXB8xS0iXzyK
   A==;
X-CSE-ConnectionGUID: inR3z8Q5Q6O9IDybZbmr5A==
X-CSE-MsgGUID: x0sLBQ5ZSSaZd+/icG0Gag==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="82505025"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="82505025"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 07:14:16 -0800
X-CSE-ConnectionGUID: PLTW0sgvRr+sZIyjb4ObHQ==
X-CSE-MsgGUID: 0j9FHxy/Qi2fCSVgALjwlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="211778201"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.131])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 07:14:08 -0800
Date: Tue, 10 Feb 2026 17:14:04 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-renesas-soc@vger.kernel.org,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andy Shevchenko <andy@kernel.org>,
	Antonio Borneo <antonio.borneo@foss.st.com>,
	Arnd Bergmann <arnd@arndb.de>, Boqun Feng <boqun.feng@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Konrad Dybcio <konradybcio@kernel.org>, Lee Jones <lee@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Waiman Long <longman@redhat.com>,
	Wilken Gottwalt <wilken.gottwalt@posteo.net>,
	Will Deacon <will@kernel.org>
Subject: Re: [RFC PATCH 0/4] hwspinlock: refactor headers into public
 provider/consumer pair
Message-ID: <aYtLPHmZTg8oFxfL@smile.fi.intel.com>
References: <aXc7DxsqiCGdfzxi@smile.fi.intel.com>
 <aXc-Zxw05XQLb1Dy@ninjato>
 <aXdAB2bLTy6u8G8c@smile.fi.intel.com>
 <aXdCBu6kzdw1NWay@ninjato>
 <aXikZ5wc6bvgRqF6@ninjato>
 <aYnBrN0JRCf9-UjB@ninjato>
 <yl4bbbev7lgrmnqys2izkolo5egzg24faukvqar5eh26q5ra7p@42rcegfpqqt6>
 <aYo60vooftdem4Lt@ninjato>
 <aYrcVE9HsDNAwqIB@smile.fi.intel.com>
 <aYsMCVf1qpLSCXTs@shikoro>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYsMCVf1qpLSCXTs@shikoro>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Feb 10, 2026 at 11:44:25AM +0100, Wolfram Sang wrote:

> > > And if so, would be this series acceptable
> > > as-is then (modulo the better include-sorting mentioned by Andy)?
> > 
> > *From my experience it's not the Q "will they or not?", the Q is "when?"
> >  they start abusing it. I really prefer to hide as much as possible from
> 
> I totally agree with you on that.
> 
> >  day 1. Maybe the structure can be split to two? Currently IIO has a
> 
> I also thought that keeping some internal header might provide that
> safety. When looking into it, I didn't see an obvious and somewhat
> elegant way. Even more, I got a better picture of why Bjorn named the
> current approach "unergonomic". I got some ideas which look doable in my
> time frame. I will try going the full route, after all.

Thanks!
Looking forward for the rest, the cleanup is quite good, no added lines.

-- 
With Best Regards,
Andy Shevchenko


