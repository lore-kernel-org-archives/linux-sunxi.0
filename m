Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397CF344DA8
	for <linux-sunxi@lists.linux.dev>; Sun, 12 Jul 2026 05:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783833197; cv=none; b=JGz02O5vjkOTGq9DPF+E2ErMXSfCZSKfsM1crcboripdfulh7B8oI3VOjtut4enLjjw4gNRXyZcig0aHhxLWzH3w4r8+9EBmprT/snvX/5rZFDn95J8DDZX2Jd0m3L5shPjyrcgbe6rLzy4UEBUfTpNUdQfHPlkDNqKAaIDsb04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783833197; c=relaxed/simple;
	bh=uqygXZPSLZQO0SRlxM+UGSn3H6OXnYQPC0oJsol+Kmc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y2lLaX3PqHzGGehcNUowMOeA6Y/RHFRYzc83lWckNHemUi8ds6/1onl5hoTcdfy2RvQhxHAeAhgMtQP7ExrrbPTwbBz+gxfVLS5lhF/JIocH2jUhr/wW1zEbP3VhufU00W3r4CqBKDAzgZWsJyauuKpAikQHATj/U7w/SM1ytHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TKaTinPC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TKaTinPC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED8901F00A3A
	for <linux-sunxi@lists.linux.dev>; Sun, 12 Jul 2026 05:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783833195;
	bh=rLTCb96hFjM2FfPbsAHnO1f3U06p3l/uWtkaSYyB/bQ=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=TKaTinPC1ZYqhrkOX7Or5vOM6O5lf8hbFPR9k7c0alpTVohqZsixhBZPvG+xUexPV
	 RCve3Bg91hwbvAIMZ7kjmhKfjMJV/Vev79s3wCHmMhIxk4Ln1SUA9E4yBlD+p+oMsW
	 Kytnne2o7WzAItPTpi8RLLgceHw0/IEygCv3Ov1cggnsr+1rRNrEd6ees5f8o6re4I
	 G4s5idzvMn9wv+eB1Y8uA+b2jC+PSIGgIy7VSPyqfTY7p5jfLdqPjSNx4B9OoI2TJI
	 JcFB+rsS5bmwFGNUWbkEihwhYLTV16jbrM++iflsRTjhdx/CQ49OilyodYIpXmb4GY
	 XQTjOWucfinXw==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aeb5e85378so2182178e87.1
        for <linux-sunxi@lists.linux.dev>; Sat, 11 Jul 2026 22:13:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrXRtD2Gl4TsLAM96sVIybq+ybWAKAdzCnS3Zeyn0x9TWjIDL/NndUI17zFmcnctTghrTKfTQbdnhQwBg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyf46Efxs3zlfO9U/hU8z6shC+YmGdMjDV1LUHgxm0WBpi/RPb+
	JlJtaXW2sn7bdSA1WlgYyI7sKM1yFJ66ruMp4fBHIjb6Zw65BR67Lmrjy/1JDWzp4/dI7vpigZe
	433EhyJlDkMen25CGZqukw3dCgA02ojs=
X-Received: by 2002:ac2:5284:0:b0:5ae:c636:5c with SMTP id 2adb3069b0e04-5b0236de96dmr689800e87.47.1783833193266;
 Sat, 11 Jul 2026 22:13:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260702214750.3428694-1-utilityemal77@gmail.com>
 <20260702214750.3428694-2-utilityemal77@gmail.com> <20260703-versed-locust-of-agility-d76fda@quoll>
 <akgR7N1LmqEmPSLy@suesslenovo>
In-Reply-To: <akgR7N1LmqEmPSLy@suesslenovo>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 12 Jul 2026 13:13:00 +0800
X-Gmail-Original-Message-ID: <CAGb2v64dEj_M+LvCok91EuH6uq3ivutMRqU8-XUno2_ag5p+tg@mail.gmail.com>
X-Gm-Features: AUfX_mwTG0Ej3M8TCZ8CoQWahuofQ1shmnD3lKfX2hOd7HU_ITVHuXMr_RVFxTM
Message-ID: <CAGb2v64dEj_M+LvCok91EuH6uq3ivutMRqU8-XUno2_ag5p+tg@mail.gmail.com>
Subject: Re: [PATCH 1/4] media: dt-bindings: allwinner,sun4i-a10-ir: add A523 compatible
To: Justin Suess <utilityemal77@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sean Young <sean@mess.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 4, 2026 at 3:50=E2=80=AFAM Justin Suess <utilityemal77@gmail.co=
m> wrote:
>
> On Fri, Jul 03, 2026 at 12:56:00PM +0200, Krzysztof Kozlowski wrote:
> > On Thu, Jul 02, 2026 at 05:47:47PM -0400, Justin Suess wrote:
> > > The A523 (sun55i) contains a newer revision of the sunxi CIR receiver=
.
> > > It is not backwards-compatible with the A31 programming model: the
> > > control register has a pulse capture mode field (bits [7:6]) that
> > > resets to a value which captures no pulses at all, and the sample
> > > clock divider is now selectable via SPLCFG bits [1:0] instead of
> > > being fixed at the old module clock / 64.
> > >
> > > Since a kernel driving it as an A31 CIR receives nothing, add the
> > > compatible as a standalone entry rather than under the
> > > allwinner,sun6i-a31-ir fallback.
> > >
> > > Signed-off-by: Justin Suess <utilityemal77@gmail.com>
> > > ---
> > >  .../devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml        | 1=
 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-=
a10-ir.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-i=
r.yaml
> > > index 42dfe22ad5f1..06656058ce91 100644
> > > --- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.=
yaml
> > > +++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.=
yaml
> > > @@ -19,6 +19,7 @@ properties:
> > >        - const: allwinner,sun4i-a10-ir
> > >        - const: allwinner,sun5i-a13-ir
> > >        - const: allwinner,sun6i-a31-ir
> > > +      - const: allwinner,sun55i-a523-ir
> >
> > I assume you are adding it in expected order that Allwinner is
> > following, not just randomly at the end of any list.
> >
> I did it in product generation order, is that what is expected?
> I know that the a523 series succeeded a31, so that's what I put for
> ordering.

Yes it is.

> > Also, please change all above entries to one enum, can be the same
> > commit.
> >
> No problem, I'll do that for v2.
> >
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> >
> > Best regards,
> > Krzysztof
> >
