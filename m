Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3607B3DFC61;
	Wed,  5 Aug 2026 07:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785915219; cv=none; b=LyoyMh7nsyJVDiM766eDKzmrqF6MDEkTwNLhuXuGe5tHIgrNwJf/SrD9jA7LkdtgYBIFKVqx4DOWegGPdl++7f0b3IfhRHbHgGIwlyZLeRWfio58IoxHP5WJYYGpOKEUfagl01WfMxEpdxpjkrT4p2j653nENKCKZwAtxL8DthE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785915219; c=relaxed/simple;
	bh=1KRmqAJ9/qxNsKeJG7cVyIV4gEeoCathO5UqzEOq2zQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vBMx7H7Qwl2Z3GIAKTeD7cZ82r6T4J9ypuJnXxv6nkULXIMtvt1EEo97DlVkwlymksfgJ+U9oUI1Mjp0vwmhfmbmEKy8aILMt2b6Fw2PBIklrWD8Yf0+1Z2KQF36fGHqbAG/E0qJxTY5N/8zCEhwJSAOlrz+mWXxTSE1ndDYJ3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F5MLED9H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F5MLED9H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C6121F00A3A;
	Wed,  5 Aug 2026 07:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785915217;
	bh=E8Pplx5QnU6Rr1kBPTcri9uayeJX5puxAU3cLDzc2Vs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F5MLED9H9oiftWsSWmYwWngs/cNwLMNqjiFUrs55d7/+9LLdDJ8lMaBzebMm/SoJG
	 1ZHB6d8hz9XJqp/a12SjjwTXArbSNHAZkmgjgtSZv7FeiVXng4IuHYdN0QlMlVRa/B
	 Tw4E6wPq6l0JU6AXTvkw8LbOFD9/R4/f6P81LZq+LlTn+RQcJCS3iqorqfLWPRACga
	 i3B5UO2t9Xmz4Mrhzt6uqw1Ck8GmpJHPaQebJNbMeu9+zPVMWEavpoPApWuvWuJvVC
	 JFZn8q83Y2sFtpy148eBMQFN9w50r4kx+pCHH8hsYcywwkUlwOE9yuhHLERvj3axEH
	 qgJQAqsOTiBxQ==
Date: Wed, 5 Aug 2026 09:33:32 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] dt-bindings: irq: sun7i-nmi: Document the Allwinner A733
 NMI controller
Message-ID: <20260805-subtle-clever-ammonite-0bdfce@quoll>
References: <20260731-allwinner-a733-nmi-support-v1-1-61e4a0825b20@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260731-allwinner-a733-nmi-support-v1-1-61e4a0825b20@baylibre.com>

On Fri, Jul 31, 2026 at 06:09:52PM +0200, Jerome Brunet wrote:
> The A733 NMI controller is compatible with the A523 one. Add an
> A733-specific compatible string, with the A523 as fallback.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  .../bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml      | 3 +++
>  1 file changed, 3 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

