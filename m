Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FC1383B2
	for <linux-sunxi@lists.linux.dev>; Tue, 11 Jun 2024 15:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718121557; cv=none; b=aXXUhtHvM3FeMzVvXi+9+qo4sntQBIr0F6qHH3QoQtgH4uC2NOZTFjhiLiuHF2FPrCSWg1WimGXTREDODs7Y8RXRuHJO+DDLfW1d+bJ8BZ8sSoALiaZWu/IvwfUKw2SIjf4oqrJHc6tgZxNIa+j1QOxn3xCkYLf2fL+6zPf9nZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718121557; c=relaxed/simple;
	bh=HsSfwE4c9FKwzt2D18mve0ctqok3simx/c6Sk4d9mD8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jyAhTqivANgWULg/+ihxQe+98tW7x1DBQ+XTxS4G6b3HEQQc3tets2G20ZTGjbbdxjmXmNBE3C7yknhX3SaJ9sALzfQgUBPzV4QQ27vOJtOsnfSu6eIur0LgStRhQXCayu6k1HFZYAtF2CEe9OuGhhVucnIRuY4p0vVD8cRvEa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=CYNb1Y06; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="CYNb1Y06"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a6f0c3d0792so155281566b.3
        for <linux-sunxi@lists.linux.dev>; Tue, 11 Jun 2024 08:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718121554; x=1718726354; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7KeeLnew4Dr2lt2iWiQJB+NWU2kaX728eR1Y/pdt+oA=;
        b=CYNb1Y06bu0bfXDhNok6bOey9V+zaNRGKzNRNCsIlAUdlZTNz6k3AhHm4O6pe/lEUw
         wwQGU96ctW4YObBUkScW8w5P5F5TwkWOlXa5BYZc8R30idQYAvjIRGjjlZL74OasApRN
         I7SasazSkI8/4YK0ShXKXjx1AnOIEqG21Pce1txk6hP99AVUCmyS8+piCstK9rbi8Ucj
         4Qp5SRZABhDUtmO+iWbYoT6GDHN+DeX8vFbMQ1n+8VD03tXgyB33P8zb8ZrDI9oChrXe
         gj4OLuPmzGStl7bdAcaq3tSD9Mb4rq0AI4rFIR9j7+XEbJUVlTuNwW09IU9NaQXTJdGt
         +kiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718121554; x=1718726354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7KeeLnew4Dr2lt2iWiQJB+NWU2kaX728eR1Y/pdt+oA=;
        b=fSRLSAQEBxhuXsa4zamti77n19HfZWpakIKEAQcv7p9MkA9kdBV3R/i2OLiHgtDfks
         ugcgo1WwPejjGixKNHgbilN7i3w2IDcvhBXGIJ/NKgS37FNpTOuqOm1n7Nopwp8AGZzy
         wW9MstSJsb2OS/VUnb75IrfSz+BSZSyQNJZw+MaVU/OFlo/zspKMUewEXDqHbpt4BRUw
         Ei8o8Z40wJrYXnHtu7/59JuEa3QTqRyv4jPJCnTVY4cCYP06szZAKmAeVcVXCgZPefA5
         FnCkml/5/m/x4OqhU/T9chzLrk96BK2C8YCL5Y3e8AWFZHv9TvWPX0OHxfmERezIxEGW
         SIPw==
X-Forwarded-Encrypted: i=1; AJvYcCV4dZtK69kb8juGYIOb6MLTPqg8IEoVheW1lab+kUFOlEwzU6Aru01cjW4CvRsDwwOY4ksLkFErByalJ/NEYlwZpFEL0c/bL2LlyUQ=
X-Gm-Message-State: AOJu0Yy1rtDLBoogkGCV2xwRJgiQ2Gvv8c6w5J8k3dOMdHDT2wUqcDS5
	bPb9Bo+IcXW2KmDt1NfBoRC77ArwnYx5kqL0n4B3ouux+qOkVhbPUqcrvpcMoeJnfNgB+5qogyT
	tQSIpL6QIwXFgWvgaKwxp459IrtCqEcXIS6rOig==
X-Google-Smtp-Source: AGHT+IFtN4cYhXjGsiGLi9dtTvtTxex9wzVTtZ32q9gZra1QREy0esNjyQa0xfTpDsvoF9kv8aqdxu0J/DY1HdrDZBE=
X-Received: by 2002:a17:906:2811:b0:a6e:f7bc:dcab with SMTP id
 a640c23a62f3a-a6ef7bcdd76mr607353666b.65.1718121553604; Tue, 11 Jun 2024
 08:59:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240610-xtheadvector-v2-0-97a48613ad64@rivosinc.com> <20240610-xtheadvector-v2-11-97a48613ad64@rivosinc.com>
In-Reply-To: <20240610-xtheadvector-v2-11-97a48613ad64@rivosinc.com>
From: Evan Green <evan@rivosinc.com>
Date: Tue, 11 Jun 2024 08:58:37 -0700
Message-ID: <CALs-Hsu2jFAfr7H9UfLd9VHEZvpfF7Q6Chxko3XbBZBCU94eSw@mail.gmail.com>
Subject: Re: [PATCH v2 11/13] riscv: hwprobe: Document thead vendor extensions
 and xtheadvector extension
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Andy Chiu <andy.chiu@sifive.com>, Jessica Clarke <jrtc27@jrtc27.com>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 10, 2024 at 3:57=E2=80=AFPM Charlie Jenkins <charlie@rivosinc.c=
om> wrote:
>
> Document support for thead vendor extensions using the key
> RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0 and xtheadvector extension using
> the key RISCV_HWPROBE_VENDOR_EXT_XTHEADVECTOR.
>
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> Reviewed-by: Evan Green <evan@rivosinc.com>
> ---
>  Documentation/arch/riscv/hwprobe.rst | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/ri=
scv/hwprobe.rst
> index 204cd4433af5..9c0ef8c57228 100644
> --- a/Documentation/arch/riscv/hwprobe.rst
> +++ b/Documentation/arch/riscv/hwprobe.rst
> @@ -214,3 +214,13 @@ The following keys are defined:
>
>  * :c:macro:`RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE`: An unsigned int which
>    represents the size of the Zicboz block in bytes.
> +
> +* :c:macro:`RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0`: A bitmask containing =
the

Our recent snafoo with CPUPERF_0 popped into my memory
when reading this. Does this work properly with the WHICH_CPUS flag?
Specifically, we need hwprobe_key_is_bitmask() to return true for this
key since it's a bitmask.
