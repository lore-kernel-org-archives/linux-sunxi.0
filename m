Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041501D5AB7
	for <linux-sunxi@lists.linux.dev>; Sat,  4 Jan 2025 20:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736023504; cv=none; b=fm0F7oBDwZ09OYs9wn2pmze2+yvJuAj+jg+jPjNVaeC5PiQbj4prPCwXjIYqAqfg2SdEhpD4zDUrkBMPha0q6D7rpo6BuGR4ipwgbcjYT2b0nwJ/JkOr08GHxb4CHuXme0Oiym6ywrcx4RBMtRGoUiEsf8C2trLOEeQQbNruk0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736023504; c=relaxed/simple;
	bh=479X+hAdJofqV9h3/6m3M+qID36G9eoeh5jRAoD4ftQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LeylLjKsNBhaYecszCNAPg8ljxYsLGTejY6XTuY7lYXxGtejaHrrBuGdNpnBiwoYfA8n1P4h2OI0sIAXZC7MHmcjpDTnQIhgr2pMsXegvpNPpleD3jcPITNtrN956P2bqqqTu0Ly/8VAlVpMcyj5JfdCEeUbFktSx2VyDRcJr9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C3lKO2hH; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C3lKO2hH"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-29ff039dab2so6408419fac.3
        for <linux-sunxi@lists.linux.dev>; Sat, 04 Jan 2025 12:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736023502; x=1736628302; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=479X+hAdJofqV9h3/6m3M+qID36G9eoeh5jRAoD4ftQ=;
        b=C3lKO2hHHkIC3FMgYwqYhFb8yxLtb43cDC578QOuRqLpK6DMoPv+3tvRtCT9b+I+Ty
         PCkaW+l/qSwCN6zgBd+aLtYR7iWn5mxT/yeXWz9M4Ns+zQ7ABcbZyfiefKIiEvV64rTS
         NAjquXTc5TAurwKNzAmAZvQkD3ZSKVxhKFHeHlKfawOeR6N2z7p0xrVFW4pclsqkO7g6
         q0pU94si6RwITxFOQC34e3VLcIedyLVdtIIIXs7xow4idiZfn6tM3cK8d8JxyfJg+7o7
         J9qzPelqQoRhAyzpfAqOXK3B8sCK21jcCyWNYO1urWwNVAxdpfO31vSgtqkb/nHZoc4c
         WeLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736023502; x=1736628302;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=479X+hAdJofqV9h3/6m3M+qID36G9eoeh5jRAoD4ftQ=;
        b=s9Utq2kRMk7bobPSzhCf3ZE4aya3C0QngM6uczHpo8jf0Bkaj3U7BI5z0c4KjT8urJ
         00Aan+W0yzmp4G2woCMvbPV8V6r4pTuS5CUcc8C45yIIlDtgaY4iwtCqouGvXnAY3CFi
         Hrq5qhWRtTqYFQ8cLckqMuRdFdta3JW1h/CXecLx6CGYpgw4Rk0DeR9coNUZ9KT68Pkl
         KlCeHkoXtx3hDTrUZeiMBpap0Ow1sRTR2RIuYaXAniy5Me455nsZ3g+sDRNvrVkTmuv2
         T7HjX3FaoknLCCDhWUV1aJBwD5sBwot2XiZO9Xc/yLQJ0ShPr6LN/5au+dNcKs+2kOxa
         n3Pw==
X-Forwarded-Encrypted: i=1; AJvYcCV1x1hGgm37cC1gQxX+yiW+VNB/IOc9bY4LT/CosjeuBWWK65cp2yxyRD8RBySxEz7X3u7tHc1TVV8eQA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5HaXlH2QZL3Goc1Ch7mPklO6kVY4f+3GufYYU5BYUwAePq76n
	V15tlLgBMh+UdPK2bBjQpCeBjPxVk0ijmBrj2Ga9G4DBLKdTQWoh2+Th+RfroX5PeygRHTR/0Bf
	wZcyQfLEoTcoHZnhcVdG/QpQ3R8o=
X-Gm-Gg: ASbGncutu37Lb58OcUR6aLdWSJtYxHpMWYBuWVtL0Iwzh7yU3ORWmDmHHjn0raMJsmx
	NjQbiJlPFcPUaiGtJjxC/C6HEsM1XPDWSBDJzhbiqFNZS4jzrtD8s
X-Google-Smtp-Source: AGHT+IET3PfD2lydjmB9lUAPFdSJsVQcRdVdEXojLiqSBWvz4vm97/5ujV9jy/Tj2jeiVODvP+E7drTMo/tGOD5/NwM=
X-Received: by 2002:a05:6871:328c:b0:29d:c832:7ef6 with SMTP id
 586e51a60fabf-2a7fb40f20emr28771169fac.39.1736023502000; Sat, 04 Jan 2025
 12:45:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250104074035.1611136-1-anarsoul@gmail.com> <20250104074035.1611136-2-anarsoul@gmail.com>
 <pc7en2jjvce6et6s22sdfooixxxos4u5bitcfhylt7ms65o7wt@bxdvnyeus7b3> <62d449d4-c764-4dda-bbad-22499101f3dd@kernel.org>
In-Reply-To: <62d449d4-c764-4dda-bbad-22499101f3dd@kernel.org>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Sat, 4 Jan 2025 12:44:35 -0800
Message-ID: <CA+E=qVfdh0OMM8ZuJdhFkjuuwNZKQBt--YMBw6T=NRvh8jb31Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: sunxi: Export PLL_VIDEO_2X and PLL_MIPI
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, Roman Beranek <me@crly.cz>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	Dragan Simic <dsimic@manjaro.org>, Frank Oltmanns <frank@oltmanns.dev>, 
	Stuart Gathman <stuart@gathman.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 4, 2025 at 2:18=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 04/01/2025 11:16, Krzysztof Kozlowski wrote:
> > On Fri, Jan 03, 2025 at 11:36:57PM -0800, Vasily Khoruzhick wrote:
> >> Export PLL_VIDEO_2X and PLL_MIPI, these will be used to explicitly
> >> select TCON0 clock parent in dts
> >>
> >> Fixes: ca1170b69968 ("clk: sunxi-ng: a64: force select PLL_MIPI in TCO=
N0 mux")
> >> Reviewed-by: Dragan Simic <dsimic@manjaro.org>
> >> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> >
> > Where did this happen?
> >
> >> Tested-by: Frank Oltmanns <frank@oltmanns.dev> # on PinePhone
> >> Tested-by: Stuart Gathman <stuart@gathman.org> # on OG Pinebook
> >
> > And these? I cannot find traces on the list.
>
> I found them, cover letter.

Yeah, most of the tags are replies to v1 cover letter. Stuart's
Tested-by comes from IRC. However all the mentioned people are on CC
list, it's not like I'm trying to sneak in counterfeit tags :)


> Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
>
> Best regards,
> Krzysztof
