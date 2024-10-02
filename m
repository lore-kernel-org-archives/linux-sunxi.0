Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0691D048B
	for <linux-sunxi@lists.linux.dev>; Wed,  2 Oct 2024 15:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727881651; cv=none; b=njTpM0v74zwBDNBuq7RGTgn14VcGzxkN6Uz1kP1ncZ4/XM+9mZ9R5jpvH83NSVDRKoRUTDriPQtlrcVaWrGXajtT+D37L1Q+U5756ixJq5dewUB0toxIRUrblWbUvtFOqfyjRtl5WRQRtdNLhJ6Gs6ZiMnRtk5QBbTTuTc29kmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727881651; c=relaxed/simple;
	bh=jtfaJpM6CIsQrfnb+cLDUgI28lgBAwSL+kJtu3n5UDY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LjJVjo0SFt279iyEsWXoEwxuESDZENyY7O7YOBmRTJh4sPF2mjkzLUQwWmNedOVyMdXdhptPZ0EV7+pS8xzCkPvTz30Qcaupts1ESIhqW1WYpLlQ9vZSgHrlByzkl8Dx9YcWa/LUV20r753zykDhJRbQhBeKFSFSsPt5IhUWJhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WtFEnVF2; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WtFEnVF2"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6e2b1b10103so2904007b3.1
        for <linux-sunxi@lists.linux.dev>; Wed, 02 Oct 2024 08:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727881648; x=1728486448; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0i3BbfvxahvYvWq4i93XsiQMPyiTP9IxQ8M027AZbg4=;
        b=WtFEnVF2/fGbNwkTSnEi6jgotXOBj9VAqb5PcehdZfH/SKx7viGOyovL15GhDlwZho
         WuR8A/OPEmZdDcEWxbU1Eoy3fWMAz57M6kDQ6yHp0nL7iDCH+OcVBqr2cbkNDwoZECj2
         hDft8Xd/U0NTiV8IHh1wesNbAoNmMHIfA2SOAKlAorKuQ21fuM8QpZpwrjHd6leeRf5j
         pOS/aB+l16F4Nfyib7gN1Fff3fYeM/Z4PC+IVZbcpNenG/63k3/7rMq1EOo2pBy+xnke
         wtAlnhA3kth+QBMh+Fc1B6mf7b8OIMx/EWlvYVp9c1VSA5kbKqINfPouYDXg0Krp7tq/
         a4FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727881648; x=1728486448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0i3BbfvxahvYvWq4i93XsiQMPyiTP9IxQ8M027AZbg4=;
        b=RatRolxQ5vdRaDWVDp6RyiFX8Vm/ayBgcIOhHwxDRd/wbcC6l3nmfSKy29+Uwr/cWy
         iW1gcVVrSXOB4md2tUHRLdhdr4YB6xgKuua0ezxUcLZlLatNZx5s50J+mPLejVYr2nup
         vXleQOf2I8j781pZ94QM7MPuU0l4G3/XdhfpuqdhPrObe5R3cqZTNZRAjZYYiN9UhuyJ
         t7RXkKHhUlMs1NgaX+1MwPTSM0Ca9wiaKjGG3k5r0avupCjDl9EuwlF46J+ouHDbZ0JU
         apmPVqYgB1bxm17h14fpeyTR2lwkTLEtWOmg11cpyPlHnESm1XM0xxETg5RH9Zfyagnv
         AMoA==
X-Forwarded-Encrypted: i=1; AJvYcCXfk6j9hBthzuSx9MNWPVcAjVGACKw1JPuyji9GY+qPbrrtIoR3t9rRvrM+KcOLCpD/B0v8WVIqPM0ngw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzFgU600aSAvAW3EdiOuf9G/RWMlxnpOxlolsywkQntaU3KAi6/
	6vheQeUGekOy/XlyiNJCTQiF1GCTgv0jJFg3SlgqGWtNS5oc4VA5Rir7a/uJ2kWIJpa5L/xKBN5
	+jY4zJ3FbUAO4XT4p2fNv8a0LDeI=
X-Google-Smtp-Source: AGHT+IH+TSllG/SCeTg8S09DQGLvV3T6Fg+wFdmO1qdI5EdM4tgcUUTykKxpYGsG9/W9hoY9YTFqiimHmtkpgobguAo=
X-Received: by 2002:a05:690c:4183:b0:6dd:ba22:d946 with SMTP id
 00721157ae682-6e2a2b8307bmr22986657b3.13.1727881648440; Wed, 02 Oct 2024
 08:07:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240911-xtheadvector-v10-0-8d3930091246@rivosinc.com> <20240911-xtheadvector-v10-1-8d3930091246@rivosinc.com>
In-Reply-To: <20240911-xtheadvector-v10-1-8d3930091246@rivosinc.com>
From: Andy Chiu <andybnac@gmail.com>
Date: Wed, 2 Oct 2024 23:07:17 +0800
Message-ID: <CAFTtA3NwY7-KbtqWTRoDLv7AGRUo2efQrCa8=hfpPo1DB1RHyQ@mail.gmail.com>
Subject: Re: [PATCH v10 01/14] dt-bindings: riscv: Add xtheadvector ISA
 extension description
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
	linux-kselftest@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Charlie Jenkins <charlie@rivosinc.com> =E6=96=BC 2024=E5=B9=B49=E6=9C=8812=
=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=881:57=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> The xtheadvector ISA extension is described on the T-Head extension spec
> Github page [1] at commit 95358cb2cca9.
>
> Link: https://github.com/T-head-Semi/thead-extension-spec/blob/95358cb2cc=
a9489361c61d335e03d3134b14133f/xtheadvector.adoc [1]
>
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Andy Chiu <andybnac@gmail.com>

> ---
>  Documentation/devicetree/bindings/riscv/extensions.yaml | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index a06dbc6b4928..1a3d01aedde6 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -556,6 +556,10 @@ properties:
>              latency, as ratified in commit 56ed795 ("Update
>              riscv-crypto-spec-vector.adoc") of riscv-crypto.
>
> +        # vendor extensions, each extension sorted alphanumerically unde=
r the
> +        # vendor they belong to. Vendors are sorted alphanumerically as =
well.
> +
> +        # Andes
>          - const: xandespmu
>            description:
>              The Andes Technology performance monitor extension for count=
er overflow
> @@ -563,6 +567,12 @@ properties:
>              Registers in the AX45MP datasheet.
>              https://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-=
5.0.0-Datasheet.pdf
>
> +        # T-HEAD
> +        - const: xtheadvector
> +          description:
> +            The T-HEAD specific 0.7.1 vector implementation as written i=
n
> +            https://github.com/T-head-Semi/thead-extension-spec/blob/953=
58cb2cca9489361c61d335e03d3134b14133f/xtheadvector.adoc.
> +
>      allOf:
>        # Zcb depends on Zca
>        - if:
>
> --
> 2.45.0
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
