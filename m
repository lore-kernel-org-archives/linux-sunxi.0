Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949084CE1C
	for <linux-sunxi@lists.linux.dev>; Thu, 14 Dec 2023 17:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bOvp56GF"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40c1e3ea2f2so81301875e9.2
        for <linux-sunxi@lists.linux.dev>; Thu, 14 Dec 2023 09:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702574104; x=1703178904; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sZcWwYsWqgvb8N253CfVL+G75y7l04rNTgihuYv69v8=;
        b=bOvp56GFnQkqtFWHis12saXFSOyRPRD+d1oRjwzVmHg9bRiuBTK4eC6lzln4lESBDE
         LXNgU5tH/nBYG5Ji9E+/VNIEMy3xKrJRabMzFlVuWyKSaPXl3KomyH3wec5SR7USd/mA
         aIXpjjnkTQCuFwtYRBzM9XEt6VfHx9cytKeIAV1hdvj6UxV9EBtAq5kgsKAUr4sHUYsm
         PfisI5AFCpAroRgXJOaooJ2yuChhqAeo5yXCb2yZZ2CYnjLgZaN2QHdgmUnklQox1g7w
         M/9W1OxFnElz715tfTLJp+Df3LJTHgTcTR6a+I8pt+U0e3RJRQWwKGmSrOIldZJEBw3i
         tqWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702574104; x=1703178904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sZcWwYsWqgvb8N253CfVL+G75y7l04rNTgihuYv69v8=;
        b=gqN5oxgM4nXC6TDAKRJJGFIIEZgiDODOXDWW0YrMWkM69bhK/eYCFzhwAI0w/wBliU
         xzJVSKM4j8jJlWDMmf7yzkg1sPK4Go2nhZiQNyixpuuG/0W1tNGpCvQltaJ8oNLuVLqs
         lRmKxohxjI262deEYcytQScyzH428fTgespX6OIeQsfseMDdPq55K2cUq8yTNeexaDDf
         KxLHJt32Ns9RSWeWfcyiFip3fIinDVsST/Q8RDnEsikznMPID96vA9B8GYsEVxZPe08x
         76EmIDvrHuxqBOUBA0GHQgVOUjPqzC4RhCotcc+pwRtdAjuGqFM3reKkg7RoVaggcusT
         QIOA==
X-Gm-Message-State: AOJu0Yx8mOwb8dzWA7QOf1V1BfbeIs9BReagok72DW4UemuslnCHV/pz
	AxoKpasIv9EMd6aq33wkEzQ=
X-Google-Smtp-Source: AGHT+IH88hDNA4eO5+FpLzOmaFi9NlwWnrCx5E2RHnwKHW5L3a+1Er8kbAdZJfkQVoeIulog2uiXMg==
X-Received: by 2002:a05:600c:4d98:b0:40c:2715:b10f with SMTP id v24-20020a05600c4d9800b0040c2715b10fmr5890947wmp.119.1702574103545;
        Thu, 14 Dec 2023 09:15:03 -0800 (PST)
Received: from archlinux.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id bh15-20020a05600c3d0f00b0040b4ccdcffbsm26013151wmb.2.2023.12.14.09.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 09:15:02 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Yangtao Li <tiny.windzz@gmail.com>,
 Brandon Cheo Fusi <fusibrandon13@gmail.com>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org
Subject: Re: [PATCH 2/5] cpufreq: sun50i: Add D1 support
Date: Thu, 14 Dec 2023 18:15:01 +0100
Message-ID: <1921146.taCxCBeP46@archlinux>
In-Reply-To: <20231214164010.0be50a89@donnerap.manchester.arm.com>
References:
 <20231214103342.30775-1-fusibrandon13@gmail.com>
 <8351928.NyiUUSuA9g@archlinux>
 <20231214164010.0be50a89@donnerap.manchester.arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

On Thursday, December 14, 2023 5:40:10 PM CET Andre Przywara wrote:
> On Thu, 14 Dec 2023 17:29:30 +0100
> Jernej =C5=A0krabec <jernej.skrabec@gmail.com> wrote:
>=20
> Hi,
>=20
> > On Thursday, December 14, 2023 11:33:39 AM CET Brandon Cheo Fusi wrote:
> > > Add support for D1 based devices to the Allwinner H6 cpufreq
> > > driver
> > >=20
> > > Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
> > > ---
> > >  drivers/cpufreq/sun50i-cpufreq-nvmem.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >=20
> > > diff --git a/drivers/cpufreq/sun50i-cpufreq-nvmem.c b/drivers/cpufreq=
/sun50i-cpufreq-nvmem.c
> > > index 32a9c88f8..ccf83780f 100644
> > > --- a/drivers/cpufreq/sun50i-cpufreq-nvmem.c
> > > +++ b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
> > > @@ -160,6 +160,7 @@ static struct platform_driver sun50i_cpufreq_driv=
er =3D {
> > > =20
> > >  static const struct of_device_id sun50i_cpufreq_match_list[] =3D {
> > >  	{ .compatible =3D "allwinner,sun50i-h6" },
> > > +	{ .compatible =3D "allwinner,sun20i-d1" }, =20
> >=20
> > This is not needed, as there is no functionality change.
>=20
> That was my first reflex, too, but this is the *board* (fallback)
> compatible, listed in the root node, so you have to list it here for each
> SoC, together with the respective blocklist in the next patch.
> We are doing the same for the H616, and actually also need that for the
> H618. Weird, I know, but last time I check not easy to fix.

Oh, that's bad. What's the rationale to have so complicated probe method?
Why not using standard, compatible based one?

Best regards,
Jernej



