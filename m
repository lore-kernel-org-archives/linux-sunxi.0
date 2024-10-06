Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05D45588F
	for <linux-sunxi@lists.linux.dev>; Sun,  6 Oct 2024 16:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728231113; cv=none; b=YGafWuLKFi3idvo7LSLIxskim8IzvAE8OGSn+PDRUxRkBnwddj9bRfatBnIoYl95BIPJH2sM/qq7G8SVmXz/dWudci56ABYg3i60tCDsEu138jlEjtU2iHqqgnfbnhXugRESzZhyriTk8AESBOOQaJH6tOB8V46KkE5HsOJkJh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728231113; c=relaxed/simple;
	bh=tDJ5s5zYFjkOd0VeumbJCL2tSq/9mRwCV6dnYOXYKzI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NkiIpIb8n72B2LzSg6GhMP9LaDVw1DEH0Vlz8iFjQCqTRQPggvfxlj45rb+CI/91PSB3SO1flgnjgUznTf1mfjq6sQlv/Cpye3NaLoPxD0IVpSJT/15xCSzYQfdEhfNwqra2ZlZWc9yJNSlVauM5yurOCOwDipYIYL1CoG+mSls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vq+hzSX/; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vq+hzSX/"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e25d164854dso2978583276.2
        for <linux-sunxi@lists.linux.dev>; Sun, 06 Oct 2024 09:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728231111; x=1728835911; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MAYqCIiSv61sSYgvtWT29++OHzmZnVI7JlxP4WixgGE=;
        b=Vq+hzSX/sDImwcAIpn7S/QmnV84vwZmutxCzoYwkTChACG0HVKjOKEWRLzBo4v/kzn
         I0kTZZEcslpQiHpw9K0uKqc6qKeCL4vzxjM5H2y8XDHWPRNiN1oKRcMxtN2xaQqAa+CK
         iSmYZK9UybrDWu5qo32zF3ldrsBB4l5KWnoH0vNm8tye/5erz/bhtvkF0WpEFGsLYrQQ
         E4TNo9MJ761jEf3UFF1ye69Vgy0tJ7nBfzpgxxy25ARCKvpC50Cvl35ZjUxRiHWdhOqB
         DzRPiig/rlBC16KD4J1nBi+yzK7SV36fS/T4eL0TQgG1OQb9NTyMiIBTqwm4Bz9l1WV1
         q9jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728231111; x=1728835911;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MAYqCIiSv61sSYgvtWT29++OHzmZnVI7JlxP4WixgGE=;
        b=pWe+lIPfKSLNLO+Ah/q/IVsbYDZ0Kc77Hr66rYa2heH326QHXKrv+3j5l/O+8DvCzl
         xvy+kx7isLjbDnyu2+whbALkA2EQlVSzF0Bz6p4oTMTFWGyqQv+kO4CgaiR0MIKxP9kh
         nz+b9jfq5e4/51l019biQjfPTSvsuV91Y0mgHvjZwoEf2juVj2sE4kllimDshWtKRd4B
         UW3xwTA6Yk0Zc1nWQicDEFSjFcaVLmHjmuvSIS7e4tKao6wNa9qWJYbkF3kHcKQZ8bo7
         Pgcgu+Y/E8x8BMKM+CiauenW5Pbu++iI6ZG4KpEeDC9NGRkPla1c6L6XA4X5aJn+rNzW
         K8gQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGnGQ+fHG5teRDBxFu2zIHadMB+Yw6A2gUi5tLDBwAwQ/4DfwJI3wAlQgEY00afUeBJG9Mt3TnhXY4mQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yybk2mvbvRrc1+xCVbcE5bN/cuS7D18KakukGDzTHKckDwqAyo7
	83dq9pc/+thfHve0mks6/YbkecC88l5ywgKfPt60dfiWDtercntK69dEaHMICRU7ajYZFBvUMEB
	DSFuVCYJG8NQ3pn3Gz64XHQjgPLI=
X-Google-Smtp-Source: AGHT+IFqMHlb0b8SgKw7RwjBG7Z/IYs0/8p3F6LoeYW5kR2rfijp2j/qGjYCoWovPSzlMmk0//HTDX0lUYq3PNC/rQA=
X-Received: by 2002:a05:6902:2b8f:b0:e20:16b9:ad68 with SMTP id
 3f1490d57ef6-e2893951b87mr6248949276.45.1728231110621; Sun, 06 Oct 2024
 09:11:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240911-xtheadvector-v10-0-8d3930091246@rivosinc.com> <20240911-xtheadvector-v10-7-8d3930091246@rivosinc.com>
In-Reply-To: <20240911-xtheadvector-v10-7-8d3930091246@rivosinc.com>
From: Andy Chiu <andybnac@gmail.com>
Date: Mon, 7 Oct 2024 00:11:39 +0800
Message-ID: <CAFTtA3O-sD-cJsHL2LgwryXwEnuEKvnP6QrTn7GMFYZmP=A3iA@mail.gmail.com>
Subject: Re: [PATCH v10 07/14] riscv: csr: Add CSR encodings for CSR_VXRM/CSR_VXSAT
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
	linux-kselftest@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Charlie,

Charlie Jenkins <charlie@rivosinc.com> =E6=96=BC 2024=E5=B9=B49=E6=9C=8812=
=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=881:57=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> The VXRM vector csr for xtheadvector has an encoding of 0xa and VXSAT
> has an encoding of 0x9.
>
> Co-developed-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
>  arch/riscv/include/asm/csr.h | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index 3eeb07d73065..c0a60c4ed911 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -300,9 +300,14 @@
>  #define CSR_STIMECMP           0x14D
>  #define CSR_STIMECMPH          0x15D
>
> -#define VCSR_VXRM_MASK                 3
> -#define VCSR_VXRM_SHIFT                        1
> -#define VCSR_VXSAT_MASK                        1
> +/* xtheadvector symbolic CSR names */
> +#define CSR_VXSAT              0x9
> +#define CSR_VXRM               0xa
> +
> +/* xtheadvector CSR masks */
> +#define CSR_VXRM_MASK          3
> +#define CSR_VXRM_SHIFT         1
> +#define CSR_VXSAT_MASK         1

nit: use VCSR_VX* instead of CSR_VX*, if you need to send the next
revision. I believe these masks are for CSR_VCSR but not CSR_VX*. If
you think CSR_VX* is a better naming then the previous patch should
introduce it as CSR_VX* but not VCSR_VX*.

>
>  /* Supervisor-Level Window to Indirectly Accessed Registers (AIA) */
>  #define CSR_SISELECT           0x150
>
> --
> 2.45.0
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Thanks,
Andy
