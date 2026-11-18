Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795009307;
	b=TvZOQ1cNNCq6eckiEscNivhpBU3kQirGR3SA7TyobVyXFIujQYXd50Y+T44N5IhByeAd
	 MF0Jn1L9fdUw8fBc96ADL7K1VvTyTuHQgn1Kf3gji5mECwfOIHnfv21FEq7FckevePcg3
	 H1wwHifxyGkMGa9G2wKpYXhVuQdpwRbR6SrZp4YEqa+Nm9tO6xwFe4SLfdTriI+EksR/5
	 7ndRZwC/Bw2qW7Gz5Fo/deEUPBPE7cqzIqS8+g4eYNErp+3U8Zlj35Ao8j1dohj+MIFgH
	 jczUrPnajgbxg7xDluMnFzYNu7fhuAY9SSR9NZ0Rx3FKR3dVY+jeVkAEwD5tidiwRYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009307;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lcaa3SNkhAb/kcsmzPV8E1WCwoDFbGJK3E0LRrMO6DY=;
	b=CFc9/6xcA5HXPd3Ird7Z5uF2MxoyzcVN98L82mYliGOxBqorKNct1GKWWq/wMNIuhpUE
	 NYjyXNP15/xgzAcZRLR496BWMjwnBFgow+MzN7LslBEmrtmRZj/mcN/PEPudglV+42uZc
	 Lm6URD/xzuPk0BpXYHxUcbPXmJDZUD/FpjNgAxpREZTC+iRQvER/8Qd3kTyqDcKMCf83S
	 X3odQrr40GEHtIoV3aJgCB/wfC/wB4dfJEJ+jIrphDO6HX3/hDYcOdvFmrUAIBi26JFKw
	 1MRwNZECz2EhZaxk8NFe1OkJUn2m+bjYnVbrHBzSepVWShZkVAyrkwdVy4uxS9SK9vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l7vSMIlU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABEF6606A32A
	for <linux-sunxi@lists.linux.dev>; Wed, 18 Nov 2026 13:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l7vSMIlU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F85B1F000CD
	for <linux-sunxi@lists.linux.dev>; Wed, 18 Nov 2026 13:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795009307;
	bh=lcaa3SNkhAb/kcsmzPV8E1WCwoDFbGJK3E0LRrMO6DY=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=l7vSMIlUj0ZnV6gCM6eDGXMeJHxgvN5KeZXKq521C1yqABKr3mPHRJfpt2naXjWJB
	 54z/+SfTXESc/0CyOjoq1+hjdqVO5355UpGtz8kPpSZGjJEi7/TnMk3H2jIBYD4ci8
	 lTsC0OHcm+zaweE+DoGye/QGHD8NQyvrz94FZ7qhlqJdF/MQ2nDjg72U00uwulzPoU
	 eLEq7gQiCBzwt3dGvV883PVeHroCXQvZR1f1PL0xtDy7zRvlXHjNKCclPbKzajCLhj
	 Z5ib/TAlVM8g7DJcXlPgB+hzRqCtmABXGyFEc9zVdl7k9jy6sivSwKFRuspjQSaMCw
	 JhLbHJ/347JIQ==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3ae417eb235so9106671fa.3
        for <linux-sunxi@lists.linux.dev>; Wed, 18 Nov 2026 05:41:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGL+0aWovnvu+YoBUl0jtcnu2JeXjldkvCsI5lvBOsm4HUQSYVJb3h/iIdYbClFD6KKWqmOwOicBBJOLw==@lists.linux.dev
X-Gm-Message-State: APuU4Z9DAeEV5A0myDv1LLMJGU47DvHkWo+dGUP2zSGyOfCX/dnf2XgS
	1HCP1l873ESr2sseBNxox/mJj70/P9ELfDa+N/mp1oJYe1xAfqe6EIPHPVQ70SKRfAa9ebnZceW
	SZqY0qWzYM0eXl92VohAe3RfbDeZEhNU=
X-Received: by 2002:a05:6512:3d26:b0:5bf:d93d:77ab with SMTP id
 2adb3069b0e04-5c1aa04bfbdmr1046146e87.14.1795009305171; Wed, 18 Nov 2026
 05:41:45 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261112-a733-fwclk-v2@gmail.com> <2374cc08-fd47-435a-b1e8-c7e9a61954c4@arm.com>
In-Reply-To: <2374cc08-fd47-435a-b1e8-c7e9a61954c4@arm.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 18 Nov 2026 21:41:30 +0800
X-Gmail-Original-Message-ID: <CAGb2v66w9XYO7CUFrvJq2HL7ELABptg=3Bs4XbZxMh7VU0pepw@mail.gmail.com>
X-Gm-Features: AclHuK_uSfLxLqB2imw4kAYz2-b1phnvB91nCtuA6LEH6OR5sLpPkWc-BEPm25g
Message-ID: <CAGb2v66w9XYO7CUFrvJq2HL7ELABptg=3Bs4XbZxMh7VU0pepw@mail.gmail.com>
Subject: Re: [PATCH v2] clk: sunxi-ng: a733: Keep SCP firmware bus clocks enabled
To: Andre Przywara <andre.przywara@arm.com>
Cc: Enzo Adriano <enzo.adriano.code@gmail.com>, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, jernej.skrabec@gmail.com, samuel@sholland.org, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Junhui Liu <junhui.liu@pigmoral.tech>, 
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 1:18=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> Hi,
>
> the patch itself looks fine, but the comments and the commit message are
> not entirely correct, I think.
>
> On 11/12/26 22:38, Enzo Adriano wrote:
> > The A733 PRCM's bus-r-riscv and bus-r-msgbox gates have no Linux
> > consumers, so unused-clock cleanup gates them. With vendor SCP firmware
> > running on the E902 as shipped on Cubie A7S, warm reboot then stalls.
>
> Please note that we don't support "vendor firmware" with mainline Linux.
> That was mostly incompatible in the past, and while it might work these
> days, this is not something we control and want to endorse.
> So we would be quite reluctant (to put it mildly) about merging patches
> that are solely needed for BSP firmware bits.
>
> > Keep both critical until remoteproc/mailbox drivers can claim them.
>
> I don't think this "until" is an argument. Even if we'd have Linux
> driver support, they would be optional to use (not compiled, not
> loaded), and would only be needed to *communicate* with the firmware.
>
> But those clocks are actually there to drive the RISC-V core clock, and
> also the "RISC-V side" of the peripherals, due to a lack of separate
> clock controls in the SoC in the Allwinner design. So the kernel should
> not care about or touch those clocks at all - which is what
> CLK_IS_CRITICAL does.

No. CLK_IS_CRITICAL also tells the kernel to turn it on, and you then
can never turn it off. You get a big warning if you try to defeat the
refcounting, but nothing else happens.

So what if the *real* remoteproc driver needs to turn the clock off to
pause the RISC-V core? It can't

So, not a fan of this. If the loaded firmware somehow needs some resources
then perhaps the software that loaded it needs to somehow tell the kernel
they are needed, like the bootloader patching the DT passed to the kernel.

If the firmware needs a piece of DRAM, you don't say in the kernel that
this piece of DRAM is off-limits. You let the bootloader tell the kernel.
Static DRAM carve outs with reserved-memory nodes in the DT source is also
ugly, as you could end up with mismatches if the firmware somehow changed.

IMO CLK_IS_CRITICAL should be used for things that the kernel knows it need=
s
but there's nothing to claim it.


ChenYu

> > This follows A523 bus-r-cpucfg in commit 1dba74abf3e2 ("clk: sunxi-ng:
> > Mark A523 bus-r-cpucfg clock as critical") and the temporary SCPI firmw=
are
> > clock protection for Meson AXG fclk_div3 in drivers/clk/meson/axg.c.
> >
> > On Cubie A7S with vendor boot0/BL31/SCP/U-Boot and without
> > clk_ignore_unused, warm reboot returns with both clocks critical and
> > stalls without them. Vinicius found either flag alone insufficient on
> > Cubie A7Z. Power-off, suspend, single flags on A7S, other
> > boards/firmware and upstream TF-A were not tested.
> >
> > Link: https://lore.kernel.org/r/20261005183038.417798-1-vinicius.eduard=
o.pedrosa@gmail.com
> > Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
> > ---
> > Changes in v2:
> > - Drop r-timer0, bus-r-timer and bus-msgbox0: A7S warm reboot works wit=
h
> >    these at 0/0. Keep only the two E902/mailbox bus gates after Junhui'=
s
> >    review, pending remoteproc/mailbox ownership.
> > - Rebase on CCU v7; its PRCM clock definitions are unchanged from v6.
> >
> > v1:
> > https://lore.kernel.org/r/20261031020640-263f7b05-a7s-clock@gmail.com
> >
> > Base: v7.4-rc1. Depends on CCU v7 (all eight patches):
> > https://lore.kernel.org/r/20261112-a733-clk-v7-0-db7c5451ffa2@pigmoral.=
tech
> >
> > November 12 board test: two RAM boots and warm reboot -f returns on
> > Cubie A7S with vendor boot0/BL31/SCP/U-Boot, without clk_ignore_unused.
> > Both retained clocks were 1/1; all three dropped clocks were 0/0.
> > The no-flag stall was observed with CCU v6 on Nov 10; PRCM code is
> > byte-identical in v7, where the no-flag control was not repeated.
> > Runtime used DT v3 and its dependencies (all four UART v2 patches),
> > with the PMIC identifier and pinctrl IRQ-map context adapted to the bas=
e:
> > https://lore.kernel.org/r/cover.1794227241.git.enzo.adriano.code@gmail.=
com
>
> I don't think there is any need for those longish test descriptions,
> especially if they pass.
>
> >
> >   drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c | 7 +++++--
> >   1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c b/drivers/clk/sun=
xi-ng/ccu-sun60i-a733-r.c
> > index b8f6e8c6e507..f2965daba0d3 100644
> > --- a/drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c
> > +++ b/drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c
> > @@ -108,7 +108,9 @@ static SUNXI_CCU_DUALDIV_MUX_GATE(r_spi_clk, "r-spi=
", r_spi_parents, 0x150,
> >                                 0);
> >   static SUNXI_CCU_GATE_HW(bus_r_spi_clk, "bus-r-spi", &r_ahb_clk.commo=
n.hw, 0x15c, BIT(0), 0);
> >
> > -static SUNXI_CCU_GATE_HW(bus_r_msgbox_clk, "bus-r-msgbox", &r_ahb_clk.=
common.hw, 0x17c, BIT(0), 0);
> > +/* Vendor SCP firmware on E902 needs this until a remoteproc/mailbox d=
river claims it. */
>
> Please change this comment. Something like the msgbox clock is shared
> between the E902 core and the Arm APs.
>
> > +static SUNXI_CCU_GATE_HW(bus_r_msgbox_clk, "bus-r-msgbox", &r_ahb_clk.=
common.hw,
> > +                      0x17c, BIT(0), CLK_IS_CRITICAL);
> >
> >   static SUNXI_CCU_GATE_HW(bus_r_uart0_clk, "bus-r-uart0", &r_apb1_clk.=
common.hw, 0x18c, BIT(0), 0);
> >   static SUNXI_CCU_GATE_HW(bus_r_uart1_clk, "bus-r-uart1", &r_apb1_clk.=
common.hw, 0x18c, BIT(1), 0);
> > @@ -146,8 +148,9 @@ static SUNXI_CCU_MUX_DATA_WITH_GATE(r_riscv_clk, "r=
-riscv", r_riscv_parents, 0x2
> >                                 24, 2,        /* mux */
> >                                 BIT(31),      /* gate */
> >                                 0);
> > +/* Vendor SCP firmware on E902 needs this until a remoteproc/mailbox d=
river claims it. */
>
> and this. Just note that the E902 might be running on its own, in a pure
> firmware role, or even completely separate from the main kernel.
>
> Oh, and also please put somewhere that this is based on the linux-sunxi
> for-next tree, aside from just having the base-commit ID below.
>
> Cheers,
> Andre
>
> >   static SUNXI_CCU_GATE_HW(bus_r_riscv_clk, "bus-r-riscv", &r_apb0_clk.=
common.hw,
> > -                      0x21c, BIT(0), 0);
> > +                      0x21c, BIT(0), CLK_IS_CRITICAL);
> >   static SUNXI_CCU_GATE_HW(bus_r_riscv_cfg_clk, "bus-r-riscv-cfg", &r_a=
pb0_clk.common.hw,
> >                        0x21c, BIT(1), 0);
> >
> >
> > base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
>
