Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D41A39E17C
	for <linux-sunxi@lists.linux.dev>; Sun, 10 May 2026 14:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778424031; cv=none; b=C5bKlmLF6ZEBRtF3b2c7kx4GIlp61Rq6vSn6gjB8vecgoS4RWFhmSNjAWVv1Xm9BBaVLzNejZu2FrjvZx79JlFHKqX2588FnVpdDhUTDrA/Uxw1Kr1D61qXnP/AJTN7sbxGoMLpvC9RDiY+DW8lOu5palrT2kbT+aWQimB7dl4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778424031; c=relaxed/simple;
	bh=5hMtyrpO4o/xrWDyBZAdZa2vglyjgQ5ZkQbZ7oKGLqM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C9piGm3z8StSu68OnDv5EiSaRGU8RAcxotCQRiRFm39aKfmCseT2skq2rVqmziIBza0bcIQKjpNqNJV30zQmqv8yN+yEYUyKP12Qm3Mb6LHUcHB2+TAXhoWLOUiOMHw/xc7a50SXWUShnOUrhjgrGITR0mypUnO50cBO2CtuUe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hXWI/P+0; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hXWI/P+0"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso41508995e9.1
        for <linux-sunxi@lists.linux.dev>; Sun, 10 May 2026 07:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778424028; x=1779028828; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hiN95M/W3RKJE3egtZ7DgExVN40C9ma45InA4oM+ByQ=;
        b=hXWI/P+0EEIgMMUk8jINjR1quDsEefuJCGMlB/kLk2wQMTzbIV/xWA2aa2Jz1FnMJu
         UrsiH92BG3GAjTqHrbx4Tm+4Q5nU8caWLrn7rhsRQJAzcoN/g3HEDiDqRNFJgPbQnR2p
         mjKjmvU8lRrz35R4RjFC5aU4kYiAoB3FbB52ogD3z8aiX16ubvuRy60Aat7FGCmfF3ej
         7f9YRrEEB8eWSeuG8Da4826VYw1pVusJmM7badMQcq/k7va+G0QGr+vsPNmf+komLFLW
         bBhhwNFo3dTQuIgDv6+oVdX72SIDl8smNvl/1jwhbzQu9KDpc+v7M+Q3Cw66d4m0Tl78
         X1Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778424028; x=1779028828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hiN95M/W3RKJE3egtZ7DgExVN40C9ma45InA4oM+ByQ=;
        b=kCUGcc8ykKBYkCXqR1zRNaQ0IEv3ch4IJvGQVfvgyWuPKQn3bUlK6Vuu47n8kzO2ue
         1hNDwao4t7pnj8tajpVpa2mfOk59BpQvDLZh3vLT6h+6O9J5CwpYpFZ+p07fdXp/H48U
         veht8GzUK0Pb7S5X0p4YlGiZANvpUak13aF0Ar+twCDTQ0r46UxWq3gTqSY6mwlDJMQJ
         aeiSYgw4dlzWVD/9LBxUpdxiL5K0MIrVuy9ujpz5FLF0vPR9J+Il4t5D0rFxg4JAdPLX
         ue4xQ9CQuR+K+tqKAoEPq3qAEYL68rI5Zz5P6zvMG6wByqOJWsaVl8SiAOvvNEUaVO2P
         AHlQ==
X-Forwarded-Encrypted: i=1; AFNElJ/fJT9C9HITrQUDaqJ3uJ8yc1u1HW5Axl68T6P65L2Jlk8Jk2fwFF1MGeXEzmiv8N4OhDZ1a279OKWnzg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4Q4w+dYFDsQTY8lpnn+Fei1JNHZDmWUK7/mdJtE+pHMuO6ggW
	NwD9+LQoxxbkwPH6evm2xvPje8CKg4+yYBc9hZCRQ0uzfVzaJZeipyIX
X-Gm-Gg: Acq92OEgwUwhNNuHFjehKsEwTeMGp4CyvhlY6Fca1RJ2QWP+0+Y7/oWh5na6LRy81E8
	OR8Xxcop6GnrSKVXEKr7K23bAdn8w0l+gT2TZl88Bxl0lIjPKiKKEGV2j/fUmce1WTJZRoILFS2
	hYxdLKnvdGRDHuOyr747mok1Sv3VBf6Zde08u/sV3hf+TT48Md5POLnfd8ZBqDgN3Lz4d7TKC/l
	iweI6j4VHRCUQyj9k74EyZjrm6RloJNv/mz+7783LdGbMml5XGdzlSLy3cptRLMFIYOOFsxH+iW
	mCbUGejg2WjbuZfR84gYOsz9ko99C05icoqjwAy1JxGWq/8nF2KKIA80eXOmZJwMagU4fJ2FKTx
	RdVXID41DJ9+OKPoZjh9dhpZKV1eZLYWDH6WAwEoozJA8KbVFomlTpC/Md9kuFsKOCztu0raE3T
	B1y/bqWKvJqhStlx2TBMLFs64w/6x/yj73AaEFEjGzhUFtfxonaotwhf4dJ0wbE7Vxkk8uPyaq5
	A9knvUX
X-Received: by 2002:a05:600c:4512:b0:489:284:44ab with SMTP id 5b1f17b1804b1-48e51e1deedmr319196545e9.12.1778424028175;
        Sun, 10 May 2026 07:40:28 -0700 (PDT)
Received: from jernej-laptop.localnet (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e6db09943sm44844115e9.19.2026.05.10.07.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 07:40:27 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
 David Lechner <dlechner@baylibre.com>,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Maksim Kiselev <bigunclemax@gmail.com>,
 Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Michal Piekos <michal.piekos@mmpsystems.pl>
Subject: Re: [PATCH 1/3] dt-bindings: iio: adc: Add GPADC for Allwinner A523
Date: Sun, 10 May 2026 16:40:26 +0200
Message-ID: <5JZHjuPfR4qv95vQhkLpDg@gmail.com>
In-Reply-To: <20260510-sunxi-a523-gpadc-v1-1-4f6b0f4000fb@mmpsystems.pl>
References:
 <20260510-sunxi-a523-gpadc-v1-0-4f6b0f4000fb@mmpsystems.pl>
 <20260510-sunxi-a523-gpadc-v1-1-4f6b0f4000fb@mmpsystems.pl>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne nedelja, 10. maj 2026 ob 14:57:22 Srednjeevropski poletni =C4=8Das je M=
ichal Piekos napisal(a):
> Add support for the GPADC for the Allwinner A523. It differs from the
> D1/T113s/R329/T507 by having two clocks.
>=20
> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> ---
>  .../iio/adc/allwinner,sun20i-d1-gpadc.yaml         | 37 ++++++++++++++++=
+++++-
>  1 file changed, 36 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d=
1-gpadc.yaml b/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d=
1-gpadc.yaml
> index da605a051b94..89da96cd705f 100644
> --- a/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc=
=2Eyaml
> +++ b/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc=
=2Eyaml
> @@ -17,6 +17,7 @@ properties:
>        - items:
>            - enum:
>                - allwinner,sun50i-h616-gpadc
> +              - allwinner,sun55i-a523-gpadc

It shouldn't be combined if it has different number of clocks.

Best regards,
Jernej

>            - const: allwinner,sun20i-d1-gpadc
> =20
>    "#io-channel-cells":
> @@ -29,7 +30,12 @@ properties:
>      const: 0
> =20
>    clocks:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 2
> =20
>    interrupts:
>      maxItems: 1
> @@ -40,6 +46,35 @@ properties:
>    resets:
>      maxItems: 1
> =20
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          items:
> +            - const: allwinner,sun55i-a523-gpadc
> +            - const: allwinner,sun20i-d1-gpadc
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +          maxItems: 2
> +          items:
> +            - description: Bus clock
> +            - description: Module clock
> +        clock-names:
> +          minItems: 2
> +          maxItems: 2
> +          items:
> +            - const: bus
> +            - const: mod
> +      required:
> +        - clock-names
> +    else:
> +      properties:
> +        clocks:
> +          maxItems: 1
> +        clock-names: false
> +
>  patternProperties:
>    "^channel@[0-9a-f]+$":
>      $ref: adc.yaml
>=20
>=20




