Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C3C29B224
	for <linux-sunxi@lists.linux.dev>; Tue,  8 Jul 2025 08:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751962739; cv=none; b=dhYxEa/YseNSRseTrdywVXzs6UpiI7eZopFRPCAxKNasES8zi91H2HFyGhnNIeuR+aXINSQMdvWW/cr6XRzFJeM3rzLqUohA+XI2gs8eoWwJMnZaLuo2XHn+fpY/hNdz9tTKJe2B9o4W7Fal/oPKuf1GgH0Yb/rz9nnNT7cGnuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751962739; c=relaxed/simple;
	bh=403iFXS8Ya0K6jMaeM+1AN9CNalmRymO+IoXF72ZOak=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fm40/FVBVRImMqsedijg/oJRVf33Gy5IQt7PoAIcKT7hQ0Wrekg+7u6U2rttwUQnMKefOJ4BnSIuhql7napvD0T0eC/66WRS10bMPaDNeTJ4YgfU+2snrmwvzFOuDbU48VrmNK3tLQpYV0Yzpd1K8vtrjWEbLCagrAkmHmZQaVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-553d771435fso3345044e87.3
        for <linux-sunxi@lists.linux.dev>; Tue, 08 Jul 2025 01:18:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751962729; x=1752567529;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F8a42AL8Gvhq3V8KbpdB8ciKkimXt8q0Er3Jq8Vtdrk=;
        b=uvw9wwOcC1rywlF/RLDR2ycfHwng8VVFenGZf+BAByAo+7oAbkvytl/PmrLk8+3YMW
         66GwEZ99/UU7nXHqCeVZJW95lopcjAeWWbmiS5Ljb+oZWgbvkUErpa04lAxb13b05AIh
         Dcn7BHCqnbm89MKXnq7w8B0gJzQNPG2OuodhraA3DMg7N4e3Lk9WyxsEspaksT+2X8Od
         p6cIUP5jF8SgWy75F1t5ERjRjoc5IOLRqgt9IneOl3xydk5BVK5DdCvEwDqlADFP+IT4
         Op1EyMqvDODbRXnWPkjXg7lTivOTpfEQv8ezC9gxnnoHjrFJSS6Xh+qSRCEFM34/94UN
         tAVw==
X-Forwarded-Encrypted: i=1; AJvYcCVd9faD3WClNrRVwJYGpo+35yxdFbvlo5covMmdJfQq9nKmz+cUPZxYVSnX+A8mgMRoYhSFhg/Ij0WJIQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyYDCbHmbJEbmgUBtMXPyfRu3/CxzpIrHVlHLFhJoVQBoF7nA8x
	q9SzDxxc36kGFpH7hR7v8X73iEIAgpP2RcrK5aoBsDi3DI7pAIXSPLJhSxCTjsYv
X-Gm-Gg: ASbGnctKRRMfqp9ZBkiKgoiHTEYXPs0yDarrhaSLE0FVhwo4rwg3V+vDigihATRzB3L
	lOFiZrEK05Pb3pnOSD8mRqE9nZwJ8nJ4tvuSb2f3OCmmwozXfb6QElgLg76mDmFHNSIAgPy91Gk
	BbiQ+o/g/jvjBCXAhDxARMYzRPP2z1LuWBgeP7yBwN8YZwDEcGvNkoNRVj27w8+4u3/yOPzr/GW
	EBUrlsH2eqzh3mdbj2MgsAFIe3lDmfGyDM09wD9D7wQWDS/tR+L4V5ep5Vog/8TifkMs1PdwO4I
	aiV+96/bvst/5+2dyN1NNq4qlt0Ypg7S9ciQaTtQ6PMgXaDtY10tmAeqFjmLnNMuE+6MsZhq111
	t0Xgpq5mlUEUv90vKNRo=
X-Google-Smtp-Source: AGHT+IF7qDCUnnrQIw+W24TCad/y51OX7FVVK8hGFb/OYtU124frQ28s7Fsr3wstmxW6+TF/MCLDAw==
X-Received: by 2002:ac2:568a:0:b0:553:acbf:e003 with SMTP id 2adb3069b0e04-557f8304874mr694651e87.13.1751962728665;
        Tue, 08 Jul 2025 01:18:48 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com. [209.85.208.173])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-558f64aca06sm16213e87.207.2025.07.08.01.18.47
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 01:18:48 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-32f1df5703aso20481901fa.3
        for <linux-sunxi@lists.linux.dev>; Tue, 08 Jul 2025 01:18:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXH9ox83BqH1rUKJYAS1Sl3nQnGtkHFgf1AKMnqe2yoMsuIuOwQUsr4x7x2KaBMr0uPNQxC05/gH2xMiA==@lists.linux.dev
X-Received: by 2002:a05:651c:1a0a:b0:32c:b83d:64ab with SMTP id
 38308e7fff4ca-32f39b07025mr4745291fa.24.1751962727665; Tue, 08 Jul 2025
 01:18:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250707165155.581579-1-paulk@sys-base.io> <20250707165155.581579-5-paulk@sys-base.io>
 <20250708003348.58fe509f@minigeek.lan>
In-Reply-To: <20250708003348.58fe509f@minigeek.lan>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 8 Jul 2025 16:18:33 +0800
X-Gmail-Original-Message-ID: <CAGb2v650h05aNvsQeQOjg63Ljcarxy2zqXnvNnjJ5+5ooGOELQ@mail.gmail.com>
X-Gm-Features: Ac12FXxSawVr5l8DSW2OyggsnlD_AQQGgECd75bIDcC2Q3K6HqehhpaNB0rYrHE
Message-ID: <CAGb2v650h05aNvsQeQOjg63Ljcarxy2zqXnvNnjJ5+5ooGOELQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: allwinner: a133-liontron-h-a133l: Add
 Ethernet support
To: Andre Przywara <andre.przywara@arm.com>
Cc: Paul Kocialkowski <paulk@sys-base.io>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 8, 2025 at 7:36=E2=80=AFAM Andre Przywara <andre.przywara@arm.c=
om> wrote:
>
> On Mon,  7 Jul 2025 18:51:55 +0200
> Paul Kocialkowski <paulk@sys-base.io> wrote:
>
> Hi Paul,
>
> > The Liontron H-A133L board features an Ethernet controller with a
> > JLSemi JL1101 PHY. Its reset pin is tied to the PH12 GPIO.
> >
> > Note that the reset pin must be handled as a bus-wide reset GPIO in
> > order to let the MDIO core properly reset it before trying to read
> > its identification registers. There's no other device on the MDIO bus.
>
> putting the PHY reset GPIO into the MDIO node is a clever solution, I
> was struggling with putting it either in the MAC or PHY node, though
> conceptually it would still belong in the latter, I think. But this
> might be a more generic problem: for most other devices we activate
> reset and clock gates *before* trying to access them, though this might
> be historically different for Ethernet PHYs.

The phylib core has code to deal with reset GPIOs listed under the PHY node=
.
It might be worth checking why that doesn't work.

OOTH, there's no code to deal with regulator supplies for PHYs.

ChenYu

> > The datasheet of the PHY mentions that the reset signal must be held
> > for 1 ms to take effect. Make it 2 ms (and the same for post-delay) to
> > be on the safe side without wasting too much time during boot.
> >
> > Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
>
> Despite the above, this looks fine, and works for me:
>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> Tested-by: Andre Przywara <andre.przywara@arm.com>
>
> Cheers,
> Andre
>
> > ---
> >  .../sun50i-a133-liontron-h-a133l.dts          | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l=
.dts b/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts
> > index fe77178d3e33..90a50910f07b 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts
> > @@ -65,6 +65,25 @@ &ehci1 {
> >       status =3D "okay";
> >  };
> >
> > +&emac0 {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&rmii0_pins>;
> > +     phy-handle =3D <&rmii_phy>;
> > +     phy-mode =3D "rmii";
> > +     status =3D "okay";
> > +};
> > +
> > +&mdio0 {
> > +     reset-gpios =3D <&pio 7 12 GPIO_ACTIVE_LOW>; /* PH12 */
> > +     reset-delay-us =3D <2000>;
> > +     reset-post-delay-us =3D <2000>;
> > +
> > +     rmii_phy: ethernet-phy@1 {
> > +             compatible =3D "ethernet-phy-ieee802.3-c22";
> > +             reg =3D <1>;
> > +     };
> > +};
> > +
> >  &mmc0 {
> >       vmmc-supply =3D <&reg_dcdc1>;
> >       cd-gpios =3D <&pio 5 6 GPIO_ACTIVE_LOW>; /* PF6 */
>
>
