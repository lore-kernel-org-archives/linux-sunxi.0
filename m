Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2698A168B8
	for <linux-sunxi@lists.linux.dev>; Fri, 12 Jan 2024 20:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atishpatra.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="koKjM8Dc"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2cd8b661cb8so20997381fa.0
        for <linux-sunxi@lists.linux.dev>; Fri, 12 Jan 2024 12:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1705090655; x=1705695455; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pdPl62Kj42qLAAkF8TWMuSZ2lBBKNdyCgrrnQIbbjq8=;
        b=koKjM8DcihDp2Sb03+xnkeuy0emRR9RXhkNFt0DwjgjSj2k3rJbCZdVQ6pB10/b4uY
         1WzD4H8lYAaaf8LqVFeoxKGcW+3NWqvKynFrm2mqBYZtWQ0dUbJW9laXmx87dvgYIxDv
         EJng97HwX/lUYVj0ZyQ2W907zGd7MYnj8ew0M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705090655; x=1705695455;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pdPl62Kj42qLAAkF8TWMuSZ2lBBKNdyCgrrnQIbbjq8=;
        b=gwtT/cwXH0RSIpNv1228m3mx84Pha5+IIpVQD/1zNUHbMioRqpYHphXlzanK7eN9wX
         p54UpLt+u4npMPKDZrCg2S+N9wMmtz8+QBknlWbRYQ2nmK5WdtAKpBU5g4JsTvDAtQz3
         EDFmXQsCMt0pPqM7XtKch+NNMgkjAUcqzvtTzAYzM9M5mbgUMI6kGVPAEF2KAwU1eNIR
         f09AARbLvX5iN8KtyfhBgsLRWIpeS8fO6zoWopPtPU7cXbW5pAFu477rrITjv0ov01/v
         eVPX8zLgCLYQf+4oSLIa54HfJQITqLRGabEMHCACRublgUumGmRCVcrr5jVGdCSuEgNH
         T4Qw==
X-Gm-Message-State: AOJu0YytE2Qe6I+c+knc89McUUKDorHY3DPIAqIHgqmb3yEjjFnP6UFv
	luTkS0pK+Rr+jUiCY1NfC9bzxKoki3R0YEB9QWSxmVyh5gdq
X-Google-Smtp-Source: AGHT+IH9QK11T/Suh1c1OYYHTXmVh+no7GMm/AzsKYmS9El+CD8gOLnlidxHzce7VuVJ4ZtS2BQI67YGB4XrpVAbABo=
X-Received: by 2002:a2e:740d:0:b0:2cd:900c:d5ff with SMTP id
 p13-20020a2e740d000000b002cd900cd5ffmr665638ljc.0.1705090654991; Fri, 12 Jan
 2024 12:17:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240110073917.2398826-1-peterlin@andestech.com> <20240110073917.2398826-7-peterlin@andestech.com>
In-Reply-To: <20240110073917.2398826-7-peterlin@andestech.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 12 Jan 2024 12:17:23 -0800
Message-ID: <CAOnJCUJuDk6euX_XKiQ3H=TSGU02fgGgqSq-WycDwurq1XkDHw@mail.gmail.com>
Subject: Re: [PATCH v7 06/16] perf: RISC-V: Eliminate redundant interrupt
 enable/disable operations
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
> The interrupt enable/disable operations are already performed by the
> IRQ chip functions riscv_intc_irq_unmask()/riscv_intc_irq_mask() during
> enable_percpu_irq()/disable_percpu_irq(). It can be done only once.
>
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> ---
> This patch allows us to drop unnecessary ALT_SBI_PMU_OVF_{DISABLE,ENABLE}
> in the initial PATCH3 [1].
>
> [1] https://patchwork.kernel.org/project/linux-riscv/patch/20230907021635=
.1002738-4-peterlin@andestech.com/
>
> Changes v1 -> v2:
>   - New patch
> Changes v2 -> v3:
>   - No change
> Changes v3 -> v4:
>   - No change
> Changes v4 -> v5:
>   - No change
> Changes v5 -> v6:
>   - No change
> Changes v6 -> v7:
>   - No change
> ---
>  drivers/perf/riscv_pmu_sbi.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 16acd4dcdb96..2edbc37abadf 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -781,7 +781,6 @@ static int pmu_sbi_starting_cpu(unsigned int cpu, str=
uct hlist_node *node)
>         if (riscv_pmu_use_irq) {
>                 cpu_hw_evt->irq =3D riscv_pmu_irq;
>                 csr_clear(CSR_IP, BIT(riscv_pmu_irq_num));
> -               csr_set(CSR_IE, BIT(riscv_pmu_irq_num));
>                 enable_percpu_irq(riscv_pmu_irq, IRQ_TYPE_NONE);
>         }
>
> @@ -792,7 +791,6 @@ static int pmu_sbi_dying_cpu(unsigned int cpu, struct=
 hlist_node *node)
>  {
>         if (riscv_pmu_use_irq) {
>                 disable_percpu_irq(riscv_pmu_irq);
> -               csr_clear(CSR_IE, BIT(riscv_pmu_irq_num));
>         }
>
>         /* Disable all counters access for user mode now */
> --
> 2.34.1
>

Reviewed-by: Atish Patra <atishp@rivosinc.com>

--=20
Regards,
Atish
