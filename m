Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CA26184
	for <linux-sunxi@lists.linux.dev>; Tue, 14 Feb 2023 00:14:05 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 362EB4B3;
	Mon, 13 Feb 2023 16:14:47 -0800 (PST)
Received: from slackpad.lan (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6CFEA3F663;
	Mon, 13 Feb 2023 16:14:01 -0800 (PST)
Date: Tue, 14 Feb 2023 00:04:17 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Bastian Germann <bage@debian.org>
Cc: Wilken Gottwalt <wilken.gottwalt@posteo.net>, Ohad Ben-Cohen
 <ohad@wizery.com>, Bjorn Andersson <andersson@kernel.org>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai
 <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: hwlock: sun6i: Add missing
 #hwlock-cells
Message-ID: <20230214000417.6f466073@slackpad.lan>
In-Reply-To: <20230213231931.6546-2-bage@debian.org>
References: <20230213231931.6546-1-bage@debian.org>
	<20230213231931.6546-2-bage@debian.org>
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

On Tue, 14 Feb 2023 00:19:28 +0100
Bastian Germann <bage@debian.org> wrote:

> The allwinner,sun6i-a31-hwspinlock.yaml binding needs #hwlock-cells
> which is required by the hwlock type.
> 
> Fixes: f9e784dcb63f ("dt-bindings: hwlock: add sun6i_hwspinlock")
> Signed-off-by: Bastian Germann <bage@debian.org>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  .../bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml       | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml b/Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml
> index 10e5a53e447b..01b1bbb3061f 100644
> --- a/Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml
> +++ b/Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml
> @@ -26,11 +26,15 @@ properties:
>    resets:
>      maxItems: 1
>  
> +  '#hwlock-cells':
> +    const: 1
> +
>  required:
>    - compatible
>    - reg
>    - clocks
>    - resets
> +  - "#hwlock-cells"
>  
>  additionalProperties: false
>  

