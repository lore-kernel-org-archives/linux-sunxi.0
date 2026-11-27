Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795778750;
	b=uAgl6Qthp0d9w9PHTk1K4zDB//dkKrf2sF3saS2XQWxwXlw3YKuNlt7s5Q+A+z+uupH1
	 YLXmmQ0hoc+j5ceCSzF2QRQqcTzHpIkYePMU4ranDq1hHHdS4+MgnM3I1F9mcVpbEzWnv
	 KZ49BuQY9FDyF6mOViNJ9M90xxjFZM9UFhpEPzIspJYBAAZQ9Hx6eucYhG53Umiz7hY6T
	 BilueDoksQUNmnT0xtbWPtOK/TIsC7y/B6QaSinmcIu1fbevUMPF/CTa5EWjmS0zjj+BH
	 Euk2ORQm2YMnso5Xx0FTwaTldXG25IfM682XHs0xMvlPC8JCvagaKhhFyeR4cheBqNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795778750;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Spam;
	bh=7pO5JbwHDSPKvg0uHKowrZmDSkanYpZpNWtrBN/cyzY=;
	b=uhM6irxvsqez3DoLu8vPna2r6OiukgdqfCYjd0zN3E7Vlxd47ESTGydwvlFmWPIQV5LP
	 A6fMoHKUajFMYjosH/+jNeMgEPOMafowWdmNeu9kYF+7bgF0rp8vG3878Z48b3F/KxmxG
	 C8U6bZQhx/o+g7jTFGKziUClyCU9hczIh2FNcb7wJtBaPYepvag6aWBlpNxyBKpC9RPrB
	 ygdWSDuj584LpZFBXkUNUlxpT76wupRmhKZId3wJONoM02AnPrMr8+eTnJyLpP1DT/y42
	 u9s8WFqQqv6y5UIY6ekYPMNNs4y7iptov+oR4oeilEqcOzdrHGeMTJuFZ2gIaUis4AA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=cAj0ii6n;
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD061606A329
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 11:25:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD061606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=cAj0ii6n
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 592A64C98D;
	Fri, 27 Nov 2026 22:25:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795778745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7pO5JbwHDSPKvg0uHKowrZmDSkanYpZpNWtrBN/cyzY=;
	b=cAj0ii6nHEBU9SYpE4YrrcRDdw7CUbah0N6sbLMd/3Z0iLupU5UmicpNGgrnJdSBgDxr6O
	Hhoo5xAte0KXuQQqgvQ3MKqtYzO1LI+hXszKjZTBTV0jBfB7ir995LFso1YocGCUEkqVNd
	vhsn1MDdLv6iq48eY6UjHOfzacp2T3dFrTx+WOEwCN1+vQS2bH6gLgzajZmGf+ERBnYP2y
	VKJAP1buQi1Y+rdcIh6pQmEE5SZuiYgdSZvuXc/YjjIFFSBYTGfOQt/sUWKVHKPNcCtrmu
	/d57PIJTCud6/BPkzH/moKBbGc/eS0jvV7Om3vJc6FLG8q0ODYQYqRFe3f6Sqg==
From: Alastair D'Silva <alastair@d-silva.org>
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Alastair D'Silva <alastair@d-silva.org>
Subject: Re: [PATCH RESEND v3 2/3] dt-bindings: pinctrl: sun55i-a523: one interrupt per implemented bank
Date: Fri, 27 Nov 2026 22:25:45 +1100
Message-ID: <20261127112545.2584201-1-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261124215048.42074-3-pmazzini@gmail.com>
References: <20261124215048.42074-1-pmazzini@gmail.com> <20261124215048.42074-3-pmazzini@gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes

On Tue, 24 Nov 2026 21:50:47 +0000, Pablo Mazzini <pmazzini@gmail.com> wrote:
> The A523 and A733 have no PA pins, the A523's PA IRQ bank is not
> implemented, and the driver no longer counts it. Go back to one
> interrupt, and one debounce period, per implemented bank: 10 for both.
>
> This reverts commit 11f25ac56372 ("dt-bindings: pinctrl: sun55i-a523:
> increase IRQ banks number").
>
> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml   | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
> index d7d0ba32ced4..c04b04acf6e4 100644
> --- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
> @@ -36,7 +36,7 @@ properties:
>  
>    interrupts:
>      minItems: 2
> -    maxItems: 11
> +    maxItems: 10
>      description:
>        One interrupt per external interrupt bank supported on the
>        controller, sorted by bank number ascending order.
> @@ -63,7 +63,7 @@ properties:
>        bank found in the controller
>      $ref: /schemas/types.yaml#/definitions/uint32-array
>      minItems: 2
> -    maxItems: 11
> +    maxItems: 10
>  
>  patternProperties:
>    # It's pretty scary, but the basic idea is that:
> @@ -133,8 +133,8 @@ allOf:
>      then:
>        properties:
>          interrupts:
> -          minItems: 11
> -          maxItems: 11
> +          minItems: 10
> +          maxItems: 10
>  
>    - if:
>        properties:
> -- 
> 2.52.1
>

Reviewed-by: Alastair D'Silva <alastair@d-silva.org>
