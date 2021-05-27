Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7712FAD
	for <linux-sunxi@lists.linux.dev>; Thu, 27 May 2021 13:53:57 +0000 (UTC)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 2548660008;
	Thu, 27 May 2021 13:53:48 +0000 (UTC)
Date: Thu, 27 May 2021 15:53:48 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Roman Beranek <roman.beranek@prusa3d.cz>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Emil Lenngren <emil.lenngren@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Lee Jones <lee.jones@linaro.org>,
	Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@siol.net>, linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-sunxi@googlegroups.com,
	Roman Beranek <roman.beranek@prusa3d.com>
Subject: Re: [PATCH] pwm: sun4i: Avoid waiting until the next period
Message-ID: <YK+kbJIvx7mVNDCE@piout.net>
References: <YK0onNy2r30aNw2g@orome.fritz.box>
 <CBO0N2KNI5MJ.1KDTI8B2UE4SM@zen.local>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CBO0N2KNI5MJ.1KDTI8B2UE4SM@zen.local>

Hi,

On 27/05/2021 14:10:35+0200, Roman Beranek wrote:
> Hello Thierry,
> 
> On Tue May 25, 2021 at 6:41 PM CEST, Thierry Reding wrote:
> > I'm pretty sure Alexandre at the time reported that the instantiation of
> > the controller that he was using required waiting for the period to
> > complete before the output went to the disabled state. It's possible
> > that this was changed in subsequent versions of the IP, so perhaps we
> > need to distinguish based on compatible string?
> 

I can't recall what I tested exactly. I probably assumed it would take
the whole period to update because this is how it is working on v1 of
the atmel PWM and this is what I was working on at the time. I did test
on a CHIP. I guess linux-sunxi.org is more correct than I was at the
time.

> I've got myself an A10 (sun4i) board to test my new patchset with and
> indeed the 2 cycles seem to be enough.
> 
> I have yet to write a cover letter for it though, expect it by Monday
> at the latest.
> 
> Best regards,
> Roman

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
