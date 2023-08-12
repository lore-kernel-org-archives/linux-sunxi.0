Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC99628
	for <linux-sunxi@lists.linux.dev>; Sat, 12 Aug 2023 08:39:39 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4RNDc14Cn9z9skN;
	Sat, 12 Aug 2023 10:39:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
	s=MBO0001; t=1691829569;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ArSlNANKt5fVqedX9q261tcndTrTB23Mm5NRgz3SKP0=;
	b=XrMoQKM2v7LfJS9BxI79ThF0DhUs7Vtvt9f1fF6s+tMuDqpUyo8yPdZygmaqNZF8yPVlkA
	SLErpVAdXY+em4TkdkFLCpdqm6y0sQGQ+YKTon2F6H2r6Pbq/LloASsVTcDbw/SooEkilW
	Uqa0i5z3CbTnyxj/lbqPmtv22G0eRJWnsa1W0wpnEf9cpkQdnQyTTOXCb/v2D5zGPSC2O0
	N/FljPnU4BkNRTwzK6NLTt9HWCRION0xSkjzZ2GGjvrxCyQ1Yw5iCmO4E5ueMyo9CQTOXy
	gNce+so1OFNz0wPhEimBuuDGeJmzjo7ZGCUVGEyn/bTg6HeUCNeTS+Ee5n4Org==
References: <20230807-a64_pll_video0_notifier-v1-0-8a7ccdc14c79@oltmanns.dev>
 <20230807-a64_pll_video0_notifier-v1-2-8a7ccdc14c79@oltmanns.dev>
 <16a690b357f34db0ba852a63d86ba13b9ded5924.camel@icenowy.me>
 <87il9rtc7y.fsf@oltmanns.dev>
 <af2fc72a8206ababe7f4ec7af0667ba39c6df2d4.camel@icenowy.me>
From: Frank Oltmanns <frank@oltmanns.dev>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Ond?0?0ej Jirman <x@xnux.eu>, linux-sunxi@lists.linux.dev,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/3] clk: sunxi-ng: a64: keep tcon0 clock rate when
 pll-video0's rate changes
In-reply-to: <af2fc72a8206ababe7f4ec7af0667ba39c6df2d4.camel@icenowy.me>
Date: Sat, 12 Aug 2023 10:39:28 +0200
Message-ID: <87h6p4k62n.fsf@oltmanns.dev>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 4RNDc14Cn9z9skN


On 2023-08-07 at 18:22:26 +0800, Icenowy Zheng <uwu@icenowy.me> wrote:
> =E5=9C=A8 2023-08-07=E6=98=9F=E6=9C=9F=E4=B8=80=E7=9A=84 11:48 +0200=EF=
=BC=8CFrank Oltmanns=E5=86=99=E9=81=93=EF=BC=9A
>>
>> On 2023-08-07 at 17:43:52 +0800, Icenowy Zheng <uwu@icenowy.me>
>> wrote:
>> > =E5=9C=A8 2023-08-07=E6=98=9F=E6=9C=9F=E4=B8=80=E7=9A=84 11:36 +0200=
=EF=BC=8CFrank Oltmanns=E5=86=99=E9=81=93=EF=BC=9A
>> > > From: Icenowy Zheng <icenowy@aosc.io>
>> > >
>> > > Notify TCON0 clock (and in consequence PLL-MIPI by
>> > > CLK_SET_RATE_PARENT)
>> > > to reset when PLL-Video0 changes (because of HDMI PHY clk which
>> > > is a
>> > > child of PLL-Video0 and has CLK_SET_RATE_PARENT set). In this way
>> > > we
>> > > can
>> > > get clock tree to satisfy both pipelines.
>> >
>> > Well for fixing one's patch that contains SoB, use the following
>> > format:
>> >
>> > Signed-off-by: A <a@a.local>
>> > [B: fixed something]
>> > Signed-off-by: B <b@b.local>
>>
>> Ah, okay. Will do. But I keep A in the "From: " line, correct?
>
> Yes.
>

One more thing: You seem to be using a new mail address. Do you want me
to replace the "From" and SoB's with the new address?

Thanks,
  Frank

>
>>
>> Thanks,
>> =C2=A0 Frank
>>
>> > > ---
>> > > =C2=A0drivers/clk/sunxi-ng/ccu-sun50i-a64.c | 15 +++++++++++++++
>> > > =C2=A01 file changed, 15 insertions(+)
>> > >
>> > > diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
>> > > b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
>> > > index ef567775fc95..93beedb0428e 100644
>> > > --- a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
>> > > +++ b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
>> > > @@ -943,6 +943,17 @@ static struct ccu_mux_nb sun50i_a64_cpu_nb =3D
>> > > {
>> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.bypass_index=C2=A0=
=C2=A0=C2=A0=3D 1, /* index of 24 MHz oscillator */
>> > > =C2=A0};
>> > > =C2=A0
>> > > +/*
>> > > + * Since PLL-Video0 is an ancestor of both tcon0 and HDMI PYH,
>> > > tcon0
>> > > clock will
>> > > + * conflict with HDMI PHY clock which is on another display
>> > > pipeline.
>> > > + *
>> > > + * Therefore, a notifier is required to restore the rate of
>> > > TCON0
>> > > when the rate
>> > > + * of PLL-Video0 changed.
>> > > + */
>> > > +static struct ccu_rate_reset_nb
>> > > sun50i_a64_pll_video0_reset_tcon0_nb
>> > > =3D {
>> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.common=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D &pll_video0_clk.common,
>> > > +};
>> > > +
>> > > =C2=A0static int sun50i_a64_ccu_probe(struct platform_device *pdev)
>> > > =C2=A0{
>> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0void __iomem *reg;
>> > > @@ -978,6 +989,10 @@ static int sun50i_a64_ccu_probe(struct
>> > > platform_device *pdev)
>> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ccu_mux_notifier_reg=
ister(pll_cpux_clk.common.hw.clk,
>> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &sun50i_a64_cpu_n=
b);
>> > > =C2=A0
>> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Reset the rate of TCON=
0 clock when PLL-VIDEO0 is
>> > > changed
>> > > */
>> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sun50i_a64_pll_video0_res=
et_tcon0_nb.target_clk =3D
>> > > tcon0_clk.common.hw.clk;
>> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ccu_rate_reset_notifier_r=
egister(&sun50i_a64_pll_video0_r
>> > > eset
>> > > _tcon0_nb);
>> > > +
>> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
>> > > =C2=A0}
>> > > =C2=A0
>> > >
