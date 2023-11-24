Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474CF2D781
	for <linux-sunxi@lists.linux.dev>; Fri, 24 Nov 2023 15:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fji6ZN3E"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-581ed744114so910920eaf.0
        for <linux-sunxi@lists.linux.dev>; Fri, 24 Nov 2023 07:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700838499; x=1701443299; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wqb6gmrOIr6APnQsTYHkPk1borpFhD009W5cTbT2h40=;
        b=fji6ZN3ETunxTMRFRWfHapxZ7wrQBAQyV3zwNTBZYi5Q408yB7sdTFx3jTz1jlt1g8
         fF6X/ZfsmnU8sPC9bfRK+r59ThHQsFyZilJUgfQiPw+40yZUSyLKOt46xp5dNtGx1vBk
         APMOBihv7pqH+DHuo08F4iEGTuBtzXDPRUgM6hYtz/CugKwZDiSW71AmKGObQGOKa+IX
         Oe5tFi0GCOgyfWXtxH+HAEOD8Voztm/wp5i4akeTLwq2YvRF1NZ44P8E8L7ewrAxsOpg
         SmkDEjqNtrBHLhyz7h66vrJg7zaCKcdO4WBOMU2DutxK76KiY8sDZSJ1h/fnRk/v8lYC
         5ObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700838499; x=1701443299;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wqb6gmrOIr6APnQsTYHkPk1borpFhD009W5cTbT2h40=;
        b=EIpPEic1jogiOsKxhJ1W4G7zvzcKy9oNw0AkeEetpj1ulEMkGrgQ9qO4pq9ivtDWuf
         pzTdRJjJw76WecoUFLm7qoGxWed6L8s6jyRje7IaDks34MZg2sEmoz01X/yaX3h0k6DS
         zoM1RjbMjNML+D4ythXOeHhNmZazHWvgqVxLn7Sgjp6TQYXWGDnAW2jY7DQy5HnvqVuZ
         urd4Szt4/UIaw5uiJkBVsb2IBh9Vwa/INEA8NtFD4YLJszEztClNzDiYKObYpUHfRTCh
         sdL6LAoSe1GzyG6+hlXoEQkiAdSG4Qr9Ax79FDcc0JM0o2vRmhpArl4lGzgIWzjVV+ZR
         +Uqg==
X-Gm-Message-State: AOJu0YzhC5dl/xsuBM5IK8I2nmVACl1a+Hclcx8wweAHqn+BRGsAOqQ4
	JW2eQSNVmIJ2CYpGSyEV2I4KTqFNdX8CLnlq4DU=
X-Google-Smtp-Source: AGHT+IG77ETgp0DMV9KXOevkcc677tVxeO+ugYI4hI1PX92j15kxePilfPhpPcHEZVQAcN8ZK/GbSo2YogMF+v/oHCA=
X-Received: by 2002:a05:6358:998a:b0:168:e707:2e56 with SMTP id
 j10-20020a056358998a00b00168e7072e56mr2295754rwb.16.1700838499153; Fri, 24
 Nov 2023 07:08:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231122121235.827122-1-peterlin@andestech.com> <20231122121235.827122-13-peterlin@andestech.com>
In-Reply-To: <20231122121235.827122-13-peterlin@andestech.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 24 Nov 2023 15:07:53 +0000
Message-ID: <CA+V-a8swHt079fxZfzMnzr3w7MfKpLnceHU_p4zvU+6X-Po0zg@mail.gmail.com>
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

On Wed, Nov 22, 2023 at 12:19=E2=80=AFPM Yu Chien Peter Lin
<peterlin@andestech.com> wrote:
>
> xandespmu stands for Andes Performance Monitor Unit extension.
> Based on the added Andes PMU ISA string, the SBI PMU driver
> will make use of the non-standard irq source.
>
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> ---
> Changes v1 -> v2:
>   - New patch
> Changes v2 -> v3:
>   - No change
> Changes v3 -> v4:
>   - No change
> ---
>  arch/riscv/boot/dts/renesas/r9a07g043f.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi b/arch/riscv/boo=
t/dts/renesas/r9a07g043f.dtsi
> index 78072e80793d..5f2f2181638a 100644
> --- a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
> +++ b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
> @@ -26,7 +26,7 @@ cpu0: cpu@0 {
>                         riscv,isa =3D "rv64imafdc";
>                         riscv,isa-base =3D "rv64i";
>                         riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c", "zicntr", "zicsr",
> -                                              "zifencei", "zihpm";
> +                                              "zifencei", "zihpm", "xand=
espmu";
>                         mmu-type =3D "riscv,sv39";
>                         i-cache-size =3D <0x8000>;
>                         i-cache-line-size =3D <0x40>;
> --
> 2.34.1
>
>
