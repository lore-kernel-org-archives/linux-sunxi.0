Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B23E331A91
	for <linux-sunxi@lists.linux.dev>; Tue, 17 Oct 2023 12:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 56C702F4;
	Tue, 17 Oct 2023 05:45:56 -0700 (PDT)
Received: from slackpad.lan (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CDEC93F5A1;
	Tue, 17 Oct 2023 05:45:14 -0700 (PDT)
Date: Tue, 17 Oct 2023 13:44:04 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: SASANO Takayoshi <uaa@mx5.nisiq.net>
Cc: "linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>,
 u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>, Mikhail Kalashnikov
 <iuncuim@gmail.com>
Subject: Re: [PATCH RESEND] sunxi: add axp313a support
Message-ID: <20231017134404.63305833@slackpad.lan>
In-Reply-To: <87cyxdr3kd.wl-uaa@mx5.nisiq.net>
References: <875y4u9b3t.wl-uaa@mx5.nisiq.net>
	<20230908102404.3f386a43@donnerap.manchester.arm.com>
	<87cyxdr3kd.wl-uaa@mx5.nisiq.net>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 17 Oct 2023 18:38:58 +0900
SASANO Takayoshi <uaa@mx5.nisiq.net> wrote:

Hi,

> Hello, sorry for late reply!

no worries, glad you came back!

> > Anyway, my plan is to not add anything to the SPL code in its current
> > shape anymore, instead do some refactoring first, then have a much cleaner
> > and smaller patch with the AXP313a support. I am more than halfway through
> > with that, just stuck on some nasty preprocessor problem. I will post
> > something once that's ready, and will then CC: you, so you can add the
> > AXP313 parts on top, if you like.  
> 
> Sounds good, current complicated PMIC should be cleaned I think.
> If a testing staff is needed, please tell me.

Thanks! I have something easy ready, just the final touches needed.
Will CC: on the post.

> By the way, do you have any memory controller information
> when Allwinner H616 connects DDR4?
> 
> Simply adding AXP313a code make MangoPi MQ-Quad working,
> but OrangePi Zero3 requires setting up memory controller for DDR4.
> 
> At least sunxi's binary blob (boot0) can do this, no source code.

Yes, we have been looking at this for a while, and there is code out
there. The latest drop is from Mikhail:
https://lore.kernel.org/u-boot/20231016053441.3197087-2-iuncuim@gmail.com/
If you can try this, maybe even review it, that would be great.

Cheers,
Andre
