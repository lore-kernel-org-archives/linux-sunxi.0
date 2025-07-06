Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92EA22AE90
	for <linux-sunxi@lists.linux.dev>; Sun,  6 Jul 2025 13:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751807860; cv=none; b=mA1CPIv0aFB3XKQ0Q5TvqPYLCoPpggkqb4Dbyf6N9tNAeO1xMglAbikyQHI370BpVHQGUqvDW7tGLAfNZvE2zBuVpQy+z0Y1+Il4+jC/E/pv2W5snfgTm54Hkj9FQAz4AwaDo4hy0ui6Jwra/8jHKVoJHCwgrXGihWu/I13dLhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751807860; c=relaxed/simple;
	bh=Mv/shLjCKwn0QObl0EoTZZfjn3MUjEkt7hwbMWVsVCU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eO0lete1Z+E9OJtHgiKE6qUlFtfEVu686Eotvc7hPFtgN0pqLuospdS1PfhJGC7FDWXz2nxLjz2hdABwigjIZJ+vPELcQQS6JjBaeykdX4FPslomXTxJyOF/Q27USn9r3KbnW2RCH+Ly1KEDzdPE3IckbzMY4VvaXT2fzKTJaAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-555163cd09aso2198087e87.3
        for <linux-sunxi@lists.linux.dev>; Sun, 06 Jul 2025 06:17:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751807853; x=1752412653;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L0y9e3VsPZwS3i8gc70lCXlWKvcLrZlEitoiyjDH0k0=;
        b=pa8anQtS6fWyerzF4gMZPzyO/NBzi21e+oAbibvDBTJSk6J5ubCi13Wyz20bJrpvIP
         VrTa+qvw07aBdm0HJgN094eDBxyMcb57LEIAQiCO9CGDkRVEtXeJZbImBrgaN8BhJRfx
         U+v+kTweZMfSpU1KkqM9gBuQEBT2G3mwGoIlFf1bn/oXYuHcLpfj289Ddd+e072f0A8S
         kSpwq/5MrqOdZkCaEXegYN79WqpFE8dsCCyvTjtSoJCG4Ab+k7tqlIcrbZ/ss+IU9g/y
         yESIhM7Maiu4nqWftzsxUj0E2qqLBPOe6mXa3sfbq1vA3bbHkj/Mz5u8NoEt7yTyBy+E
         hKjA==
X-Forwarded-Encrypted: i=1; AJvYcCXlZCYho1SXrC2O6tqXooqGDxAwHsPDEP+YaQCfwvmbGQYo7C52RklZWbjAq2GaD88e3oOmy+QAxXE7rQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1PzQsaU6SlYK0/ZwfOOKrnm85rt8tC4xnfUFo3WkZmZK+OMdT
	YkBl6pQHKtbzWO4Ns6/XjKAqFCkpRw07jBF70L/ptd+UmlXXivs/2l86Dth3T+Gw2ak=
X-Gm-Gg: ASbGncuUr+HOnp/1aF4DAdL5ExUzflPewOSfCEvpgdJ2u6pbSPhG4GzJ5Iu4t9z2QuQ
	IR5RGNP8OCe2xKXyxDxaphjiijCzAa7d5StJSa9Qa8UwgvcS4eG5jPOz7smbwFlFJsEet5QWAXA
	j2PWN333B2okN+UUwarv8w/qyplkeI1+X2M9IhqdmDeDk0yQAasoJdxObmX7Qkw8e0EI8DuhxAt
	HpI97sHjHfZQxcReTOEEtB3HHzn4IA4L4FYMWlJKv4VVKww1vU13CvEvw+arCD694XyvaaN73wV
	neQFyPDczFR9fcXvAWKSLcK4RSEeRXuQh+fM6f6Jew26dsXI/fadSIbwrPosLB1FcvPuvGVO4mh
	yBB86tJDIKDTqD8wNZC8=
X-Google-Smtp-Source: AGHT+IFfH1+9lwMxaxMryfVzoEfvdJcwajcXMx7zYjsepmqhkCXCG8C7381tUBv8Hw9iMOHrfPi3Sg==
X-Received: by 2002:a05:6512:3181:b0:553:25e4:274b with SMTP id 2adb3069b0e04-557e5558655mr1308472e87.41.1751807852748;
        Sun, 06 Jul 2025 06:17:32 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384a86a3sm939010e87.159.2025.07.06.06.17.32
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Jul 2025 06:17:32 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-32b8134ef6aso19939151fa.0
        for <linux-sunxi@lists.linux.dev>; Sun, 06 Jul 2025 06:17:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVKMBNiuBaVL8vNwrPBcdc4lTubxo2zvP9aXw4SD3JD4OAf1MorQ9kHeFKFkKJfSRsTPy2cBCmOF9hFIQ==@lists.linux.dev
X-Received: by 2002:a05:651c:1104:b0:32b:755e:6cc8 with SMTP id
 38308e7fff4ca-32f19af1307mr14177851fa.31.1751807852041; Sun, 06 Jul 2025
 06:17:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250706095804.50475-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250706095804.50475-2-krzysztof.kozlowski@linaro.org>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 6 Jul 2025 21:17:18 +0800
X-Gmail-Original-Message-ID: <CAGb2v65XF=A5Qrm8FrLQaZXLLs5T-0osBLP3Fz3UabrTi5xUXQ@mail.gmail.com>
X-Gm-Features: Ac12FXzvgRNdcFpttWg_IhO6gnULQzwACTFMlrJqzvSYihRttnVAncFXhqPJE4A
Message-ID: <CAGb2v65XF=A5Qrm8FrLQaZXLLs5T-0osBLP3Fz3UabrTi5xUXQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: arm: sunxi: Combine board variants into enums
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, lukas.schmid@netcube.li
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 6, 2025 at 5:58=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> The common style in all bindings for enumerating similar variants is to
> use 'enum', not 'oneOf', so all boards of same variant or using same SoM
> should be grouped under enum.  It is more readable, more compact and
> makes easier to find actual devices from the same family/type.  Also
> there is completely no point to repeat the compatible in the description
> (incircuit,icnova-a20-adb4006 implies this is "ICnova A20 ADB4006" and
> pine64,pinephone-1.2 implies "Pine64 PinePhone (1.2)").
>
> Combine two easily visible cases: ICnova A20 and Pine64 PinePhone.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

I can take it through the sunxi tree if you prefer. We do have new
boards coming in this cycle, but I don't think there is any overlap
in the board binding file.
