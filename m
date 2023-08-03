Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B47D11CAE
	for <linux-sunxi@lists.linux.dev>; Thu,  3 Aug 2023 12:34:53 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6146E113E;
	Thu,  3 Aug 2023 05:35:36 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 600BB3F6C4;
	Thu,  3 Aug 2023 05:34:50 -0700 (PDT)
Date: Thu, 3 Aug 2023 13:34:47 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Martin Botka <martin@biqu3d.com>
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@somainline.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, Jami Kettunen
 <jamipkettunen@somainline.org>, Paul Bouchara
 <paul.bouchara@somainline.org>, Martin Botka <martin.botka@somainline.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Icenowy Zheng <uwu@icenowy.me>,
 Ludwig Kormann <ludwig.kormann@ict42.de>, Andrew Lunn <andrew@lunn.ch>,
 Heiko Stuebner <heiko@sntech.de>, Shawn Guo <shawnguo@kernel.org>, Bjorn
 Andersson <andersson@kernel.org>, Chris Morgan <macromorgan@hotmail.com>,
 Jagan Teki <jagan@edgeble.ai>, Maxime Ripard <mripard@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/6] dt-bindings: arm: sunxi: Add BigTreeTech CB1
Message-ID: <20230803133447.29eb9157@donnerap.manchester.arm.com>
In-Reply-To: <54C66F97A81FBC29+20230802220309.163804-3-martin@biqu3d.com>
References: <20230802220309.163804-1-martin@biqu3d.com>
	<54C66F97A81FBC29+20230802220309.163804-3-martin@biqu3d.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  3 Aug 2023 00:02:35 +0200
Martin Botka <martin@biqu3d.com> wrote:

Hi,

> From: Martin Botka <martin.botka@somainline.org>
> 
> Add a name & compatible for BigTreeTech CB1 SoM
> 
> Signed-off-by: Martin Botka <martin.botka@somainline.org>
> ---
>  Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
> index ee8fdd2da869..5ae1b81af6fc 100644
> --- a/Documentation/devicetree/bindings/arm/sunxi.yaml
> +++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
> @@ -151,6 +151,11 @@ properties:
>            - const: roofull,beelink-x2
>            - const: allwinner,sun8i-h3
>  
> +      - description: BigTreeTech CB1 SoM
> +        items:
> +          - const: bigtreetech,cb1
> +          - const: allwinner,sun50i-h616
> +

If I get this correctly, the CB1 is the SoM, which cannot be used on its
own, right? In this case there is no need for an entry in this file, since
this combination will never appear in a board .dts file alone.
So just drop this patch then.

Cheers,
Andre

>        - description: Chuwi V7 CW0825
>          items:
>            - const: chuwi,v7-cw0825

