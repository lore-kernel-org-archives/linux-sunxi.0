Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB8D215F6C
	for <linux-sunxi@lists.linux.dev>; Tue, 29 Apr 2025 14:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745938324; cv=none; b=OoBlu9Z3qpLt9kNREEmxyYpJbFu7MUB4L1neBksIUXXmMzYGuZ1xoeWZbhUArzh5+SGa5/MDASKlwNTXAKqbJLv1AVlipSMQ3/29khQYS02I0UU7xb+5Fb30KAz7/ZUKIZbdZkL7krNVRgueNdybSPWdzyY+DjsaZbD8OvFnxnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745938324; c=relaxed/simple;
	bh=ujLWWkmaRLLveVflcOWu68G29t6oIIc6pHVq9Ko9pzs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a1pVRV7rJ0BaYv+yV2MqIq9TYx3hlRXE7oaSh8jKe08ZSLo6DJ0yDNzYOp2ID+PtOhDbFyp/C3po8FpEDEuUnNQ+O87azggUaZDX03T2U9hQgfbbCR/KJzzVeDK/cPFCZ/27vAmUciQvsmjMAEO5YX5izziABE2zuYpHy/Qhf6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a62wbqb/; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a62wbqb/"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5edc07c777eso7760762a12.3
        for <linux-sunxi@lists.linux.dev>; Tue, 29 Apr 2025 07:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745938321; x=1746543121; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2j3vmWcblMpAFi5MSBk2qMdY2/rE/Q+wya2rcoXjQ98=;
        b=a62wbqb/hiHzjMJnHc1EBgAhOkcvtIqhXR4U4Cs/QSDVnuLRCj2E0bz63NKwQhmMbn
         z0V8OIjurKAAurd5jeaFQJk4VGre2r+MGLKiwqNTF1l2vD2wSGHH8KoEUdVfecAAcvyL
         KAyrWcYx+YBZlcEtOM0PH/YVGsbQfDkopXSB9uAGNDMrqMBBnkPXRM5ErPbXtXWILsZd
         vCMZT0NVsZItrg9rG6TulSYnuZwUYdaC2wZwN2f1JeVuzCcyU2hnRKre1tUgJEPHPWUL
         LvUQzm1OBuXBiDg00BIH1ZJaICbk9vZIABRrms6GrFVoCzqXrDRzlSmVCzePv1jciJmX
         ByzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745938321; x=1746543121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2j3vmWcblMpAFi5MSBk2qMdY2/rE/Q+wya2rcoXjQ98=;
        b=UqrAhRBoU7/c3ivaW9AzduUMT6nVM+nsUuG2VlBD1o+8HdiayugpwgKW1BiQucby9L
         HE1kNmJIPAVcSalTgfZ3Ibfk5LrorpnbWqjKfaM7cAkvtnMRKj54r5yjw3wOV++DRHjz
         l+mfNu2TlIQdZw8tRxp8qWgJYzrML099fTjPmAQi2tA9hWebMcpXVidsVB39IB5uQIZX
         07Bgfq6DNe5p867d/yu5T4HcpgwXUrdYsLskNY+cuaUTnnuCWHU6rWIFlRhd9HWnFlDB
         TuUm2Qkve0opzFntktJFRvHxW6Isr4rsioWoCKwBijyG9fAdWPf6hUBckN/ogbFv2Ze7
         6nyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEUNkvWQQyyHy8lWMkrsIZvCaC9ObdMfCXQEdeaGYobe+ZGMzqrl5g4ews6QpZW2YtinjsBlKSGLJ53w==@lists.linux.dev
X-Gm-Message-State: AOJu0YyXOGIaXpTEV8VsPBIJfQp1YaRPLaORcR2zY9O3X1uPgMoCrv1k
	3Okt13bFVpzWXF3JWqPfOxgFkQlkaoovXDv9iBuPeNbK5g8OCni5
X-Gm-Gg: ASbGncsa/VDEQw8n9tiLFSmSFrohi9QwmGjGiQxQNxKHh/377qzI5dIPv6bku9a8D3L
	UWKuev1/55/rzpyRRuAdKGr+pBnS6ZRM4KC6blQUCim3K1dofc5nKqb2dP5EnpRkc/gfwMbwdWL
	yHfcpNBWBGWi9hlHyWFVdgNylsZXCiovO09Y6EiiqClCYhZq3WFlhdyCBtguDVcM+7B5YFQika0
	EhLfEXCWEodDAacVy0nqaVcssMbw/1YtdskintNcjeyL+9xoWYxY/gdT0xr9gIUjGvkFdu2fohf
	aFqTBBqpYPv1K5WRA0kCN53CoIOf8fmsF32dOMxoYI9XFlvB+8saxK8XU3RcAyl1if4RGurw9Tg
	HKG3UFITOZLwxNwKT
X-Google-Smtp-Source: AGHT+IEz06/+DeCVuRvMFYjbMCHdLWSGqTMxg/VP6erFPSJQ+to0uxlq6imsOijDrrRMdG90WDzVxA==
X-Received: by 2002:a05:6402:348f:b0:5f8:2436:1df9 with SMTP id 4fb4d7f45d1cf-5f83afc1b49mr2846758a12.10.1745938321060;
        Tue, 29 Apr 2025 07:52:01 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7038340b7sm7414214a12.79.2025.04.29.07.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 07:52:00 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andre Przywara <andre.przywara@arm.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, wens@csie.org, samuel@sholland.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: allwinner: h6: Add OrangePi 3 LTS DTS
Date: Tue, 29 Apr 2025 16:51:59 +0200
Message-ID: <5880182.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <34e30bf2-6f80-4c43-9e52-c1ebe0521c43@lunn.ch>
References:
 <20250413134318.66681-1-jernej.skrabec@gmail.com>
 <2219754.irdbgypaU6@jernej-laptop>
 <34e30bf2-6f80-4c43-9e52-c1ebe0521c43@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 28. april 2025 ob 14:37:48 Srednjeevropski poletni =C4=8Das=
 je Andrew Lunn napisal(a):
> On Sat, Apr 26, 2025 at 08:00:49PM +0200, Jernej =C5=A0krabec wrote:
> > Dne petek, 25. april 2025 ob 17:34:14 Srednjeevropski poletni =C4=8Das =
je Andrew Lunn napisal(a):
> > > > > +&emac {
> > > > > +	pinctrl-names =3D "default";
> > > > > +	pinctrl-0 =3D <&ext_rgmii_pins>;
> > > > > +	phy-mode =3D "rgmii-rxid";
> > > >=20
> > > > So relating to what Andrew said earlier today, should this read rgm=
ii-id
> > > > instead? Since the strap resistors just set some boot-up value, but=
 we
> > > > want the PHY driver to enable both RX and TX delay programmatically?
> > >=20
> > > Yes.
> > >=20
> > > There is a checkpatch.pl patch working its way through the system
> > > which will add warning about any rgmii value other than rgmii-id. Such
> > > values need a comment that the PCB has extra long clock
> > > lines. Hopefully that will make people actually stop and think about
> > > this, rather than just copy broken vendor code.
> >=20
> > I spent quite some time working on ethernet support for this board. Once
> > I've found PHY datasheet, I confirmed that there is added delay. So this
> > particular board needs "rgmii-rxid" mode.
>=20
> There have been numerous discussions about what these rgmii modes
> mean, because DT developers frequently get them wrong.
>=20
> Does the PCB have an extra long clock line in the TX direction? That
> is what rgmii-rxid means, the PCB is providing the TX delay, the
> MAC/PHY pair needs to add the RX delay.

While schematic is accessible, AFAIK PCB/gerbers are not, so I can't really
tell how long it is. But without this extra delay, ethernet doesn't work.

>=20
> Ignore strapping. That is just a power on default which gets over
> ridden once the PHY driver is running.
>=20
> What PHY is this?

Motorcomm YT8531C.

Best regards,
Jernej

>=20
> 	Andrew
>=20




