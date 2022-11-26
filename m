Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A03184
	for <linux-sunxi@lists.linux.dev>; Sat, 26 Nov 2022 00:14:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8D73C433D7
	for <linux-sunxi@lists.linux.dev>; Sat, 26 Nov 2022 00:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669421653;
	bh=N74f9IDDlvZlnyuOCje55je2uSM3m6cjmtYX6V2hg/g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=W0RxMFzvqCZxFGdKxkTd+/hYOd16SuE+JNOHjr6P774AS/1/L+8yul74UVZ5xKYb7
	 CE4CoYfV1c3wsD67NrS6SZNyYC2UQ60cIcFWMwbn7E/TivY6/lpegphSywkbAB0pIP
	 HMXSDY6WdLRKP3uO/wxxqba62Qg11gjrHIU2qHQPf8RnaknmP6VhGuRi5srTF68PgM
	 6hU7Pi8+uyBaMfx+15ZsKQFzgt7rGGJ1ThL6Rrh5WsqclFxuBEAVQOc5tcv5deyf43
	 cmRLIlcFgf/VjO3i8fxxh4V474LMmBSinvkaXczxi7eFhjXuOQLzjlimqrgXPFfqBC
	 zOniNf8ukrevA==
Received: by mail-ej1-f48.google.com with SMTP id vv4so13439173ejc.2
        for <linux-sunxi@lists.linux.dev>; Fri, 25 Nov 2022 16:14:13 -0800 (PST)
X-Gm-Message-State: ANoB5pkdgfPXTu/L6LZHnMNSAuIjVyo+9bxQLsEk9r9mGEp1+gi2PZmH
	uvU+mEyPvvr9mqbOL7XOoA3sFKdTmfjenGZ9WmY=
X-Google-Smtp-Source: AA0mqf6HG42rf/HfnEimx0EAtLwPqQGcB27y2FKCmyx3exOnkFF5dvFVMCfC53gZ0ELIJ3NNCB1u7iZj2WTecYK5skE=
X-Received: by 2002:a17:906:6a8e:b0:78d:a136:7332 with SMTP id
 p14-20020a1709066a8e00b0078da1367332mr34001772ejr.355.1669421651963; Fri, 25
 Nov 2022 16:14:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221125234656.47306-1-samuel@sholland.org> <20221125234656.47306-3-samuel@sholland.org>
In-Reply-To: <20221125234656.47306-3-samuel@sholland.org>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 26 Nov 2022 08:14:00 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRmHWQ5K=_jKDvum6hxmL_B_0KksPYkofOLutFk3VJ75g@mail.gmail.com>
Message-ID: <CAJF2gTRmHWQ5K=_jKDvum6hxmL_B_0KksPYkofOLutFk3VJ75g@mail.gmail.com>
Subject: Re: [PATCH v2 02/12] dt-bindings: vendor-prefixes: Add Allwinner
 D1/D1s board vendors
To: Samuel Holland <samuel@sholland.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev, 
	Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Jisheng Zhang <jszhang@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Andre Przywara <andre.przywara@arm.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>, 
	Christian Hewitt <christianshewitt@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Stanislav Jakubek <stano.jakubek@gmail.com>, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Guo Ren <guoren@kerenl.org>

On Sat, Nov 26, 2022 at 7:47 AM Samuel Holland <samuel@sholland.org> wrote:
>
> Some boards using the Allwinner D1 or D1s SoC are made by vendors not
> previously documented.
>
> Clockwork Tech LLC (https://www.clockworkpi.com/) manufactures the
> ClockworkPi and DevTerm boards.
>
> Beijing Widora Technology Co., Ltd. (https://mangopi.cc/) manufactures
> the MangoPi family of boards.
>
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>
> (no changes since v1)
>
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index 592e43911a07..f2c67b7418e4 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -262,6 +262,8 @@ patternProperties:
>      description: Cirrus Logic, Inc.
>    "^cisco,.*":
>      description: Cisco Systems, Inc.
> +  "^clockwork,.*":
> +    description: Clockwork Tech LLC
>    "^cloudengines,.*":
>      description: Cloud Engines, Inc.
>    "^cnm,.*":
> @@ -1430,6 +1432,8 @@ patternProperties:
>      description: Shenzhen whwave Electronics, Inc.
>    "^wi2wi,.*":
>      description: Wi2Wi, Inc.
> +  "^widora,.*":
> +    description: Beijing Widora Technology Co., Ltd.
>    "^wiligear,.*":
>      description: Wiligear, Ltd.
>    "^willsemi,.*":
> --
> 2.37.4
>


-- 
Best Regards
 Guo Ren
