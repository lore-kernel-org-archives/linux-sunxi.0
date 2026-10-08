Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149313CF047
	for <linux-sunxi@lists.linux.dev>; Thu,  8 Oct 2026 06:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791442519; cv=pass; b=QNGRTVcgYf1aRKLVhmmHzSeqMOxRFvIN0wXBpomGh9pS7VxkjQF2fild0Z+fpxkl1B7kVsplxihlpe4KqKp5XYZIwa0MVhopi/dENmT93iNG1usx/GlCynmg9anSk4kp159yRYaAClPAe4f65bL5NF2TY2NjX/+xiGw8U8XUvZM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791442519; c=relaxed/simple;
	bh=LAU+lAaONCsbyhUKz3NVx/NrIoGX2BWhWJ83XVPrkW0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QF1KTZAPMz3m2GpT8p8X7R+n5L0dBNqlikSNGm8WDofGpXaWRSyTccx3m1dGkL/D621PWCwnCYtrFXM0p4AWVfdKkgof6+0w7LjLnhxl0t+z37hLGkNNfp/a5vkUqn4sefL81eC4MxeAeFIqm/9WxSA5mWCJ176ywNkDtQJWr20=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p2dDwJKO; arc=pass smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p2dDwJKO"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc147d86bebso207335a12.0
        for <linux-sunxi@lists.linux.dev>; Wed, 07 Oct 2026 23:55:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791442517; cv=none;
        d=google.com; s=arc-20260327;
        b=raeiUy0g1R9DdGmbcivTakDCNm9L4tOS2SQ+O821W92c/6j94pf16+v/bAD3mI51BS
         LF1bA+mimV8yxAqM6at5M8C7ibh00TcA2LfR5ARzU3paw8PST5HLNgZrFWHJoQ5Xsy6+
         fkD6sZHrFppDttd7GkvVV+fW0Zumko4pdYKN5Ie0Wa6fpTlB+K4MDrk+crWYOizOxyk2
         qauN0iFeNJZicOI1Xw+O0fHjtVuQZhul0aJtVHDbW1svTFwEzFKsUS/OJbtJdhWBjEMx
         0ZnPN12Dx0p85kTI0zRzv97eMU1WtK1Rf5tIslt7OlhrMdrmThTH/XikvSXXecZu/IVi
         DAbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GwVHKedpjNUKuB2nBCCOQbetrG9q4vZVX+BP70vaR40=;
        fh=egLP1UuqeCgy78MPQ9hJuee8nsBXBez2X4kPg6FqcvI=;
        b=qPZotWOlhljaLRBcCfoU4MxLYT/pwWTa9VAMCAHq4BuTKu0t9HvdmgiPnSRElDeZqI
         UJITNKKHcu4RGZbGk/pMRw4lO5/nLQ8hTyoz9ONpnxJayU5aEroBtSTu8i10kOX0l2IU
         isx33CpSqjmjA9EuGKmR6LWK+EFjql25hPInw4NwXAxKc4JMrBWXk2YZaI7Iw+J4KYsF
         cTj6j9uWAnagCBOuvRRTM/B5DvcgT+pezyBVfjMj8iWlfNs9niFTtIhBtpvlAKnDp8c8
         Zgm0KTDaoeHBJBjwRu/QI2cQ5kvdwmq0+60aEmJam9jT3Tg1WPuSGKHRAjD6g4IJVDT5
         OR+Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791442517; x=1792047317; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GwVHKedpjNUKuB2nBCCOQbetrG9q4vZVX+BP70vaR40=;
        b=p2dDwJKO3NvnYm16CV3YfEMYD+0yoCfrXgr48tawqdBf28zeyjt1OOmXlhcIfDXzjw
         kHoHmfM3uvwrXtkjPK8KBRrP3jJrppqHyZwV2eOcFJC+wtzsAMd2B5i9uYbcINwxStxa
         06ABaFWtQqffgjj5EdMnXY2nR4kdTSyTfyfsYrLXFDO5y5JFJTbR9UKlkQ7hC0wCaB4N
         GfvYtk8UrA1UMJrUymn8290nwoEH4K60sQOA+cbhBgLaScWd7UK52hdns3YACN8h4M/P
         LpL099wMsYDUIrK2QMUcnvQ5fhT9IFxHsEjKhzsnFEUFfkBV+BU3xMJmLfg6mywYV+F9
         6qWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791442517; x=1792047317;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GwVHKedpjNUKuB2nBCCOQbetrG9q4vZVX+BP70vaR40=;
        b=l1GKJZ35lY52qCY0AkzSRCF2YVlrZJJv4iA71ZJnovSzCo0OJAX8u/xOcpu76QQJnx
         flOoWq89IcUgqMhs0aBd6uNzIBqv8aCL3w4rMPKWRQ6OoxlQ0lLWq2ey3PpLS8Y5ILbf
         z6WamdUsQWs90Zc1v2XIH4MoUNHAhhW6H6IaPZVjyaFw43AmSX8/jJoEDGa0aAjGq+rk
         yBom9KTAr/T+wpELpgXj409b6P+9o0pNCR5TX2zg9LTGvYgaF/Av7hl1T/lI1elIocuZ
         5wv/4IFtzI6hNUEx5RwwZKY+4g9GNHlmuzihu7jzK3LNhzzI677G7qqez/dJa1lwoN6C
         KNwg==
X-Forwarded-Encrypted: i=1; AKwUvBxVZFDFWTm7rLUCqahsMkHTh5RDLBGWoHwKSie/OBbnkHTwvV5BMu3CELY9w/nLMs/VlF1H2nPkPnwRcA==@lists.linux.dev
X-Gm-Message-State: AFuF++mOYN2UOpW4EHfatcBxy02Q3jj8/ywUZaJ/tISwWDMV5jdMfRk9
	LS1Cqf4ohWLrNfKGHHvdaSbLSfWBlfE9s6LeCdquX2wRNpmWskPo9wlQuWnCCFBUkeigi254bRU
	s/INwVPT2wnZIwd46n5/g1Hz4gAL4LdM=
X-Gm-Gg: AYBFou3BeuqD0wPxx4uHn0mqTxjiuTIWivzz/dnwHujGd/SIkTwP+Vj9FJw6iAtN/9p
	G08NfiC8xjjKf5VAycxAk98a73vmPHlf3PaWo7AnklSuon/z49n4pTt1ACtaID2VH38flWqasdZ
	Z+cI0s8hXjV6/H7smBTWvRm3lhakOBO04dYshqcmqEzLDD1Ma0Fa27qXzjs2EV/OtZpac6E1lUK
	/4/CEa5LUlbJXfHIUjSY4YjwOz5mjJjEnzgPUfUOdz6jWuZj4M6o5gUGHLutMR4oMZh7vvdznu2
	whHGnxzjl4bYGj7MFfUjeJTfR+madfgEC6e6p5tDXICFXj7QYk+uvq69sQnXUxDfKD4irjg=
X-Received: by 2002:a05:6a21:3e09:b0:3de:3bfb:dc65 with SMTP id
 adf61e73a8af0-3e14c5a1255mr1132038637.34.1791442517344; Wed, 07 Oct 2026
 23:55:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261005202731.153971-1-pmazzini@gmail.com> <20261005202731.153971-4-pmazzini@gmail.com>
 <20261007211626.GA338242-robh@kernel.org>
In-Reply-To: <20261007211626.GA338242-robh@kernel.org>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Thu, 8 Oct 2026 07:54:59 +0100
X-Gm-Features: AclHuK9HNWmbYmgrwOCN8Dj1r6Aaf0O489JwabVju8_e_8zgAdvV8DQG3O2TPc8
Message-ID: <CAAxh=jsoFDfNGEtcWvxe5VNH-knf8LZg9aVh800LF9t-7m1qbA@mail.gmail.com>
Subject: Re: [PATCH v3 03/11] dt-bindings: pinctrl: sun4i-a10: add Allwinner B288
To: Rob Herring <robh@kernel.org>, andre.przywara@arm.com
Cc: Chen-Yu Tsai <wens@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

The B288 uses the same scheme as the A523, and the A733 queued for
7.4, which the shared pinctrl-sunxi-dt helper parses, so I'd rather
stay consistent with them.
Andre, what do you think?

Thanks,
Pablo

On Wed, Oct 7, 2026 at 10:16=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Mon, Oct 05, 2026 at 09:27:23PM +0100, Pablo Mazzini wrote:
> > The B288 driver takes its mux values from the DT, so allwinner,pinmux
> > becomes an allowed property here, required for this compatible only.
> >
> > Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> > ---
> >  .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml  | 22 +++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-=
a10-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4=
i-a10-pinctrl.yaml
> > index 45b7a0b6c626..b1f093d218f5 100644
> > --- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pin=
ctrl.yaml
> > +++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pin=
ctrl.yaml
> > @@ -39,6 +39,7 @@ properties:
> >        - allwinner,sun8i-a33-pinctrl
> >        - allwinner,sun8i-a83t-pinctrl
> >        - allwinner,sun8i-a83t-r-pinctrl
> > +      - allwinner,sun8i-b288-pinctrl
> >        - allwinner,sun8i-h3-pinctrl
> >        - allwinner,sun8i-h3-r-pinctrl
> >        - allwinner,sun8i-r40-pinctrl
> > @@ -120,6 +121,15 @@ patternProperties:
> >          $ref: /schemas/types.yaml#/definitions/uint32
> >          enum: [10, 20, 30, 40]
> >
> > +      allwinner,pinmux:
> > +        $ref: /schemas/types.yaml#/definitions/uint32-array
> > +        description:
> > +          Pinmux selector value, for each pin. Only used by SoCs whose
> > +          driver takes the mux values from the DT instead of an in-dri=
ver
> > +          table. Almost every time this value is the same for all pins=
, so
> > +          any array shorter than the number of pins will repeat the la=
st
> > +          value, to allow just specifying a single cell, for all cells=
.
>
> Perhaps new platforms should move to the common 'pinmux' property?
>
> Rob
