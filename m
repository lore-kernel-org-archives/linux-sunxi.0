Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB5D02701BC
	for <linux-sunxi@lists.linux.dev>; Thu, 24 Apr 2025 00:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745455669; cv=none; b=lcMCCzwoofC7Ys7egp+Bm5FgTcQ74pRscGf8S0uaETvGYoqC8G5u1eX/96hDCW+QzuJIFj6MZynrpQzriKjv/kXr4CkJNpGMohD5KqiWBCBFgpBfkDoCxSrfpPqhGB4O6+kOXM1BdJRWqijjdBnMUhnG9Rl2+CONnLy6ewk5Udo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745455669; c=relaxed/simple;
	bh=ok6GdHj13IWtzTTZmP7tdotz1A+I8om9d4rsjicjIIY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fqYJPdJayKF6J1gxC6DyJf7zX1KgBkyovcOyFucAXZCFxCBNVN5j0yWMbZOgh9OTDSPnvAEKdr9mwFWUCLvrb5jpLvtXmi3yEVIpAhS2SRouf/4CUWgPvgekDoUD+y79rnBf+Gg/pUqEcHmOQiuied6w2rXHh/QI/A+ki+YDp/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AED101063;
	Wed, 23 Apr 2025 17:47:42 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4F07A3F59E;
	Wed, 23 Apr 2025 17:47:45 -0700 (PDT)
Date: Thu, 24 Apr 2025 01:46:41 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Yixun Lan <dlan@gentoo.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Maxime Ripard <mripard@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: sram: sunxi-sram: Add A523 compatible
Message-ID: <20250424014641.50c15efc@minigeek.lan>
In-Reply-To: <20250423-01-sun55i-emac0-v1-1-46ee4c855e0a@gentoo.org>
References: <20250423-01-sun55i-emac0-v1-0-46ee4c855e0a@gentoo.org>
	<20250423-01-sun55i-emac0-v1-1-46ee4c855e0a@gentoo.org>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 23 Apr 2025 22:03:22 +0800
Yixun Lan <dlan@gentoo.org> wrote:

Hi,

> Add new compatible for A527/T527 chips which using same die
> as the A523 SoC.

this reads a bit confusing, what about:
The Allwinner A523 family of SoCs have their "system control" registers
compatible to the A64 SoC, so just add the new SoC specific compatible
string.

Regardless:
Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  .../devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml     | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml b/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml
> index a7236f7db4ec34d44c4e2268f76281ef8ed83189..e7f7cf72719ea884d48fff69620467ff2834913b 100644
> --- a/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml
> +++ b/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml
> @@ -50,6 +50,7 @@ properties:
>            - enum:
>                - allwinner,sun50i-a100-system-control
>                - allwinner,sun50i-h6-system-control
> +              - allwinner,sun55i-a523-system-control
>            - const: allwinner,sun50i-a64-system-control
>  
>    reg:
> 

