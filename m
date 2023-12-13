Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEADB2E3FF
	for <linux-sunxi@lists.linux.dev>; Wed, 13 Dec 2023 14:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="BdPmD4oT"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2cc3647bf06so9459941fa.2
        for <linux-sunxi@lists.linux.dev>; Wed, 13 Dec 2023 06:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1702477693; x=1703082493; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wYCVDEfmEpAAq2joADzIDjMSoQFlP/Ou+pXsJQt/qSE=;
        b=BdPmD4oTvaum/fZkpFkLG2RhfRFSeLZqEyLjLBVQIPwAADXFqiOXO2SwbbOo9wT5Q3
         ebIRAlTfP8RDL2JGThvZnrLXO65HDedsNL5laR7GB7OMun9hi7XxvnDQlSQ6ySx8Wd5D
         jAVkaPQTyfedw+rOch6QxWLds0H6Fs8NaAGpwdRqkdYrjLdQHSz5EWuVJPQ5kx4Hccdq
         q0ZTHwUgTSyAoXgFhFZkuKxmbpqqXLf+WVivDWcNUdpzu0wCIFTN6BXDKhZ1hJAzpvgu
         +iplmeSO116/qWgsJcgQHws6+GboBc2dgh+Cdnnfe3cnccNAb+G1KGYEy1izotLi1Ugd
         tPng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702477693; x=1703082493;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wYCVDEfmEpAAq2joADzIDjMSoQFlP/Ou+pXsJQt/qSE=;
        b=VWnL0Z27W9ZRAMdea085X2w9OOvoUgwc39fo9tcQ3TWz+6gNBAydl1GHEDxEr+R1TT
         n7R4mfVt3Tq21u69ere8D6bU0GZafHZxUX40so5q1xnQyNpfElFBc5hreGFHY8I+AUQ1
         s5zsTFAuEMIbgBViK+TazmEIRYOro07YwkdDp+e2FABMOkPMxAUtzASDbqG5NbMua+je
         qXTtmsANsCNBiNKC9fWGmD8CCVg8T5lW6DueuK3BMH8k7vMB1QXgmwr3aemQReIbxIhw
         jVW9kf/pEqLNX7VBFTd3R5olQY+CZ7LId2uadKGg9ysFNTSAMSmqYKRHoyhasIWUGBiq
         nwHA==
X-Gm-Message-State: AOJu0YyOXVxSDz2ocIFnIliwn36Dd7hh+V+Oqsw0XztaUT6uEfxOF2h1
	FMIhOamFT/2431gh2uYfNUcC3KiEiJSBoH0WUgyS9g==
X-Google-Smtp-Source: AGHT+IHDmlLtTkFMLJW7VNJT8SlVJHCzmvG4k5wsYrRIgEpE6i0fDa0/acLJ4JdcgtstAE4LD4tfwFQKOdBlv8mM9Vw=
X-Received: by 2002:a2e:bea7:0:b0:2cb:2b04:cf92 with SMTP id
 a39-20020a2ebea7000000b002cb2b04cf92mr2250407ljr.11.1702477692628; Wed, 13
 Dec 2023 06:28:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231213070301.1684751-1-peterlin@andestech.com> <20231213070301.1684751-3-peterlin@andestech.com>
In-Reply-To: <20231213070301.1684751-3-peterlin@andestech.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 13 Dec 2023 19:58:00 +0530
Message-ID: <CAK9=C2WuuYQD8ydrHP16hUXVk6RuKLbfvUe_GpUGw9ppe3Rd8Q@mail.gmail.com>
Subject: Re: [PATCH v5 02/16] irqchip/riscv-intc: Allow large non-standard
 interrupt number
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

On Wed, Dec 13, 2023 at 12:34=E2=80=AFPM Yu Chien Peter Lin
<peterlin@andestech.com> wrote:
>
> Currently, the implementation of the RISC-V INTC driver uses the
> interrupt cause as hardware interrupt number and has a limitation of
> supporting a maximum of 64 interrupts. However, according to the
> privileged spec, interrupt causes >=3D 16 are defined for platform use.

I disagree with this patch.

Even though RISC-V priv sepc allows interrupt causes >=3D 16, we
still need CSRs to manage arbitrary local interrupts

Currently, we have following standard CSRs:
1) [m|s]ie and [m|s]ip which are XLEN wide
2) With AIA, we have [m|s]ieh and [m|s]iph for RV32

Clearly, we can only have a XLEN number of standard local
interrupts without AIA and 64 local interrupts with AIA.

Now for implementations with custom CSRs (such as Andes),
we still can't assume infinite local interrupts because HW will
have a finite number of custom CSRs.

>
> This limitation prevents to fully utilize the available local interrupt
> sources. Additionally, the interrupt number used on RISC-V are sparse,
> with only interrupt numbers 1, 5 and 9 (plus Sscofpmf or T-Head's PMU
> interrupt) being currently used for supervisor mode.
>
> Switch to using irq_domain_create_tree() to create the radix tree
> map, so a larger number of hardware interrupts can be handled.
>
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> Reviewed-by: Charles Ci-Jyun Wu <dminus@andestech.com>
> Reviewed-by: Leo Yu-Chi Liang <ycliang@andestech.com>
> ---
> Changes v1 -> v2:
>   - Fixed irq mapping failure checking (suggested by Cl=C3=A9ment and Anu=
p)
> Changes v2 -> v3:
>   - No change
> Changes v3 -> v4: (Suggested by Thomas [1])
>   - Use pr_warn_ratelimited instead
>   - Fix coding style and commit message
> Changes v4 -> v5: (Suggested by Thomas)
>   - Fix commit message
>
> [1] https://patchwork.kernel.org/project/linux-riscv/patch/20231023004100=
.2663486-3-peterlin@andestech.com/#25573085
> ---
>  drivers/irqchip/irq-riscv-intc.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv=
-intc.c
> index e8d01b14ccdd..2fdd40f2a791 100644
> --- a/drivers/irqchip/irq-riscv-intc.c
> +++ b/drivers/irqchip/irq-riscv-intc.c
> @@ -24,10 +24,9 @@ static asmlinkage void riscv_intc_irq(struct pt_regs *=
regs)
>  {
>         unsigned long cause =3D regs->cause & ~CAUSE_IRQ_FLAG;
>
> -       if (unlikely(cause >=3D BITS_PER_LONG))
> -               panic("unexpected interrupt cause");
> -
> -       generic_handle_domain_irq(intc_domain, cause);
> +       if (generic_handle_domain_irq(intc_domain, cause))
> +               pr_warn_ratelimited("Failed to handle interrupt (cause: %=
ld)\n",
> +                                   cause);
>  }
>
>  /*
> @@ -117,8 +116,7 @@ static int __init riscv_intc_init_common(struct fwnod=
e_handle *fn)
>  {
>         int rc;
>
> -       intc_domain =3D irq_domain_create_linear(fn, BITS_PER_LONG,
> -                                              &riscv_intc_domain_ops, NU=
LL);
> +       intc_domain =3D irq_domain_create_tree(fn, &riscv_intc_domain_ops=
, NULL);

I disagree with this change based on the reasoning above.

Instead of this, we should determine the number of local interrupts
based on the type of RISC-V intc:
1) For standard INTC without AIA, we have XLEN (or BITS_PER_LONG)
    local interrupts
2) For standart INTC with AIA, we have 64 local interrupts
3) For custom INTC (such as Andes), the number of local interrupt
    should be custom (Andes specific) which can be determined based
    on compatible string.

Also, creating a linear domain with a fixed number of local interrupts
ensures that drivers can't map a local interrupt beyond the availability
of CSRs to manage it.

>         if (!intc_domain) {
>                 pr_err("unable to add IRQ domain\n");
>                 return -ENXIO;
> @@ -132,8 +130,6 @@ static int __init riscv_intc_init_common(struct fwnod=
e_handle *fn)
>
>         riscv_set_intc_hwnode_fn(riscv_intc_hwnode);
>
> -       pr_info("%d local interrupts mapped\n", BITS_PER_LONG);
> -

Same as above, we should definitely advertise the type of INTC and
number of local interrupts mapped.

Regards,
Anup

>         return 0;
>  }
>
> --
> 2.34.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
