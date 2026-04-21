Received: from s106b.cyber-folks.pl (s106b.cyber-folks.pl [195.78.66.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E063D6682;
	Tue, 21 Apr 2026 14:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.78.66.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776780395; cv=none; b=G+YsuEukuPRReluaBl7OaqeTXe+Z0X1d8/Gl0O6QPp11mRfngp2dDdppIkbb/xl+7+PbdfYHdv1ybw5QeKoGJ6aoZgk+io3A88OC9wKaOOHmAlaCP4Es9JONR7rk0ICfQ/UQsMgWV1Pzp6Ul1SNfQT3+yAcf5+SkYS3TJnhOTF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776780395; c=relaxed/simple;
	bh=ZTfV6RBx39CmAgFbinyGVptw2FtN9mrkJfOuofOHx1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DspDLoTFmWmSPAx51HjzRf9KDmFgACospEFy2NHfJw8My5dcbgLQ9v7BXVc9jqhbOdTp4Up4sBLlQtvryEVZ7Qvnk9+77ifd/mlR0IxYtDJxODVxCTzgYq79ASjCHFqmq034HoPnkkp2FMA9Xmy0iRWh3j23S9Ks0+h2FwAdqgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl; spf=pass smtp.mailfrom=mmpsystems.pl; dkim=pass (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b=AwjowB3A; arc=none smtp.client-ip=195.78.66.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mmpsystems.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b="AwjowB3A"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ZWdPHRCtNzex4as64xLaRloyZfolOl/Dj/FxVThdR2o=; b=AwjowB3AQgBR680/tkNkHOaz24
	CJcvRxR9VLgOeZAwMmhYwRVxvwzJdHsXtxiwtHn/KxtOwTztxSVipbVTm08KnMrObPTIgjE/vMtdI
	ZW+9f5QlJQidW8etJ5LLtxp78VhcrC4xgqJd1Khn+SN1/I4oXX0dZ1iA6/vvVzxxcLfVcIsAMtKx0
	URwhndWlbFJfkE928xZLrNeFxfDGjd+w64fe6FEzSTRHQo4MCmhKhNj3EyJGy3Kd2PtFPqia3QESD
	DzBV2ZubC9bGT2PxLzex4yqSCDoIxBmHVe1cbXKnlV8gliI7hQdktinChaUykSFKQIKaUNrr9Btwq
	e5l1/Ciw==;
Received: from user-5-173-16-91.play-internet.pl ([5.173.16.91] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1wFBkD-0000000BABf-2coC;
	Tue, 21 Apr 2026 16:06:29 +0200
Date: Tue, 21 Apr 2026 16:05:43 +0200
From: Michal Piekos <michal.piekos@mmpsystems.pl>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 0/4] Add hstimer support for H616 and T113-S3
Message-ID: <h4b3xluygfptee3ej4gbr3hctgjk6q4oytkisk66saii4uyvl3@lw4qdtfuyoz5>
References: <20260419-h616-t113s-hstimer-v1-0-1af74ebef7c5@mmpsystems.pl>
 <20260419225539.718367e0@ryzen.lan>
 <xlvldmapdoql7nt3swube5vd6fdiosq7rt5afg246xertko5fa@4irmzupkar23>
 <b89c1c8b-2678-4f4f-a63c-03b92cf7617c@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b89c1c8b-2678-4f4f-a63c-03b92cf7617c@arm.com>
X-Authenticated-Id: michal.piekos@mmpsystems.pl

On Mon, Apr 20, 2026 at 04:14:44PM +0200, Andre Przywara wrote:
> Hi Michal,
> 
> On 4/20/26 13:27, Michal Piekos wrote:
> > On Sun, Apr 19, 2026 at 10:55:39PM +0200, Andre Przywara wrote:
> > > On Sun, 19 Apr 2026 14:46:06 +0200
> > > Michal Piekos <michal.piekos@mmpsystems.pl> wrote:
> > > 
> > > Hi Michal,
> > > 
> > > > Add support for Allwinner H616 high speed timer in sun5i hstimer driver
> > > > and describe corresponding nodes in dts for H616 and T113-S3.
> > > > 
> > > > H616 uses same model as existing driver except register shift compared
> > > > to older variants.
> > > > 
> > > > Added register layout abstraction in the driver, extended the binding
> > > > with new compatibles and wired up dts nodes for H616 and T113-S3 which
> > > > uses H616 as fallback compatible.
> > > 
> > > Can you say *why* we need this? IIUC Linux only ever uses one clock
> > > source, and selects the (non-optional) Generic Timer (aka arch timer)
> > > for that? So can you say what this hstimer clock source adds? I guess
> > > higher resolution, but what is your use case, so why would you need the
> > > 200 MHz? And does this offset the higher access cost of an MMIO
> > > access, compared to the arch timer's sysreg based access? Also, IIUC,
> > > people would need to manually select this as the clocksource, why and
> > > when would they do so? (Given they even know about it in the first
> > > place).
> > > Also the hstimer hasn't been used since the A20, so nobody seemed to
> > > have missed it meanwhile?
> > > 
> > > Cheers,
> > > Andre
> > > 
> > I took the table from https://linux-sunxi.org/Linux_mainlining_effort as
> > a todo list and wanted to help with it. I do not have own use case for
> > this timer. If it is not needed then I will spin v2 to include your
> > comments and abandon it.
> 
> Ah, that's good to know, and thanks for picking things from that list! I
> don't think there is a particular need to abandon your work, we could as
> well upstream it. At least the DT changes should be added, so that other DT
> users could make use of the timers - after all it's a Linux implementation
> choice to utilise just one timer. But please go ahead and post a complete
> v2, I don't think it hurts to have HSTIMER support in the kernel.
> And while you are at it: can you figure out what the need is for using two
> timers? One is a clock source, the other is for clock events? And why do we
> limit the counters and timers to 32 bit? Even the A13 manual lists them as
> 56 bits, and a wraparound time of roughly 21 seconds (with 32 bit counters)
> does not sound very long to me.
> 
Yes. Channel 0 is clockevent and channel 1 is a clocksource and sync
reference for channel 0 disable timing. 

32 bit counters seems like implementation choice rather than limitation
but that would need to be implemented and tested. Would you suggest to
extend it to 56 bit in the following patch?

> 
> Not sure what your primary motivation for fixing Allwinner support is, but
> we could probably find more worthwhile targets. Do you have Allwinner boards
> other than the OrangePi Zero 3? There are not many low hanging fruits on the
> H616 left (MBUS and LDOs(?) maybe), but the A523 has quite some missing
> drivers still, some of them probably more on the easy side.
> 
I have boards with A733, A527, T113-S3, H616, H6, H3 and I
think some older stuff too. My motivation is mostly fun and learning.
I also use those boards in custom projects.

I will take up GPADC on A527 after finishing this as I worked with ADC's
a lot on MCU's. Unless other suggestions?

Thank you for comments.
Michal

> If you are stuck with the OpiZero3, then you could just look and check the
> existing devices, and verify their operation. For instance I think USB-OTG
> is still broken - across most Allwinner SoCs actually, so it's a sunxi
> driver issue.
> 
> Thanks,
> Andre
> 
> > 
> > Michal
> > 
> > > > 
> > > > Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> > > > ---
> > > > Michal Piekos (4):
> > > >        dt-bindings: timer: allwinner,sun5i-a13-hstimer: add H616 and T113-S3
> > > >        clocksource/drivers/sun5i: add H616 hstimer support
> > > >        arm64: dts: allwinner: h616: add hstimer node
> > > >        arm: dts: allwinner: t113s: add hstimer node
> > > > 
> > > >   .../timer/allwinner,sun5i-a13-hstimer.yaml         |  8 +++-
> > > >   arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi       | 12 +++++
> > > >   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi     |  9 ++++
> > > >   drivers/clocksource/timer-sun5i.c                  | 56 +++++++++++++++++++---
> > > >   4 files changed, 78 insertions(+), 7 deletions(-)
> > > > ---
> > > > base-commit: faeab166167f5787719eb8683661fd41a3bb1514
> > > > change-id: 20260413-h616-t113s-hstimer-62939948f91c
> > > > 
> > > > Best regards,
> > > 
> > > 
> 
> 
