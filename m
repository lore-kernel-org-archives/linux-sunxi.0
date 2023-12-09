Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB68E541
	for <linux-sunxi@lists.linux.dev>; Sat,  9 Dec 2023 21:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manjaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b="HbAKvFT/"
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1702155729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OKG+a5quDiL+Z7/Tf/S0RakkdB1Ewc30Lj24wd8jJw0=;
	b=HbAKvFT/mYBi2fA/t5znHZOax99KACm6Y2kFM7SyBzmigJTh317+d/YhYfPLKWKmnk212c
	V1tR+pGPc8S1PlPwEJDOQtFq5kj1EkHdxnCaQtTkY0Ma7EMKv5CZwsl6su1RZQbez8Ut/o
	EzY1aODOkgeXY3dvZBCtIfWrjbPVdhTgol8VOxr0o0IfGLblv/6DE+wUlwJuKNuiVV+831
	JMhl8xdF5c6FMYe5ZIWkIylcGkRAkXLcODwSRB3YsQvVtcBeb87VSmLah4BSJpTTklspF5
	3mSWwd5LmKfkRTsq2jK5pjffF+l3JQD4CX1tdJs5PGQJV2cj5WtBDjXWfanRow==
Date: Sat, 09 Dec 2023 22:02:09 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Tom Rini <trini@konsulko.com>
Cc: Andre Przywara <andre.przywara@arm.com>, Jagan Teki
 <jagan@amarulasolutions.com>, Simon Glass <sjg@chromium.org>, Vignesh R
 <vigneshr@ti.com>, Jaehoon Chung <jh80.chung@samsung.com>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Mikhail
 Kalashnikov <iuncuim@gmail.com>, Piotr Oniszczuk
 <piotr.oniszczuk@gmail.com>, Bob McChesney <bob@electricworry.net>, Stephen
 Graf <stephen.graf@gmail.com>, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 1/3] mtd: spi-nor: Add support for zBIT ZB25VQ128
In-Reply-To: <20231209204336.GG2513409@bill-the-cat>
References: <20231204005954.13201-1-andre.przywara@arm.com>
 <20231204005954.13201-2-andre.przywara@arm.com>
 <20231206162443.7f0692d7@donnerap.manchester.arm.com>
 <20231209203423.GF2513409@bill-the-cat>
 <3c6b3fe41f54a2d2a391d433684e80d9@manjaro.org>
 <20231209204336.GG2513409@bill-the-cat>
Message-ID: <5f898df3e85bb46df5e3dbaa81525047@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org

On 2023-12-09 21:43, Tom Rini wrote:
> On Sat, Dec 09, 2023 at 09:37:28PM +0100, Dragan Simic wrote:
>> On 2023-12-09 21:34, Tom Rini wrote:
>> > On Wed, Dec 06, 2023 at 04:24:43PM +0000, Andre Przywara wrote:
>> > > On Mon,  4 Dec 2023 00:59:52 +0000
>> > > Andre Przywara <andre.przywara@arm.com> wrote:
>> > >
>> > > Hi,
>> > >
>> > > > Add support for the zBIT ZB25VQ128 (128M-bit) SPI NOR flash memory chip,
>> > > > as used on the Xunlong Orange Pi Zero 3 board.
>> > >
>> > > does anyone have any objections against this patch? I wanted to take
>> > > this
>> > > via the sunxi tree, as this blocks some board support patches.
>> > >
>> > > IIUC Linux gave up on adding rather generic entries up for each and
>> > > every
>> > > SPI NOR chip, if there is nothing special about them:
>> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=773bbe1044
>> > > Should we follow suit here?
>> >
>> > And we could then start trimming the table we do have as well, to
>> > reclaim space?
>> 
>> In general, yes, but we'd also need to consume a bit more space with 
>> the
>> additional auto-detection logic.
> 
> Maybe part one of the series is backport that logic, part two is remove
> all the easy to remove tables? Or at least a number of them so the
> series is a wash and then a targeted series of drop-an-entry and cc the
> person that added it so they can run-time verify it's still fine?

Sounds like a plan to me and I'm willing to work on that.  Though, I 
think we'll inevitably end up with increasing the resulting image sizes 
a bit, but that might be an acceptable trade-off for making supporting 
more SPI chips and more new boards much easier in the future.
