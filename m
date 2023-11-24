Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A96018E35
	for <linux-sunxi@lists.linux.dev>; Fri, 24 Nov 2023 14:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZB5SbaN5"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-6d7f2058213so1127142a34.1
        for <linux-sunxi@lists.linux.dev>; Fri, 24 Nov 2023 06:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700837861; x=1701442661; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=McONVnnVXBzrRAKYWOt6koN2Gq2PdEQz7Bj2evyzgvA=;
        b=ZB5SbaN5unwyJ7D4BWseBcwm0YWRvpFIbsTTHI+pGi87NPzxjd9otgUt2gK/SighoI
         RIMbPSyRSQxHhgZvwcQxDPOyo1fTKPBtfYEXj6U+bCtdbt/zFZCpAjjKO17ZOhui3xiZ
         D4SY5XreKyYGhMW+GFGUIG+HhOuWWrNrRQ3qg03aWOs96wdyqNSGkglinrfv0CAR2GHZ
         jTKNQNKTkTcuaXEG4G6oc6YLZtd9sI5tHd/fk5DfqoezQ4CSmVWlN7U56xMfk8ZpFPqh
         U4tVEjjxnDIrffVxnQDfKCeZ4JgtgL7kJfzHxm+c1VRxSNXvroMDHBxa5AY2WiFCeohY
         N6HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700837861; x=1701442661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=McONVnnVXBzrRAKYWOt6koN2Gq2PdEQz7Bj2evyzgvA=;
        b=mCpDZG/0d8Munr9/TKQjpNGXhbnULZ8AFWkxCFuyArDU7nQZhf3MQl1NDAWAquciPg
         YHNt20nGRaOKIuK8VAODgRQ3w0V+0gD8ScEh5/Yav5od6LOyIJU3p6nrrmqULKysixpQ
         Vf+06H/vFzxhZzXdfYxWxsd8TVk5+f/Gepac+DQyR+P1B1AniaCk/nMAOV+KFa9WXjb+
         tabc37eVKiOhRApsD+s0zvmO2NfvIJvRbvRIZdW5D+X1ffw8VQMRL+b0EusyoJRsRCnH
         R4b06lwAQC0o3vZ1Vb/XFr46FA5QVJvv7ezASfoMTsZmFJTPScnzZLhLBRrTGWwC6GIs
         dq6Q==
X-Gm-Message-State: AOJu0YyhJ4bFxxoM2z+XriPsdyJf6WNBx7GEs7tYn8Avkx6/s8I2lVRY
	aLWwoUrcaM9KjsV8bRRchkia3z2pQNwW2IamyEE=
X-Google-Smtp-Source: AGHT+IFyw54KdvX5NZtpjxNOebZ/DdQWx5nul4bTgzQLtaMiqrgW8bakiEzPtq/Ulcd5S/faM446P2Jo1/UeRTY/fHI=
X-Received: by 2002:a05:6358:9198:b0:16d:f02d:d394 with SMTP id
 j24-20020a056358919800b0016df02dd394mr2754632rwa.14.1700837860947; Fri, 24
 Nov 2023 06:57:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231122121235.827122-1-peterlin@andestech.com> <20231122121235.827122-2-peterlin@andestech.com>
In-Reply-To: <20231122121235.827122-2-peterlin@andestech.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 24 Nov 2023 14:57:15 +0000
Message-ID: <CA+V-a8tS0hE_aDEk6RwhhjjEPP-OQpg1zuRbFrK7JdHtLCUTYA@mail.gmail.com>
Subject: Re: [PATCH v4 01/13] riscv: errata: Rename defines for Andes
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
> Using "ANDES" rather than "ANDESTECH" to unify the naming
> convention with directory, file names, Kconfig options
> and other definitions.
>
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> Reviewed-by: Charles Ci-Jyun Wu <dminus@andestech.com>
> Reviewed-by: Leo Yu-Chi Liang <ycliang@andestech.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> Changes v1 -> v2:
>   - No change
> Changes v2 -> v3:
>   - Rewrote commit message (suggested by Conor)
> Changes v3 -> v4:
>   - Include Conor's Acked-by tag
> ---
>  arch/riscv/errata/andes/errata.c       | 10 +++++-----
>  arch/riscv/include/asm/errata_list.h   |  4 ++--
>  arch/riscv/include/asm/vendorid_list.h |  2 +-
>  arch/riscv/kernel/alternative.c        |  2 +-
>  4 files changed, 9 insertions(+), 9 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/arch/riscv/errata/andes/errata.c b/arch/riscv/errata/andes/e=
rrata.c
> index 197db68cc8da..d2e1abcac967 100644
> --- a/arch/riscv/errata/andes/errata.c
> +++ b/arch/riscv/errata/andes/errata.c
> @@ -18,9 +18,9 @@
>  #include <asm/sbi.h>
>  #include <asm/vendorid_list.h>
>
> -#define ANDESTECH_AX45MP_MARCHID       0x8000000000008a45UL
> -#define ANDESTECH_AX45MP_MIMPID                0x500UL
> -#define ANDESTECH_SBI_EXT_ANDES                0x0900031E
> +#define ANDES_AX45MP_MARCHID           0x8000000000008a45UL
> +#define ANDES_AX45MP_MIMPID            0x500UL
> +#define ANDES_SBI_EXT_ANDES            0x0900031E
>
>  #define ANDES_SBI_EXT_IOCP_SW_WORKAROUND       1
>
> @@ -32,7 +32,7 @@ static long ax45mp_iocp_sw_workaround(void)
>          * ANDES_SBI_EXT_IOCP_SW_WORKAROUND SBI EXT checks if the IOCP is=
 missing and
>          * cache is controllable only then CMO will be applied to the pla=
tform.
>          */
> -       ret =3D sbi_ecall(ANDESTECH_SBI_EXT_ANDES, ANDES_SBI_EXT_IOCP_SW_=
WORKAROUND,
> +       ret =3D sbi_ecall(ANDES_SBI_EXT_ANDES, ANDES_SBI_EXT_IOCP_SW_WORK=
AROUND,
>                         0, 0, 0, 0, 0, 0);
>
>         return ret.error ? 0 : ret.value;
> @@ -43,7 +43,7 @@ static bool errata_probe_iocp(unsigned int stage, unsig=
ned long arch_id, unsigne
>         if (!IS_ENABLED(CONFIG_ERRATA_ANDES_CMO))
>                 return false;
>
> -       if (arch_id !=3D ANDESTECH_AX45MP_MARCHID || impid !=3D ANDESTECH=
_AX45MP_MIMPID)
> +       if (arch_id !=3D ANDES_AX45MP_MARCHID || impid !=3D ANDES_AX45MP_=
MIMPID)
>                 return false;
>
>         if (!ax45mp_iocp_sw_workaround())
> diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/as=
m/errata_list.h
> index 83ed25e43553..4ed21a62158c 100644
> --- a/arch/riscv/include/asm/errata_list.h
> +++ b/arch/riscv/include/asm/errata_list.h
> @@ -12,8 +12,8 @@
>  #include <asm/vendorid_list.h>
>
>  #ifdef CONFIG_ERRATA_ANDES
> -#define ERRATA_ANDESTECH_NO_IOCP       0
> -#define ERRATA_ANDESTECH_NUMBER                1
> +#define ERRATA_ANDES_NO_IOCP 0
> +#define ERRATA_ANDES_NUMBER 1
>  #endif
>
>  #ifdef CONFIG_ERRATA_SIFIVE
> diff --git a/arch/riscv/include/asm/vendorid_list.h b/arch/riscv/include/=
asm/vendorid_list.h
> index e55407ace0c3..2f2bb0c84f9a 100644
> --- a/arch/riscv/include/asm/vendorid_list.h
> +++ b/arch/riscv/include/asm/vendorid_list.h
> @@ -5,7 +5,7 @@
>  #ifndef ASM_VENDOR_LIST_H
>  #define ASM_VENDOR_LIST_H
>
> -#define ANDESTECH_VENDOR_ID    0x31e
> +#define ANDES_VENDOR_ID                0x31e
>  #define SIFIVE_VENDOR_ID       0x489
>  #define THEAD_VENDOR_ID                0x5b7
>
> diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/alternat=
ive.c
> index 319a1da0358b..0128b161bfda 100644
> --- a/arch/riscv/kernel/alternative.c
> +++ b/arch/riscv/kernel/alternative.c
> @@ -43,7 +43,7 @@ static void riscv_fill_cpu_mfr_info(struct cpu_manufact=
urer_info_t *cpu_mfr_info
>
>         switch (cpu_mfr_info->vendor_id) {
>  #ifdef CONFIG_ERRATA_ANDES
> -       case ANDESTECH_VENDOR_ID:
> +       case ANDES_VENDOR_ID:
>                 cpu_mfr_info->patch_func =3D andes_errata_patch_func;
>                 break;
>  #endif
> --
> 2.34.1
>
>
