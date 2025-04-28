Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E190125E47E
	for <linux-sunxi@lists.linux.dev>; Mon, 28 Apr 2025 08:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745829472; cv=none; b=DoTG4P8DfdayAj8Av1ZY9v3lpuyQqil1dmjKCqOnEOVjIXjVqHc1oKo6GCf6yFkznstAsRhZ92nJCGg8PmejqtcpeY1oJxO+UEXMhlMCv1BgV4ThmpcGrmb7dVF9O34dzDt8tKm5/RQP5yEsOG2Q8xslV06GL2Zl5rL7jtvy+sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745829472; c=relaxed/simple;
	bh=0kLJgngd8OBHnB9bkAEEFHOf3k87BlAdTqH93ssIaow=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=coAXrbx3IVPBcfttjW9Ksk2sU7Dosk/G3NV1a7D+4b6rGpeuXpqfuEU5zN9dIblMEGtuP3BhOqSHAWAjKU21EnNgu4KIEmQOxa1CWvHXwf+7l2thb85maywpV834UE2oiimQ8kxFUE80yf0x5LA5mMDhrS/C37gJSCQKxB1Qszk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54b09cb06b0so4722026e87.1
        for <linux-sunxi@lists.linux.dev>; Mon, 28 Apr 2025 01:37:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745829466; x=1746434266;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1ztfMn1VNdd3sBgxsbvmNyvjhCCtBTgEPkzz2bCSzMw=;
        b=piAIsU7b9A9MCHW5vlGjsNPKlR6w132kCrYNwR9dunHRIEfKYh7kWuQC4D+VpTt31q
         NOk7If2Qwp9988in6tsbVRXcN+nk2QrHY4WvI/v+ecVGVcgN76Aup0LMNWMrwC6ZsUjj
         hUuzJKJwgSm1wDy5jet07i+hTP2X/3UkDNJ+4CiriGfo41Pc3qzSYQzyXR9E3JqQPOoi
         gw0b1A2RBhJUqL1iWSBwG5VcljjbvHKrJ0+0hWrrUQYhL2OkL96g+k+fN7l1stNqF0io
         W6usLNqKbXveYYmjtbQwFSIEF0V+PEQEdcV9Mf/Bf7puUJRzbWniRp4+9pPP1YWTlzRa
         XbDA==
X-Forwarded-Encrypted: i=1; AJvYcCWXvJrue0kkFb4PsMncI2ML45GCIcO9ewjVZ8aAp2wF14LL9pcYqVOWHSdSRop6A4J6XhYf8U04mV19Rg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzW7cQlNsoLnMWyBbDvDZGrh4aF4GPmWFzAjihqxH3VZbUMQ9A4
	pUz4Ou3UpysMe5bY/SlHGCC4z5W+KDHVHQ0126FVH1f7EnLi+a0hcdP5lqOD
X-Gm-Gg: ASbGnct5fh5rGytfh3AHs5eYF/3qfjG8ghEsnrV+aWX0h2FEoeuVf8rSg2ylCJwcJ4E
	KZYlC65/0HklIg2gR/7AbIZJuZEv/A+MQ1eXvCpNEeHAYM0CpmaZ2wgwA4LsOQjmUD/T9c7w1hb
	GFbNKIJ9zfkb/krjhr6dDjChE3elklyPCJbxr68/FcmixwPABatteziUT1TLdwXRS0trGzHJ5zO
	KJZ6K34+uwgdarmFONY7Z/M0r3xyhhLg+ILPEwwlLOnXox4WNpfvAGWuXHEuov9o1/IjqsbUYRn
	j8CYoEgJ/nHCqmyrgMNmbPnabYSPqm+tGgLcuLo9TAdS+kSHDQVpJD3clpDfJMT+Sa/9rIOYz55
	T2yj8
X-Google-Smtp-Source: AGHT+IH6YXnJ2UTC/Nyb8dAD74BPmru+AB+f+HPMyDzbH2tmo8Lgt23wDnr4MiUZ2MjpTvYI9nLK1w==
X-Received: by 2002:a05:6512:b89:b0:54b:1095:6190 with SMTP id 2adb3069b0e04-54e8cc131f7mr2325038e87.49.1745829465533;
        Mon, 28 Apr 2025 01:37:45 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3bc53sm1578413e87.94.2025.04.28.01.37.44
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 01:37:45 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5493b5bc6e8so5277723e87.2
        for <linux-sunxi@lists.linux.dev>; Mon, 28 Apr 2025 01:37:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW1AiYll/ntxypCUO1ynJJhqOfpT1rFd9bIfrSgu3krutBophljrP3LGEp2cCl1ON+oaZxmNfmlsHZtag==@lists.linux.dev
X-Received: by 2002:a2e:bc22:0:b0:30b:9813:b002 with SMTP id
 38308e7fff4ca-31907611d07mr36339461fa.30.1745829463977; Mon, 28 Apr 2025
 01:37:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250418-opz-audio-v1-1-4e86bb5bc734@posteo.net>
 <CAGb2v67-1tk0uAmYL-y6479itUxBJua76qhjn+0tTsN+Ni_a1w@mail.gmail.com> <aA8tsao6hhW50k4e@probook>
In-Reply-To: <aA8tsao6hhW50k4e@probook>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 28 Apr 2025 16:37:31 +0800
X-Gmail-Original-Message-ID: <CAGb2v67Trz_Dtp5_ME3MnfwBjtp=DwPN4aJ1vrtizgiUn08_3w@mail.gmail.com>
X-Gm-Features: ATxdqUGWc3W8r_9HVJ8EOFRWh1ggm3Yd1EhRVjGqxp6FjjlbklMvKQE6GcEe8I0
Message-ID: <CAGb2v67Trz_Dtp5_ME3MnfwBjtp=DwPN4aJ1vrtizgiUn08_3w@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: allwinner: orangepi-zero: Enable audio codec
To: =?UTF-8?B?Si4gTmV1c2Now6RmZXI=?= <j.ne@posteo.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 3:26=E2=80=AFPM J. Neusch=C3=A4fer <j.ne@posteo.net=
> wrote:
>
> On Sun, Apr 27, 2025 at 01:28:58PM +0800, Chen-Yu Tsai wrote:
> > On Fri, Apr 18, 2025 at 7:32=E2=80=AFAM J. Neusch=C3=A4fer via B4 Relay
> > <devnull+j.ne.posteo.net@kernel.org> wrote:
> > >
> > > From: "J. Neusch=C3=A4fer" <j.ne@posteo.net>
> > >
> > > Line out playback and microphone capture work, after enabling the
> > > corresponding ALSA controls. Tested with the Orange Pi Zero interface
> > > board, which is a (mostly) passive adapter from the 13-pin header to
> > > standard connectors (2x USB A, 1x Audio/Video output, 1x built-in
> > > microphone).
> > >
> > >   https://orangepi.com/index.php?route=3Dproduct/product&product_id=
=3D871
> >
> > What about the USB ports?
>
> Good point, I could test these. I have not mentioned them because they
> are not related to audio.
>
> > In any case, we don't enable peripherals on "headers" by default. That'=
s
> > up to the end user. The description for the whole adapter board could b=
e
> > an overlay that users can then apply directly.
>
> For features such as pinmuxed UARTs (already present and disabled in the
> dts), I fully agree, because they could as well be used as GPIO, and
> that's for the user to decide.
>
> For the audio pins, there's nothing else one can do with them, as far as
> I understand it. It is possible to use at the least the Line Out pins
> with very minimal setup, e.g. just connecting the pins to headphones or
> something else.

Sure, but you are also adding the routing information, which could be
different if someone designs a different adapter board. One could
include GPIOs and I2C from the 26-pin header, and make a headset
adapter (mic on the TRRS instead of tv-out) with a headphone amp
and headset detection IC.

It's easily overridable, and I suppose providing the basic use-case
that one can directly use via the pins does have value. Instead of
doing a lot of editing, the user can just toggle the status via
the bootloader.

> I'll clarify the following points in a comment in the next version:
>
>  - The audio signals are exposed on the 1x13 header described in
>    https://linux-sunxi.org/Xunlong_Orange_Pi_Zero
>
>  - The pins can't be used for anything else according to section
>    3.1. Pin Characteristics of the Allwinner H3 Datasheet.
>
> Although I would prefer to enable the audio pins by default (because
> they are present on the Orange Pi Zero board), I would also be ok with
> adding them as status =3D "disabled", as is the case with uart1 and uart2=
.
> Please let me know your opinion.

I think it's better to have them disabled by default. We don't want to
confuse users that don't have the adapter board, who might end up looking
at their audio mixer and wondering where the line out is.

If they have the adapter, or they are explicitly using wires to hook up
things, then they can toggle the status. If they have something else,
then they load whatever overlay that matches their hardware.


Thanks
ChenYu

> I will test the USB ports and write a devicetree overlay at
> arch/arm/boot/dts/allwinner/orangepi-zero-interface-board.dtso
>
>
> Best regards,
> J. Neusch=C3=A4fer
>
