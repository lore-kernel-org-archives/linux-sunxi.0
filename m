Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456E6145B0B
	for <linux-sunxi@lists.linux.dev>; Thu, 16 May 2024 12:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715863858; cv=none; b=CKueswXHpp2uAl3PTKeLMNeTVbZ0Rj6QnlHzqA74rCp/ASIr+aFFeOKJL680Goaf9HeZ+ZtztbVGBO9L1M2T8yKeksHxvKwqnSn7NZdsPt7iKmfW5HJitnGp0HgNr27DgGlw377B0B0F7xXHGMpEu+XotpMRFaPd/ztXowOFddI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715863858; c=relaxed/simple;
	bh=kZU55I/RDRwDthGYCDmfPc+xZ2lz+hR5qGvHj4RkRqY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OjVGkibad/hvW6xWawRXUie1Xzn9sUTAzCdhKNeP9E7PxVrMT3Sv/XxBy3yXJWKQ7loXnfkTsFI+nJaNgmERvtUKCuGlHAxtBeIdmq5dAVKEy2iGwL3LNoKeNGJqo65w1xt9wNOvx/k9CSPlid16+Vrul0bOKxsx2ZJdcTYadmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=dBZLJTE/; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="dBZLJTE/"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6153d85053aso64343487b3.0
        for <linux-sunxi@lists.linux.dev>; Thu, 16 May 2024 05:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1715863856; x=1716468656; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Od+pJB6mZAnjsfvS954bc7TMJjR9/PUts1oYAKpTsg=;
        b=dBZLJTE/HXxHWLkiruM3fEi5VXNRvCUrD7qatT2qqzFKU4mMyAHHXIJwomYQj159WK
         OKnSECuLXyvZIktVcAovOEAzMURF0ahPCMlYc4WJhVnU80ri091vLOE61fi2PSVVoAgO
         IeKh+0ct0fsjB/MlvbKbY/oAsIuhonaIoqDn9fteLQCKiMV0u+dKCVAh64v+b6maEFhE
         Itj1hy6dZroS9xnmZfwXYihSmK70AWY+IiGN2tiRriiMh2iCcNbjF9BHkD/1Ho8XQICe
         hYByFCodUL2DdF2Eb6F7n7a1S2R8af9+i6Q7013oMt43uWVDj9wR8Jat0lMMVtTttD2s
         4QBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715863856; x=1716468656;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Od+pJB6mZAnjsfvS954bc7TMJjR9/PUts1oYAKpTsg=;
        b=aMF13r+/HxAPJOEnLPxF0tuwmDq8HyJUbXpaRjoPHHJIIZVdMiRTWITFqGamHkSJfV
         pgUwjrYBARrEhcJf+WFgMz/TDegEsAu1lCwqcEO1M8CTKajP5ImzwMxNBCw22WTKQgQF
         SR74gL/6k1hsMwHEQ0AnAvSYXxDasGhnTsdLpDnaaDhPxB0nHYW553QDy2DKMvqVpjmj
         4o5eCADIPe7/BadoSbPHS4LbeYsAI30cXiOyd7liY3NtMCC+nsFEXzvxV1r+rVlWuT88
         Ja0UEYechuWG+gEEY+P4UH5YNNE8w19LXtjP4dLelBxG+0ngE1hy96qbUgcAp3VUazA+
         pdtg==
X-Forwarded-Encrypted: i=1; AJvYcCWN5q/VpsBdZ7P8WxpmFdG6KflSvMpaZvxW6uQu1M1Z2ZVizyJfKwmmXnb8LfjKFS8q2sUjNo8hKDphZx8a7RnHSboWdWFYun6Zzsc=
X-Gm-Message-State: AOJu0YwfuuU+VsrZG8MdHaIaDd3X8iVgzWH9Mjyb7r7C2U7QtejMe0aJ
	BpDByAUWn0/bu56bnCiuydw4YHPXx4yJaVcs/TJUDQJHLdGE/1VSRrlzEUdivg0WOajfA1IjlFs
	3R/zCAB89Paj/69shjiuAggY5syGb1Lzh611jAw==
X-Google-Smtp-Source: AGHT+IGs7lVMK92YN+1HJCcotmujY/ztr2anQuNr3U+Iebkb2i92DLwZmM+D3pTVHWKs6H4058jiuMgZuuev28xE+eY=
X-Received: by 2002:a0d:cb52:0:b0:615:46dc:44db with SMTP id
 00721157ae682-622b013ca1bmr180898027b3.35.1715863856375; Thu, 16 May 2024
 05:50:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240503-dev-charlie-support_thead_vector_6_9-v6-0-cb7624e65d82@rivosinc.com>
 <20240503-dev-charlie-support_thead_vector_6_9-v6-2-cb7624e65d82@rivosinc.com>
In-Reply-To: <20240503-dev-charlie-support_thead_vector_6_9-v6-2-cb7624e65d82@rivosinc.com>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Thu, 16 May 2024 20:50:45 +0800
Message-ID: <CABgGipXNoiQ-+R3CzFS_hGT+d9L9vhqyB1famkDmm=v8XcYavg@mail.gmail.com>
Subject: Re: [PATCH v6 02/17] dt-bindings: riscv: cpus: add a vlen register
 length property
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

On Sat, May 4, 2024 at 3:33=E2=80=AFAM Charlie Jenkins <charlie@rivosinc.co=
m> wrote:
>
> From: Conor Dooley <conor.dooley@microchip.com>
>
> Add a property analogous to the vlenb CSR so that software can detect
> the vector length of each CPU prior to it being brought online.
> Currently software has to assume that the vector length read from the
> boot CPU applies to all possible CPUs. On T-Head CPUs implementing
> pre-ratification vector, reading the th.vlenb CSR may produce an illegal
> instruction trap, so this property is required on such systems.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>

Reviewed-by: Andy Chiu <andy.chiu@sifive.com>

> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Document=
ation/devicetree/bindings/riscv/cpus.yaml
> index d87dd50f1a4b..edcb6a7d9319 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -94,6 +94,12 @@ properties:
>      description:
>        The blocksize in bytes for the Zicboz cache operations.
>
> +  riscv,vlenb:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      VLEN/8, the vector register length in bytes. This property is requ=
ired in
> +      systems where the vector register length is not identical on all h=
arts.
> +
>    # RISC-V has multiple properties for cache op block sizes as the sizes
>    # differ between individual CBO extensions
>    cache-op-block-size: false
>
> --
> 2.44.0
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
