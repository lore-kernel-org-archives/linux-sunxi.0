Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A52C8EC
	for <linux-sunxi@lists.linux.dev>; Wed, 23 Aug 2023 16:13:46 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2bba6fc4339so89351941fa.2
        for <linux-sunxi@lists.linux.dev>; Wed, 23 Aug 2023 09:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692807225; x=1693412025;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l95LCr0GMnr5YIrvqZTvdFeVvMdsvoY6X85sEcfYdiE=;
        b=PlQI+RDkk1NVSZGlQ84IghRbiWgml+c5nhCu6EL9Adlzg+YYBScfkWOJMK5PjQ7GGF
         rVvJ8SUfT72W+q2h3rTCOLrG1ZCh6/SLHp69P/pGMWGzivp4jQP2BaO1ibeoDDKTG98h
         jlcrM/dUGy/NeTDagNToM3Ob60wtBQAiiADwEErEaJHxuXFlzGdMdL+WCBkI2ULyOMiy
         fZJKWu0Azt7io9ky45aGIZDbc1SyTe6raDeR/VZ+PAhBzrVq2NeW0avh7AhIZikbmka3
         HAp4IgTwRJAmgKiAsz7uh+ThJyLgH47ymSGVJY+Ok6so+/bmu0w5iOT7qp52I9vCn9/2
         uD2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692807225; x=1693412025;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l95LCr0GMnr5YIrvqZTvdFeVvMdsvoY6X85sEcfYdiE=;
        b=eLvNig8pEGFuTsvDXEQ7pgx3o6VXKHjjYh9B3T7YFHy2nIMNl3IABJrvoxb8qfrp6i
         tiuwsJb1waFb+O1m3ATsYHrFjJYYtPKpGYO4X92eU5j4s8WKba7aHK1OnxOAgpwMMtEz
         NV9XOfnTW2CDudxSY8MOCzdVYQEGbzr5NLOkUmWGEzkKCj0DrRA6Hd9eRcCkw4uGwIVr
         rpmS2RQB2jp7xIcMoM0ajGtfCQYN50s+PmrisEw0+Hm/kciviBz6fQsIsUUJCOG/PKId
         VH/SMOEhPHYnl1/vtBzI+hEzHl8OWMFhCYhEViieEQZZ/Azq5nKp7sPshfX7vbOe0xLh
         SwDw==
X-Gm-Message-State: AOJu0YwmVql+tBnSWuaS4Co7dx/O9Kp5uX+/cMxsCD9ZuJBqErjrnVVG
	gt32bFRJrWNRT0sdncpNUQfNaRm/vBFOtEQqYlc=
X-Google-Smtp-Source: AGHT+IEg3+HoSNgWCsU5nKzt+RBMxv37klHp8t/UlohBP0GSJi3Ntpjq/Fb5EwAahM5Tl0nX9STzlX0dMhXv7HMOebE=
X-Received: by 2002:a2e:9dcd:0:b0:2b6:e105:6174 with SMTP id
 x13-20020a2e9dcd000000b002b6e1056174mr9882353ljj.47.1692807224549; Wed, 23
 Aug 2023 09:13:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230805180506.718364-1-bigunclemax@gmail.com>
 <20230805180506.718364-3-bigunclemax@gmail.com> <20230821154739.GA1720453-robh@kernel.org>
In-Reply-To: <20230821154739.GA1720453-robh@kernel.org>
From: Maxim Kiselev <bigunclemax@gmail.com>
Date: Wed, 23 Aug 2023 20:13:33 +0400
Message-ID: <CALHCpMjoxV+sUh6KSVXfEcWgc_ETBHWo2a7xHMT-nKS2xBYOvQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/5] ASoC: dt-bindings: Add schema for "allwinner,sun20i-d1-codec-analog"
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Maxime Ripard <mripard@kernel.org>, 
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 21 =D0=B0=D0=B2=D0=B3. 2023=E2=80=AF=D0=B3. =D0=B2 19:47, Rob=
 Herring <robh@kernel.org>:
>
> On Sat, Aug 05, 2023 at 09:05:02PM +0300, Maksim Kiselev wrote:
> > Add a DT schema to describe the analog part of the Allwinner D1/T113s
> > internal audio codec.
> >
> > Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
> > ---
> >  .../allwinner,sun20i-d1-codec-analog.yaml     | 33 +++++++++++++++++++
> >  1 file changed, 33 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/allwinner,s=
un20i-d1-codec-analog.yaml
>
> Looks the same as allwinner,sun8i-a23-codec-analog.yaml. Why can't you
> use that?
>
Hmm. You're right. But let me explain my decision :)
When I added a new file, I assumed that since this is a separate driver,
then the binding should be in a separate file.

As an example, I looked at the sun50i-a64-codec-analog.yaml binding.
It is mostly the same as sun8i-a23-codec-analog.yaml too.

So I really don't know which approach is better. If you advise me
just add a new compatible sting to sun8i-a23-codec-analog.yaml,
then I'll gladly do it in the next version.

Cheers,
Maksim
