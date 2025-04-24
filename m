Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2344828FFE4
	for <linux-sunxi@lists.linux.dev>; Thu, 24 Apr 2025 19:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745521538; cv=none; b=La0nNmJ/AGN8msWoZHICfy/0ttgnp1b6Xs3xVXiZBzOrTlB+arSg0wGqwbPVrVOAWTitJtn5Dj8sEYyp3VJSl524t9PK2Nf8MtjlWiEhXmORvyQw+EC982T+QuuwKeWTdfOVUh0bWUnmmOekfaqIRz+Lex9Db6W1Vr4d8w4ldAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745521538; c=relaxed/simple;
	bh=YBKsUW/EPfANNhvxLG05JedW2Qch1UwPCKwOdSUXq7M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fRvla9J3rrL6SDOyqUpeyoRNrgM/Nv4c67uGyQh7LM2zSkP+ZH7y96kTQ+ZQ/VW8lGzLNxM7Z5pDf/CLMLvm4J855UU/snquTdeKE0jgH7WlTbP5R4ZXpRzbIZJvcfswS2z5xXy58Mb/8HDgy8qEbPatdf/MHdzqdbiVf4wvSwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30db1bd3bebso15658021fa.2
        for <linux-sunxi@lists.linux.dev>; Thu, 24 Apr 2025 12:05:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745521531; x=1746126331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YBKsUW/EPfANNhvxLG05JedW2Qch1UwPCKwOdSUXq7M=;
        b=XKzy4uvsNaLnWjiqWttThIBh9dDbNoOp5RbQumlkSS3jdPsp4kcP7KacYBibo3wiVr
         yHnNL4rhDT1Kam0b6rRoEVUASk20fPz0+8xJZAgTnn5fwsJJn03nu/Uge2bsCJ0xpsTL
         Tor7RNL+YJrtyrxkA6TJuY7SoEX4DviIqXLLwyfiDaVSSfFAFPFFzp2e7j4EN7z5al+J
         VaH8sjSkCpKMnry4a0tSS13mf2SSbLb880tijJPHPB90u11TAqsPfZnzo9RbsdYRFQFl
         i+ioF8WnsxUPsj0DLWvmaM9v1FBvXBnDNxQNtmOHck7nKOCaHyCk+GJ7BMwj3knFudLV
         SmBw==
X-Forwarded-Encrypted: i=1; AJvYcCVJm9rmIakzR/M89Vm3kSww9o6CCb9g6MRZ56pULKA7ES7QFl25Mr4CcWDjH6DgQniN0Fue2wpr1lO5PQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzjAzHZqSFdo6Ggga+VoWERQNKfzypbg6PijP5JifWSxFe0j61k
	IjFJsc7EzS6uvrvd9SSAlcTzr7I3kkDAyC//qutKjCRmUHtQMsihRIZBmJEz
X-Gm-Gg: ASbGncudYnV3IirmQunT7tg/hHNvuAhOXEfcW4SO6hLnkQMrk5fGZLP2TbOuIT30Ukr
	AosJnsRFN9IR1w7iSMGwQ4nNEDeuquHcSTZCULq7wWhdt0RE3UPaoVMSYZTZ6dBjMrpzw8rEq/R
	wCheKEhRnxwrZX3Z6qSgwzjVlIXYK+VcCnyus49WHMbQdzQ+ESP1Z0ok/FlPxvNsUV1bs5sGA+m
	93aQKoGMPSByQ+nJJE7mJeFvY5ZoskvP40YCyCwVDBd3R4GE05dfyATd3//vg2S6c1Cn7u4Qz7v
	waE6PxxS/zvJyl7yhQb8ySHGd2jmZkJXbp40cYxQP2fHdkXhE+rOSOGEZ+bLcKDyq8HcRu+VW1L
	PEC9eGZxa
X-Google-Smtp-Source: AGHT+IETZwV0vJSD4wLU/jRiQwOs/0hHGGOfz/IXOpkPn2L3QqUkAvDhalDm95lt+nh0swj8cgZO0Q==
X-Received: by 2002:a2e:a989:0:b0:30b:fe19:b07a with SMTP id 38308e7fff4ca-318a9290bd1mr3131851fa.25.1745521531044;
        Thu, 24 Apr 2025 12:05:31 -0700 (PDT)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317cfb4855esm3779161fa.30.2025.04.24.12.05.30
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 12:05:30 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30bfb6ab47cso13212221fa.3
        for <linux-sunxi@lists.linux.dev>; Thu, 24 Apr 2025 12:05:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXmt4Dt+Gw9DEIJs+sHSXYom4r7MbF67NeapPZERAAR53nUDTzu4xpi/X2zJ7PjTzt0XoG0t0GypsCwmg==@lists.linux.dev
X-Received: by 2002:a2e:bc83:0:b0:30c:2d44:c212 with SMTP id
 38308e7fff4ca-318a7ef5782mr3267911fa.9.1745521530295; Thu, 24 Apr 2025
 12:05:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250423-01-sun55i-emac0-v1-0-46ee4c855e0a@gentoo.org>
 <4ba3e7b8-e680-40fa-b159-5146a16a9415@lunn.ch> <20250424150037.0f09a867@donnerap.manchester.arm.com>
 <4643958.LvFx2qVVIh@jernej-laptop> <7fcedce7-5cfe-48a4-9769-e6e7e82dc786@lunn.ch>
In-Reply-To: <7fcedce7-5cfe-48a4-9769-e6e7e82dc786@lunn.ch>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 25 Apr 2025 03:05:17 +0800
X-Gmail-Original-Message-ID: <CAGb2v65GPqr5Vnqb_MhAJBAjQzd-vKi1g1pJ53oUnF0Ym2PH9g@mail.gmail.com>
X-Gm-Features: ATxdqUHHFIvGhKguImv0eKl6AhZd0EW8z8xCFHbw-GoYUR64Hf9zgUT_-m4qJRA
Message-ID: <CAGb2v65GPqr5Vnqb_MhAJBAjQzd-vKi1g1pJ53oUnF0Ym2PH9g@mail.gmail.com>
Subject: Re: [PATCH 4/5] arm64: dts: allwinner: a527: add EMAC0 to Radxa A5E board
To: Andrew Lunn <andrew@lunn.ch>
Cc: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>, 
	Andre Przywara <andre.przywara@arm.com>, Yixun Lan <dlan@gentoo.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, clabbe.montjoie@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2025 at 3:02=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > In my experience, vendor DT has proper delays specified, just 7 instead=
 of
> > 700, for example. What they get wrong, or better said, don't care, is p=
hy
> > mode. It's always set to rgmii because phy driver most of the time igno=
res
> > this value and phy IC just uses mode set using resistors. Proper way he=
re
> > would be to check schematic and set phy mode according to that. This me=
thod
> > always works, except for one board, which had resistors set wrong and
> > phy mode configured over phy driver was actually fix for it.
>
> What PHY driver is this? If it is ignoring the mode, it is broken.
>
> We have had problems in the past in this respect. A PHY driver which
> ignored the RGMII modes, and strapping was used. That 'worked' until
> somebody built a board with broken strapping and added code to respect
> the RGMII mode, overriding the strapping. It made that board work, but
> broke lots of others which had the wrong RGMII mode....
>
> If we have this again, i would like to know so we can try to get in
> front of the problem, before we have lots of broken boards...

I think the incident you are referring to is exactly the one that Jernej
mentioned.

And regarding the bad PHY driver, it could simply be that the PHY driver
was not built or not loaded, hence the kernel falling back to the generic
one, which of course doesn't know how to set the modes.

ChenYu
