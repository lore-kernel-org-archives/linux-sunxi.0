Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C0E2E417
	for <linux-sunxi@lists.linux.dev>; Fri, 24 Nov 2023 15:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="flMuZUnH"
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-7c461a8684fso453925241.2
        for <linux-sunxi@lists.linux.dev>; Fri, 24 Nov 2023 07:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700838257; x=1701443057; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l/uTADgd8yavomJvu4FPF4hVWKDAN545TEF230idRIM=;
        b=flMuZUnHtjGvtL+5pExPr6cy3sApjfyfAiYd8lPFeDq4oXEc+Ax1QYxw1IOwH9mklc
         dtcauTX9seK9Fnp2zFQkOhA8+fyhLerKjmpMkqgOBATxawweMD9p7ih7Y8xMzXhIMfNY
         4PjSp0VCeAcQw69il9r6t1mQ6td0vQ6hW7JdcTr1nqwNjMXXKvCVyJla1VIFLtZdAzvj
         bHyxfrXc5lwtWWTSX+OvKgxygNRfO9VrPLhEOtQqj2oTGxQL4xrG8eAdkWpvJs45Gsqr
         iBvRtZXP1NwSwj2tQbcJhSqgpuWvOfdAVBRcVHprER6/WcU3LOV88rQK2ciK1hwW3Rk5
         7WdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700838257; x=1701443057;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l/uTADgd8yavomJvu4FPF4hVWKDAN545TEF230idRIM=;
        b=KK5PZJDiPNq1QtxXb+mDkFWZfn2N+oj7pJtK4vhJxIqDmypWgbs2IB7YdQMo0HtNaj
         VwiSCzhfcSP7xm31XVfJa8ztlCHmYm5WyO2Xxu7fdqnfmE8OPRvAQVm7fXRENvmnMqxy
         rCsMjLnb8MqD5saTIRv+/aRw1PWTECCQ1oa64mVJjeTsrEi0Fe8dZPVjYuRWf7At9nM8
         6djKML3L/zLhWznBUNailwBT2WGqcVjpPR5JM1ubBEvzphVgtuwsWPKHim9rt8y29ONX
         mrcBa3TM4vrsf+Y3zVYQy2pnxDJ5QzK3Q6SepZ5Ob+FqqhvbXBAlMfCPsR0YBDytYCEh
         vhAA==
X-Gm-Message-State: AOJu0YzkMYXkmxBKXLbvi21Qa2fRCZQe7xkU8XO2er59TqzxPBCYGArh
	qi0g2D7LU3OCFls6z+xOU2DkF5P1Fnmyk58a5zU=
X-Google-Smtp-Source: AGHT+IGn6rzI1NHfvj2S91FrsEfWhu1mpfJ9nScpB8mMaoymohn6mrpA57mTUjJApelr8DTsyC/emZM0XfrDO6gs3Qc=
X-Received: by 2002:ac5:cde1:0:b0:4ab:fbff:a811 with SMTP id
 v1-20020ac5cde1000000b004abfbffa811mr2973431vkn.14.1700838257213; Fri, 24 Nov
 2023 07:04:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231122121235.827122-1-peterlin@andestech.com> <20231122121235.827122-5-peterlin@andestech.com>
In-Reply-To: <20231122121235.827122-5-peterlin@andestech.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 24 Nov 2023 15:03:51 +0000
Message-ID: <CA+V-a8t+vgrwDe9OxqMNHdcVX+qq76DuskF0ETCri4VeP-FAbg@mail.gmail.com>
Subject: Re: [PATCH v4 04/13] dt-bindings: riscv: Add Andes interrupt
 controller compatible string
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
> Add "andestech,cpu-intc" compatible string to indicate that
> Andes specific local interrupt is supported on the core,
> e.g. AX45MP cores have 3 types of non-standard local interrupt
> can be handled in supervisor mode:
>
> - Slave port ECC error interrupt
> - Bus write transaction error interrupt
> - Performance monitor overflow interrupt
>
> These interrupts are enabled/disabled via a custom register
> SLIE instead of the standard interrupt enable register SIE.
>
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> ---
> Changes v1 -> v2:
>   - New patch
> Changes v2 -> v3:
>   - Updated commit message
>   - Fixed possible compatibles for Andes INTC
> Changes v3 -> v4:
>   - Add const entry instead of enum (Suggested by Conor)
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Document=
ation/devicetree/bindings/riscv/cpus.yaml
> index f392e367d673..50307554478f 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -100,7 +100,11 @@ properties:
>          const: 1
>
>        compatible:
> -        const: riscv,cpu-intc
> +        oneOf:
> +          - items:
> +              - const: andestech,cpu-intc
given that the first patch renames andestech -> andes, do you want to
follow the same here?

> +              - const: riscv,cpu-intc
> +          - const: riscv,cpu-intc
>
>        interrupt-controller: true
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> --
> 2.34.1
>
>
