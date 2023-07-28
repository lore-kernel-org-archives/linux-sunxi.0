Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6545B800
	for <linux-sunxi@lists.linux.dev>; Fri, 28 Jul 2023 00:29:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF0A0D75;
	Thu, 27 Jul 2023 17:29:58 -0700 (PDT)
Received: from slackpad.lan (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1BEB33F5A1;
	Thu, 27 Jul 2023 17:29:13 -0700 (PDT)
Date: Fri, 28 Jul 2023 01:28:24 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Matthew Croughan <matthew.croughan@nix.how>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] dt-bindings: arm: sunxi: add Mango Pi MQ-Quad
 binding
Message-ID: <20230728012818.52f32a00@slackpad.lan>
In-Reply-To: <20230719172551.3248166-3-matthew.croughan@nix.how>
References: <20230719172551.3248166-1-matthew.croughan@nix.how>
	<20230719172551.3248166-3-matthew.croughan@nix.how>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 19 Jul 2023 18:25:40 +0100
Matthew Croughan <matthew.croughan@nix.how> wrote:

> Document board compatible names for Mango Pi MQ-Quad
> 
> Signed-off-by: Matthew Croughan <matthew.croughan@nix.how>

Thanks, this looks alright, but needs to be the first patch in this
series. Otherwise dt-validate would fail when bisecting lands just in
the middle.
For the patch itself:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre


> ---
>  Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
> index ee8fdd2da869..2dee815fd45e 100644
> --- a/Documentation/devicetree/bindings/arm/sunxi.yaml
> +++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
> @@ -862,6 +862,11 @@ properties:
>            - const: wexler,tab7200
>            - const: allwinner,sun7i-a20
>  
> +      - description: MangoPi MQ-Quad
> +        items:
> +          - const: widora,mangopi-mq-quad
> +          - const: allwinner,sun50i-h616
> +
>        - description: MangoPi MQ-R board
>          items:
>            - const: widora,mangopi-mq-r-t113

