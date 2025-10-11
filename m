Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5833C221FC8
	for <linux-sunxi@lists.linux.dev>; Sat, 11 Oct 2025 10:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760178467; cv=none; b=ibie/TnPzMx8ErzAmp9gciI0tys0hjLiXuXqyORZfrxvEcsJz9Yiil9+2gbi5WKm48jq8xpch1CsvrYR6Wqc+k9hmpPEUUPeYoOvitQC3VIFkdk5pc9mTdCQoMbT64ImHN+99j/YlDdL5wynATdGwOQKOg/ta5Gq6SNrZP3WZ9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760178467; c=relaxed/simple;
	bh=LO/zKHiwH9pV77xNhnL2eijeftuXrDQ6YZ4Vabk0NRo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SSSS7x0LyCHEAZkramjM8hwDCQd/FCY+syzZeTQ2iOkT2HneDQUPI0jvatIanIhy++XyAKz3mZ5aPbLzV3TwW9PEhbxFWpAGXTKrIDLaok/9w1VrZVyqsW4nUMkGZIr2+Kf+211kEBZfANoxt0TvlgE9Ypk9xjoYVzNzGDKjsLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O4bhsP1F; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O4bhsP1F"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-62fb48315ddso4092342a12.2
        for <linux-sunxi@lists.linux.dev>; Sat, 11 Oct 2025 03:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760178461; x=1760783261; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iZCFVzYHZ2h0JIUQU0arhlSFw5b6cu6XyQY71uLY2mU=;
        b=O4bhsP1FwiAt/pusEyNjiXUDbSb2f8/cc4Gk8tAgAHzwN7vHJN5kYOP+zb73jRTo+d
         BXDECPx73zIPjb38iZGxG/aRIu//0OvJi/d6slnoxlzM0Fi8DinGiLGj4NGmGjNhkvTt
         SqEg3gT+odILDiDQSsjjO/b6riT5PwhMTHmNJvGxBwGIAxcMIa7EfewSj34fvgbN2D4i
         4uoqc7x0BCKoNYne7gMsiSc2k0pWXo3TuhkML+UN8h5IEgiAxDdCyIqjKgDHS8k8CaIX
         p29oras3xxk4KfdjqI0808HEEpyYPbRLBA70EYC+ZjYsqZp0PTj0HjQMksl/2KcEOs78
         qiZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760178461; x=1760783261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iZCFVzYHZ2h0JIUQU0arhlSFw5b6cu6XyQY71uLY2mU=;
        b=WW1jKDxGZT+6VzumJgCKPtZ6+9r0fQWxYctYVaWirD2/o5l85A80/m+vRg+cuPkgxr
         3Jn+pO3pQsIW3+JcwM6RBH4A1vc/vLlbh63TAygEpVvOsryaYe8SKopvIKVQuQ3wZYwV
         EbZPrCO6Hb2iJQ7pASljWSUYqN+Y1u7kkqF47j4HD+WLXt9tXNraLv3SeUPLAdOhKSY8
         ig34weaSztYN4wYnRo4hnu5bZGo5+d5eHCnwXjihFU7UBsxg+nHivdenj5faY+rJdiJw
         oNiBCW74kQfueJO7Ua9zIuuNPtHSV8oNU2rQkCkriUexq9Jelm2Rt4mvbiocx91fqDgB
         daQA==
X-Forwarded-Encrypted: i=1; AJvYcCUZBcqX/Xj26nvNocvtnsi7WDD7/ou7T07D0CPdesEJsbFFlJJMq8F7KcKR3jOL9tLHRz62HsubEcLWIg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzFBWXCiaoV4brMCl6CbCjP/aRFTHxQdhaCG1RN9Houd4lFa8yM
	2oTXlQVNI6qnt3JW8PM9kJ1pOZDoJob03cTta29PtJwkiKvVBBczcS1b
X-Gm-Gg: ASbGnctwkKnOszX4FD+SETqkhWsA+AOWqWLLEE2i+M78M735vj4bkzma0AhbfN8alXe
	oENzWgYLobppEmKCfN1IXwROmwFqIK6qa0N0voR24TeaL0AuWZU8Z/w2e4rnHESMfBUFGXrmLcY
	ygmTesmQYjvolwhNKWH7iHUgft4qtZf6WIWLS0gL5+b+z/WcdMaf8UZrRVgzythFigtvl8A1b+l
	uII9eaonAU2qlPNqoGxznlHDeU87nKRaEwackUJhRp8HC3spuEjWMWyvFBlQDZ3T2UGAOGGKqzI
	PuUh/J+AVIu85uFjujuJaT2tTwa+8gBnbGjcH4+jFS7MW50bhwnct2HjIrsRnh3vyvJYbM+IQk8
	Kyqg/OaxOkn+/aXBEwZDEQPxyYhxlGkF0+4pKqH+DaceLTjlMRuKdb/AmqfKD2+3YU7/DgzpEjA
	==
X-Google-Smtp-Source: AGHT+IGDpGQ1keH41V5u7okn0umUzJaDZ4pIXQPpFP/RgbssUfZTewtEXcOU16HUhZmJhf/y3/QSQg==
X-Received: by 2002:a05:6402:40c8:b0:62b:63f8:cdbb with SMTP id 4fb4d7f45d1cf-639d5c4c1e1mr12894658a12.25.1760178460551;
        Sat, 11 Oct 2025 03:27:40 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a5c132567sm4471906a12.33.2025.10.11.03.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 03:27:40 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Richard GENOUD <richard.genoud@bootlin.com>
Cc: Wentao Liang <vulab@iscas.ac.cn>,
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/15] dt-bindings: mtd: sunxi: Add new compatible
Date: Sat, 11 Oct 2025 12:27:38 +0200
Message-ID: <12756400.O9o76ZdvQC@jernej-laptop>
In-Reply-To: <195f3b01-93d9-41da-aa9e-826e82889d83@bootlin.com>
References:
 <20251010084042.341224-1-richard.genoud@bootlin.com>
 <02864e41-cbf7-42e1-87ba-95bdac6d9e6d@kernel.org>
 <195f3b01-93d9-41da-aa9e-826e82889d83@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi,

Dne petek, 10. oktober 2025 ob 12:18:56 Srednjeevropski poletni =C4=8Das je=
 Richard GENOUD napisal(a):
> Le 10/10/2025 =C3=A0 10:49, Krzysztof Kozlowski a =C3=A9crit :
> > On 10/10/2025 10:40, Richard Genoud wrote:
> >> +
> >>   properties:
> >>     compatible:
> >>       enum:
> >>         - allwinner,sun4i-a10-nand
> >>         - allwinner,sun8i-a23-nand-controller
> >> +      - allwinner,sun50i-h616-nand-controller
> >=20
> >=20
> > Also:
> > 1. missing new line - why did you remove it?
> > 2. Keep existing sunxi preferred order of entries. In other platforms it
> > is alphanumerical, not natural. In case sunxi uses something else, just
> > be sure you use sunxi order.

Sunxi order is from oldest generation to newest and then alphabetically
by soc name.

This is already correctly ordered.

Best regards,
Jernej

> ok, make sens
>=20
> Thanks!
>=20
> >=20
> > Best regards,
> > Krzysztof
>=20
>=20
>=20




