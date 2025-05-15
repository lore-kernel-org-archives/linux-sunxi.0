Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591D9283FC9
	for <linux-sunxi@lists.linux.dev>; Thu, 15 May 2025 08:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747296038; cv=none; b=NXHqwGDS5/MB29JSF3ms6NicI/3gs0Smrc7jaBVcZLIfTvA45ZH1fdVT8Sr6fkQrg4Mw1jhjOfhtXfqLdRdTJ2+LgDbF2h9rwUtQ/H2rmb5DOlYgr0LJ1KRqLusCrHAUdSMkrhg9liA7290ycc1Je3CQdzPRUlLlYe0hUDZ/454=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747296038; c=relaxed/simple;
	bh=tk/XDQLggBW/cCd7GmHTdtwt/QcoAPS1/He9RNjMpkw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jx4ofEkY+xJr8sYtP9EXv9Wf+O7uP9gmaqeF4LW8JqLqRBzi4zNSAmo1060HvQOFssUM3fTLopJ4RJSEsp99xyZi2uNdOHatphRgJR7vXqOwqqjc4WDs/NAefdgv9LGOycO9aM7eUxgZ53gJxn9biY98Zc51FhB7DNOKa2mLs0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54d3ee30af1so664786e87.0
        for <linux-sunxi@lists.linux.dev>; Thu, 15 May 2025 01:00:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747296031; x=1747900831;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=83/6bruci8d3XeppjMMQIod4VG9vV6e31bosgCEHfPA=;
        b=t0hQwb1lLkhrbvrFM6IhDRDYM3D2KOJWQT3+oV/1qPF+t3AzAfdJ+kvWctYNtw8z2l
         vfiabfB22+kvCavjHzA4aNx8mTykb1igYCpj0ge6UoOP48Z4mHK95UT/b3PdaVNKYhjS
         aktLNql4mE7Ro2YRivXv3ueQe7ydgq+FdUeTWmyEMQ/+kiS7THDplnNknHS5cK5nnGLy
         x+SFaxYgwF+EdujhlgL6DyC8CB2sKKQY7n2qYi30z3r/DBziKQX7iwRZja0TvdPoycz9
         nMakD+bw0eSMKK67UIk1dZkIGBQNHoi0S7JzXuY4fhkQQHoLKEXNArQa8lb7hQ4uulFS
         584w==
X-Forwarded-Encrypted: i=1; AJvYcCUj3UmHyFEzrPRhJdm/JlYj/PHQTcY/QJNvKIHuh73pavw5kBJfansYmOWMmwO3FD5RbaLVDZvq+TVmrA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxpgeW0c42fe3lixmHb4gVoF/N/FwVZbO9v8xX1tZheqz10TnmE
	/9CQam3Lx95Gh4+YGVbFr5nbznEobGfRefWvxE9x0EUITtuwPalkqLuIPVDJ
X-Gm-Gg: ASbGncuUYh2zuPOvKFcxR1xcouFtTYKcHW7lMguqOVFFb9c1KZv1AkTtsTWwf/HElun
	Ms+9h8Z6zJabrB2QoDitjX801pB7A6t8NDI7N/aMJKsI/7jfPnkWpjUOt1E2N8VFStFiuL9OP0a
	+khV1BjOHHkqNGfI8yU/pCt5Uk9EMmhwaeJVRUHq5EYCxNPj475+Is/pDCywtKb5BJ9dZXpHgbw
	atDu43WX9PTl5UJPn8dtkOM/7yblSHb98VRajV8PtiTwtQzXInGQQKuomEZFh4l8er4zgg/0fYb
	ahBj1fPc0CrdX0byFYdlGg+0Yj7hqvxIGovoCG+TBR7YVb1mlcJfgDx1jepzW1XYK65kyBBnaFF
	oL7HO
X-Google-Smtp-Source: AGHT+IGJZsqQ5i+myu88mDiQ+67MGz3VjHv4x0VLX6DIRBlC2f96elycvYjzBWCjSvaBpiesEaCT8Q==
X-Received: by 2002:a05:6512:1294:b0:549:c1e6:cbb9 with SMTP id 2adb3069b0e04-550dcffc373mr493788e87.9.1747296030943;
        Thu, 15 May 2025 01:00:30 -0700 (PDT)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64bfd8asm2546611e87.199.2025.05.15.01.00.29
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 01:00:29 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54d3ee30af1so664664e87.0
        for <linux-sunxi@lists.linux.dev>; Thu, 15 May 2025 01:00:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVJlv2j1bjGEFGIgIrA5UuyfeeSOHEuvPMun7Al4wPc91jZ8WqMpHf8s7+B374X4AY7vVY6H7gVUBKh9w==@lists.linux.dev
X-Received: by 2002:a05:651c:1477:b0:30b:f2d6:8aab with SMTP id
 38308e7fff4ca-327fac55a0amr5702491fa.32.1747296029090; Thu, 15 May 2025
 01:00:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250511104042.24249-1-ryan@testtoast.com> <20250511104042.24249-6-ryan@testtoast.com>
In-Reply-To: <20250511104042.24249-6-ryan@testtoast.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 15 May 2025 16:00:16 +0800
X-Gmail-Original-Message-ID: <CAGb2v64BY+8ZkoxG82MCP+-5BZAFiYMRcm4LXeke9uVfpZX2bA@mail.gmail.com>
X-Gm-Features: AX0GCFtQJojOkTJDrh1Srsp9NZ6Emv-AQGyH6XtcUh5xrCVbMWvLF3It26XNdqM
Message-ID: <CAGb2v64BY+8ZkoxG82MCP+-5BZAFiYMRcm4LXeke9uVfpZX2bA@mail.gmail.com>
Subject: Re: [PATCH v10 05/11] dt-bindings: allwinner: add H616 DE33 bus binding
To: Ryan Walklin <ryan@testtoast.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Andre Przywara <andre.przywara@arm.com>, Chris Morgan <macroalpha82@gmail.com>, 
	Hironori KIKUCHI <kikuchan98@gmail.com>, Philippe Simons <simons.philippe@gmail.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, Chris Morgan <macromorgan@hotmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 11, 2025 at 6:42=E2=80=AFPM Ryan Walklin <ryan@testtoast.com> w=
rote:
>
> The Allwinner H616 and variants have a new display engine revision
> (DE33).
>
> Add a display engine bus binding for the DE33.
>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
>
> ---

Since this just falls back to the A64 compatible, there's no matching
driver change. Can you send this together with the DT changes instead?

Otherwise it goes unused.

ChenYu

> Changelog v1..v2:
> - Correct DE2 bus enum to reflect fallback devices accurately.
>
> Changelog v2..v3:
> - Separate content into three patches for three separate subsystems
>
> Changelog v5..v6:
> - Increase reg maxItems to 3.
>
> Changelog v9..v10:
> - Remove maxItems, this was added in error to the bus binding (rather tha=
n the mixer binding) when it was split from the other bindings in an earlie=
r revision.
> ---
>  .../devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml     | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-d=
e2.yaml b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.ya=
ml
> index 9845a187bdf6..ea7ee89158c6 100644
> --- a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
> +++ b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
> @@ -24,7 +24,9 @@ properties:
>      oneOf:
>        - const: allwinner,sun50i-a64-de2
>        - items:
> -          - const: allwinner,sun50i-h6-de3
> +          - enum:
> +              - allwinner,sun50i-h6-de3
> +              - allwinner,sun50i-h616-de33
>            - const: allwinner,sun50i-a64-de2
>
>    reg:
> --
> 2.49.0
>
