Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F3F311C02
	for <linux-sunxi@lists.linux.dev>; Mon, 11 Aug 2025 16:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754929702; cv=none; b=NvvN2jVq1ELLrwFxOtZ1CnIA263YqW+nRJIV3oWJWYrGNLGd8SUPaZ/DYQ/tXTT1REw/HRhRFzrJUi/DhfE+HdJ92s4tqi3hMM3w8mKkxLY4Tpfojhne8Crc1PfmX1Cpv4r0HDIkMnXuuSnZSuKYJ3Ax5KcOvg6qPm3ssEGYLyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754929702; c=relaxed/simple;
	bh=+bR475SRjyay1Ue836WP66vP3fRyfTFvk+NZNz4nFFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NMaT5UGBrEY7hdsnuKw/5SW54nTiGKpqx5zNMexK2SEMxVb0/NniCyPPUDDJfnILfVNlFHLI7fgQwpZ2zmvsz9CJIR6hHUHxo3nZRAnWxosW6NlGgclQa16UjPSnbTUiMEeUIlTQOGWTInGmcoXIZ34+cnVcy2AgJYkdjproBgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SiRDSBMd; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SiRDSBMd"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3b783d851e6so3896783f8f.0
        for <linux-sunxi@lists.linux.dev>; Mon, 11 Aug 2025 09:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754929698; x=1755534498; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a6pZhPkTmPwrStRmjBBeOOl3BPnkkUEqZ/JYcvCMxtQ=;
        b=SiRDSBMd2FWcadvVuqDR0WUCz3LQXuxiLVodRlvwZX4aygnBA3VmT/+rv47fwoqxrx
         hUGEmcrq+MUx7D7iVa/hfqaAyWJaMq+HoF2OKZjvtp3+FP6iQgDrlNgF1+DjitN19tj2
         e+ucG2AFA9a4UYspLpbImKAYCW3zWNg/1k4jGZdYCUSeiEXbA7LlPJhtphrTroqMdjSn
         dpi5e247SjQeE4HyqpCWzMF3mpfnCNwBXrsGsZYTTXlYriHc7Y7JmDNr7QaNttt+ovdV
         8mrERCPqc6fu/6cUEYz4OLOe1mEsgfxzkoo6MBW8g+bW/nk4bNIA11we1LZhPKKn38WS
         F0aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754929698; x=1755534498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a6pZhPkTmPwrStRmjBBeOOl3BPnkkUEqZ/JYcvCMxtQ=;
        b=f3HuLwrzIGdB2Unr1YCU3PjvZmfDyp2vv2T97UpudtJxGorSzMlRvpoErbtzA1MTbB
         W8KdZ0WK3o+Hlki35PWKtkogf0vMwjCXrxoBlp9s+Sb4xy+zRSvBjYe0cJ1rIplLXj6z
         ggUxhyVdqCzCn/mkIKPS4cnjwxXnTm7rY4GbWn69WyvtBnk9jbgyp579ZgHakQD1i91i
         zF5g4TBvIQRqPwgHdzJF8OWg6G4Xaald2Cb7tvXi/Uo1AOmXhjPVH6cHuaBA1HT/P3yj
         Zl9ATRjSgfpab2rEhcfAIxNahFL0gueNLBTU2C2wWNn5EkdDEq+k1wHxzRETNCDbgSKe
         uA5A==
X-Forwarded-Encrypted: i=1; AJvYcCXg7H2rpDWCl5MF116VJq2HfO+bdBhawNsT5tBJqXm3XtS2fHq1t+TaD7kk5W6IIESZ9zhtYJVf1/ZdQg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzTl+Uent9R0trM2cbfCM+WGh20+RcerBDO6Y1rPX0/7LiprN4j
	1gLUqEiNt3GaqluU0zXmc2DV+Kgm/SBsnhb3UY5qerPBAtAWs2jjoAJe
X-Gm-Gg: ASbGncuIZKU3h2R+IQ/acaBH8/zYby2xb6/MxGxsG3z7UW9heYCYIEFHnamWBiqGX79
	w8jBpMr7Q4k7VrOxRqA+887M/hoGKQtrywmGvAfkkt7VrSJHYsqjJO9imq9qWcIcNo7qC1vhas+
	GoO8IT7m7AygZU/gMeegXzrTScU4NY2EVQEiioA36LyJk5wYrJxUEV2VjysG++vmXM5UJLA772w
	JobK9N9J2cJ79yWXMa/zknvyv1SjnZ/kaN1ODIp0FbHZi0FWjj8vkU5dDro1ozT9Qe2bX1aWLBn
	HaLF1xapX83Ad6PFdsxD+py2qFPVzOJ1y3ERmkpf3XaGtib4HPxlBcULZBTzKB0m934lOh3iqBw
	YpPA+12wRfZgLW64SsDac45zUCypw5M9Fg2IvIgPYe3lE6ZzseCXGTkem8HS60sfTJIz/dVOYlg
	==
X-Google-Smtp-Source: AGHT+IHSrH1ZW1fBH0gun9ZPAWYWoCnyX1s0CbkYhM+HManBK+cp2Z8O+AsqWZl4xD8QQV09FD8rUQ==
X-Received: by 2002:a05:6000:220f:b0:3b7:924a:998f with SMTP id ffacd0b85a97d-3b900b499cfmr11694247f8f.5.1754929697663;
        Mon, 11 Aug 2025 09:28:17 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459de0d4cf1sm324974175e9.13.2025.08.11.09.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 09:28:17 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: u-boot@lists.denx.de, Tom Rini <trini@konsulko.com>,
 Cody Eksal <masterr3c0rd@epochal.quest>,
 Chris Morgan <macromorgan@hotmail.com>, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 3/3] sunxi: H616: dram: fix LPDDR3 mode register settings
Date: Mon, 11 Aug 2025 18:28:16 +0200
Message-ID: <4444430.ejJDZkT8p0@jernej-laptop>
In-Reply-To: <20250811170816.60e57b14@donnerap.manchester.arm.com>
References:
 <20250801234918.19176-1-andre.przywara@arm.com>
 <7836068.EvYhyI6sBW@jernej-laptop>
 <20250811170816.60e57b14@donnerap.manchester.arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 11. avgust 2025 ob 18:08:16 Srednjeevropski poletni =C4=8Da=
s je Andre Przywara napisal(a):
> On Mon, 11 Aug 2025 17:49:06 +0200
> Jernej =C5=A0krabec <jernej.skrabec@gmail.com> wrote:
>=20
> Hi Jernej,
>=20
> many thanks for having a look!
>=20
> > Dne sobota, 2. avgust 2025 ob 01:49:18 Srednjeevropski poletni =C4=8Das=
 je Andre Przywara napisal(a):
> > > The JEDEC LPDDR3 spec defines mode register 0 (MR0) as being read-onl=
y,
> > > so there is no point in trying to set its value.
> > > Also the H616 memory controller encodes the mode register index to be
> > > written starting from bit 8 in MRCTRL1 (for LPDDR3 and LPDDR4 chips),=
 so
> > > we need to OR in that number to tell the controller which MR to progr=
am.
> > >=20
> > > On top of that, the mode registers between DDR3 and LPDDR3 are
> > > completely different, so writing values crafted for DDR3 into a LPDDR3
> > > chip is just wrong. Due to the above mentioned bugs the writes for
> > > MR0-MR2 did not have any effect (as they were all trying to set the
> > > read-only MR0), so the mode registers just stayed unchanged. =20
> >=20
> > Nice catch! Looking at BSP DRAM code, it only sets MR1, MR2 and MR3.
> >=20
> > >=20
> > > Looking at the LPDDR3 spec and the BSP code, let's write the proper MR
> > > values into LPDDR3 chips, using the proper addressing mode. =20
> >=20
> > Please explain how you find those values. Are they always set in this w=
ay
> > for all boards using LPDDR3?
>=20
> Yeah, that's a good question! At first, I tried using what JEDEC describes
> as the default settings, but that didn't work. Then I looked into some
> parameters found in some BSP image dumps, but that didn't work either.
> JEDEC describes those MRs as write-only, and I haven't tried whether
> reading them would work nevertheless, not sure about the exact algorithm
> for reading MRs anyway.
> What eventually worked was to use the BSP values written by exactly the
> boot0 on the eMMC that boots an LPDDR3 system - which is actually only one
> in mainline: the Tanix TX1.
>=20
> So yeah, those values work for me (TM), and there is only one LPDDR3 board
> supported, so fingers crossed. But actually I wonder if those MR values
> really belong into the timing routine (mctl_set_timing_params(), since
> parts depend on the speed bin. I see some other SoC/DRAM type combinations
> doing that already (H6 DDR3/LPDDR3 and A523 LPDDR4), maybe we should
> follow suit here?

Historically, I checked several boards and if MR value was the same in all
configs, I just hardcoded the value. While this is a bit naive, it works mo=
st
of the time. There are some cases where it is set dynamically in BSP code. =
Those
cases can be a bit annoying to find. Ideally, MR values shout be Kconfig
option with default values.

It's up to you to decide which approach to take. Since it affects just one
board and changes were tested:

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>=20
> Cheers,
> Andre
>=20
>=20
> >=20
> > Best regards,
> > Jernej
> >=20
> > > Use the opportunity to document the LPDDR3 mode register bits written.
> > >=20
> > > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > > ---
> > >  arch/arm/mach-sunxi/dram_sun50i_h616.c | 12 ++++++------
> > >  1 file changed, 6 insertions(+), 6 deletions(-)
> > >=20
> > > diff --git a/arch/arm/mach-sunxi/dram_sun50i_h616.c b/arch/arm/mach-s=
unxi/dram_sun50i_h616.c
> > > index 877181016f3..3345c9b8e82 100644
> > > --- a/arch/arm/mach-sunxi/dram_sun50i_h616.c
> > > +++ b/arch/arm/mach-sunxi/dram_sun50i_h616.c
> > > @@ -1078,18 +1078,18 @@ static bool mctl_phy_init(const struct dram_p=
ara *para,
> > >  		mctl_await_completion(&mctl_ctl->mrctrl0, BIT(31), 0);
> > >  		break;
> > >  	case SUNXI_DRAM_TYPE_LPDDR3:
> > > -		writel(mr0, &mctl_ctl->mrctrl1);
> > > -		writel(0x800000f0, &mctl_ctl->mrctrl0);
> > > -		mctl_await_completion(&mctl_ctl->mrctrl0, BIT(31), 0);
> > > -
> > > -		writel(4, &mctl_ctl->mrctrl1);
> > > +		/* MR0 is read-only */
> > > +		/* MR1: nWR=3D14, BL8 */
> > > +		writel(0x183, &mctl_ctl->mrctrl1);
> > >  		writel(0x800000f0, &mctl_ctl->mrctrl0);
> > >  		mctl_await_completion(&mctl_ctl->mrctrl0, BIT(31), 0);
> > > =20
> > > -		writel(mr2, &mctl_ctl->mrctrl1);
> > > +		/* MR2: no WR leveling, WL set A, use nWR>9, nRL=3D14/nWL=3D8 */
> > > +		writel(0x21c, &mctl_ctl->mrctrl1);
> > >  		writel(0x800000f0, &mctl_ctl->mrctrl0);
> > >  		mctl_await_completion(&mctl_ctl->mrctrl0, BIT(31), 0);
> > > =20
> > > +		/* MR3: 34.3 Ohm pull-up/pull-down resistor */
> > >  		writel(0x301, &mctl_ctl->mrctrl1);
> > >  		writel(0x800000f0, &mctl_ctl->mrctrl0);
> > >  		mctl_await_completion(&mctl_ctl->mrctrl0, BIT(31), 0);
> > >  =20
> >=20
> >=20
> >=20
> >=20
>=20
>=20




