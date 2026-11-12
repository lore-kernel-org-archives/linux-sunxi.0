Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794459807;
	b=kKyH0rJpiZMorjUUKi5koQuuacwj46hAIfD0YdfYgBxZK0OMQ987WSZp2+qYsdHHfhg7
	 r+5muKO9TgKlnIYnBZ+4HQWi2fcRQtl1MDHrittVO/9V3tjTrKMnRM26bZtnukCcMqPuB
	 JXAXZsl0rCOTVytffv5yzVePA2i5gUI2x3Py1sOr1R1HlC9glVEa40O7PWk5/U3nF2IDg
	 bXFe8QTaYcuMzxhoQGuGWCSTDg5KvSjtc4Nv/1EYl2LDIirxidw3hohfEUai415Q7yFvH
	 K9Icru2ybTm/Q6NlDwEPWQWLFR3G06Ev560onpZedDqCVKfa9jD1IlJvTK1rFinLfiA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794459807;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=wojn57CdK3ADHCAhmqBfKGAS91+qGaFp/WwM/gNTuCE=;
	b=zapUMX2xsRU5BbMd/D5jDPHsurBRJrcLLoTfdunTlG32lTVgZ2uRwn0kWgGSWy757xlf
	 Y9tfd8/qHhjYF4II8Dvvc4bOKEjG8CF9nxlWmOfBj4qvhJf07zlM/389cvmlF8gtpaD61
	 x/csbNSUQOxIObphyBElpdFsE7jTe7A7ZaPU7cW3UuXXbzTPPK3c6vM250MZOz8Nhl5TI
	 9MBsgfFcVkJJUE5uftgXsnWzixPj9t08RizWX4WyIfsePbax+OpfGYuae6ya6kOmm1dsx
	 P2kzEEPXbiNYAxNMJz6yZQFKT9kjwxrdfL0N06bAHlTjn0MWvCsvGapiZwhOAebutiA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jZ6Jvj3G;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.181
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC8C606A323
	for <linux-sunxi@lists.linux.dev>; Thu, 12 Nov 2026 05:03:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEC8C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jZ6Jvj3G
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3ae10409ceaso1480031fa.0
        for <linux-sunxi@lists.linux.dev>; Wed, 11 Nov 2026 21:03:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794459805; cv=none;
        d=google.com; s=arc-20260327;
        b=WNeOc36RU41Phn0hFlZkVqduTeIDbcKyTD6yq4SCjq1CxeDvHM7A+meDl7FzG4UyL5
         fMMBKxj3f31x4yuPvsEJ4EWFCsp1MqElKiLj5XdD0V1QHv3WPrNyCm9cIIprM3lyJEa1
         +W8ZF+oTprytlhAzBzwpJt7QXh17Gy30ks6La4p/nPyaHRmMsyd/UNtBeAEEUrixr8Xh
         lRIghTexk/1OczNMN0MWwGWr29mnF8O0AWrcRKW02LekyPpiveXBvYJR6WFnOsAlNNoJ
         wiG2HQSdE1Vtmbmd30waP1SIWEg5KUQbmaq6JW/+SAU//kKN991MDnB2Fxb7fO6LNPLe
         SdQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wojn57CdK3ADHCAhmqBfKGAS91+qGaFp/WwM/gNTuCE=;
        fh=TYtm4i6sryumHpWEUZVbnjp2j3ht5I4xUPt+Hqo3Y3Q=;
        b=sdprx46gmSXks0TbOySQHOd9PD9TRxQRjAQA/HZKhiaWQHJNXgEMOsWuGvVKGkuMEr
         qwfc7s6buKfCSCS5RHpgyhCJtarxCZHJGJe7p2c+jgNxukLQek7tEFJ1OlOafNwlCTba
         YxLX0GZWrM6t649eByv2s2Dg+MgGXL9XSdTfnC/4fRpHVvLxVt9J2uQvB5tbuJv68Egq
         dzbMJoMaVRJrh0HLFd89tFXKCfHvRy2D+jcAsgLmvxL1I6VixwcsPuzjt0iNwdL+VNRF
         jWFo4px46tDbQslMTXYz2lblsMeS96SyAQ2YD0J4BDOAmdE6LNrCdKVJmMzX4SW3fj0s
         6AHA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794459805; x=1795064605; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wojn57CdK3ADHCAhmqBfKGAS91+qGaFp/WwM/gNTuCE=;
        b=jZ6Jvj3Gg+XUaZsATF9y5GYPrZC129S6HXZPAF9HBoVolxQPPOKCWGAUbAH8Pb/OK4
         32n5JocC3rvq5+ALCDBF+R9ml4apH+DZPkbuUSCgG06jkkfsZVcH/fdju3Cuuq+WLSM5
         nbUXLpZFhwB5AWIRZj7X6xCspUkIIFBz1xgjTnZs9o1Hey6UbktbKD6SFzaaxmp5FCUc
         bSUY6aA0JAx+C5X39X0WqUaaRZOesxSiPpSXbxt/kyWd3NFmgxO5j4D7MjtkJTlo3smw
         U19YfA/1vwz3kKAJmW64ddKubsdwP+Edb2rND927/f81xvfS/v3VHc5vPsTYWOwEY3v7
         /ZBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794459805; x=1795064605;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wojn57CdK3ADHCAhmqBfKGAS91+qGaFp/WwM/gNTuCE=;
        b=yvHTg5v3OVt6NbrS42pZVsIHZn0e1UBGrLzsIAHDIqg7/3dTQBBAu6On/n+lGXWUOJ
         enrN9P9Em50ESHjd/rjfWsU0uFci+TxFilD85l5Pb0/3b59vGOyhVY5/x9mTmR+ORADD
         eP4I4CPDlWttHgPOJvV+nIE7ubJtl68bXCbR7+fLX0YHEWXcP3itZzdbZAnoA8AZUorM
         8Cx62gSaQyKOoIFQYtlr160hwm+4BZPkWpSozvtv4XieV7M0UGSX/TX6OuJUV0wy/4az
         fQmfUJ2o/N7gxYyS0/XBKGGkrbjX/iUBPxX1ZvVMWtI15+Vd9bdnwjvEnFivme7wjffP
         kUbw==
X-Forwarded-Encrypted: i=1; AL+hErHIrj7GgOvPpqkH13XhlUKnU+ml0QqYDBk4x51X6mWwzc7GQmmdgM79X67i/fuHDBwDDwHlSjIDew2MMA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/WZwceyGPRDWamU8Bn43gvBmBDZt1/e4MqOBCSkr7U3ugdwT5W
	K2z4HG2eTfoZFyGmH4oH6pS9znDkb03znZ/n5vby3n/tczblOIrXmR1tUjI6QOXIH8ITn6HBcmh
	SRsVWfIGHr/HYkuvFAF5FaRtJy+/Iw2s=
X-Gm-Gg: AYBFou1+h6MAJT6nkqrGN92Qh49Y/4IaMKEQGN+qV6QshlvSMhlsi7paomRY266kxEu
	Iqj3l+jLqFODS4actEm/gFVIL+8k47lHRd51Vz3xt2usS67hFQESnHaId4QM0nk7opkiiyObS+9
	CjDgylExvW4t9WZkkiaHc4JJvlTWpST23VDuWvJeU7Fwvy+Oh9aauu811Z2ImZHBBG6675pRcAW
	2IuN8EDrGxJfWgxgeIIrrueHOUpI8E/WgrYsetFHt5pR65LcFkROliHGazHENhekWaHlmwqau5J
	yBODDvx2M2NUp9YCwSWGOjfLUE8RCSXn1xuJnVMQRTHY4/Chz+eABQ7WKZfEuM4m3sHrOJeo2Kw
	NHYz+I2Jkr/Ykk6HP6lYnZVzcCFZwAnwDQEoUWsrD1eSyyArKiRw6qAhB3gMhMbQ2yiyuaaE=
X-Received: by 2002:ac2:5683:0:b0:5c1:4f83:180f with SMTP id
 2adb3069b0e04-5c15d79ea99mr1533353e87.6.1794459804558; Wed, 11 Nov 2026
 21:03:24 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261110-h616-zero2-dt-v1-0-05506d760f21@gmail.com>
 <20261110-h616-zero2-dt-v1-8-05506d760f21@gmail.com> <ekjxzCRpRcWPwcDw_lDV4g@gmail.com>
In-Reply-To: <ekjxzCRpRcWPwcDw_lDV4g@gmail.com>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Wed, 11 Nov 2026 21:03:13 -0800
X-Gm-Features: AclHuK_1HOFnNDyAInx4WxkF0Jpvdf0PJfEA3HHVUlfWeMJnLB-aUMtv6VNxQng
Message-ID: <CAEy9hNV+tiw6RgjTz2zvCFriLb9Y9-aDhgfZMF9mxzUryGWqYg@mail.gmail.com>
Subject: Re: [PATCH 8/8] arm64: dts: allwinner: orangepi-zero2: Add i2c aliases
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Ryan Walklin <ryan@testtoast.com>, 
	Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Understood - please disregard v2, v3 will fix this issue.

On Tue, Nov 10, 2026 at 8:11=E2=80=AFAM Jernej =C5=A0krabec <jernej.skrabec=
@gmail.com> wrote:
>
> Dne torek, 10. november 2026 ob 06:37:02 Srednjeevropski standardni =C4=
=8Das je Arun Iyengar via B4 Relay napisal(a):
> > From: Arun Iyengar <aiyengar1990@gmail.com>
> >
> > The I2C core numbers adapters after the "i2cN" aliases and hands out
> > dynamic numbers, in probe order, to adapters without one. The Orange Pi
> > Zero2 DT has no i2c aliases, so a TWI controller enabled by an overlay
> > for the header pins gets whatever number is free when it probes: TWI3
> > on header pins 3 and 5 does not show up as /dev/i2c-3, and the number
> > changes with the set of enabled buses. The vendor manual and the
> > vendor BSP name the buses after the controller.
> >
> > Pin the numbering as the vendor BSP does: i2c0 to i2c4 are TWI0 to
> > TWI4, i2c5 is R_TWI. Disabled controllers get no adapter, so nothing
> > changes for buses that stay off.
> >
> > Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
>
> NAK.
>
> Extension connector is not covered by board DT. Use overlays
> if you want to use them.
>
> Best regards,
> Jernej
>
> > ---
> >  arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts | 9 +++++=
++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.d=
ts b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
> > index d5d39bac5915..98fc83291dc8 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
> > @@ -12,6 +12,15 @@
> >  / {
> >       model =3D "OrangePi Zero2";
> >       compatible =3D "xunlong,orangepi-zero2", "allwinner,sun50i-h616";
> > +
> > +     aliases {
> > +             i2c0 =3D &i2c0;
> > +             i2c1 =3D &i2c1;
> > +             i2c2 =3D &i2c2;
> > +             i2c3 =3D &i2c3;
> > +             i2c4 =3D &i2c4;
> > +             i2c5 =3D &r_i2c;
> > +     };
> >  };
> >
> >  &cpu0 {
> >
> >
>
>
>
>
