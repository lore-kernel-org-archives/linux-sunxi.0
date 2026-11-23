Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432384;
	b=a94A/8TjscYCBZez/g5uewHDOFpDZ4gTfD6N9sZ3lvXYqdDC+sfNXMbF++4cvTLgtXxL
	 WsGd6aLclUCxeX85rIi8CTFYd1pgIG37LzShzXU/cWaJf+kwpVFydX6hsLUblDJ0oDtvU
	 gmxWesvBABOnWrYeGw2dd6MVKHrfwjC4SL8aSsyklSIH0SKlpWUlTYcolTVmVUqy9XEYA
	 cImAu4IKQ0YnqaNnL0xsjAdk/urvgueIz+e/0c5E0M3nulSATwy8eGdmxa+d4lQYGMLNX
	 fbbHNM+lAZjJ6mylrkLdh3RfWDkamma8FnWZCVDz5iw1TaTjHKulA1hZ+VdZ08s2itA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432384;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=gXtppw2VGScP46e4T0icLwB377Wg2zh32ul4GnIcj4c=;
	b=UbRT5pIOA/NDn3FCLWuwFtq6N49+WH13ofplPKXXJrGHN/jLP0etyQ1gCHo9BInOhV1M
	 7QwPgVYzRpszdASvV5kKQYSw7XLycaRrl34GvceOACifGLP92QEa+cWLpagiEUH5ndci5
	 xpSwVZEELp57tdDwDC4OgpEGAQ0oQHcaPDZEwHGJqkEcHm/aALzWjwjWkUIqO0ElIBPh2
	 /BRx0BSK31qIw+1tzCwWy1OMAnYiQI3PelkenGcqdRESSdvgBdq+RyQsVcTQ9B94q6t5T
	 YTF4ZqzxG9T+d37+0JVVfgcdY4iL2ETIWPCp/qPGLqkLWyRYi+XRErqhjXD9OboAghA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BckXcxSR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2EE606A31A;
	Mon, 23 Nov 2026 11:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BckXcxSR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5AD81F000D0;
	Mon, 23 Nov 2026 11:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795432383;
	bh=gXtppw2VGScP46e4T0icLwB377Wg2zh32ul4GnIcj4c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BckXcxSREsY3Qbjdy957VDgJhhX1RVhHqnPr862zpPKKKrcUQY/1VWBhjtG5X++AY
	 a8C6GIICTykhk2LkMAPSCdNWR4j/zAo/wT1jjJEMMnaM5Xp6rDVk6+7eRKFrQMh68S
	 U87xtYe3KgvXuzzIP29PdMyrR0HBVOQRHlRDe2ooIYSn4i2W2KXqjDvmvfGGq4TGW5
	 hCtHfc1efqCF4PrmX9EcKS0zYnOAd9xRVQU4Rbes/TMX0/mnf4ZRh7ML3420zlTXLZ
	 RX9XEptbT/qwY0O/k6b7qExgcGzSYWCkKBaw7mfPzvSMamnrL25q0PtYtqLZ5aGYcS
	 +L8r+Rg9S+QKA==
Date: Mon, 23 Nov 2026 12:13:00 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Andre Przywara <andre.przywara@arm.com>, Xu Rao <raoxu@uniontech.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: document Allwinner A733 USB-2.0
 PHY
Message-ID: <20261123-international-brown-kakapo-257aec@quoll>
References: <20261116105544.669029-1-vinicius.eduardo.pedrosa@gmail.com>
 <20261116105544.669029-2-vinicius.eduardo.pedrosa@gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261116105544.669029-2-vinicius.eduardo.pedrosa@gmail.com>

On Mon, Nov 16, 2026 at 07:55:43AM -0300, Vinicius Pedrosa wrote:
> The Allwinner A733 USB 2.0 PHY uses the same configuration as the D1,
> so add its compatible with the D1 fallback. The A733-specific
> compatible lets the driver clear SIDDQ before releasing the PHY reset,
> without changing the PHY configuration.
> 
> Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
> ---
>  .../devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml    | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

