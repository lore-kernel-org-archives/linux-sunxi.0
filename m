Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8B92AE6A
	for <linux-sunxi@lists.linux.dev>; Sun,  6 Oct 2024 16:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728230673; cv=none; b=fcJBDWowzoxKfAoMdfGlu3b2uL37X/vs51QtV9dWBrMzy/AC8TJY7XkRbYCuEAs5k15Gewu0NVl8krgEWKifh0BGPZsVVpBe3ObXD0yAV9KeTOK4g8lzL8qc/vSG13ux1f1NZnjgZatBxghVeTxpTkgRtnuEU2c8g3a4p1zdGys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728230673; c=relaxed/simple;
	bh=34Fedq5x8l/T9bE90W84WAGeoMX0EdQtZtaZfYn9+js=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ny6zkm/VV3Gukq3vvmnZ6oJ5bOGRFKcHl5ySWqBo8hWQKRodwEiZsWPgILx2ukUYFKuCZkhhy5xAnkgY6JdtmnZyXg66X/kxeNffFfrhB7r3DY6xWbQgkw02vb57Juim6MHplWe/KSEd0q88FJWBmGSRvexST3P7syaK7/C0VBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jYnhUqqS; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jYnhUqqS"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e25cf3c7278so3177198276.3
        for <linux-sunxi@lists.linux.dev>; Sun, 06 Oct 2024 09:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728230671; x=1728835471; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uch5zWkAziPgJRQdKvEezF5yVQHunIRJ5aY+mbi1jxQ=;
        b=jYnhUqqSscvyMNzy1BfxFsx6W9yYeWgYOFj28//C3ibd+IynYGzDh1URcDpLaI4r3s
         qbjr5IWrb4pPeOD4EgqQ1pj6yvVXlEpGy3wDkW+DsrXI5QsytwjXC4DRfjAjeSu76h+8
         qD5YJB4v2U9LgwD4JQj44863oM20Bd8Zl1C1jqGfEMrlN52MIVGcACXiN6QPOaiUWTB8
         NqNVfgNEKTdPeVDks5DTesDn1HNlMxE6Kz95/PjUmIGN4up8bC6cypZbLYN9zcPTYWHK
         D0co9p8cj3Eoi6px4raiOTDlK1K/bUeK9rbe3ZYrPvqSwzCTp4XxHFeYXY0K+9YCkZR3
         TtGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728230671; x=1728835471;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uch5zWkAziPgJRQdKvEezF5yVQHunIRJ5aY+mbi1jxQ=;
        b=NtMuiWBlYr50KGpoMe8otwz5MReDIFfbBsgHKDzXcA87Hf8Xs8M7aMm7Yyd+bmQ5wi
         wDv9pSkSyQ6oQZlThHx+eRwac6OITdQKV4KMWegNPjMN4MX+vrwlxY8hcs3Chrip2O5M
         hRm7/klN+FVFploPcJ6ywWm1Bdxj97JUJr/03Bjtsieio+I5hWHtUCP9rouHFNs2CaP2
         H7d5hhYR2wWlZ30PY1SYkfNnn7PbpSBmfhfsnHYewplx35DcdMUhtAV6Mr9cCquLSMvf
         aXUsIcZwr3O7FCcWkreCywAAbrLe/b5A60XTh9acY2ni47E/jF3khu33fH4st4lmROif
         SFsw==
X-Forwarded-Encrypted: i=1; AJvYcCUE7M5BELD/qwwOxVfepEC787T3R0/f3+0V5die3g2b3X7WQrvYz2t0jlpGbxl2bI6fRiMUoARrdcf4QQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxbf8mzJnreTHj630N4aM4XM+WLQRNN1CspuXkd+zN3FjLXqFQL
	XQrakUz9PRj7uCEKkChZ9k7PnAVyYmFN/RWuhhRMcd3bK7cbXLwt4Z94mhGBuWE43Yct6VVUCoP
	PeS3wi4htV1St4Oe4+yJRzpOtjpQ=
X-Google-Smtp-Source: AGHT+IHghEmYGvQOkKyyuJZaMY/eRKpityYTGhDKnMiJovkVuEa93BGTo1Fa/3AOIwWu8CpUXNrp8IgagfvkZZpUw1g=
X-Received: by 2002:a05:6902:1142:b0:e26:1041:4986 with SMTP id
 3f1490d57ef6-e28937e2eadmr7591066276.26.1728230669839; Sun, 06 Oct 2024
 09:04:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240911-xtheadvector-v10-0-8d3930091246@rivosinc.com> <20240911-xtheadvector-v10-6-8d3930091246@rivosinc.com>
In-Reply-To: <20240911-xtheadvector-v10-6-8d3930091246@rivosinc.com>
From: Andy Chiu <andybnac@gmail.com>
Date: Mon, 7 Oct 2024 00:04:18 +0800
Message-ID: <CAFTtA3M3NhooM5u7woDO3juAgQK=EpF-aSf69VJm30aj7iNfZA@mail.gmail.com>
Subject: Re: [PATCH v10 06/14] RISC-V: define the elements of the VCSR vector CSR
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Samuel Holland <samuel.holland@sifive.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <shuah@kernel.org>, Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>, 
	Andy Chiu <andy.chiu@sifive.com>, Jessica Clarke <jrtc27@jrtc27.com>, 
	Andrew Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Charlie Jenkins <charlie@rivosinc.com> =E6=96=BC 2024=E5=B9=B49=E6=9C=8812=
=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=881:57=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> From: Heiko Stuebner <heiko@sntech.de>
>
> The VCSR CSR contains two elements VXRM[2:1] and VXSAT[0].
>
> Define constants for those to access the elements in a readable way.
>
> Acked-by: Guo Ren <guoren@kernel.org>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>

Reviewed-by: Andy Chiu <andybnac@gmail.com>

> ---
>  arch/riscv/include/asm/csr.h | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index 25966995da04..3eeb07d73065 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -300,6 +300,10 @@
>  #define CSR_STIMECMP           0x14D
>  #define CSR_STIMECMPH          0x15D
>
> +#define VCSR_VXRM_MASK                 3
> +#define VCSR_VXRM_SHIFT                        1
> +#define VCSR_VXSAT_MASK                        1
> +
>  /* Supervisor-Level Window to Indirectly Accessed Registers (AIA) */
>  #define CSR_SISELECT           0x150
>  #define CSR_SIREG              0x151
>
> --
> 2.45.0
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
