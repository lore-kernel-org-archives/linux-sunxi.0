Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FF71D174F
	for <linux-sunxi@lists.linux.dev>; Wed,  2 Oct 2024 16:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727885153; cv=none; b=iV8O/EJmtgimztMYh0RB0Sa9Ixd3lpPiNqugLDHJVpe2XcklhWePq+UxDokXE4BiTkF9S+MK+ABmd4ypHplbgAMhJ1n2vhg2x6ERUzPOlNw2GaA9PXmRCS+9chLqgdWsKwmPq4DNvUigqslZwGjOLh/SlC/cbRVtlg3GN3yoFhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727885153; c=relaxed/simple;
	bh=ANC8Qb5v5SRqtuiLPKYG+H+JN4dcEV1+gCnN8O8CSzA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b5dDW6OLLslZSZHy9oANtpDsfmCobo5W+Haxo2ejL3fboRa03lY3yHymR9VIOtoZxYUFyONxmX5QHnacBwReFfwiZFjfmHLASc11jjrjjKQuWHn+IO5HlHfNBmRLF1w975xZEKsOClv5WUwYTeUCWhWlXe/RF7Pz7wjLw+yge5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jZNKmYZh; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jZNKmYZh"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6e21ac45b70so57923547b3.1
        for <linux-sunxi@lists.linux.dev>; Wed, 02 Oct 2024 09:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727885149; x=1728489949; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5N4+gqSeb1KPAY46BU6QRBcQA4A0mtfnF/DfhNnvaYg=;
        b=jZNKmYZhGP8dVp6U6CH22UjHNeVK0pvABJOWnKaVqzi7XHo6p17wTLNLat0xGRE8Lc
         QnaRWZv8wnQcGwnSXQhlAg5hGYC7QXq+IFYa9Y8xE50P3HlWRO3gH44ZTCiWyFR/R6HS
         2d/g8p4+roa9wWZ2p6HYu8l/JKQVVgAJC4jn4LF9rrKaykOIMHoTO3mX27YlHip6QrS0
         gf6ZILPD43jE2yZ6bCnIO12QYd3Mp4INFZnga++Otk4xblKVTw/+LRl7dWD1Z3Nph1cQ
         7i4/SfNt5TOfv+J1NpmQ+/jKytJ/0aANWDCZW6ePu2Ibe6NHWeL6jFmNke+fmCPHgXaE
         g4Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727885149; x=1728489949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5N4+gqSeb1KPAY46BU6QRBcQA4A0mtfnF/DfhNnvaYg=;
        b=A95kIaIq+gxIwfaPR3EGTpAOzhv7hdRFKNf9JbAIo15eAF+5dpAJDbmpgZRz1Bq3lQ
         Z9jR+H/YNP9nA6XpoHxZhJZRbUMgi3gVRdLrFXo/uXFMAx1o/BDLSdk+cAwkeLsO8h4C
         c4aYuE0hPYNLhEp5vjjyCp8WfBz1LdqZzX+rZil2hxvHA+nAaKyDlwbseJfiDjbpkksn
         9fGwddP66A/irmwYJxHQ7VDIhBheDEkuyPV7aMDTSv+mz9k8ye/oJbl7l9oG4/NaaevL
         E+s/t/O8G8Qo0a/pn6GMJNgHMAqyyQC6YzF+p853RwD35dJ+o6y7slF00g3244jLZ/Ip
         3TBA==
X-Forwarded-Encrypted: i=1; AJvYcCUOsFYuweW934Pwy6DP5W/14gVCLwfCME+ZeQQ6gm0me/IyvEr3klCWvLb0f8hpKueXA8ZcOlTyL7BmWw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwrGYp98ZW/6qI5tsGv/wxGw5oy14hFMyYl+bSDxShXVGlJgz17
	Ben4M3Sh9bqlvMsCfZEejzRS4QKArrFPrFHsHuBIowhrlZ+RwvE+UNnWMu+EjzWwhsgCsxp6/Yr
	im9yqURm1GzbZWlIQBSMLtQUXEiw=
X-Google-Smtp-Source: AGHT+IFUlmzbLTsFGYihjtzA3b4/xF4lQlYRCLWv50QanOiiRb9UJNd04Ll1C8wrxpzQb0JBZR9YOz+0MxaVbPy8aQQ=
X-Received: by 2002:a05:690c:6d09:b0:627:778f:b0a8 with SMTP id
 00721157ae682-6e2a2e37b2bmr40441297b3.42.1727885149175; Wed, 02 Oct 2024
 09:05:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240911-xtheadvector-v10-0-8d3930091246@rivosinc.com> <20240911-xtheadvector-v10-2-8d3930091246@rivosinc.com>
In-Reply-To: <20240911-xtheadvector-v10-2-8d3930091246@rivosinc.com>
From: Andy Chiu <andybnac@gmail.com>
Date: Thu, 3 Oct 2024 00:05:37 +0800
Message-ID: <CAFTtA3NwGFioVAeipkA6aCUfRY12jKFJiR7MaCpCYNjdsT7TMQ@mail.gmail.com>
Subject: Re: [PATCH v10 02/14] dt-bindings: cpus: add a thead vlen register
 length property
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
> Add a property analogous to the vlenb CSR so that software can detect
> the vector length of each CPU prior to it being brought online.
> Currently software has to assume that the vector length read from the
> boot CPU applies to all possible CPUs. On T-Head CPUs implementing
> pre-ratification vector, reading the th.vlenb CSR may produce an illegal
> instruction trap, so this property is required on such systems.
>
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Andy Chiu <andybnac@gmail.com>

> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 19 +++++++++++++++++=
++
>  1 file changed, 19 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Document=
ation/devicetree/bindings/riscv/cpus.yaml
> index 8edc8261241a..c0cf6cf56749 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -26,6 +26,18 @@ description: |
>  allOf:
>    - $ref: /schemas/cpu.yaml#
>    - $ref: extensions.yaml
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              enum:
> +                - thead,c906
> +                - thead,c910
> +                - thead,c920
> +    then:
> +      properties:
> +        thead,vlenb: false
>
>  properties:
>    compatible:
> @@ -95,6 +107,13 @@ properties:
>      description:
>        The blocksize in bytes for the Zicboz cache operations.
>
> +  thead,vlenb:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      VLEN/8, the vector register length in bytes. This property is requ=
ired on
> +      thead systems where the vector register length is not identical on=
 all harts, or
> +      the vlenb CSR is not available.
> +
>    # RISC-V has multiple properties for cache op block sizes as the sizes
>    # differ between individual CBO extensions
>    cache-op-block-size: false
>
> --
> 2.45.0
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
