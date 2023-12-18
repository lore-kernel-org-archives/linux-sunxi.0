Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E0C3D57A
	for <linux-sunxi@lists.linux.dev>; Mon, 18 Dec 2023 16:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hGPGpjui"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a23350cd51cso210059566b.2
        for <linux-sunxi@lists.linux.dev>; Mon, 18 Dec 2023 08:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702916114; x=1703520914; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NuQkvFoOE7DbmbVDS6evAusjIw9xKO/OIgcTSDhOMeo=;
        b=hGPGpjuiQiVEnbzdtc2E2zWoun1WA1e/YSmqZi9Z0UL+HppaOohs9qBYfdD/c6dYkj
         up7AAccfArzfbI5xYWB4kRvaD8uNazz/PhJeOeqFEALexuw8XExIKgerXd95ht89iJLh
         9D26l1HWXY8ca2r5UN8gQvjTQL7AOXYrABWMTgW1KIWXw6NbMCHJk22vROU+R9ZNbcUo
         QbTsj+mIIzZlt4QwYfrGW+8FBjFg+2vZ5dokY4st7/aBPjtq9NCHhCpNMeGSLs1s+JlA
         Dm26zmR2N3Fu2yvcqJ7kwfm46+JxvBb5sYlzocCxKEhYeM13fpAs8RKvxWxbunHl4iV7
         HJsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702916114; x=1703520914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NuQkvFoOE7DbmbVDS6evAusjIw9xKO/OIgcTSDhOMeo=;
        b=g5MUuqLnH8E7oQbfdzgVXxV4L0oQb2My6diPitfMbS8uxMxxDf6HOydqfyPVn3absC
         aLU3l0igkht6U0CKvmtfoUMyZeH9fx8+B4UbiOBvVIusnp70YGbFyV8o5NRH22luGX4h
         ws18gped4OGwXmHd2I60xHz9uUEm4zvLUEqyGcFGM93y1DEL+vPkpl9qW/SlR8+lyfD9
         7Onh1b6rQSQqmXgvN4IW5pMuJxyWI0hDdRkkkVxMsybwGKmqiE9L6fTd8BTzB1x4rYeb
         SEVRlZCHHEvwtaOYVWX0ZsTC+0AMzY+muH+L0cp0Y2wflVBBHSdNM40SQtY2smKyIqZj
         sSaw==
X-Gm-Message-State: AOJu0YySMbpte1HCV8+mhqewe2HmnNLzE9cUQdBHbqcJO8FNVX8BkNal
	D0QqChG6DDFOlwehB78aXtw=
X-Google-Smtp-Source: AGHT+IFwxKikc0VD/aflFLF5hsUj2htfh9cxPznr1qHGY/nVPfC2muHIz36ghByZC6hXFA3e5iP3eQ==
X-Received: by 2002:a17:906:51d8:b0:a23:6eb6:6b29 with SMTP id v24-20020a17090651d800b00a236eb66b29mr58860ejk.101.1702916114457;
        Mon, 18 Dec 2023 08:15:14 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id hg12-20020a1709072ccc00b00a2359f95ad8sm1230202ejc.37.2023.12.18.08.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 08:15:13 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Conor Dooley <conor@kernel.org>, Andre Przywara <andre.przywara@arm.com>
Cc: Brandon Cheo Fusi <fusibrandon13@gmail.com>,
 Yangtao Li <tiny.windzz@gmail.com>, Viresh Kumar <vireshk@kernel.org>,
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 3/5] cpufreq: sun50i: Add D1 support
Date: Mon, 18 Dec 2023 17:15:12 +0100
Message-ID: <2710663.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20231218155345.476e71ea@donnerap.manchester.arm.com>
References:
 <20231218110543.64044-1-fusibrandon13@gmail.com>
 <20231218-blabber-slapstick-ab7ae45af019@spud>
 <20231218155345.476e71ea@donnerap.manchester.arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 18. december 2023 ob 16:53:45 CET je Andre Przywara napisal(a):
> On Mon, 18 Dec 2023 14:55:30 +0000
> Conor Dooley <conor@kernel.org> wrote:
> 
> Hi,
> 
> > On Mon, Dec 18, 2023 at 12:05:41PM +0100, Brandon Cheo Fusi wrote:
> > > Add support for D1 based devices to the Allwinner H6 cpufreq
> > > driver
> > > 
> > > Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
> > > ---
> > >  drivers/cpufreq/sun50i-cpufreq-nvmem.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/drivers/cpufreq/sun50i-cpufreq-nvmem.c b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
> > > index 32a9c88f8..ccf83780f 100644
> > > --- a/drivers/cpufreq/sun50i-cpufreq-nvmem.c
> > > +++ b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
> > > @@ -160,6 +160,7 @@ static struct platform_driver sun50i_cpufreq_driver = {
> > >  
> > >  static const struct of_device_id sun50i_cpufreq_match_list[] = {
> > >  	{ .compatible = "allwinner,sun50i-h6" },
> > > +	{ .compatible = "allwinner,sun20i-d1" },  
> > 
> > I thought the feedback in v2 was to drop this change, since the
> > devicetree has the sun50i-h6 as a fallback compatible?
> 
> Well, this is the *board* (fallback) compatible string, so we cannot assign
> it as we like. The whole (existing) scheme is admittedly somewhat weird,
> because we not only match on a particular device compatible
> (like allwinner,sun20i-d1-operating-points), but also need to blocklist and
> re-match some parts against the *board compatible*, owing to the
> cpufreq-dt driver. The board name is basically used as a placeholder to
> find out the SoC, because there is (or was?) no other good way - the
> CPU DT nodes don't work for this. Back when this was introduced, this was
> the "least worst" solution.
> 
> I don't remember all the details, and didn't find time yet to look into
> this in more detail, but fixing this is non-trivial. If this isn't 6.8
> material, I might have a look at this later this week/month.

I would say it's 6.9 material. -rc6 already passed and it's not yet aligned
with all maintainers.

Best regards,
Jernej


