Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B29614B075
	for <linux-sunxi@lists.linux.dev>; Wed, 18 Dec 2024 06:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734503782; cv=none; b=ZovfDoIthL9J9XmeuDivqMJscFzyWLnNuwJzWQyzM8vdO0RXx2nLNmTuGtWl5NNtId0jOJkXJTUeYzDyljB0sk1TqqD0ChVp8D+hNoIlRkzeIzvb+BW5WYHz3SP7ZzAXObcNGpI4ToBeu7XTWddEjfkxHS/dNPzN6Sbwf+xdZwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734503782; c=relaxed/simple;
	bh=vwWXD8zvh9hmnZ6QxYEzB+FDN7i50BUIb92pyDHG0lo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WMV1yPYpLOpfvhhFVYuySp5HCOY9OIniDP5GMQPlEIlyhyAOcnPo7ZM7E8qzsvImSjTaeR51RRPB+2l+9JNrjfv6t+NN0MURj5iTKxVtQKpWVpwJhzpihuu8P++bVzdzhecbV6mYupvlMyPBQ+ZMhGjq7onSIjDUkaulcB0TbB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=las2b0Eh; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="las2b0Eh"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5f3328fca29so2034131eaf.1
        for <linux-sunxi@lists.linux.dev>; Tue, 17 Dec 2024 22:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734503779; x=1735108579; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tg+exyt2bEd/acPRMVaty3D/uVegz4OUg+5qQVFiOTE=;
        b=las2b0EhxTITX1hokptHw5r3dJgZYzCbiKVlwLT+VgZnt5ZgEyHpBxOX8C8oePq6Il
         vqbH+CvzFWhyqhQGs7pa5JP0x7e432OH9lTTHpkKbThoz8hOmukQLc5lEtkkF6wrfSD2
         4l83WNQxeVqhyY3rbvxzinxr766yq9VqXJ9Z1TWteeEy+k0Mh2HY/M5JgX9siH5PNSzB
         1NcUY7/+9Zi/dfiwOiJetd5sR7sevf2gSruRlzkWwUBnqj426e13XlSAz9vldv/LQYOx
         CnnYspb2eJOiUv4xzeV22hksj5Nc7BJiCkVNT0pcSJEhzs6SAqeAEfaTss0HvdWgarj7
         Rq4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734503779; x=1735108579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tg+exyt2bEd/acPRMVaty3D/uVegz4OUg+5qQVFiOTE=;
        b=BbcZod1e1DHy3opHcWO9pa4Nl4UOrTz695e0a2fYxg1Ziy0Bn1iU5nRb570Iyovli+
         /p6VC84DFVYKKqMCI7TmbVTTPS6hkAcmLX13rh/IbzzToNWwNG555SptnCB8z9tkqZVG
         uR4lhodQgSzMIEa8z2PurBoIp6VGo+q65Wc8aeR/z6W3PmoT8sbAG1phtfoXodBY+IV0
         BMi2LSkdn3orV9Z6GI5qsCLFw+BNgsa7UrglfXlDCOVckWZ32oRlOhEJIM6PUUg3iL80
         TKN+bd9HL5Q10j0Ox90D1H+ZrLGSQJzc1cbjsFUBTGxwQktNR6LN1F7hSMCXcPwF8lMs
         GZfw==
X-Forwarded-Encrypted: i=1; AJvYcCUj516PSqmpseN+SRQXXOe81359Pik5C3GaCE+oPilVa5qj9DSL9YC71CaFew4eOlHDjNVZXizp7Kdpzw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwIpases3tTgC5+qsc/y8SfM2qHDIe2zJPi4Dfl/iFHvNZcUtiN
	x2bRu6ysU0HbutkFIb+xFfX9LU+WBS4q3SlYa2cLu6c8vsWGExRDCaAoUOZVxGzeB02QrO46FQA
	I3b7nPnhE2dvM8VwU957wQIKRdVQ=
X-Gm-Gg: ASbGnctIo/OQnuaH2jKHbhxZyEJubIRnSwp0Gb29daUdnpxTawZr9vTOhuC6PB+b2XJ
	X/wYDo/6GbzQHSjMZtMD+644FdAwRvwI27/8upteIqJo/MqIwCb/Kvbs3ZTiI8MYeoYUPBSRE
X-Google-Smtp-Source: AGHT+IGDZx1A4lzjevZaetM3q0p0F9NGqZ4KJyg/ET7Jin7l5ozux8ML2xLClyaZEmXGWB3tap3fvdMwxeQKOyK0U2E=
X-Received: by 2002:a05:6870:340c:b0:29e:2345:c656 with SMTP id
 586e51a60fabf-2a7b3435b4cmr635905fac.43.1734503778886; Tue, 17 Dec 2024
 22:36:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241215053639.738890-1-anarsoul@gmail.com> <20241215053639.738890-2-anarsoul@gmail.com>
 <qbtp4jvkx3r5azufe4k3vtapqpfs54dyjiu4cy5v5wkkzumrzx@vy3xzkfplbue>
 <CA+E=qVeQ8uHBCeFtw6_2cY3252-YXc6eWrf5_YdeVgbp5LJo5g@mail.gmail.com> <20241217211505.7f9c9e4e@minigeek.lan>
In-Reply-To: <20241217211505.7f9c9e4e@minigeek.lan>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Tue, 17 Dec 2024 22:35:53 -0800
Message-ID: <CA+E=qVcU9V+8LZ0Xnh+oDROVf8H99t_kiku7iSdXTHP43d9E_A@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: clock: sunxi: Export PLL_VIDEO_2X and PLL_MIPI
To: Andre Przywara <andre.przywara@arm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, Roman Beranek <me@crly.cz>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 17, 2024 at 1:15=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> On Tue, 17 Dec 2024 10:00:45 -0800
> Vasily Khoruzhick <anarsoul@gmail.com> wrote:
>
> Hi,
>
> > On Mon, Dec 16, 2024 at 11:33=E2=80=AFPM Krzysztof Kozlowski <krzk@kern=
el.org> wrote:
> > >
> > > On Sat, Dec 14, 2024 at 09:34:57PM -0800, Vasily Khoruzhick wrote:
> > > > These will be used to explicitly select TCON0 clock parent in dts
> > > >
> > > > Fixes: ca1170b69968 ("clk: sunxi-ng: a64: force select PLL_MIPI in =
TCON0 mux")
> > > > Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> > > > ---
> > > >  drivers/clk/sunxi-ng/ccu-sun50i-a64.h      | 2 --
> > > >  include/dt-bindings/clock/sun50i-a64-ccu.h | 2 +
> >
> > Hi Krzysztof,
> >
> > > You cannot combine these changes.
> >
> > The patch basically moves defines out from ccu-sun50i-a64.h to
> > sun50i-a64-ccu.h. How do I split the change without introducing
> > compilation failure?
>
> You can just have the binding part first, adding the (same) definition
> to the binding headers. As long as the #define's are not conflicting,
> this is fine.
> Then remove the now redundant definitions in the kernel headers, with a
> subsequent patch.

Thanks for the suggestion! I'll address it in v2.
