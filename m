Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5B39D2E5
	for <linux-sunxi@lists.linux.dev>; Wed, 15 Feb 2023 20:42:25 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9C7A94B3;
	Wed, 15 Feb 2023 12:43:07 -0800 (PST)
Received: from slackpad.lan (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EB19D3F663;
	Wed, 15 Feb 2023 12:42:22 -0800 (PST)
Date: Wed, 15 Feb 2023 20:40:26 +0000
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
Subject: Re: [PATCH v2 2/5] dt-bindings: hwlock: sun6i: Add #hwlock-cells to
 example
Message-ID: <20230215204026.318d4b2d@slackpad.lan>
In-Reply-To: <20230215203711.6293-3-bage@debian.org>
References: <20230215203711.6293-1-bage@debian.org>
	<20230215203711.6293-3-bage@debian.org>
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

On Wed, 15 Feb 2023 21:37:07 +0100
Bastian Germann <bage@debian.org> wrote:

Hi,

> The dt-bindings tools will compile the yaml dt examples
> and this prevents an error about this node not existing.

This needs to be part of patch 1/5, otherwise it will break
bisecting. Just squash the two patches together.

Cheers,
Andre

> Signed-off-by: Bastian Germann <bage@debian.org>
> ---
>  .../bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml          | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml b/Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml
> index 01b1bbb3061f..38478dad8b25 100644
> --- a/Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml
> +++ b/Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml
> @@ -48,5 +48,6 @@ examples:
>          reg = <0x01c18000 0x1000>;
>          clocks = <&ccu CLK_BUS_SPINLOCK>;
>          resets = <&ccu RST_BUS_SPINLOCK>;
> +        #hwlock-cells = <1>;
>      };
>  ...

