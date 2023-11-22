Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53E524B30
	for <linux-sunxi@lists.linux.dev>; Wed, 22 Nov 2023 16:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-5ca9114e0e2so35657277b3.3
        for <linux-sunxi@lists.linux.dev>; Wed, 22 Nov 2023 08:34:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700670871; x=1701275671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ophsLbscDpT/fxf0eBhWE8ZK8OIp8kFL24DJaRjaQW8=;
        b=I4UF0On089NkJep4gMUBDOwEHUAUtkmO12DYy+7UZFRAG65aRBWs2ioGytxyeIM5ST
         uwZgOnggrG6qV9fTtJQY2RX0S3A09edqelQqKQxAEeSdhjHCP5H6v2oItUWbidCNKtCJ
         PyFoM2eDbgkef6hAoO6dcuBb2YopItTbjYYGzJmhSImtGJAcI3HTSWmUjiSF06xk3DQG
         Nghamrs4iYDDACWroEZLqlXomap5K9n8EfyQ3YV6A6hzUPMDcmcoGcKiapwL02PVtXu3
         bf9H38wbkxw0PmxbW2fGWk7Gw0PodDdsxlEQMIBcc7baV8bH2KwEwhAQOv2D9K01QeCH
         /bXQ==
X-Gm-Message-State: AOJu0YxHWSkeYxykpIRmXhnNWmTlmY3WdloMWCiNJj4AWkW0BBPhBnWs
	AvyPdxxVHFTu0hIEO5/qr/4LM1BklQ9++Q==
X-Google-Smtp-Source: AGHT+IFxy3bYkiGllaS6Lh9/BYKdUvwKB4QPZJzqKqQgSEmc5hzk+VnQqzqECRcwHJ8W+9D+VZbVAg==
X-Received: by 2002:a0d:dd04:0:b0:5ca:b35d:965 with SMTP id g4-20020a0ddd04000000b005cab35d0965mr2731658ywe.20.1700670871246;
        Wed, 22 Nov 2023 08:34:31 -0800 (PST)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id y7-20020a0def07000000b005a247c18403sm3862454ywe.37.2023.11.22.08.34.29
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 08:34:29 -0800 (PST)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-5ca9114e0e2so35656287b3.3
        for <linux-sunxi@lists.linux.dev>; Wed, 22 Nov 2023 08:34:29 -0800 (PST)
X-Received: by 2002:a0d:cb58:0:b0:5cb:576a:ec1c with SMTP id
 n85-20020a0dcb58000000b005cb576aec1cmr2804676ywd.9.1700670868874; Wed, 22 Nov
 2023 08:34:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231122121235.827122-1-peterlin@andestech.com> <20231122121235.827122-13-peterlin@andestech.com>
In-Reply-To: <20231122121235.827122-13-peterlin@andestech.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Nov 2023 17:34:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWHx6FoTCZZqaUAES5wJ=JBu7iLvVtNdBZAHB9mgBX4Gg@mail.gmail.com>
Message-ID: <CAMuHMdWHx6FoTCZZqaUAES5wJ=JBu7iLvVtNdBZAHB9mgBX4Gg@mail.gmail.com>
Subject: Re: [PATCH v4 12/13] riscv: dts: renesas: Add Andes PMU extension
To: Yu Chien Peter Lin <peterlin@andestech.com>
Cc: acme@kernel.org, adrian.hunter@intel.com, ajones@ventanamicro.com, 
	alexander.shishkin@linux.intel.com, andre.przywara@arm.com, 
	anup@brainfault.org, aou@eecs.berkeley.edu, atishp@atishpatra.org, 
	conor+dt@kernel.org, conor.dooley@microchip.com, conor@kernel.org, 
	devicetree@vger.kernel.org, dminus@andestech.com, evan@rivosinc.com, 
	geert+renesas@glider.be, guoren@kernel.org, heiko@sntech.de, 
	irogers@google.com, jernej.skrabec@gmail.com, jolsa@kernel.org, 
	jszhang@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	locus84@andestech.com, magnus.damm@gmail.com, mark.rutland@arm.com, 
	mingo@redhat.com, n.shubin@yadro.com, namhyung@kernel.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, peterz@infradead.org, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, rdunlap@infradead.org, 
	robh+dt@kernel.org, samuel@sholland.org, sunilvl@ventanamicro.com, 
	tglx@linutronix.de, tim609@andestech.com, uwu@icenowy.me, wens@csie.org, 
	will@kernel.org, ycliang@andestech.com, inochiama@outlook.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 22, 2023 at 1:17=E2=80=AFPM Yu Chien Peter Lin
<peterlin@andestech.com> wrote:
> xandespmu stands for Andes Performance Monitor Unit extension.
> Based on the added Andes PMU ISA string, the SBI PMU driver
> will make use of the non-standard irq source.
>
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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
