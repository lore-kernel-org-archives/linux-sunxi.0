Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9331860875
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Feb 2024 12:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708950487; cv=none; b=rMNSY+KNoZ+I2MYKwiYXYO1AnbDlx20Wbz7ZHDY8FwsFqm1qxiH7SmNUhzWKNqqzoD86UmTUL85a8nZ3felnR2xHAd22ldDHG2WEoIaYLECcdSXczq5eorjcDsdM2T+ptyfPZUaY9e+jX6tGdKZPpE+RNeg15EQExHzxzVI7stk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708950487; c=relaxed/simple;
	bh=NAXgruINWdOQv8VRnp1gn8XclW92gQqN4yv7U/TfJwU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=huqSntHc/03jerfmrE57UUmo9ftJhwFngPwIIIfZxwv/6KK/Jq2XEVf9cwCTOOfEOh19ex3tuFQpaYJfyqwuSTVcaFR8LjERpYFTcp1tV0mlabWUHb15kvotx3G3P5qYoKcXElxHgbVtnkcmxs3Fj0XY1hS8EZ8YwqlUTiYQZ2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-60915328139so3335407b3.0
        for <linux-sunxi@lists.linux.dev>; Mon, 26 Feb 2024 04:28:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708950484; x=1709555284;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C7Jt6uOGYEF2aQdl/7Fp6F1BKKNUfz+MFg3gqXg/aVI=;
        b=mBgABd/RMvEVT1al5D6SErfVmmqvEFKEma+vAJYz4xRdhMc2H8kqqqAuzd71n/ZwzB
         lfQ8M7lCAoGR39J5XRTFpEMe5/ecw2fcl5Z9cf3U30/+biyX0GP8Qnp9r4aiu0S9XhMo
         Nf6XoF/A9u6N/7zwTEKZ0/vIZmGhJVxJ5Rgfm6dK/stfUVeVmNu7S9at7XrRIpIo5HX0
         hXCHr4bZ3Y1Y3jJkZQZqPqpyy5/PnbODtpij4zLjsYHrjX06TL26XY3t0wE1O+FTsLXL
         JNiF/eLt58oLXVV8BOowAm2C7Sj6Qkykt7G3lv/+Wx1oNnPq+lLpjJlNJRBsvW8gJBe8
         tZIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOkgv5oB6/VIlL8a2jtMz2CNjw3j1CdYv2V1NeGYqQDq0uW2nYfqUfIY2uNwPiBTFqPwiawhtmdKJHBHB3nEAYAppdQjjmN+FVdfE=
X-Gm-Message-State: AOJu0YxePzXpDF1Y37MQcy1jDqjK+w976wCFhM09cMHS/8gWLYfh6Kc6
	7nQAGM4Tt27bMj2r1Mxgc+CUe/czkcG7ecDeB9Vn4VhBr6rCukAEa9NMd5Vu3kk=
X-Google-Smtp-Source: AGHT+IFgCaRwNpYE/RF+8vVt+oItgNQ6d808jfYznBBHxtTmFMq7i+BBOEQ9E6Zd0f0GffgCg3IuMA==
X-Received: by 2002:a05:690c:f91:b0:608:173e:2486 with SMTP id df17-20020a05690c0f9100b00608173e2486mr6642807ywb.19.1708950484672;
        Mon, 26 Feb 2024 04:28:04 -0800 (PST)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id v11-20020a81b80b000000b00608d5de1c94sm1052208ywe.37.2024.02.26.04.28.04
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Feb 2024 04:28:04 -0800 (PST)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dcc80d6006aso2969742276.0
        for <linux-sunxi@lists.linux.dev>; Mon, 26 Feb 2024 04:28:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXKJDNaMhfudi8ChRMevRppotD8uwI39jVUGgNuOfj3A/9EyuNASm6T0YHXtzARGT+mMlAIs0tuVv72QGRZx/WPePCjzBgGmfDArlI=
X-Received: by 2002:a05:6902:3c5:b0:dc2:2041:fc49 with SMTP id
 g5-20020a05690203c500b00dc22041fc49mr4426711ybs.5.1708950484424; Mon, 26 Feb
 2024 04:28:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240222083946.3977135-1-peterlin@andestech.com> <20240222083946.3977135-6-peterlin@andestech.com>
In-Reply-To: <20240222083946.3977135-6-peterlin@andestech.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Feb 2024 13:27:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWzzrQBq-RzFnfr8pXgeUOuqG8CwCjwDOwfCJzGQ=ZDJA@mail.gmail.com>
Message-ID: <CAMuHMdWzzrQBq-RzFnfr8pXgeUOuqG8CwCjwDOwfCJzGQ=ZDJA@mail.gmail.com>
Subject: Re: [PATCH v9 05/10] riscv: dts: renesas: r9a07g043f: Update
 compatible string to use Andes INTC
To: Yu Chien Peter Lin <peterlin@andestech.com>
Cc: acme@kernel.org, adrian.hunter@intel.com, ajones@ventanamicro.com, 
	alexander.shishkin@linux.intel.com, andre.przywara@arm.com, 
	anup@brainfault.org, aou@eecs.berkeley.edu, atishp@atishpatra.org, 
	conor+dt@kernel.org, conor.dooley@microchip.com, conor@kernel.org, 
	devicetree@vger.kernel.org, evan@rivosinc.com, geert+renesas@glider.be, 
	guoren@kernel.org, heiko@sntech.de, irogers@google.com, 
	jernej.skrabec@gmail.com, jolsa@kernel.org, jszhang@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, locus84@andestech.com, magnus.damm@gmail.com, 
	mark.rutland@arm.com, mingo@redhat.com, n.shubin@yadro.com, 
	namhyung@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	peterz@infradead.org, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	rdunlap@infradead.org, robh+dt@kernel.org, samuel@sholland.org, 
	sunilvl@ventanamicro.com, tglx@linutronix.de, tim609@andestech.com, 
	uwu@icenowy.me, wens@csie.org, will@kernel.org, inochiama@outlook.com, 
	unicorn_wang@outlook.com, wefu@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 22, 2024 at 9:40=E2=80=AFAM Yu Chien Peter Lin
<peterlin@andestech.com> wrote:
> The Andes hart-level interrupt controller (Andes INTC) allows AX45MP
> cores to handle custom local interrupts, such as the performance
> counter overflow interrupt.
>
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> Changes v1 -> v2:
>   - New patch
> Changes v2 -> v3:
>   - Fixed possible compatibles for Andes INTC
> Changes v3 -> v4:
>   - No change
> Changes v4 -> v5:
>   - Include Geert's Reviewed-by
>   - Include Prabhakar's Reviewed/Tested-by
> Changes v5 -> v6:
>   - No change
> Changes v6 -> v7:
>   - No change
> Changes v7 -> v8:
>   - No change
> Changes v8 -> v9:
>   - No change

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
so Palmer can pick it up with the rest of the series
(the Renesas tree imerge window for v6.9 has closed)

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
