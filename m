Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794475507;
	b=AI9QNQjBQu+GRw/VVvV84uP2l+ZjTv31zglWA9hdLLxyeqyR4Nopwt2zu1h14XwcFAgz
	 FOryMU5/CuXBwFFO4b4N+SfQe5oUrRUPu+fZyB+hPbpce6o0vHndOmoQlmBevqCYHZtYB
	 rKOUOCBSNE31q9dUgPBwXKohkFqcq2rGtNcbeCtfe7dD44LGBMNF+9j3ZdatO6BHoVXMq
	 y/inBDOJ0ClsUpbLfSfBYwuT+7ArnU2bD6TCnDu0K93mCTKpE5a6BoyXUUBlAl57cHIao
	 WyyAOQNKkiOPxZZr0JH2qmmf42RRqpJ2S299t7gfnzCQvCA7omMOstQiqFQwLZVRWMw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794475507;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=aAW3v6GEJbuYIvU/kMT5hk01048H4iK9Lb9vDkzw68s=;
	b=ykkZdfim8nUyofbLDglc0D0UdR0xHE/joWXR1jUni7dLtU8vjsWX/LmgttdHzwDXxZ2r
	 Vk1DuVrc0i51fAfikKR4LMCzKi5l6itweeeJ8HeyaALuYnuWyf8tR62VbOa9OAz/38var
	 52nQ410w1zMQoI4fqIahofP2nLUhZTWomWyMZLE+HmHXlupR5yYsWXSgJzZPBA51o6nle
	 Cko0xtMEeONUbfp5iIBRMEAas8OVyhElXEGv9famIpExQG7HQ6RBE7BHrIlIrXSCJuDRd
	 f6PTZHU61E6cr5BKFv+mbpXi7q874zxTNbdU7r4mLP+0nWgqyku3bZtFllPvN937ONA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZB2PAKWz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.41
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB7F606A323
	for <linux-sunxi@lists.linux.dev>; Thu, 12 Nov 2026 09:25:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FB7F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZB2PAKWz
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5c0ea47f5b8so158553e87.3
        for <linux-sunxi@lists.linux.dev>; Thu, 12 Nov 2026 01:25:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794475505; cv=none;
        d=google.com; s=arc-20260327;
        b=q+8yArHuk+iAqV9POFbylzK11R8+gywpc/OFJqESS5SUBK6qYRpvkyQXtcW1StwNWQ
         6h6O0KVulXzT4+YGrDp6tsVH/3oZX5bbN/AXQksP4wbNN2QZfWw9DLQbWKYmgtqKLdqh
         Xy85iYoiyPn7kzvCafvpqS0blN2oN5/vcLMN3MPuNzafOK1qhD9TaqbdbhZNPbzAXpgT
         NLMf8wrG2dggxibqpnVk1B5ic0AYm+GTPIoBA9huiShoqgY0BquRziJi25mrg4hbHGe6
         uG0TyrgEFEcw4mfhRye+NrLIT2iI7LIjwW9ES78/1tIMaD9Sy6MFGmBATvb+5nAMgQ4U
         RXgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aAW3v6GEJbuYIvU/kMT5hk01048H4iK9Lb9vDkzw68s=;
        fh=pLuEQt0c0c0OYwp/n13oHi4KrHdKLGWh2LRMDxI2Scg=;
        b=eMHl+YPuCxNO3IzwMckQVHy9khbvYa3mDyPCpg6jyaMwU6PyLOtqmqEXL5vKHukzqn
         mvsH0CbqWM2jCP2DEpOnmBukcDbT4vapzTxpReWGpgvExjy2g4wd5/9x9Mut4E12Cj/N
         1xacz/JKgVL80rtauhClmt3UQqEjmS1pHOuxqcfeAqtTzmr+V6yP6Tzj98s4J/SgVbTa
         dadrE4cDtN29BpzJpiLC+T8rvlOMEa1hd6SBeGPaKLQymzHtUNFajOXvb24RZwdWp2/K
         iGmpnQLg2l16L2oekV1K41mAlql/WENE/QZFl8KEX6QGhT28bOpnhVh87LKAsPdQuHH2
         c6vw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794475505; x=1795080305; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aAW3v6GEJbuYIvU/kMT5hk01048H4iK9Lb9vDkzw68s=;
        b=ZB2PAKWzlMzjY9Ond/8UwDD0FsmnIR6nRn9li77U9RlP5T4zr0pbSfy6yE4yvtG8MB
         gs17RSN+L9IRh5WGBJP/BI66eRBfPNz0vc1zztFn3R+E3HBXO9tDpgkyVPmquagvV9ib
         sjYQVI6megAVBZSDvD+lJ0iyKBolrq/eHywdWGZmfjNGhK7x/liC2c5CmfmM74I1GRtP
         jqn0k0Zl4TYBISEiHWtBJu3EYxJUW570JQVUyg9A29aEfewBEgKf5LgA3yoV10UgkQZc
         mRQVtl+YuoSh/N2f6uYfAWDIHStTAvCqZ9PoL36wjtUneQkQcd0H0zcdTgCtBT4bfumh
         oLAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794475505; x=1795080305;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aAW3v6GEJbuYIvU/kMT5hk01048H4iK9Lb9vDkzw68s=;
        b=bx8cQEZ1/MF7eT6lncO4f8tab7lXUTMkPPpuVWAghu3KDS2n+g+9bFiLWhI07PRhBq
         v04xHobMqfprqTeXVagwX5j59AOJ/V28HFNh+c6uZWFUcPzlgFkIG5oxZ6USdMCZooY6
         gNuCe39+YhiKMa48daLSxUMfxu4K+msfJ5tfgEJnZgieexFT/nKBiDgB/KwjGX+j7eh3
         WjCPH9mdUOSw7nWBuCppANedo80kmKJgYnkeMPbMAeIdkxtDmmCKULjh/lPorTkfDSWD
         RXyiIY8MdQwTVNyi2R+4TrM9gpsr3y6Y/aywQlwkfGMecbWTKfBFxGV56XTLRW33yHeK
         ZZnQ==
X-Forwarded-Encrypted: i=1; AL+hErHssziZ4W7UtWRBXu/z0Aee/r3eV7cdtuf1E1+2mbTQVdtyvSpvj1K/EiTRoHzZM2MPKy3vvKVxuHrKEw==@lists.linux.dev
X-Gm-Message-State: APuU4Z+xA85fTGEonX4mw81LNWnKADBuLtGYpUbcu8r61cl0tQQSJX5U
	iXWB29Zhmw4rrUXqYMuatv9ApXJyb5txtIRxN74mlOQzstO64KqTnFBR7E4F7cTBU8bh8oaqDRG
	XumjN4dHS1ysm+lAe6zBZBuksHHfFX50=
X-Gm-Gg: AYBFou2lq1FkojrirnQvSSng3CJzohrnBLmXl2R9vhcyBN+3uL75L7QZuJRcac0om5i
	Cj3rfi8SE+ai7PopeuI1q9i34Rvve3NiQ3+l9JtNTM4ScOMAToGwHJlthOAziDoLAOLk5GBsnD/
	7PeWE0XmblEfqPrcRb5W0nE3fju9RrD9I/tgynWiuM0mHXE6I2uRb2MbtBUUy5Ic/bR2Vzd1IAL
	PqfGMCxFTk/EBT9UzyEEI0w5rm3f0hA9HaRPQicofv0dage+ADjmTZ4cwl9dVJott6XiE2ZraEW
	qX1borm9s7xIWOILZAZemyoxqfN0YH0SpiUPDwKDmwaFI2giWXPLYJTFpe8AQlOosQVrxfdpxcB
	wAOZH+go7wYmizg7UbLAoBsgpP/o2igyVgdUZkYeBMq/XDRCbvxW92RoWRFe1DjAmmHyEZlI=
X-Received: by 2002:a05:6512:1105:b0:5c1:57b9:90d3 with SMTP id
 2adb3069b0e04-5c15d5a8091mr1824839e87.1.1794475504618; Thu, 12 Nov 2026
 01:25:04 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261110-sun5i-hstimer-arch-sunxi-v1-1-9016f63e186f@gmail.com> <CAGb2v66=UbyC0jaW6tjeux5VruUAXN_64bAs3+LyS=CRG1qm9Q@mail.gmail.com>
In-Reply-To: <CAGb2v66=UbyC0jaW6tjeux5VruUAXN_64bAs3+LyS=CRG1qm9Q@mail.gmail.com>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Thu, 12 Nov 2026 01:24:53 -0800
X-Gm-Features: AclHuK-hAO4EvOdrjX-CMAuSOsrtdv-9s5jREBggl1QgG0DXsRBqy77zUtF8Ctk
Message-ID: <CAEy9hNXfqPHEhDnfP+S5zbvFbVSiuMUALVRNQLPEdOLTsehRZg@mail.gmail.com>
Subject: Re: [PATCH] clocksource/drivers/sun5i: Allow enabling the driver on
 64-bit sunxi
To: wens@kernel.org
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Michal Piekos <michal.piekos@mmpsystems.pl>, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chen-Yu,

On Wed, Nov 11, 2026, Chen-Yu Tsai wrote:
> This doesn't really say _why_ a user might want to enable it though.
> The only reason to do so is to get a higher resolution timer, but
> the rating for sun5i-timer is lower than sun4i-timer for both clocksource
> and clockevents. Realistically speaking this is never going to get used.

Thanks for the review. You're right: with its rating below both the
architected timer and the sun4i timer, the kernel never picks it, and I
have no use case that would. I'll drop this patch.

Best regards,
Arun

On Tue, Nov 10, 2026 at 11:33=E2=80=AFPM Chen-Yu Tsai <wens@kernel.org> wro=
te:
>
> On Tue, Nov 10, 2026 at 3:07=E2=80=AFPM Arun Iyengar via B4 Relay
> <devnull+aiyengar1990.gmail.com@kernel.org> wrote:
> >
> > From: Arun Iyengar <aiyengar1990@gmail.com>
> >
> > The high-speed timer driver binds "allwinner,sun20i-d1-hstimer", which
> > the H616 device tree uses as the fallback compatible of its
> > "allwinner,sun50i-h616-hstimer" node and the D1/T113 device tree uses
> > directly. SUN5I_HSTIMER, however, only has a prompt under COMPILE_TEST
> > and is selected by the 32-bit sunxi machine Kconfig alone, so arm64 and
> > RISC-V sunxi kernels cannot enable it and these nodes never probe.
>
> This could be simplified: the high speed timer is available on many
> newer platforms, but it is only selected by the few original platforms,
> and not visible to the user.
>
> > Make the prompt visible on ARCH_SUNXI. The driver registers its
> > clocksource and clockevent at rating 340: below the architected timer's
> > clocksource (400) and below the sun4i timer (350), which ARCH_SUNXI
> > already selects on arm64 and RISC-V. Enabling it therefore adds a
> > second hardware time base without changing which one the kernel uses.
> >
> > Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> > ---
> > The H616 and D1/T113 hstimer nodes and the D1 driver support were merge=
d
> > for 7.2, but the driver still cannot be enabled outside COMPILE_TEST on
> > arm64 and RISC-V.
> >
> > Tested on an Orange Pi Zero2 (H616) with a 7.3 kernel carrying this
> > patch and CONFIG_SUN5I_HSTIMER=3Dy: the hstimer node at 0x3005000
> > probes and available_clocksource lists "arch_sys_counter timer
> > hstimer".
> >
> > This patch was developed with Claude (Anthropic) as a coding
> > assistant. It investigated the problem and wrote the code and the commi=
t
> > message; I reviewed it, and it was tested on an Orange Pi Zero2 (H616)
> > as described above.
> > ---
> >  drivers/clocksource/Kconfig | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> > index da83483296d5..971491d2e584 100644
> > --- a/drivers/clocksource/Kconfig
> > +++ b/drivers/clocksource/Kconfig
> > @@ -172,12 +172,17 @@ config SUN4I_TIMER
> >           Enables support for the Sun4i timer.
> >
> >  config SUN5I_HSTIMER
> > -       bool "Sun5i timer driver" if COMPILE_TEST
> > +       bool "Sun5i timer driver" if COMPILE_TEST || ARCH_SUNXI
>
> Nit: I would probably write "if ARCH_SUNXI || COMPILE_TEST" just to match
> the other instances.
>
> >         select CLKSRC_MMIO
> >         depends on COMMON_CLK
> >         help
> >           Enables support the Sun5i timer.
> >
> > +         The 32-bit sunxi platforms that have this timer select it. On
>
> "selected"? BTW I think we can drop the "selects" from those platforms
> if the option is now visible to the user.
>
> > +         64-bit (ARM64, RISC-V) sunxi SoCs such as the H616 and D1 it
> > +         registers an additional clocksource and clockevent device, ra=
ted
> > +         below the ones the kernel already uses there.
> > +
>
> This doesn't really say _why_ a user might want to enable it though.
> The only reason to do so is to get a higher resolution timer, but
> the rating for sun5i-timer is lower than sun4i-timer for both clocksource
> and clockevents. Realistically speaking this is never going to get used.
>
>
> ChenYu
>
> >  config TEGRA_TIMER
> >         bool "Tegra timer driver" if COMPILE_TEST
> >         select CLKSRC_MMIO
> >
> > ---
> > base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
> > change-id: 20261110-sun5i-hstimer-arch-sunxi-167ea2ebcbd7
> >
> > Best regards,
> > --
> > Arun Iyengar <aiyengar1990@gmail.com>
> >
> >
