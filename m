Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527E4219FC
	for <linux-sunxi@lists.linux.dev>; Fri,  3 May 2024 16:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714753824; cv=none; b=n3FLxm71Nd35CUhyfSRLeDl2WpGveJD6P4ec8LO8ifzsTn+q4UnpcqrZm7RTpY+4KZUxax+VzDpYVejbDcJ/eJSViHebBWudXFj3RxO2XeBo56CF1D1tZJxEmZshplPo5tfhSkedSM6uza1j3DRNaunWXHRjpf1dp8JAJUMW6S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714753824; c=relaxed/simple;
	bh=zpHuLnbgLmVheBeAchmrpDn3hbUehvkp2z504eY5q2w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lzSEZWoOPn8tvJhqNnqDQ7ZV3FuYOHEGkVBBxq9jkj4hQTFW96Cd9j91iM4OA7+GcIiC3jD2NBFsWzAfZRqXaW4h8QIIBGS1S/mTwLdFOWrInqKoQgDbk8h3Fvtq+srJfxqudklbm9kSBYAKryOoFUAiT88ynDuumJ6ncukR2oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=ya0bPiko; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="ya0bPiko"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-51ab4ee9df8so11410185e87.1
        for <linux-sunxi@lists.linux.dev>; Fri, 03 May 2024 09:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714753820; x=1715358620; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ECKKevExQfrRBAsStlRWaZSjC9IYktyb9BBiLuVGtM=;
        b=ya0bPikogK2pcZFM54FVBqB3vf31eruYDqV52ySX5UYFrmMNuPByrKIuCZBaVF0cKu
         omepm2V3yFIXVNvqVTm0uBikxFOaJb8HYQ8QKL1fI0Y/zwig7VXhL5t1SAx9o3IU997F
         bA903t/KEnafrTEDhp30TqJ87n2VD2Z1PbaHmqnvvjMouHt/isVC9EWXKk6N4eucTnCf
         cLKSVYfqI0FOnIZCqyWpnJuLbGs1w9EdMEhYLVtBG5bBUjhShBOrXXl/zKaBq+eJ9Gj1
         W9uFQPqedanVkd01DiHXnIaauKTOQzojaZifJfWqYa4FOJpJ9tOUln0/CjfuQY+yMvyV
         zl2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714753820; x=1715358620;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ECKKevExQfrRBAsStlRWaZSjC9IYktyb9BBiLuVGtM=;
        b=YIbTz7QN3mDvLUP4kOUydots5rtzBrJxsRtU7Rw7kE58TaUube5g+n/OvR8PSLZLcJ
         E78vS8UmXD874EDUoEo5c0cisiqecvPvq2RnKYcUg/cP8YBXqFp5Y6Th59IWk/y3Y/OB
         ZlGxdx8Wy3l3Lic6FL7PUnDASRyD4XPb7n2dnsMfBXWUtaOaBe2dpTpc9TIHuDVNfZlX
         rCV/g+98kdqghUZC2XKfwuh+OSGE0HkvYH3hyzh6yCuMHElFRP7l4AyXc+P+VC2XXQzm
         bvs+Y15DnlfiZfidyMR9OfVQOLyxJSturlm9Lw6QC0pVUxD9WidUK++kfPjSb39z1Tbt
         pTuA==
X-Forwarded-Encrypted: i=1; AJvYcCVIPso3CiW0/yGNFtsMB0j8AEfprfJ4ueowsi5K+nAEE+Mey2Ma22jpnwPOgbMAfA1mx5hY6ldI4MLciHkHqzJEO6cmlNItndcpNvg=
X-Gm-Message-State: AOJu0YxURne09YQazvm+iP1q+1EfhLB3vSaBr4kopZIeNIcehnIeqt5+
	s4IVAduWFcmCuL0+WS/WfUxXNw4mSjfoKPNiDUbWqeSyBoMUxf+MNLVq6Ldqn/Bfrq8/NHCfBw5
	o5b/BIzTLV9IiwXoQ0fr1TtDmYiA2du3nKilE4g==
X-Google-Smtp-Source: AGHT+IHDX6K66EuD6OEdJQjZv4tm4JzzT4zBdU56UFKVu3/gieg9qBK1HGl4Mk0l5uBWTi4+Lta91K95C/2JbZzzOOw=
X-Received: by 2002:a05:6512:715:b0:51f:315c:75e0 with SMTP id
 b21-20020a056512071500b0051f315c75e0mr1836596lfs.44.1714753820280; Fri, 03
 May 2024 09:30:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240502-dev-charlie-support_thead_vector_6_9-v5-0-d1b5c013a966@rivosinc.com>
 <20240502-dev-charlie-support_thead_vector_6_9-v5-14-d1b5c013a966@rivosinc.com>
In-Reply-To: <20240502-dev-charlie-support_thead_vector_6_9-v5-14-d1b5c013a966@rivosinc.com>
From: Evan Green <evan@rivosinc.com>
Date: Fri, 3 May 2024 09:29:44 -0700
Message-ID: <CALs-HstJ2qZTNWYaN_To-KNbYGKGRgfofQHHsMM+2fON_XKZWA@mail.gmail.com>
Subject: Re: [PATCH v5 14/17] riscv: hwprobe: Add thead vendor extension probing
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Conor Dooley <conor.dooley@microchip.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 2, 2024 at 9:47=E2=80=AFPM Charlie Jenkins <charlie@rivosinc.co=
m> wrote:
>
> Add a new hwprobe key "RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0" which
> allows userspace to probe for the new RISCV_ISA_VENDOR_EXT_XTHEADVECTOR
> vendor extension.
>
> This new key will allow userspace code to probe for which thead vendor
> extensions are supported. This API is modeled to be consistent with
> RISCV_HWPROBE_KEY_IMA_EXT_0. The bitmask returned will have each bit
> corresponding to a supported thead vendor extension of the cpumask set.
> Just like RISCV_HWPROBE_KEY_IMA_EXT_0, this allows a userspace program
> to determine all of the supported thead vendor extensions in one call.
>
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>

Reviewed-by: Evan Green <evan@rivosinc.com>

> ---
>  arch/riscv/include/asm/hwprobe.h                   |  4 +--
>  .../include/asm/vendor_extensions/thead_hwprobe.h  | 18 ++++++++++++
>  .../include/asm/vendor_extensions/vendor_hwprobe.h | 34 ++++++++++++++++=
++++++
>  arch/riscv/include/uapi/asm/hwprobe.h              |  3 +-
>  arch/riscv/include/uapi/asm/vendor/thead.h         |  3 ++
>  arch/riscv/kernel/sys_hwprobe.c                    |  5 ++++
>  arch/riscv/kernel/vendor_extensions/Makefile       |  1 +
>  .../riscv/kernel/vendor_extensions/thead_hwprobe.c | 19 ++++++++++++
>  8 files changed, 84 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hw=
probe.h
> index 630507dff5ea..e68496b4f8de 100644
> --- a/arch/riscv/include/asm/hwprobe.h
> +++ b/arch/riscv/include/asm/hwprobe.h
> @@ -1,6 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
>  /*
> - * Copyright 2023 Rivos, Inc
> + * Copyright 2023-2024 Rivos, Inc
>   */
>
>  #ifndef _ASM_HWPROBE_H
> @@ -8,7 +8,7 @@
>
>  #include <uapi/asm/hwprobe.h>
>
> -#define RISCV_HWPROBE_MAX_KEY 6
> +#define RISCV_HWPROBE_MAX_KEY 7
>
>  static inline bool riscv_hwprobe_key_is_valid(__s64 key)
>  {
> diff --git a/arch/riscv/include/asm/vendor_extensions/thead_hwprobe.h b/a=
rch/riscv/include/asm/vendor_extensions/thead_hwprobe.h
> new file mode 100644
> index 000000000000..925fef39a2c0
> --- /dev/null
> +++ b/arch/riscv/include/asm/vendor_extensions/thead_hwprobe.h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_RISCV_VENDOR_EXTENSIONS_THEAD_HWPROBE_H
> +#define _ASM_RISCV_VENDOR_EXTENSIONS_THEAD_HWPROBE_H
> +
> +#include <linux/cpumask.h>
> +
> +#include <uapi/asm/hwprobe.h>
> +
> +#ifdef CONFIG_RISCV_ISA_VENDOR_EXT_THEAD
> +void hwprobe_isa_vendor_ext_thead_0(struct riscv_hwprobe *pair, const st=
ruct cpumask *cpus);
> +#else
> +static inline void hwprobe_isa_vendor_ext_thead_0(struct riscv_hwprobe *=
pair, const struct cpumask *cpus)
> +{
> +       pair->value =3D 0;
> +}
> +#endif
> +
> +#endif
> diff --git a/arch/riscv/include/asm/vendor_extensions/vendor_hwprobe.h b/=
arch/riscv/include/asm/vendor_extensions/vendor_hwprobe.h
> new file mode 100644
> index 000000000000..2a29f1a5cae3
> --- /dev/null
> +++ b/arch/riscv/include/asm/vendor_extensions/vendor_hwprobe.h
> @@ -0,0 +1,34 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright 2024 Rivos, Inc
> + */
> +
> +#ifndef _ASM_RISCV_SYS_HWPROBE_H
> +#define _ASM_RISCV_SYS_HWPROBE_H
> +
> +#include <asm/cpufeature.h>
> +
> +#define EXT_KEY(ext)                                                    =
               \
> +       do {                                                             =
               \
> +               if (__riscv_isa_extension_available(isainfo->isa, RISCV_I=
SA_VENDOR_EXT_##ext)) \
> +                       pair->value |=3D RISCV_HWPROBE_VENDOR_EXT_##ext; =
                 \
> +               else                                                     =
               \
> +                       missing |=3D RISCV_HWPROBE_VENDOR_EXT_##ext;     =
                 \
> +       } while (false)
> +
> +/*
> + * Loop through and record extensions that 1) anyone has, and 2) anyone
> + * doesn't have.
> + */
> +#define VENDOR_EXTENSION_SUPPORTED(pair, cpus, per_hart_thead_bitmap, ..=
.)                     \
> +       do {                                                             =
                       \
> +               int cpu;                                                 =
                       \
> +               u64 missing;                                             =
                       \
> +               for_each_cpu(cpu, (cpus)) {                              =
                       \
> +                       struct riscv_isavendorinfo *isainfo =3D &(per_har=
t_thead_bitmap)[cpu];    \
> +                       __VA_ARGS__                                      =
                       \
> +               }                                                        =
                       \
> +               (pair)->value &=3D ~missing;                             =
                         \
> +       } while (false)                                                  =
                       \
> +
> +#endif /* _ASM_RISCV_SYS_HWPROBE_H */
> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/u=
api/asm/hwprobe.h
> index 9f2a8e3ff204..21e96a63f9ea 100644
> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> @@ -1,6 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
>  /*
> - * Copyright 2023 Rivos, Inc
> + * Copyright 2023-2024 Rivos, Inc
>   */
>
>  #ifndef _UAPI_ASM_HWPROBE_H
> @@ -67,6 +67,7 @@ struct riscv_hwprobe {
>  #define                RISCV_HWPROBE_MISALIGNED_UNSUPPORTED    (4 << 0)
>  #define                RISCV_HWPROBE_MISALIGNED_MASK           (7 << 0)
>  #define RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE    6
> +#define RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0   7
>  /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
>
>  /* Flags */
> diff --git a/arch/riscv/include/uapi/asm/vendor/thead.h b/arch/riscv/incl=
ude/uapi/asm/vendor/thead.h
> new file mode 100644
> index 000000000000..43790ebe5faf
> --- /dev/null
> +++ b/arch/riscv/include/uapi/asm/vendor/thead.h
> @@ -0,0 +1,3 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +
> +#define                RISCV_HWPROBE_VENDOR_EXT_XTHEADVECTOR   (1 << 0)
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwpr=
obe.c
> index 8cae41a502dd..aeb70afe230b 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -13,6 +13,7 @@
>  #include <asm/uaccess.h>
>  #include <asm/unistd.h>
>  #include <asm/vector.h>
> +#include <asm/vendor_extensions/thead_hwprobe.h>
>  #include <vdso/vsyscall.h>
>
>
> @@ -216,6 +217,10 @@ static void hwprobe_one_pair(struct riscv_hwprobe *p=
air,
>                         pair->value =3D riscv_cboz_block_size;
>                 break;
>
> +       case RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0:
> +               hwprobe_isa_vendor_ext_thead_0(pair, cpus);
> +               break;
> +
>         /*
>          * For forward compatibility, unknown keys don't fail the whole
>          * call, but get their element key set to -1 and value set to 0
> diff --git a/arch/riscv/kernel/vendor_extensions/Makefile b/arch/riscv/ke=
rnel/vendor_extensions/Makefile
> index 8f1c5a4dc38f..f511fd269e8a 100644
> --- a/arch/riscv/kernel/vendor_extensions/Makefile
> +++ b/arch/riscv/kernel/vendor_extensions/Makefile
> @@ -1,4 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>
>  obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_THEAD)       +=3D thead.o
> +obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_THEAD)       +=3D thead_hwprobe.o
>  obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_ANDES)       +=3D andes.o
> diff --git a/arch/riscv/kernel/vendor_extensions/thead_hwprobe.c b/arch/r=
iscv/kernel/vendor_extensions/thead_hwprobe.c
> new file mode 100644
> index 000000000000..53f65942f7e8
> --- /dev/null
> +++ b/arch/riscv/kernel/vendor_extensions/thead_hwprobe.c
> @@ -0,0 +1,19 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <asm/vendor_extensions/thead.h>
> +#include <asm/vendor_extensions/thead_hwprobe.h>
> +#include <asm/vendor_extensions/vendor_hwprobe.h>
> +
> +#include <linux/cpumask.h>
> +#include <linux/types.h>
> +
> +#include <uapi/asm/hwprobe.h>
> +#include <uapi/asm/vendor/thead.h>
> +
> +void hwprobe_isa_vendor_ext_thead_0(struct riscv_hwprobe *pair, const st=
ruct cpumask *cpus)
> +{
> +       VENDOR_EXTENSION_SUPPORTED(pair, cpus,
> +                                  riscv_isa_vendor_ext_list_thead.per_ha=
rt_isa_bitmap, {
> +               EXT_KEY(XTHEADVECTOR);
> +       });
> +}

Very tidy!


>
> --
> 2.44.0
>
