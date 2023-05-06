Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A81BC846B
	for <linux-sunxi@lists.linux.dev>; Sat,  6 May 2023 21:59:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 82AB91FB;
	Sat,  6 May 2023 15:00:13 -0700 (PDT)
Received: from slackpad.lan (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1FF7B3F5A1;
	Sat,  6 May 2023 14:59:25 -0700 (PDT)
Date: Sat, 6 May 2023 22:59:11 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Maksim Kiselev <bigunclemax@gmail.com>
Cc: Icenowy Zheng <icenowy@aosc.io>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Cristian Ciocaltea
 <cristian.ciocaltea@collabora.com>, Maxime Ripard <mripard@kernel.org>,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 5/6] dt-bindings: spi: sun6i: add DT bindings for
 Allwinner D1/R528/T113s SPI
Message-ID: <20230506225911.7ac3198e@slackpad.lan>
In-Reply-To: <20230506073018.1411583-6-bigunclemax@gmail.com>
References: <20230506073018.1411583-1-bigunclemax@gmail.com>
	<20230506073018.1411583-6-bigunclemax@gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat,  6 May 2023 10:30:13 +0300
Maksim Kiselev <bigunclemax@gmail.com> wrote:

> Allwinner D1/R528/T113s SPI has the same as R329 controllers
> 
> Add compatible string for this controller

Please fold this into patch 1/6, and adjust accordingly to cover all
the combinations.

Cheers,
Andre

> 
> Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
> ---
>  .../devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml      | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
> index 2c1b8da35339..164bd6af9299 100644
> --- a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
> +++ b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
> @@ -30,6 +30,10 @@ properties:
>                - allwinner,sun50i-h616-spi
>                - allwinner,suniv-f1c100s-spi
>            - const: allwinner,sun8i-h3-spi
> +      - items:
> +          - enum:
> +              - allwinner,sun20i-d1-spi
> +          - const: allwinner,sun50i-r329-spi
>  
>    reg:
>      maxItems: 1

