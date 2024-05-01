Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46355D52F
	for <linux-sunxi@lists.linux.dev>; Wed,  1 May 2024 16:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714582000; cv=none; b=tz0yeoPPKJdNYPBt2UlTPL7wMNzbPnE8efuwjx+xiggc5ol0wDimWe86kUG8vfzQnslUt9tn3sQHc2TdDKdyWRTdDvP+QgMP2oK4Nild8fA1+bHF978P4NRz8D0rdfrAjnXhgTEaVBdn5CZgNBXetAAIPAQG8PTT+CLwxTS2Qec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714582000; c=relaxed/simple;
	bh=tR+PGLQo9BVGPoo9A8iw6jPgITstE381cUqT5HTEdhs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IQF+PZU0IvPnQnxpYt0ufqjzAnAsvibhDJcT9xvxZ/5nTFo0HggPHIU7vyiWKJwDZYGyrYrppiu0LFxLf6OJkwydiFNRXULaYPyIkevhVcOJvL6TIbBKRweJYquAzlDWHOkWM9QoykwbQkXBrw7p4sDJfpUgE05hf45azxzHB/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=etowMm5y; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="etowMm5y"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2dac77cdf43so88776031fa.2
        for <linux-sunxi@lists.linux.dev>; Wed, 01 May 2024 09:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714581996; x=1715186796; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nPkyhmFJU1JMGPaNgbyvGV60qehrcfbkIOrxyWAvpo8=;
        b=etowMm5yxXqrYcdBvYGZmTRT6e3e2jFBwfiRzhdNMYKP8HkHXxjhitXdvhzw/mz9/p
         auJGen6tKYNoygKkoHZILjOTQwHRYZ+6X1YzWqwkBJ5UKtidKtYptO6lRNEah0mZ2w75
         42we6AeqEOEqJKwU8qLazzIbHoFbVoJC37wYAWfy/CSg4X1di+E9YVOkfeLk+Iedx1lc
         r2Swn7USBKdbXFFhKgYoBLq4io7uDX/sIBBniwrW0bolIenmNTByzxyoQvQTmIbLFMUE
         EuBAEZ4ctgaIJ6RCl8qaiNLInD+JCGb99Jc+9VAzmqTU5Adz5MISViZ2ejMlgKAaFriI
         obUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714581996; x=1715186796;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nPkyhmFJU1JMGPaNgbyvGV60qehrcfbkIOrxyWAvpo8=;
        b=bcrRHoeAtbx4uOIElQhCK/oJlA7KuH4Q2kyZ2z2BU9fXvKlipMkug53AzHq7UFAY0L
         vHDt/wshB/9SBvJCtG2UdkCt1jFzcPK+r/feh+kHLtGQDasDmL2+8/3xTH7dr6dHrbcn
         ZWXCD396yJlAfuBEI+u7BcgEXLiYIM5YggTqk7+v6Zo4NctJP4jsf0AzjBSMQFNidSvo
         KW2DlfFpZ4PqVo2Yjn8aAwIswJfaHv9nrIhTcKqsy/O05T6HAawPBjzAmt4zrH8nAzUD
         ++B+CXXCUnE5Jk4kFygtVp5AYN0xJfAUtQzqnDEOMJiwFgW/SnULfAg4vnMtDEmQdEpB
         zINA==
X-Forwarded-Encrypted: i=1; AJvYcCUYv7K3jqFcnBPk6Ci2EoK6ObYUpODKDlP2uQ8rDmg15LZG9X2I903MICLVZwg0vPGHET4pdnE5ro5brZqCr1cbFRQMNe98lcfd8pc=
X-Gm-Message-State: AOJu0YyleNOaQ0YSe055YjwTjh94jwi5lmBYFE7uJSQ2SD/0whjWyjzs
	Sc5ZuC4Y+4vP9JAE4yPSXE7EIy6PfZlkLFn6Cuiq1hkG9lLPeQKIQui7pc6bycEVG643kSByWAM
	S+sGLnLShZjs8eXqIiukJKCx682Hsj3FUTGUtnA==
X-Google-Smtp-Source: AGHT+IG2HxP8EkhhzvKMZFmu+eStMsTn8Na5rYE3NFMbVub2yDTq+zSkE9e9PLzI6PYUpamY3eZ/RVfBbio+sRUFRIA=
X-Received: by 2002:a2e:9b48:0:b0:2e0:ca9a:a1c7 with SMTP id
 o8-20020a2e9b48000000b002e0ca9aa1c7mr2232711ljj.45.1714581996597; Wed, 01 May
 2024 09:46:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240426-dev-charlie-support_thead_vector_6_9-v4-0-5cf53b5bc492@rivosinc.com>
 <20240426-dev-charlie-support_thead_vector_6_9-v4-13-5cf53b5bc492@rivosinc.com>
In-Reply-To: <20240426-dev-charlie-support_thead_vector_6_9-v4-13-5cf53b5bc492@rivosinc.com>
From: Evan Green <evan@rivosinc.com>
Date: Wed, 1 May 2024 09:46:00 -0700
Message-ID: <CALs-HsuPXhc93jqs==-Gq5Os701jxmzjxg82EHdOFHn+H-9Jdg@mail.gmail.com>
Subject: Re: [PATCH v4 13/16] riscv: hwprobe: Add thead vendor extension probing
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

On Fri, Apr 26, 2024 at 2:37=E2=80=AFPM Charlie Jenkins <charlie@rivosinc.c=
om> wrote:
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
> ---
>  arch/riscv/include/asm/hwprobe.h                   |  4 +--
>  .../include/asm/vendor_extensions/thead_hwprobe.h  | 11 ++++++
>  arch/riscv/include/uapi/asm/hwprobe.h              |  3 +-
>  arch/riscv/include/uapi/asm/vendor/thead.h         |  3 ++
>  arch/riscv/kernel/sys_hwprobe.c                    |  9 +++++
>  arch/riscv/kernel/vendor_extensions/Makefile       |  1 +
>  .../riscv/kernel/vendor_extensions/thead_hwprobe.c | 42 ++++++++++++++++=
++++++
>  7 files changed, 70 insertions(+), 3 deletions(-)
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
> index 000000000000..907cfc4eb4dc
> --- /dev/null
> +++ b/arch/riscv/include/asm/vendor_extensions/thead_hwprobe.h
> @@ -0,0 +1,11 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_RISCV_VENDOR_EXTENSIONS_THEAD_HWPROBE_H
> +#define _ASM_RISCV_VENDOR_EXTENSIONS_THEAD_HWPROBE_H
> +
> +#include <linux/cpumask.h>
> +
> +#include <uapi/asm/hwprobe.h>
> +
> +void hwprobe_isa_vendor_ext_thead_0(struct riscv_hwprobe *pair, const st=
ruct cpumask *cpus);
> +
> +#endif
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
> index 8cae41a502dd..e59cac545df5 100644
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
> @@ -216,6 +217,14 @@ static void hwprobe_one_pair(struct riscv_hwprobe *p=
air,
>                         pair->value =3D riscv_cboz_block_size;
>                 break;
>
> +       case RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0:
> +#ifdef CONFIG_RISCV_ISA_VENDOR_EXT_THEAD
> +               hwprobe_isa_vendor_ext_thead_0(pair, cpus);
> +#else
> +               pair->value =3D 0;
> +#endif

Could we move this ifdef into the header by declaring a dummy
hwprobe_isa_vendor_ext_thead_0() in the header for the !ENABLED case?

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
> index 000000000000..e8e2de292032
> --- /dev/null
> +++ b/arch/riscv/kernel/vendor_extensions/thead_hwprobe.c
> @@ -0,0 +1,42 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <asm/vector.h>
> +#include <asm/vendor_extensions/thead.h>
> +#include <asm/vendor_extensions/thead_hwprobe.h>
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
> +       /*
> +        * Loop through and record extensions that 1) anyone has, and 2) =
anyone
> +        * doesn't have.
> +        */
> +
> +       struct riscv_isainfo *per_hart_thead_bitmap =3D riscv_isa_vendor_=
ext_list_thead.per_hart_vendor_bitmap;
> +       int cpu;
> +       u64 missing;
> +
> +       for_each_cpu(cpu, cpus) {
> +               struct riscv_isainfo *isainfo =3D &per_hart_thead_bitmap[=
cpu];
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
> +       EXT_KEY(XTHEADVECTOR);
> +
> +#undef EXT_KEY
> +       }
> +
> +       /* Now turn off reporting features if any CPU is missing it. */> =
+       pair->value &=3D ~missing;
> +}

Something to consider, perhaps when there's a second vendor, is how we
might reduce this boilerplate on the second vendor. Probably best to
wait though until we know exactly what the commonalities are. This
looks good for now.


>
> --
> 2.44.0
>
