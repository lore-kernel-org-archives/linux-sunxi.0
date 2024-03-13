Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4C84D9F8
	for <linux-sunxi@lists.linux.dev>; Wed, 13 Mar 2024 18:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710353624; cv=none; b=ruyl+0KP99yGmuMCPufXNCsHEs1FKh4L1b6f9UY1HBMLYS3x0uuoyF0QAOCBm90By17xiaoxmpICdZRBsqUu/ItLsY2qGoPmfWPAvRZAauM+m7Iv8M3F/TKdBtIprZ4y8Adw3pnyHohDrhzQJxbArs3B3zfHPAXqaJSr+24BJiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710353624; c=relaxed/simple;
	bh=XBZxd3/8sCA+mi0OAIV0bPCc+jlbGDc9ebO1Ccnfgsc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FkOCZMmJk5u/rdUTfCU4Ssc7IAtQVgZ1qyYVZFnZ3TR9eOwgRxNl5A25+HBmb9iy5l1wXGvfI96RQb3jFKhuriPayrKiPdy7Xoo2nQe4UmxEturFrJRO1BwvkMj/bmfsIy0SX+OUPVfpUjIKkxm2Ivy2Z5sXiZa8QseAZARipfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1dca3951ad9so861065ad.3
        for <linux-sunxi@lists.linux.dev>; Wed, 13 Mar 2024 11:13:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710353622; x=1710958422;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AhNbiGT3dBNYmyMqRR3v/dtfPCNBKZcqWH9p/BqTK+I=;
        b=pFleQu1rwzTjl44b0tRLa5u6ajofymb1std9NWbPdnWceiveRNhKVaaj7qyOP/8WXi
         fEnqmngTz4G/lYxDUzf3qcLXGbglpWDs5YHVvdzILMELjaD9cR0/pm3c3CuUrd9MRl/o
         m6VNgE8aWNiLvY7z0wwJLO6JIV6C6nb2IxUZe4N4Oe4fYJf9irgmEpdZUjiM0SOz6ArN
         pmhRpHGu8fzf0Xktm77kS53j6wje7eL/oF7Hfu5kU+XQ0e3JUxGmjO+7e+PBcx4vEC+2
         j9B7wK0tFLF33SHna5/IFsIpQDXWKFxss/P8MEX7e4LDNWvKfdx1+GKZFApcI47JgvmP
         FwMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVYEp3P5XXY9Hz0p7CVQFHcO4cZ73FF5WJ/4L19BRQ5ntU+Wkpy5Fkd1noTnh1iawSRi3w2aFB1CRUdqFhHcj8mtB72n60Cz7pNpE=
X-Gm-Message-State: AOJu0Yx/oM8c3u7alOo0dzwRBZt68D/LJ5Kszc4+fKDgLENzM8Nc/9eG
	EieKCvJOXeOJLfrC/s0xridv1fw131T1+QXDfWfEj8LK2dTNgQjZiW1rf9Jr
X-Google-Smtp-Source: AGHT+IFpvycldlj7lYxH35PA266GOA5ZayOfxQCP1T7yZbqEU0gUwR3ctiPmy5zXe6bv4RjVoxDzjw==
X-Received: by 2002:a17:903:2988:b0:1db:f696:b09 with SMTP id lm8-20020a170903298800b001dbf6960b09mr17957470plb.14.1710353621622;
        Wed, 13 Mar 2024 11:13:41 -0700 (PDT)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com. [209.85.216.43])
        by smtp.gmail.com with ESMTPSA id la13-20020a170902fa0d00b001dc3c3be4adsm8975732plb.297.2024.03.13.11.13.41
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Mar 2024 11:13:41 -0700 (PDT)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-29bd0669781so152929a91.1
        for <linux-sunxi@lists.linux.dev>; Wed, 13 Mar 2024 11:13:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWFdsGpuD6G2FMvOD1k35Te9v/86sBpggD89O5HgQQKPJ7/yOjDmFFYF8j76dnBOhLl5l89DJFU7qplSTk9+AkOBHja0B0rbsqJmDU=
X-Received: by 2002:a17:90a:9084:b0:29b:b854:db with SMTP id
 j4-20020a17090a908400b0029bb85400dbmr11208175pjo.27.1710353621055; Wed, 13
 Mar 2024 11:13:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240310010211.28653-1-andre.przywara@arm.com>
 <20240310010211.28653-3-andre.przywara@arm.com> <f203a0a3-9107-4290-a934-0f6736fe218a@sholland.org>
 <20240313173529.1f816404@donnerap.manchester.arm.com>
In-Reply-To: <20240313173529.1f816404@donnerap.manchester.arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 14 Mar 2024 02:13:29 +0800
X-Gmail-Original-Message-ID: <CAGb2v65LgmYU_PZLU8KDSYhr76y=kPNboTsZ9mRkT=wBuYSdvA@mail.gmail.com>
Message-ID: <CAGb2v65LgmYU_PZLU8KDSYhr76y=kPNboTsZ9mRkT=wBuYSdvA@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: mfd: x-powers,axp152: document AXP717
To: Andre Przywara <andre.przywara@arm.com>
Cc: Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Chris Morgan <macromorgan@hotmail.com>, 
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 14, 2024 at 1:35=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> On Mon, 11 Mar 2024 17:20:50 -0500
> Samuel Holland <samuel@sholland.org> wrote:
>
> Hi Samuel,
>
> thanks for having a look!
>
> > On 3/9/24 19:02, Andre Przywara wrote:
> > > The X-Powers AXP717 is a PMIC used on some newer Allwinner devices.
> > > Among quite some regulators it features the usual ADC/IRQ/power key
> > > parts, plus a battery charger circuit, and some newly introduced USB
> > > type-C circuitry.
> >
> > Do you plan to put the Type-C logic under a subnode, or should the
> > Type-C connector node go directly under the PMIC node? Either way, the
> > binding probably needs to be updated for that.
>
> I haven't looked into this yet, so cannot say which way to go. I
> definitely consider this some non-trivial task, so indeed wanted to push
> this off to later.
> For now there is a device (Anbernic RG35XX) with that PMIC, so we need at
> least the regulators to unblock this. USB support is not critical for now=
.
>
> > > Like two other recent PMICs, it lacks the DC/DC converter PWM frequen=
cy
> > > control register, that rate is fixed here as well.
> > >
> > > Add the new compatible string, and add that to the list of PMICs with=
out
> > > the PWM frequency property.
> > >
> > > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > > ---
> > >  Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/mfd/x-powers,axp152.ya=
ml b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
> > > index 06f1779835a1e..b8e8db0d58e9c 100644
> > > --- a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
> > > +++ b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
> > > @@ -83,6 +83,7 @@ allOf:
> > >              enum:
> > >                - x-powers,axp313a
> > >                - x-powers,axp15060
> > > +              - x-powers,axp717
> > >
> > >      then:
> > >        properties:
> > > @@ -99,6 +100,7 @@ properties:
> > >            - x-powers,axp221
> > >            - x-powers,axp223
> > >            - x-powers,axp313a
> > > +          - x-powers,axp717
> > >            - x-powers,axp803
> > >            - x-powers,axp806
> > >            - x-powers,axp809
> >
> > The regulators patternProperties needs to be updated for the new boost
> > regulator.
>
> Ah, I indeed missed this one. I think the former PMICs had this
> batter->VBUS boost regulator hidden, controlled entirely by the PMIC?
> I will need to check if exposing this will present any surprises. I
> guess this goes together with the USB-C support, to have role switching,
> unless this appears on some device with just USB-A or micro-B.
> I will check what it takes to add this one, the regulator itself looks
> easy.

I don't think there was such a boost regulator on previous PMICs. It was
just a passthrough, which is why on some boards such as the Cubietruck
there is an external boost converter to put out 5V when just the battery
is used.

ChenYu
