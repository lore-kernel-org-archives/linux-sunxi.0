Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E026143862
	for <linux-sunxi@lists.linux.dev>; Thu, 16 May 2024 13:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715865109; cv=none; b=P8wxbaERh35S0bumukGUXdi8LNoB6T6P84bK23dvfTnmZtELyoYrc0hTrYR1HeeGszXu1wfTq/C7wGTJUHOY1HhWpXpgm8MuUj8+0NVLZZbQ5Bc3DTcxyXJRR2V0gJ9pOzvfDj7IqRnnyqHzfkdNg/cSmablxR9WzIP7DltiZ1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715865109; c=relaxed/simple;
	bh=Wi6fPWBM2N13lqz1ePjmrOpqRQ8zl8M+Hd0GZZShN44=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NxUFQE6t86Nlj8ZPz+OfsVFtXx7V8r+rwFsnYiGiXM45VTnqmCRd1yZ6revqA6ki59yO2nvjMvsEThbG2FreKt5vw4Yk5XO5bTP3Wrtg9CuVird+dvZkwWDwOTDdM6hijm+TjQvROkTl0gcBymeigWlRFyf9DxdRF6GhPNMcXbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=Eq3lHSkS; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Eq3lHSkS"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6277a2bb35fso5282547b3.1
        for <linux-sunxi@lists.linux.dev>; Thu, 16 May 2024 06:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1715865106; x=1716469906; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4V904prVi6oQ5IyZz7aDLXAgfOChEzLZtTfRAaiZkwU=;
        b=Eq3lHSkSWqkTa9peveTMYOv5YlIn/T4WsPzNiH3eR6Ik6wwegq4kYo3gnhLsGTTuZ7
         TdSINTGEKH1kKdp661oUTQ18EkjsKgIjU+46K2Xmpwjxk8FKj9M0axSU32i0W2Bqx5AC
         SkMLk57N8Wdy0sqMDksXg16U7DtuWS/gHBNzyu0ERunZyPbfG84G+0FCaxikruf8d1LR
         7WuROJS6ULKru5PDBQT9IxwOLTOW3KPagjuhx+TY8LCISNx+x42MPZya9uIalBCsbSHs
         uKOfaymzD+G4eDyFjuAlW1rpRbeYPihSx2kYJjPA1pgP2VlNgukD30aILejGKz10RmOE
         xNyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715865106; x=1716469906;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4V904prVi6oQ5IyZz7aDLXAgfOChEzLZtTfRAaiZkwU=;
        b=Aj9lEG6LUtT7sbqfGYMKR12nyIk2rSzcBN2810bV93iWk9hlK1/ND0kCGHlWCobDOQ
         D/l1X8YipvKiYYwzK/QYkLauPo80dU8Gu0Z6PUr0X8nCT7H5KYdxxP1mFc/ArrLazvlX
         /mfOFsHJQZJIabYc2zQwVcpXcY7KkHILZjom8DcLVXSObKiw0WJQ+JaGfvbN57Q8o8Fz
         nrp0V2qDwgQZ76XgLbuvMo9n/9loNjhhEWx7AzadXA7QaRlmXPNA0BJoX1zzxWyhgNIg
         H4NnSS1QRw7TjSwC+YS+po/SlzV1aFtaSAhbmuHn0CEEJIgZGFifY5aE9j+qZH7X7L4r
         AHiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsoAPt4Q7Vi0gBynVA+chfhEl+9hCtTsUMNWsoWlGOgmP0/4IxUK7GNJUN+PNno0ttgWaLObpSDDowpVn22CYrPmJdHFq3Oocvi/g=
X-Gm-Message-State: AOJu0YyRwhinvdN3xvOa6gN6mlLYH7Gq2tHMXewBukUKRwdde1j4Xit5
	Wjx3d3vuda1HBEMGCBIMettey30riHLkGDQIoX78k4IB+Pm2qzO8Pdb1t34m7KAPJp/WFoSYDdr
	HI2/wXu01nShRf0laWEASIFQpq2qGOw6zFQNCFA==
X-Google-Smtp-Source: AGHT+IH5FRDo7BDlg+tWZAgAOlCiAfHazME5mq8JEMAmJ+ns26s+bWNHf5N3/miLQXMAqpV9jaca9Qw0iocuCcuU1Ac=
X-Received: by 2002:a81:77c2:0:b0:618:9198:1a9b with SMTP id
 00721157ae682-622af7af307mr115191067b3.3.1715865105680; Thu, 16 May 2024
 06:11:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240503-dev-charlie-support_thead_vector_6_9-v6-0-cb7624e65d82@rivosinc.com>
 <20240503-dev-charlie-support_thead_vector_6_9-v6-3-cb7624e65d82@rivosinc.com>
In-Reply-To: <20240503-dev-charlie-support_thead_vector_6_9-v6-3-cb7624e65d82@rivosinc.com>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Thu, 16 May 2024 21:11:33 +0800
Message-ID: <CABgGipUJ1hk_N6Vka2j12o80bxpDbAadJVBHdoLncrQEaBPoaw@mail.gmail.com>
Subject: Re: [PATCH v6 03/17] riscv: vector: Use vlenb from DT
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 4, 2024 at 2:21=E2=80=AFAM Charlie Jenkins <charlie@rivosinc.co=
m> wrote:
>
> If vlenb is provided in the device tree, prefer that over reading the
> vlenb csr.
>
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>

I agree with Conor that we need a mechanism to turn off v and all
depending extensions with has_riscv_homogeneous_vlenb(). And that can
come after this.

Thanks for adding the homogeneous vlen checking!

Reviewed-by: Andy Chiu <andy.chiu@sifive.com>

> ---
>  arch/riscv/include/asm/cpufeature.h |  2 ++
>  arch/riscv/kernel/cpufeature.c      | 47 +++++++++++++++++++++++++++++++=
++++++
>  arch/riscv/kernel/vector.c          | 12 +++++++++-
>  3 files changed, 60 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm=
/cpufeature.h
> index 347805446151..0c4f08577015 100644
> --- a/arch/riscv/include/asm/cpufeature.h
> +++ b/arch/riscv/include/asm/cpufeature.h
> @@ -31,6 +31,8 @@ DECLARE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
>  /* Per-cpu ISA extensions. */
>  extern struct riscv_isainfo hart_isa[NR_CPUS];
>
> +extern u32 riscv_vlenb_of;
> +
>  void riscv_user_isa_enable(void);
>
>  #if defined(CONFIG_RISCV_MISALIGNED)
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index 3ed2359eae35..6c143ea9592b 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -35,6 +35,8 @@ static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __r=
ead_mostly;
>  /* Per-cpu ISA extensions. */
>  struct riscv_isainfo hart_isa[NR_CPUS];
>
> +u32 riscv_vlenb_of;
> +
>  /**
>   * riscv_isa_extension_base() - Get base extension word
>   *
> @@ -648,6 +650,46 @@ static int __init riscv_isa_fallback_setup(char *__u=
nused)
>  early_param("riscv_isa_fallback", riscv_isa_fallback_setup);
>  #endif
>
> +static int has_riscv_homogeneous_vlenb(void)
> +{
> +       int cpu;
> +       u32 prev_vlenb =3D 0;
> +       u32 vlenb;
> +
> +       /* Ignore vlenb if vector is not enabled in the kernel */
> +       if (!IS_ENABLED(CONFIG_RISCV_ISA_V))
> +               return 0;
> +
> +       for_each_possible_cpu(cpu) {
> +               struct device_node *cpu_node;
> +
> +               cpu_node =3D of_cpu_device_node_get(cpu);
> +               if (!cpu_node) {
> +                       pr_warn("Unable to find cpu node\n");
> +                       return -ENOENT;
> +               }
> +
> +               if (of_property_read_u32(cpu_node, "riscv,vlenb", &vlenb)=
) {
> +                       of_node_put(cpu_node);
> +
> +                       if (prev_vlenb)
> +                               return -ENOENT;
> +                       continue;
> +               }
> +
> +               if (prev_vlenb && vlenb !=3D prev_vlenb) {
> +                       of_node_put(cpu_node);
> +                       return -ENOENT;
> +               }
> +
> +               prev_vlenb =3D vlenb;
> +               of_node_put(cpu_node);
> +       }
> +
> +       riscv_vlenb_of =3D vlenb;
> +       return 0;
> +}
> +
>  void __init riscv_fill_hwcap(void)
>  {
>         char print_str[NUM_ALPHA_EXTS + 1];
> @@ -671,6 +713,11 @@ void __init riscv_fill_hwcap(void)
>                         pr_info("Falling back to deprecated \"riscv,isa\"=
\n");
>                         riscv_fill_hwcap_from_isa_string(isa2hwcap);
>                 }
> +
> +               if (elf_hwcap & COMPAT_HWCAP_ISA_V && has_riscv_homogeneo=
us_vlenb() < 0) {
> +                       pr_warn("Unsupported heterogeneous vlen detected,=
 vector extension disabled.\n");
> +                       elf_hwcap &=3D ~COMPAT_HWCAP_ISA_V;
> +               }
>         }
>
>         /*
> diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
> index 6727d1d3b8f2..e04586cdb7f0 100644
> --- a/arch/riscv/kernel/vector.c
> +++ b/arch/riscv/kernel/vector.c
> @@ -33,7 +33,17 @@ int riscv_v_setup_vsize(void)
>  {
>         unsigned long this_vsize;
>
> -       /* There are 32 vector registers with vlenb length. */
> +       /*
> +        * There are 32 vector registers with vlenb length.
> +        *
> +        * If the riscv,vlenb property was provided by the firmware, use =
that
> +        * instead of probing the CSRs.
> +        */
> +       if (riscv_vlenb_of) {
> +               this_vsize =3D riscv_vlenb_of * 32;
> +               return 0;
> +       }
> +
>         riscv_v_enable();
>         this_vsize =3D csr_read(CSR_VLENB) * 32;
>         riscv_v_disable();
>
> --
> 2.44.0
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
