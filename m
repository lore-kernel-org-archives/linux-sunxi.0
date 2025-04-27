Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A933222A1CD
	for <linux-sunxi@lists.linux.dev>; Sun, 27 Apr 2025 05:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745732610; cv=none; b=U4DDfJZGwzobVXM+2LUn6l8R9ZBHzxrsZobabwTF7vEasTiyLnWZdM07PVtNYqee/d2J9b2CObiQdUoO7Vt9zVrPlSDcw7icasumeJXhGGuzOesUmr+uc943GbbLyWI+aLDyxx+hWvbbK4PGpqVDTpalCf7y4VTdj17QFS9Ppno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745732610; c=relaxed/simple;
	bh=fGptivm7HpFQnBALM9ABS0OE4T0+36zBT/L71NS477Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LcHZqjYxKjJdK2ZOtuIlnNaru6LEM8Z8gcfEA56o6I+2a+05+WChTcWdSVS/Y9IlYDWLXdFEsoBLZkKSOni5+8V4ZkD9Vuw19MrkbAv/E4vo4Q3/BtMoBGr5M7vWMsxMa4uE4qobELbT/I2QmUS8ql2J/rG0CIyDPNz84Kdbx00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-85e15dc801aso322165739f.2
        for <linux-sunxi@lists.linux.dev>; Sat, 26 Apr 2025 22:43:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745732602; x=1746337402;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oy4M4hL9SuSSgN6ArJgNtJBu7fkhmoEiZXyOUTNGzv8=;
        b=avJ3cSJC3YMcGMY+xRa8+GNBrYib6e3XtU0hCe9RR+JWaD+FJ1PTXuGGJCVwbwukxl
         eOrrs5SZyLQtSwVwfqKf8cRKrspNEpANtrmcbI/2lzpmBgwoQqmBy8B6aUQ0KB4GUcJQ
         v8UnHl40+Rr0IXE98/Q56wSexpct3jnEEiGBHpGqPArNVLNvXXgQrQ10aImRNv6nlT6r
         vrUvJ0zKa28oam0QBRJoF8w8S61b+2JSsTIfbXUxkvbR1wdryfTczi+CUCmRhIAUbATH
         ynBsb/LfekNXhg690jwI1GRXNwD2iC4dd/mvag/JweVq3o8qgaTZd0Sw7Z7ip9IvxQtb
         rn9g==
X-Forwarded-Encrypted: i=1; AJvYcCWqOoVSA0J6rR3+QyHuRI8A9U9O1pQqQDHFhHpw2iIaV0B3T4sM0XILKmcuXIymC9zcvGMgRQnMYQgEYA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwDyHFG8byXHRFif9kz7Q++NvUEcbTQRX+UgQp5epCbpwLx5x/Y
	e8EGX89vmbn5mEUzpknvKx4ImePMDkx0Zl7s8j0gtmM3TXBKrpWlEEe/17KZJMw=
X-Gm-Gg: ASbGnctw3z4VLKvmqkI5jm3621oMJigE/39mQ3qxfJsNkktJiha5jMbhTxO22/swB8g
	aqSK7cs4Aux5Vj+/mo3wahOb1ad9cc6hQsaELzkdox8wsaAWFCtqI0inl6TKDyD1G1v036+gzLC
	XNqPMiKmD6DWlOVv8RZTP04aYKYiQS7HnLcBLCyZ7Eo7RujFA2JJsyW6g+iXJ2rOqCu1RVtXGUd
	iQhKvOhk3qF5SmZMvK7JbEbbGE78VQPU5xLRn35S7oZG0qX0RkpoiHKIyiV0OaFIJDkLGbopReQ
	C7NpG01yC5UjdbQ/KmHcWbeWI5dgEsTbaCBzKDCTD9UFLi8weo9iLLdWt6fT2kC1TzpAoGVKup2
	E9UY8tf4u
X-Google-Smtp-Source: AGHT+IHOWLlg5LPDplAKFvFAJbW2L0nOpYvkZnRaZaemiAJMsFvFGDtNVnpdDL+wW/Bfrt0kcE5bvg==
X-Received: by 2002:a05:6602:7197:b0:864:64e9:7f75 with SMTP id ca18e2360f4ac-86464e98218mr555725839f.11.1745732602528;
        Sat, 26 Apr 2025 22:43:22 -0700 (PDT)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com. [209.85.166.181])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-864519f492asm119232539f.44.2025.04.26.22.43.21
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 22:43:21 -0700 (PDT)
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3d5e2606a1bso34670075ab.0
        for <linux-sunxi@lists.linux.dev>; Sat, 26 Apr 2025 22:43:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVMYhEvMcaer520JTSota40qZtC3ZHdhz7zZnx8RgS2nbGHjKVbWyzeYEwlti39ZylxyZ4FqJw7nHM/KQ==@lists.linux.dev
X-Received: by 2002:a92:ca48:0:b0:3d8:1d34:4edf with SMTP id
 e9e14a558f8ab-3d93b5cd78fmr81686365ab.15.1745732601011; Sat, 26 Apr 2025
 22:43:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250424-01-sun55i-emac0-v2-0-833f04d23e1d@gentoo.org> <20250424-01-sun55i-emac0-v2-2-833f04d23e1d@gentoo.org>
In-Reply-To: <20250424-01-sun55i-emac0-v2-2-833f04d23e1d@gentoo.org>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 27 Apr 2025 13:43:06 +0800
X-Gmail-Original-Message-ID: <CAGb2v64vy9Zx-mJgT7dLMMcx4nbAeQ3n8pbvwT6QkuMTL6kQTg@mail.gmail.com>
X-Gm-Features: ATxdqUH2fWJgqqz2HBql7fBmhdeRPMb6pK4jyUd7a8JS30hjhTPhRmRmPYt9c6Q
Message-ID: <CAGb2v64vy9Zx-mJgT7dLMMcx4nbAeQ3n8pbvwT6QkuMTL6kQTg@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] dt-bindings: arm: sunxi: Add A523 EMAC0 compatible
To: Yixun Lan <dlan@gentoo.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Andre Przywara <andre.przywara@arm.com>, Corentin Labbe <clabbe.montjoie@gmail.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 6:09=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wrote:
>
> Allwinner A523 SoC variant (A527/T527) contains an "EMAC0" Ethernet
> MAC compatible to the A64 version.

The patch subject prefix should be "dt-bindings: net: sun8i-emac: ".

And this needs an Ack from the DT binding maintainers.

ChenYu


> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml | 1=
 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-e=
mac.yaml b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.=
yaml
> index 7fe0352dff0f8d74a08f3f6aac5450ad685e6a08..7b6a2fde8175353621367c8d8=
f7a956e4aac7177 100644
> --- a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yam=
l
> +++ b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yam=
l
> @@ -23,6 +23,7 @@ properties:
>                - allwinner,sun20i-d1-emac
>                - allwinner,sun50i-h6-emac
>                - allwinner,sun50i-h616-emac0
> +              - allwinner,sun55i-a523-emac0
>            - const: allwinner,sun50i-a64-emac
>
>    reg:
>
> --
> 2.49.0
>
>
