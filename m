Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8072227701
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Apr 2025 03:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744859681; cv=none; b=s4dEgoT10ZJkRHKhFWGh/IGRAynhWRnFYwfLcNeRhty3oEW5r7r9Mx9ULAgAADl6xYglzvib3VdvqYnYE0bi3Vs085eaTLSotFPkHuluaTTFFVaoAL47pncz05qvbOLBHBCtD8uXsb686a0+aDQJeVmS3HKSsX6v47jHFCZ4Ias=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744859681; c=relaxed/simple;
	bh=RR+y52SUTPzi+E8u5B+AgHaBLqVXGgwSNZgKMma1sBg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jITrTAeGadKYgR87Sz8M1uT68KJnukNRoD5NuwLoD+AJPcmPDDgwl6x3PJ1Ixgmgv1dTWd4dtTfP/YpCKMLm+7fH0aFCst5TV9FGDq74QVsnIAN6OsHR7AQxeyWqyStETpmGL8DdcHtVjDVtytfWdd8PzUPrZob1JC/B7JS9k+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30dd5a93b49so2958381fa.0
        for <linux-sunxi@lists.linux.dev>; Wed, 16 Apr 2025 20:14:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744859674; x=1745464474;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lEAcyQxjxEddEf75aHlB/SZ9GV/mTO73qRXKgW1f4Hc=;
        b=CHJzrA7EBRyAeqMRfkfNIzQPNLRLY9od8rLeDYSCCFblt1ZtYb6fTEA5WF6u3yKhkM
         C0Hl48o+tF/uh2SEvUYqnKKb5UGC1dg4oCGwinijXSOvfVaG0P7OzM0PcsF3prUpKW4H
         lYWSc2ahN0Q+gyTxQUpnM+V9rbaGoB3P2dUbCGmD1KYZBdCZW8xLxHsBEPPZM8uc7j5z
         JgB6JtNwF2GCPwCxJyBqXVbYsAS9RfZHxP8ks++hll2YvDM09C6NR0KhzULrc9M2Mv7H
         oT2m0byjiIsxAorucgh3q3mCMVSisiY7QOs4ardJV6ny9H2Z/PLJKCOGEUAKQxdB5kGR
         KWCg==
X-Forwarded-Encrypted: i=1; AJvYcCXG3FjO5WL90517Jdj/aLtrlr1Jzm5q8SoEefTU9e0c5UlKMqRFRvLWELw6AAxlTcSbMjWotsIGJExAcw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyhhXPatk3zkcn+L6m5zyRuhjir+xBCiwdgGCK0fh+xDeprGKHy
	rzzgzEdgJAk2kJlcjbqALelnIiO9RBFM9OiFdWGnFQDkVLtc11I7CdnGMeck
X-Gm-Gg: ASbGncuymONSz901cmFUwzgsvrA2NZgjXxF2LYJqZ7atc+V8sZ75u2ptV+UgcmnqXMG
	YgryFAATWhGGNmcVA4CLQ5R2ii5R7JbjBawGO4J5zFp48Z+M85wEWgyw6A8pt4Vg34WJDqxT3G7
	2IqS95WEEW9c3h3hsaND1SWkW2mRSUKtJI0DMbFERdB11mkrKP1OqvEg53zZ5UFryRuecQz23lD
	eLwVUftciEKRm9c4Bpqdr0+NuxFJCHN5GMH5rqeKXL3JqSNaBw0vNAdE/C8RMnEVq9rUx908CBC
	CJg9Q/7fh/SMGnq6UMx0g0pnBT33id9CmlfRE2ah5LTqt6FUk3fBprUa7pZIScscL+CycJQclQ=
	=
X-Google-Smtp-Source: AGHT+IHcxgXfFk4PQgbYDniPaeN6WXpjmX2EPFXXcHvBj3qEcnuoUSEqeWFLxxtu1KVANtpY5YN1oQ==
X-Received: by 2002:a05:651c:1613:b0:30b:c96a:74c with SMTP id 38308e7fff4ca-3107f68c307mr17547381fa.1.1744859673726;
        Wed, 16 Apr 2025 20:14:33 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3108a345fe4sm21441fa.27.2025.04.16.20.14.33
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 20:14:33 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30db1bd3bddso2840881fa.3
        for <linux-sunxi@lists.linux.dev>; Wed, 16 Apr 2025 20:14:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUCpq32TPn6dS2WhurR9YQ+39TnOEaYM3Z0GDPlZzIykX51wyhMjfSaRUlYYuQ2N0ZCWwJ5WnxKzIdKig==@lists.linux.dev
X-Received: by 2002:a05:651c:30c2:b0:30c:3099:13d0 with SMTP id
 38308e7fff4ca-3107f6ce071mr16267491fa.21.1744859673381; Wed, 16 Apr 2025
 20:14:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250416224839.9840-1-andre.przywara@arm.com> <20250416224839.9840-2-andre.przywara@arm.com>
In-Reply-To: <20250416224839.9840-2-andre.przywara@arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 17 Apr 2025 11:14:21 +0800
X-Gmail-Original-Message-ID: <CAGb2v67-wqA4A1=NKee0JNEW2+SABdixN0H-HBg8aJjGZjKdJw@mail.gmail.com>
X-Gm-Features: ATxdqUHs7z3ZrbeWhMV3p3pM4JurppAfWHNtXUVUqdTkjloev5549-NL7E-N6XA
Message-ID: <CAGb2v67-wqA4A1=NKee0JNEW2+SABdixN0H-HBg8aJjGZjKdJw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: power: Add Allwinner H6/H616 PRCM PPU
To: Andre Przywara <andre.przywara@arm.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, 
	Philippe Simons <simons.philippe@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 6:49=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> The Allwinner H6 and some later SoCs contain some bits in the PRCM (Power
> Reset Clock Management) block that control some power domains.
> Those power domains include the one for the GPU, the PLLs and some
> analogue circuits.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../power/allwinner,sun50i-h6-prcm-ppu.yaml   | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/allwinner,sun=
50i-h6-prcm-ppu.yaml
>
> diff --git a/Documentation/devicetree/bindings/power/allwinner,sun50i-h6-=
prcm-ppu.yaml b/Documentation/devicetree/bindings/power/allwinner,sun50i-h6=
-prcm-ppu.yaml
> new file mode 100644
> index 0000000000000..7eaff9baf7268
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/allwinner,sun50i-h6-prcm-pp=
u.yaml
> @@ -0,0 +1,42 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/power/allwinner,sun50i-h6-prcm-ppu.ya=
ml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Allwinner SoCs PRCM power domain controller
> +
> +maintainers:
> +  - Andre Przywara <andre.przywara@arm.com>
> +
> +description:
> +  The Allwinner Power Reset Clock Management (PRCM) unit contains bits t=
o
> +  control a few power domains.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - allwinner,sun50i-h6-prcm-ppu
> +      - allwinner,sun50i-h616-prcm-ppu
> +      - allwinner,sun55i-a523-prcm-ppu
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#power-domain-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#power-domain-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    prcm_ppu: power-controller@7010210 {

This doesn't match the address below.

ChenYu

> +        compatible =3D "allwinner,sun50i-h616-prcm-ppu";
> +        reg =3D <0x07010250 0x10>;
> +        #power-domain-cells =3D <1>;
> +    };
> --
> 2.46.3
>
