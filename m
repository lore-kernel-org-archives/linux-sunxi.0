Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DAAA1C16;
	Sun, 11 Dec 2022 13:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670765493; x=1702301493;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=mzHG/pVGmg236g4ocCottXwf/Vck+AOplcQMPTkzoug=;
  b=LFRuBEdhdHhddmTY9KdMavYFbOK4EmjwhccQC5PxLgLjjwLXiC62Z4Yv
   +Y0mXzfPRqIYX+lxZzSMbxKxTY8NbJcaiKTHJPKEXR6YXznIyDUrfnfpr
   nMqT025Aet/Fy8TAZD7UbhC5nnyeMIJ5iaSB1ZqTccZ5Wy08pc5XtZNGG
   HZw/gg6VA65Yh2u+PF6lNzx50VkKAgUK0mhba1CuBehktJ/+qgEuC1DQK
   7dnUN+T7C1I7UhjBm/yZSfrC3Fncei9s0ZkCMvF/Iw+RMjGAin2B4LFln
   rxxU9oNBF5rJ0qPkvU6sXSEZ7uvhADQy1wo1B496Qy419Ossn53F3M8fM
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10558"; a="318847052"
X-IronPort-AV: E=Sophos;i="5.96,236,1665471600"; 
   d="scan'208";a="318847052"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2022 05:31:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10558"; a="678628772"
X-IronPort-AV: E=Sophos;i="5.96,236,1665471600"; 
   d="scan'208";a="678628772"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP; 11 Dec 2022 05:31:28 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1p4MQQ-0080Nz-0b;
	Sun, 11 Dec 2022 15:31:26 +0200
Date: Sun, 11 Dec 2022 15:31:25 +0200
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
Message-ID: <Y5XbrWTicuTxPLwN@smile.fi.intel.com>
References: <20221130152148.2769768-1-u.kleine-koenig@pengutronix.de>
 <Y5OtCjQOQjjltGPa@smile.fi.intel.com>
 <20221210091833.vdfir63nq4kpj5cm@pengutronix.de>
 <Y5TyrO5maz5VYic3@smile.fi.intel.com>
 <20221210224154.733cd5qnrkpexq22@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221210224154.733cd5qnrkpexq22@pengutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sat, Dec 10, 2022 at 11:41:54PM +0100, Uwe Kleine-König wrote:
> On Sat, Dec 10, 2022 at 10:57:16PM +0200, Andy Shevchenko wrote:
> > On Sat, Dec 10, 2022 at 10:18:33AM +0100, Uwe Kleine-König wrote:
> > > On Fri, Dec 09, 2022 at 11:47:54PM +0200, Andy Shevchenko wrote:
> > > > On Wed, Nov 30, 2022 at 04:21:37PM +0100, Uwe Kleine-König wrote:

...

> > > > I'm wondering why we didn't see a compiler warning about mistyped function
> > > > prototypes in some drivers.
> > > 
> > > I don't understand where you expected a warning. Care to elaborate?
> > 
> > intel-lpss.c has the prototype that returns an int. IIRC it was like this
> 
> Do you mean drivers/mfd/intel-lpss.c? That one doesn't implement a PWM?!

Nope, I meant pwm-lpss.c.

> And drivers/pwm/pwm-lpss.c is adapted by this series.

That's what I didn't see how.

> One of us is confused ...

Yes, because when I have checked the branch based on Linux Next I already saw
that get_state() returns a code and I wasn't aware that the series is already
there.

-- 
With Best Regards,
Andy Shevchenko


