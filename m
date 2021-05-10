Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D830D71
	for <linux-sunxi@lists.linux.dev>; Mon, 10 May 2021 08:09:56 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (unknown [217.70.183.193])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 98DD0D75D7
	for <linux-sunxi@lists.linux.dev>; Mon, 10 May 2021 08:00:57 +0000 (UTC)
X-Originating-IP: 90.65.108.55
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr [90.65.108.55])
	(Authenticated sender: alexandre.belloni@bootlin.com)
	by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 3890C240006;
	Mon, 10 May 2021 08:00:46 +0000 (UTC)
Date: Mon, 10 May 2021 10:00:46 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Maxime Ripard <maxime@cerno.tech>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@siol.net>, linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: sun6i: Add NVMEM provider
Message-ID: <YJjoLuwTSbZlNCPa@piout.net>
References: <20210419014549.26900-1-samuel@sholland.org>
 <20210430090206.lybmygrt636nysoc@gilmour>
 <a3b03a06-c8fc-7dbe-7c0b-ffd1f194ecbc@sholland.org>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a3b03a06-c8fc-7dbe-7c0b-ffd1f194ecbc@sholland.org>

On 09/05/2021 22:39:30-0500, Samuel Holland wrote:
> On 4/30/21 4:02 AM, Maxime Ripard wrote:
> > Hi,
> > 
> > On Sun, Apr 18, 2021 at 08:45:49PM -0500, Samuel Holland wrote:
> >> The sun6i RTC provides 32 bytes of general-purpose data registers.
> >> They can be used to save data in the always-on RTC power domain.
> >> The registers are writable via 32-bit MMIO accesses only.
> >>
> >> Expose the region as a NVMEM provider so it can be used by userspace and
> >> other drivers.
> >>
> >> Signed-off-by: Samuel Holland <samuel@sholland.org>
> > 
> > As far as I understood, you want to use those registers to implement
> > super-standby? If so, while it makes sense for the kernel to be able to
> > be able to write to those registers, I guess it would be a bit unwise to
> > allow the userspace to access it?
> 
> I want the user to be able to pass information to the bootloader (to
> select a boot device, e.g. reboot to FEL). I also want the user to be
> able to read data stored to these registers by system firmware (e.g.
> crust writes exception information there). It's not really related to
> standby.
> 
> I would want to stack a nvmem-reboot-mode on top to give friendlier
> names to some of the numbers, but I don't see a problem with root having
> direct access to the registers. It's no different from /dev/nvram
> providing access to the PC CMOS RAM.
> 

(which is deprecated in favor of nvmem)


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
