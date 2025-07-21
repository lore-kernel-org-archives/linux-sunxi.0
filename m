Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB79E2BE7A6
	for <linux-sunxi@lists.linux.dev>; Mon, 21 Jul 2025 14:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753109967; cv=none; b=cXBuDaj7lAto58em4UE5xvnyHZxUGqVFB4WZIGm4jsh1JkWXNsLXCj7AymHhTjjzzLT0Gm1D5WXNxfu6PaX4lToToyHyXsW/r9IN//yjWvoyALxlU0tziVJdfjL2dzfeutSxVVzy9finShJp1IjBbFDW6wAWKXRqHeoSMm6bAiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753109967; c=relaxed/simple;
	bh=oJFGLxx4w+WvcpaBlQ7bCMY8tA2AjyOdVqFYYfNhzDw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QgRQC4s8JsiH1i1fbcafzvMnsHYzTH2AYwPz8Q+cT+ZyciDbJFnQ1fCr9mm76iXoAhHZjgj3O4G03TbR/EuqLW60wHZqvgQRuCSnOK/FylCCcrp+wfsHUS4yA3SpJ9ghPWK3U2AaJQejBFOAglpb7zRMx1Bb7tc/7KyATECWLyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-32f1aaf0d60so44322191fa.1
        for <linux-sunxi@lists.linux.dev>; Mon, 21 Jul 2025 07:59:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753109962; x=1753714762;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0rmsuabFxgO5HQbcS/AHuTJwDw0eGQTKollo0RZOzC8=;
        b=t3tL3V9OgE43FrkWROiM3hX412B7TDLh5Cdaj4yOzg7aXQFqrE1lUpw3xyZGIi8pbq
         kPkRLszCu45xspMAbw9R0qv2nQTn9Rv04YJH8estjgSbKS5w7Bc0pj8PIomb1fRdxccu
         PqPn5XMKYT9fTAYOmWM/lAxrFI4X7PAp/phE1piL6OpNbeasmJ19PxI/RyRp/bMWBizz
         n+9cR8sHwZso9iwCf0J9Pel4ZxeztxUaTvIBILr85nEX6NBnoU2LFSW1i7ZPTFtbt8MC
         /FZJsvmKP/QEID1A4pX/EtuM+O5G1Cr5bbEuPaMTA2ZVAc3a0QA9m7YJWF5SdXj6c2rz
         D5YA==
X-Forwarded-Encrypted: i=1; AJvYcCWiNKmRGKgxX0qwVI7C5NymU/bVi6PfWUrfiIMt5DFWzZ6Gv9Gt43/H8ZlipnpEtu5bi9JNYAoZuVWjbA==@lists.linux.dev
X-Gm-Message-State: AOJu0YypLhtVt/ktDUJSR1qSZn2iDPy1qjTIobXuB2IAGgL8appAhwVJ
	VdA4HiHdKRM4xmCuwJpi0kewIwKhs8g2+jjBgiJCJsd6v5z0AVQt7GpjonALukKa
X-Gm-Gg: ASbGncu0H5MhZJkpniYQvpKXzQ4kCB1VVOea+yLFnJReKzgbG6jvsFO24c9YEDG3VAH
	3eYkEKcMNhXChIx7eeFnwPfVJla+pnO2DYXkP7TcvIWkRPIcto+ZIe5L9nFnf7z9Ek0BdkYX45Y
	KDnCyPw93d1n9dsAg0gmQpTYL+SDow8kwOPyKtCo+9CfYtluN9AgFXj77S2VwljFprHcB/omTKo
	0LGdhexaqlXxqeM3ImToFEco6rIXYzItbaUxLpJSE8LChIU46AZnPFQVEG4rnAFAPP8PeWdI61o
	pqfegJO+DxEOB/1QUbsv/ewzwUHc0lH9bihBfIkxblxtAGH/IRFODgxGrJu9/aNHq1CBXgg3WR1
	36LXw/6cU4DgpXXlX5ZHpPLYd7Upx2J7KqCNGBEdDblAYd9Qesu9AzEs=
X-Google-Smtp-Source: AGHT+IF72lWmeTXG7gpsM+p4bBpu5x+9O3EoJTSbx+4CJ+UOntQX41Dj9vUuVjZ6Tr3AjuDW9A1pZA==
X-Received: by 2002:a05:651c:2118:b0:32a:7979:47c3 with SMTP id 38308e7fff4ca-3309a4a9b85mr40401701fa.11.1753109962132;
        Mon, 21 Jul 2025 07:59:22 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-330a91f640csm13536111fa.91.2025.07.21.07.59.21
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jul 2025 07:59:21 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-32f1aaf0d60so44321901fa.1
        for <linux-sunxi@lists.linux.dev>; Mon, 21 Jul 2025 07:59:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVDEDTvMgsbcWI5nv8YGAxt8DSQqinhSPEJz8CdKD81UAZAXIkohuZ7uFdYLJyCz1M8bZEa3qD4p7D4Lg==@lists.linux.dev
X-Received: by 2002:a05:651c:b10:b0:32f:3671:4d6d with SMTP id
 38308e7fff4ca-3309a469ac4mr36664631fa.1.1753109960994; Mon, 21 Jul 2025
 07:59:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250720085047.5340-1-ryan@testtoast.com> <20250720085047.5340-2-ryan@testtoast.com>
In-Reply-To: <20250720085047.5340-2-ryan@testtoast.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 21 Jul 2025 22:59:08 +0800
X-Gmail-Original-Message-ID: <CAGb2v6641hLu85FJieWGH5YJsRmxCD1U-tXgStMZtCN1u0sFBQ@mail.gmail.com>
X-Gm-Features: Ac12FXy8xxyVpMZUJXrjnYkRucYHTAN65deHIYaoxabOBlfZwoY8o6UDGEBDiMM
Message-ID: <CAGb2v6641hLu85FJieWGH5YJsRmxCD1U-tXgStMZtCN1u0sFBQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/12] dt-bindings: allwinner: Add TCON_TOP_LCD clock defines
To: Ryan Walklin <ryan@testtoast.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>, 
	Chris Morgan <macroalpha82@gmail.com>, Hironori KIKUCHI <kikuchan98@gmail.com>, 
	Philippe Simons <simons.philippe@gmail.com>, linux-sunxi@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi.


On Sun, Jul 20, 2025 at 4:51=E2=80=AFPM Ryan Walklin <ryan@testtoast.com> w=
rote:
>
> The Allwinner H700 exposes RGB and LVDS pins as well as a HDMI
> connector. This requires additional clocks for the TCON_TOP as per the
> T507 datasheet (which shares the same die).
>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> ---
>  include/dt-bindings/clock/sun8i-tcon-top.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/include/dt-bindings/clock/sun8i-tcon-top.h b/include/dt-bind=
ings/clock/sun8i-tcon-top.h
> index 25164d767835..2a12d047d2e1 100644
> --- a/include/dt-bindings/clock/sun8i-tcon-top.h
> +++ b/include/dt-bindings/clock/sun8i-tcon-top.h
> @@ -7,5 +7,7 @@
>  #define CLK_TCON_TOP_TV0       0
>  #define CLK_TCON_TOP_TV1       1
>  #define CLK_TCON_TOP_DSI       2
> +#define CLK_TCON_TOP_LCD0      3
> +#define CLK_TCON_TOP_LCD1      4

I'm confused as I don't see these new ones used anywhere in the series.

ChenYu
