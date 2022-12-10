Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1604D2CA6;
	Sat, 10 Dec 2022 20:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670705844; x=1702241844;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=8tRXcUKxGagfde91ZdUSDF88p8/b8+3NQn8nn2kaumc=;
  b=gcf+X/b6eMzhHJQA2G8h0x+rloExqbtJSzGDV21AEsfeUXRriJ9VfCCY
   c0rrkHf1sU+sMBnvORw9bK5rzR6/mLG7DcEqIbYfZTqMGpbrK1oUaQqHB
   jS1pii+aSY/539frd7SQ0DF3tbffj2RwuDFyKzVdO/okOD0qm4cV8kuEP
   SbAhr1Ccm/WgPiryuv3cMTLHgb4jFkBTD45sEX8iy71Jgtel6BLLSprMo
   Wr7jPnvWAqN9tE4klIwRf7deMOqGUY7DwXGsGVuP6nqmCpw8JinzffgJ5
   DPri71LKDkQ+sIomdlNJfqgTIUJ8gMxp4SJAyS6myxMZNFrj/VcP0UyEa
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10557"; a="315286172"
X-IronPort-AV: E=Sophos;i="5.96,235,1665471600"; 
   d="scan'208";a="315286172"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2022 12:57:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10557"; a="678489946"
X-IronPort-AV: E=Sophos;i="5.96,234,1665471600"; 
   d="scan'208";a="678489946"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP; 10 Dec 2022 12:57:18 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1p46uK-007g2g-33;
	Sat, 10 Dec 2022 22:57:16 +0200
Date: Sat, 10 Dec 2022 22:57:16 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Thierry Reding <thierry.reding@gmail.com>, linux-pwm@vger.kernel.org,
	linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev, linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 00/11] pwm: Allow .get_state to fail
Message-ID: <Y5TyrO5maz5VYic3@smile.fi.intel.com>
References: <20221130152148.2769768-1-u.kleine-koenig@pengutronix.de>
 <Y5OtCjQOQjjltGPa@smile.fi.intel.com>
 <20221210091833.vdfir63nq4kpj5cm@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221210091833.vdfir63nq4kpj5cm@pengutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sat, Dec 10, 2022 at 10:18:33AM +0100, Uwe Kleine-König wrote:
> On Fri, Dec 09, 2022 at 11:47:54PM +0200, Andy Shevchenko wrote:
> > On Wed, Nov 30, 2022 at 04:21:37PM +0100, Uwe Kleine-König wrote:

...

> > I'm wondering why we didn't see a compiler warning about mistyped function
> > prototypes in some drivers.
> 
> I don't understand where you expected a warning. Care to elaborate?

intel-lpss.c has the prototype that returns an int. IIRC it was like this
before your patches. Now the above wondering passage...

-- 
With Best Regards,
Andy Shevchenko


