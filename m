Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2CF714B065
	for <linux-sunxi@lists.linux.dev>; Fri, 12 Apr 2024 17:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712941496; cv=none; b=bd+DUK1i7EsoUKrmUqZKFt1Tw6X3nnrZrKZdPlSnXgn4syWGBqk4+LJJSgkQ1UzSBCCR5nurTCThJwukaunKydMx9jlk9aYrqy0zS2xeeRoftuPK0lyMpPS9Yf8uwhz9vUB6ADHQmMfcP1TAPkGx1dQADB/oIn1MV3Yh9JkLC8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712941496; c=relaxed/simple;
	bh=tYOCD7qA19/JAXwkJAfYs6ERNWjQ6TGuUnce7Ev3h1g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tx1R1jYXfZ+LtwF9KSO2FukKJ6QhmtPYDYD/oUQgLQxvAcaiiBnihh1xWHON3fpneG2IZtFQn09I6vA9WjFvQClWnp6etHI4FFY75tK7raC0EhPNnfmbk3ZwvKt808uPx7rzmATqKzazIy2CFOZT+Fwu4tXklmGceI48EJHxWUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=2YRSoddN; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="2YRSoddN"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2d88a869ce6so12848871fa.3
        for <linux-sunxi@lists.linux.dev>; Fri, 12 Apr 2024 10:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712941493; x=1713546293; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tYOCD7qA19/JAXwkJAfYs6ERNWjQ6TGuUnce7Ev3h1g=;
        b=2YRSoddNJLxp5K4g5f6djI+R9X7ELL7fFaIo36J0XjUGHvNZQTy+iWrbXHwSZ+diwy
         QnT1LKqAXw/NuUqZLWAR2XFVh++T+HE4is2J4B/UzUAKR/ItoWcCJn260K+ziMYPvWiN
         7OCfaITAMA8eePZPzOxYmKNOS77ylsb0g3V/FYE/F121sxu3VH0O3eoP/wqQr9VNwv3j
         f1Sj0hQYsKlqqBU9SSMnFO5/9KLjUGsxyZdYW6NGqCNfP+rechaaT0N1u4u43LH839ob
         ACsbaM2IcQ5JUyeG9B0FqxsDmrSH+bpjnFpRUXTSVJTRWgudPTK0sOa3uluM9r1lid5F
         Tufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712941493; x=1713546293;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tYOCD7qA19/JAXwkJAfYs6ERNWjQ6TGuUnce7Ev3h1g=;
        b=xFhWelemI3jjkB3Wl/UC2MDkOLgDQyrxg2efgfyWoYMsPG5XJ+fGg04psJc/VMo9BT
         xh1A7UJlNxruoWSaQvTr/PnXhpYM7wZhhWeGJqPI90uxU4bZLmeWrui58a7M0oMuoP/+
         Y/KzTPjuhS5nLB80draPqEjKeMW2asUki2AcAxB9UNkgoSkB2FWnrxzI9knxAZAIixm6
         exm+JZuAlQ/QDVhKB/nboVjhiMT48nWPgm/gQkbFLJBG+qH7p10iasoWDTpiTfx7OMrA
         W20To/fynH2ruyYn5qkA/JdYPrMaN3LTNk8JrByVfr57qrY6BkJQPYpF7r8SJwKamokp
         8g0A==
X-Forwarded-Encrypted: i=1; AJvYcCWIyBUh/C43+HMADIpxIknYMh46mZmOdHvQEW8xtKXZuTPq93zrDcvASihPTAwqBdm8tdDIYGuXUfIy4K/utL6QbPIRonrfg7qvzJM=
X-Gm-Message-State: AOJu0YyzmA+qoh9JNc10s56+yNWsBo7enC+x8Nl701uA2NQ8Cve7faoM
	kwwrhvk2iaXysstD/xMI48Z0lTwdM6hKuDcas3QXfqaI603DZB+yqMbuu04KSTUbn9MvC3iOXnZ
	j3mJ61X2/L8UQg4nUaK3NVScRcZSspOYicV/8kQ==
X-Google-Smtp-Source: AGHT+IEVhmpSPd185VDGAisXX5CbjlYY2cqdA2jBznkqi4gMJsx6SWiduJXurWu4KxUaLTi372RCaB93r5g8yMqVxEs=
X-Received: by 2002:a2e:95cc:0:b0:2da:7af:e6a0 with SMTP id
 y12-20020a2e95cc000000b002da07afe6a0mr2360061ljh.38.1712941493181; Fri, 12
 Apr 2024 10:04:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
 <20240411-dev-charlie-support_thead_vector_6_9-v1-2-4af9815ec746@rivosinc.com>
 <20240412-tuesday-resident-d9d07e75463c@wendy>
In-Reply-To: <20240412-tuesday-resident-d9d07e75463c@wendy>
From: Evan Green <evan@rivosinc.com>
Date: Fri, 12 Apr 2024 10:04:17 -0700
Message-ID: <CALs-HsuMZOMpDh8kwQx6FE2mawzt+qTD-WZ6Mvhrt+hUhkZimg@mail.gmail.com>
Subject: Re: [PATCH 02/19] riscv: cpufeature: Fix thead vector hwcap removal
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Charlie Jenkins <charlie@rivosinc.com>, Conor Dooley <conor@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 12, 2024 at 3:26=E2=80=AFAM Conor Dooley <conor.dooley@microchi=
p.com> wrote:
>
> On Thu, Apr 11, 2024 at 09:11:08PM -0700, Charlie Jenkins wrote:
> > The riscv_cpuinfo struct that contains mvendorid and marchid is not
> > populated until all harts are booted which happens after the DT parsing=
.
> > Use the vendorid/archid values from the DT if available or assume all
> > harts have the same values as the boot hart as a fallback.
> >
> > Fixes: d82f32202e0d ("RISC-V: Ignore V from the riscv,isa DT property o=
n older T-Head CPUs")
>
> If this is our only use case for getting the mvendorid/marchid stuff
> from dt, then I don't think we should add it. None of the devicetrees
> that the commit you're fixing here addresses will have these properties
> and if they did have them, they'd then also be new enough to hopefully
> not have "v" either - the issue is they're using whatever crap the
> vendor shipped.
> If we're gonna get the information from DT, we already have something
> that we can look at to perform the disable as the cpu compatibles give
> us enough information to make the decision.
>
> I also think that we could just cache the boot CPU's marchid/mvendorid,
> since we already have to look at it in riscv_fill_cpu_mfr_info(), avoid
> repeating these ecalls on all systems.
>
> Perhaps for now we could just look at the boot CPU alone? To my
> knowledge the systems that this targets all have homogeneous
> marchid/mvendorid values of 0x0.

It's possible I'm misinterpreting, but is the suggestion to apply the
marchid/mvendorid we find on the boot CPU and assume it's the same on
all other CPUs? Since we're reporting the marchid/mvendorid/mimpid to
usermode in a per-hart way, it would be better IMO if we really do
query marchid/mvendorid/mimpid on each hart. The problem with applying
the boot CPU's value everywhere is if we're ever wrong in the future
(ie that assumption doesn't hold on some machine), we'll only find out
about it after the fact. Since we reported the wrong information to
usermode via hwprobe, it'll be an ugly userspace ABI issue to clean
up.

-Evan
