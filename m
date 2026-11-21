Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795304418;
	b=PUNWGNtwMhIVuqVXNCwXOR9P+BBUxZCGqyU7FVxalAjT4EPmNUyZPa6avYkqLNG35i4Y
	 BTyBPN4UDSf7ppyd3qfd8IMAuXQ0BPWJ2cU4uyUFvBnIXeZq8KpFkxX2UapR1QLRrpEUS
	 DWBAE/t3ALyI/v/gpdePsvKZ8fXOR7U45OcH78Np6a3EmoChSsTD4PYvPbHf2u8eGTF8s
	 6iFrJt6seDuSZyhzxF9ePTCky5QrqVp+IBkZjRiUdiFvNZAe9Izwl5CEEfEhJLoeMxy8X
	 BaAV/UHWe0JTmtIW2y4Pi4g7BrnGfEL+hi2tu0ODb8fB95BMVLjsNi2w4ZdFv63ldaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795304418;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=8NxAE3+c3JxlQlCfVJwT21XRRYTfIctD+MgnFE8VU2k=;
	b=LGsepaRXNspFv1XfwF5oiPdIl08duY0gA8cjkfIP3oEzR05bQUF2jDSXUsOYSfw5+/Lc
	 wgsu3OijDxUEQSVy4D2oXQA7SMKUg+lX95lbALzDLYku+tkL7pvJI8aUqhuA+4NXcvaug
	 RueBRer1jszc2aX4v7t80ymANrUEzEHmA8ZDNLVOJlQPqZFOBX8gG47pZ0aHdJ6AUt/Eu
	 241uGeEka1y0vhhLgmFbkMal98Lcb+lUcJQ+/aaJaEaYU1sJ6lRGfZgqW7w0NLqr70xIL
	 cpQsnp4a4TIOMHSoNwjr38oEEVyyopgj6m1qSHWl+LWvrpSfjLTTf7mJOSxDhz47K2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=rzh4Lff2;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82724606A320
	for <linux-sunxi@lists.linux.dev>; Sat, 21 Nov 2026 23:40:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82724606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=rzh4Lff2
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF2BE1575;
	Sat, 21 Nov 2026 15:40:13 -0800 (PST)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 09EE23F632;
	Sat, 21 Nov 2026 15:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795304416; bh=MS/cMo4fI6BQdz263DNnQ8KCQa+XHYfXkBL6vxm6U/k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rzh4Lff25WJs47n8mtXqRDU8MUwCkX3BneKVyx/HzUQEz56KWker44aSrTToyg95e
	 i5XNGOqvDFe2JR2ZrXbJXjf4bBdcOLc3mKIW/5sU5VnfqVVlaudUvalJVwBrQh9MS4
	 nFFvv1hpZsni26KMjgtVKuhU5EvCcsUGd5hMxMHw=
Date: Sun, 22 Nov 2026 00:40:08 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Enzo Adriano <enzo.adriano.code@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org, Maxime
 Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Junhui Liu <junhui.liu@pigmoral.tech>, Jerome
 Brunet <jbrunet@baylibre.com>, Pablo Mazzini <pmazzini@gmail.com>, Vinicius
 Pedrosa <vinicius.eduardo.pedrosa@gmail.com>, Alexander Sverdlin
 <alex@sverdlin.org>, Jun Yan <jerrysteve1101@gmail.com>, Lukas Schmid
 <lukas.schmid@netcube.li>, Krzysztof Kozlowski
 <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: arm: sunxi: document Radxa Cubie
 A7S
Message-ID: <20261122004008.0ee8e16d@ryzen.lan>
In-Reply-To: <428efa99fdd0182e8bc9a2ed88b78d2cbd36fa45.1795034153.git.enzo.adriano.code@gmail.com>
References: <cover.1795034153.git.enzo.adriano.code@gmail.com>
 <428efa99fdd0182e8bc9a2ed88b78d2cbd36fa45.1795034153.git.enzo.adriano.code@gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 19 Nov 2026 13:09:17 -0500
Enzo Adriano <enzo.adriano.code@gmail.com> wrote:

> Document the Radxa Cubie A7S board and Allwinner A733 SoC compatibles
> for the accompanying initial board device tree, so it can be identified
> and validated.
> 
> Reviewed-by: Alexander Sverdlin <alex@sverdlin.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
> index 7da84e2de748..d32689b7113d 100644
> --- a/Documentation/devicetree/bindings/arm/sunxi.yaml
> +++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
> @@ -857,6 +857,11 @@ properties:
>            - const: radxa,cubie-a5e
>            - const: allwinner,sun55i-a527
>  
> +      - description: Radxa Cubie A7S
> +        items:
> +          - const: radxa,cubie-a7s
> +          - const: allwinner,sun60i-a733
> +

Can you please add the A7A and name as well? I will send the .dts
patch shortly, but having the name ready would reduce the churn and
avoid conflicts.

Cheers,
Andre

>        - description: Remix Mini PC
>          items:
>            - const: jide,remix-mini-pc
> 

