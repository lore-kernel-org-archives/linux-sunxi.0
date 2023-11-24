Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8801A5A3
	for <linux-sunxi@lists.linux.dev>; Fri, 24 Nov 2023 15:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="duiJmEsX"
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-7c46c7bc538so402966241.3
        for <linux-sunxi@lists.linux.dev>; Fri, 24 Nov 2023 07:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700838467; x=1701443267; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9cD4XTfLDfdBaVvLQQvVIb/DdNn7sLhHYoYCs/LHKvs=;
        b=duiJmEsXPR4Rqd4N6W8tdziPgl3Cxh/8TxPvkR7gSIXIG5NI2ix5zX9meaollG489a
         F4Zt/wfH1yswwauKp/QPOB3wd7VJM2HsOd2khJcmcng55q12Z6qVbHCLT9+KLCPlIBbC
         zj2iP2KjBBVFF3zdnV3OQpUHRwPaXu0OaQ4nRFiWLEXf0vOQFufnH3DScCdYxMUGcqHJ
         zmhfXUUZkegz+2R2y9OtjIfvImK7aXLiDLUTiVnslMk1+w9BVJlwn/67xqyMnm9T74A5
         5Z3HtKOddqCtz6A4S4nvbVi46kK0ESyOQFYIYfKET2sTFIYA08uut3i0SnuyY5XwK85K
         T01A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700838467; x=1701443267;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9cD4XTfLDfdBaVvLQQvVIb/DdNn7sLhHYoYCs/LHKvs=;
        b=fwwyscZv18kMVC1pV5yEKuywB57jujp1hkmSHtKSr8ZoHWEXQNQ2A8FF4WDmBnlOHH
         j3q9xJo2YGhTL8hSNWeKpZWXqavMwucJLsfG2WlLuclY0Wl/7rEcsOoVaK/IVhLm/b2n
         sGM7hkIYQzRX1SzWjVMXXNQqRQBl22hstxOjcwk9ZLVWbUJJnNfy+N6JjboJamindJmP
         IX0Y3bC4XwRU7FMKZ6mMMGZmKPOviUnBFLTcPRs59aSOR4oL8kT5d4CEF/heZHEqyPLa
         ImFuRPXJZQHyqIwJSjM/637U6I2g2UaigIGZV0bUyF8UP5Ou0QOsuueWF6laFgiwl4t0
         1s4Q==
X-Gm-Message-State: AOJu0YyGw+pv/3A0jy6oLrTU5zuYQKnNKiMiobdOnwRJQFP6ff+WVllZ
	GFb2v0kj7yO13AxIlH19XpDf+pU5POL+3owEbco=
X-Google-Smtp-Source: AGHT+IGwXCccI84TpN5xF2DxNx/5Qx0U4TpwtpfvD5tAf/GoEOLYxxD2REsWw4Dlpn477SB/DfDmefE9drxOV1y67p8=
X-Received: by 2002:a05:6122:903:b0:49a:466c:199e with SMTP id
 j3-20020a056122090300b0049a466c199emr3335155vka.2.1700838467503; Fri, 24 Nov
 2023 07:07:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231122121235.827122-1-peterlin@andestech.com> <20231122121235.827122-11-peterlin@andestech.com>
In-Reply-To: <20231122121235.827122-11-peterlin@andestech.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 24 Nov 2023 15:07:21 +0000
Message-ID: <CA+V-a8s2Ep3cC_qJ-a=3xf+D_90SJKe_MObywmnm6UJzEbvA6w@mail.gmail.com>
Subject: Re: [PATCH v4 10/13] dt-bindings: riscv: Add Andes PMU extension description
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

On Wed, Nov 22, 2023 at 12:18=E2=80=AFPM Yu Chien Peter Lin
<peterlin@andestech.com> wrote:
>
> Document the ISA string for Andes Technology performance monitor
> extension which provides counter overflow interrupt and mode
> filtering mechanisms.
>
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> Changes v2 -> v3:
>   - New patch
> Changes v3 -> v4:
>   - Include Conor's Acked-by
> ---
>  Documentation/devicetree/bindings/riscv/extensions.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index 694efaea8fce..4e0066afc848 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -258,6 +258,13 @@ properties:
>              in commit 2e5236 ("Ztso is now ratified.") of the
>              riscv-isa-manual.
>
> +        - const: xandespmu
> +          description:
> +            The Andes Technology performance monitor extension for count=
er overflow
> +            and privilege mode filtering. For more details, see Counter =
Related
> +            Registers in the AX45MP datasheet.
> +            https://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-=
5.0.0-Datasheet.pdf
> +
>          - const: xtheadpmu
>            description:
>              The T-Head performance monitor extension for counter overflo=
w. For more
> --
> 2.34.1
>
>
