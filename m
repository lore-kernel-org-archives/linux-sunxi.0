Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6651A5AD
	for <linux-sunxi@lists.linux.dev>; Fri, 12 Jan 2024 23:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atishpatra.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="gvABCl3+"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2cca8eb0509so87080861fa.3
        for <linux-sunxi@lists.linux.dev>; Fri, 12 Jan 2024 15:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1705103426; x=1705708226; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KdVVm44GspY1vrqagFO17oKocrrGuSEpWF2qOryhvaY=;
        b=gvABCl3+gkz3fe9QH8MGikJ7juOOLYk2qNgHe1htJcRcRdEr9yhmOHogGHCZMILm5m
         40o/maU9QiulzD/qAjEG5N0DOLdJTOuwleJKtP3oa1dehg+RHfNlSpWvH5ok+88irTpU
         Ff9yvRpNAu4xqSGNYQkETUHR5Afkw391b6tpY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705103426; x=1705708226;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KdVVm44GspY1vrqagFO17oKocrrGuSEpWF2qOryhvaY=;
        b=dZZin0CCKT3rugstgSYry18sjRMoIALpT7vvuRtGfANcHkftdwYCBqOYuBoJDKwbuL
         TgHJBPRHIOqVguqx/F6cDV1lW3P7h9mqBWmpz4/w6qwQDoIe5Pl1g/zrxk54d8I81/cU
         LXgCXb9ZYgsS+gx/J3yoXccmDAwheUJiRkRHVY9n0WWr2hyF9RwXwWcFI08FPXZsuyZs
         ROTh8+JzpM3xVlhpmGXYH3eKPteUkluoOxuE5LXZiXO9RobFNX0UzBVndshYuIG0abm3
         CMXoar6ZMcJtcGx6SqsXnabe5W9Ajq2bW4xRQknu/P/ijtcYiASUM7qSVBCGqEE5EMCJ
         LQWw==
X-Gm-Message-State: AOJu0YxRlhaJJeWPz59vtvkbZzT17xQSjmdXYyqgzAC4sYYYvhwgqud1
	T0KSEhT7F904S8AN4PRv1mNV9YtWQCwYSEYBe9902YiX2QuT
X-Google-Smtp-Source: AGHT+IG74fXTZOq2nIQGkABoTQvuIWpEvgArH4ko847NqdeZiegoSZ+CvkTfc7jJcqd/iuL4Jfoat0JYTgOT3NmkpCw=
X-Received: by 2002:a2e:a36e:0:b0:2cd:8fe0:70ab with SMTP id
 i14-20020a2ea36e000000b002cd8fe070abmr1011564ljn.16.1705103426437; Fri, 12
 Jan 2024 15:50:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240110073917.2398826-1-peterlin@andestech.com> <20240110073917.2398826-5-peterlin@andestech.com>
In-Reply-To: <20240110073917.2398826-5-peterlin@andestech.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 12 Jan 2024 15:50:15 -0800
Message-ID: <CAOnJCUJ0fN5=+b4jDx+NPqUwgwGKuBNYt7d86dXYNyjzUYFAWQ@mail.gmail.com>
Subject: Re: [PATCH v7 04/16] dt-bindings: riscv: Add Andes interrupt
 controller compatible string
To: Yu Chien Peter Lin <peterlin@andestech.com>
Cc: acme@kernel.org, adrian.hunter@intel.com, ajones@ventanamicro.com, 
	alexander.shishkin@linux.intel.com, andre.przywara@arm.com, 
	anup@brainfault.org, aou@eecs.berkeley.edu, conor+dt@kernel.org, 
	conor.dooley@microchip.com, conor@kernel.org, devicetree@vger.kernel.org, 
	dminus@andestech.com, evan@rivosinc.com, geert+renesas@glider.be, 
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
	uwu@icenowy.me, wens@csie.org, will@kernel.org, ycliang@andestech.com, 
	inochiama@outlook.com, chao.wei@sophgo.com, unicorn_wang@outlook.com, 
	wefu@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 9, 2024 at 11:40=E2=80=AFPM Yu Chien Peter Lin
<peterlin@andestech.com> wrote:
>
> Add "andestech,cpu-intc" compatible string to indicate that
> Andes specific local interrupt is supported on the core,
> e.g. AX45MP cores have 3 types of non-standard local interrupt
> which can be handled in supervisor mode:
>

PATCH1 in this series renames everything from ANDESTECH to ANDES to be
consistent.
Here you are adding DT binding with "andestech". Is there any
fundamental difference between these two to demand
this change ?

FYI: I don't mind either way as I don't have skin in the game. Just
something I noticed while reviewing the series.

> - Slave port ECC error interrupt
> - Bus write transaction error interrupt
> - Performance monitor overflow interrupt
>
> These interrupts are enabled/disabled via a custom register
> SLIE instead of the standard interrupt enable register SIE.
>
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> Changes v1 -> v2:
>   - New patch
> Changes v2 -> v3:
>   - Updated commit message
>   - Fixed possible compatibles for Andes INTC
> Changes v3 -> v4:
>   - Add const entry instead of enum (Suggested by Conor)
> Changes v4 -> v5:
>   - Include Conor's Acked-by
>   - Include Prabhakar's Reviewed-by
> Changes v5 -> v6:
>   - No change
> Changes v6 -> v7:
>   - No change
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Document=
ation/devicetree/bindings/riscv/cpus.yaml
> index 23646b684ea2..33c2b620a59f 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -101,7 +101,11 @@ properties:
>          const: 1
>
>        compatible:
> -        const: riscv,cpu-intc
> +        oneOf:
> +          - items:
> +              - const: andestech,cpu-intc
> +              - const: riscv,cpu-intc
> +          - const: riscv,cpu-intc
>
>        interrupt-controller: true
>
> --
> 2.34.1
>


--=20
Regards,
Atish
