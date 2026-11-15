Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794751588;
	b=3VZXncyk0QxwpyIHOxOLztntb6Qpfe98O7H+UlHcMXJ4szmYgWQLwZutu6foYLESjWWZ
	 lHcjL637YE8CJiLwc4RsTMlyCm+XTFgv/9veY12rLWHGPxWt9wTJYbWOetGdiwivmRwXx
	 vfKpRkMXozyxg63yz1nCSybxcMqaU3mdURq0NpYZHP082y4ns315AZVTApvXILbmfVkVS
	 Q3NcABs/rEmUYYVgCFPLTY740liylyXQ+XXLHA4WAnoEpiDxiGa43t/Vv9ydCD6uf8Ko+
	 zTGg5iMDIHPCLRSirWa9Cp1s+MrgyAmfpFrlbVJ2DMunEj1M9FgoJvS51I8iw9bysNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794751588;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Yjh8Gm7XLBcgfYiYP3LTQh3dAygMMLi9uTvlwpldUyI=;
	b=bCHZ6EQ3CqDP1dAkXpR0g3ZveHIZ72xcjo5McnSiP2Q1k5Rwh5IapPjUn0q6m14+gX4i
	 FPUF50hTL1tH5N9xOQfahkc258eNPM9Mc9LbPCyIWPLqRmnBTe102QGihYuFZvZWtyh1F
	 R4tI7WdBpCbUxRfsdjhCLSNWLKWk5rSNUiZmTqfrZkK9Mo+0U+lUPmr+hDrZqK0D0NHHE
	 dkBks7x/UjC23AdUcbmVRvl1QKyGMx/Lpp1WhHGLZFxdwVm6rUsTmIjcSFQGmGGWQ8rRy
	 3wViriPpUeIbVwlHFD1gL5owDT+6xS2/3xzojM82Pk06yQeggtBWYNosCV/hKfJI4KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mz+siG7D;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E77606A31A
	for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 14:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mz+siG7D
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 693971F000C8
	for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 14:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794751588;
	bh=Yjh8Gm7XLBcgfYiYP3LTQh3dAygMMLi9uTvlwpldUyI=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=mz+siG7D/yfCsaQUtmvyh2TtPp6RSL+xZHuVfQQpgQhiqnFA2hy66sFqJDYv/zhNN
	 PZdl2f5jnz2cqc1ntx0TIL/cO1Z0Kh+VIfLZI8tPEkRNIx2NwRPylPxwO04vLWiK/C
	 S/tzsizO2aQtz305oM/Q/OG/w+H4MHYJduUfF7hKbiu9ouFFLGxed4MMPRDyLH/eDG
	 hMtlbugIRv5AqQQEF5MAIKv7X7WhfHNaoVQIgvD4XmINyiuNwknyiWuDimQGiag2xB
	 vmscKeRolp3ztysYOwCMZUOKT9oN5lIzDVQYCH3SP/dTdMtB1CQAPEP/qgiHKxh2iZ
	 XHTmXMjR20iDA==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3ae2fb3fe2fso21801121fa.2
        for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 06:06:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEw8hX3soffD8YC+Ho6ND4ITy/B0MagabFe9+hgCR4hn2wrWhGU74GFa/5cC7+gLjbuk8iWcYdKRSa+Fg==@lists.linux.dev
X-Gm-Message-State: APuU4Z8HveJtHLfBQnYsg8AOUU0uEf/Ey+NJti2ZwzfjBc3wPDtGpR7y
	OYo2/xN/YkqUALHkwtGZR/23dpXylYlpAvEAtT8lBlCnAh6Oy5osNlyg7eXTsj6+3GmKZhh3UEb
	SxfcARdCTbMWsKQGeodtf4ifZg3XOFgM=
X-Received: by 2002:a05:651c:41d1:b0:3ab:1207:bd2f with SMTP id
 38308e7fff4ca-3ae2b4bad8cmr29149331fa.11.1794751586867; Sun, 15 Nov 2026
 06:06:26 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261115061102.229680-1-jernej.skrabec@gmail.com> <20261115061102.229680-8-jernej.skrabec@gmail.com>
In-Reply-To: <20261115061102.229680-8-jernej.skrabec@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 15 Nov 2026 22:06:13 +0800
X-Gmail-Original-Message-ID: <CAGb2v67Kkiz=ns+DGS-nGeX7c_nT61B-CkXggqq0K2uxXGQ1UQ@mail.gmail.com>
X-Gm-Features: AclHuK-7yda1JGDc_9OgA1yiAcJwBx1hvDReZ63bJlhLUfk9UlCfGoWhOH0aQLI
Message-ID: <CAGb2v67Kkiz=ns+DGS-nGeX7c_nT61B-CkXggqq0K2uxXGQ1UQ@mail.gmail.com>
Subject: Re: [PATCH v3 7/8] dt-bindings: display: allwinner: Split H616 DE33
 layer reg space
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>, mripard@kernel.org, 
	maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com, 
	simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, sboyd@kernel.org, 
	Andre Przywara <andre.przywara@arm.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 2:11=E2=80=AFPM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> As it turns out, current H616 DE33 binding was written based on
> incomplete understanding of DE33 design. Namely, planes are shared
> resource and not tied to specific mixer, which was the case for previous
> generations of Display Engine (DE3 and earlier).
>
> This means that current DE33 binding doesn't properly reflect HW and
> using it would mean that second mixer (used for second display output)
> can't be supported.
>
> Remove layer register space, which will be represented with additional
> node, and replace it with phandle, which will point to that new, shared
> node. That way, all mixers can share same layers.
>
> This change is intentionally not backward compatible and the old binding
> will not be supported by the driver, for the following reasons:
>
> - It can't describe the hardware. Plane register space is shared
>   between all mixers, but the old binding puts it in the mixer node, so
>   only one mixer can ever claim it. The second mixer can't be supported
>   with the old binding at all. It also has no way to reference plane to
>   mixer mapping registers, which live in display clocks register space.
>
> - Supporting it would mean keeping a second, mixer-local plane
>   management path in the driver, with hardcoded plane mapping, which
>   doesn't match the hardware and which can't be tested, since nothing
>   uses it.
>
> - It was never used. Upstream H616 DT has no Display Engine nodes and
>   the rest of H616 display pipeline (TCON, HDMI, PHY) is not supported
>   upstream yet, so the old binding never produced a working display.
>   Vendor BSP kernels use a completely different DT structure and no
>   other known DT consumer (U-Boot, *BSD, Zephyr, TF-A, ...) implements
>   H616 display support. Only out of tree WIP patches used it and those
>   are updated together with the kernel.
>
> The driver will print an error, asking to update the device tree, when
> the old binding is detected.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

> ---
>  .../display/allwinner,sun8i-a83t-de2-mixer.yaml  | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-a8=
3t-de2-mixer.yaml b/Documentation/devicetree/bindings/display/allwinner,sun=
8i-a83t-de2-mixer.yaml
> index cbd18fd83e52..064e4ca7e419 100644
> --- a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-=
mixer.yaml
> +++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-=
mixer.yaml
> @@ -46,6 +46,10 @@ properties:
>    resets:
>      maxItems: 1
>
> +  allwinner,planes:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Phandle of Display Engine 3.3 planes node
> +
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>
> @@ -74,22 +78,22 @@ allOf:
>        properties:
>          reg:
>            description: |
> -            Registers for controlling individual layers of the display
> -            engine (layers), global control (top), and display blending
> -            control (display). Names are from Allwinner BSP kernel.
> -          maxItems: 3
> +            Registers for display blending control (display) and global
> +            control (top). Names are from Allwinner BSP kernel.
> +          maxItems: 2
>          reg-names:
>            items:
> -            - const: layers
> -            - const: top
>              - const: display
> +            - const: top
>        required:
>          - reg-names
> +        - allwinner,planes
>
>      else:
>        properties:
>          reg:
>            maxItems: 1
> +        allwinner,planes: false
>
>  required:
>    - compatible
> --
> 2.43.0
>
>
