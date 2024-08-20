Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A393F179A7
	for <linux-sunxi@lists.linux.dev>; Tue, 20 Aug 2024 07:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724139735; cv=none; b=AdNopPN/yV4wjyu6DwCosEZJjcaH67pNeRzEUMtqCB+C6jJ03TefCk+JR1PiZY5RtySijYiBpAef2MPImOOp+yg7cL+7Po2HoQj6U/4K8o6sDATDoGsxX3LRA7OzzGYwoGd+BPj8DzXkTnwNAB37vqLV6gyuEqN1mNGr5oyjNNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724139735; c=relaxed/simple;
	bh=MHqGozFEXa24M1GfNfz8WTKdM2zckoFwL8X6SG2QIm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kG8G+XHO5o1fr781bbrYoJbJ6FFnzMWmL/rXyU+AxGh5OgHboxD1R7ZL2BYxtO2vEI9bvgGZU0smp7064e2Y3dCMLdqy/QnSYcC3Cd3IdtP0Qi/hw7qR+xXNFXwUGQcblnZyNH4lP9RzhSTW/PVGNx4C8UHJ2KWrSY3snWVIdPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-37182eee02dso2713912f8f.1
        for <linux-sunxi@lists.linux.dev>; Tue, 20 Aug 2024 00:42:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724139731; x=1724744531;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=husHkeFncIg0j+W2GmpnfdIgBa/YY060+/4QysQxy1Y=;
        b=vhZwf9tFs9WVo0iBgyol4TYmG4MQrbIsVdQea7tssaOQUy5xdaMEIdEUxifIt2ys1u
         tRHNaillmYaO6eFXqp3TQNJTlaDWcMiIz7cWWSaBpSXYPIvqLhi+Ew9L8+V/uGfBuhMq
         +3gNz3QJOYtbWik5OXc6UahS8r6eorJu5+tJ8bk3OV1oM08xfs9yP4hQ6In/9owtDMyg
         zpvg3kRIW02pc3+K+GzQrF8XZ40+ylwTd1EB+4X79i/y9fzM/qXaR95xve5qfKyeXabk
         buZj5HG3VpU37hRq9nN+3NfXId55/tlNSx7Fk6cnrcPaF9Vr0MhV+vNHBTdbi7azSTr0
         +UVw==
X-Gm-Message-State: AOJu0YwRNS5pKX+EO8sxXhQWa9VUaIEUtikzgz8h+heTmOfJ1gWW9RKC
	seeqS4Tw/mOrwL0/T1I3oKloJ0DeQAUfZNMEMJQJjD96CdtUWAF1
X-Google-Smtp-Source: AGHT+IGD+gm4jvp43Ve4Xgj8RVDK1rAs3wa2ikJ2/8Whk9Gfl50sJMvQGIiLkZdVhsRmZzwD3iub7w==
X-Received: by 2002:adf:e585:0:b0:36b:5d86:d889 with SMTP id ffacd0b85a97d-371c4a9c310mr1111996f8f.6.1724139730617;
        Tue, 20 Aug 2024 00:42:10 -0700 (PDT)
Received: from krzk-bin ([178.197.215.209])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3718985a6ddsm12421688f8f.58.2024.08.20.00.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 00:42:09 -0700 (PDT)
Date: Tue, 20 Aug 2024 09:42:06 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chris Morgan <macroalpha82@gmail.com>
Cc: linux-sunxi@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, 
	quentin.schulz@free-electrons.com, mripard@kernel.org, tgamblin@baylibre.com, 
	aidanmacdonald.0x0@gmail.com, u.kleine-koenig@pengutronix.de, lee@kernel.org, 
	samuel@sholland.org, jernej.skrabec@gmail.com, sre@kernel.org, wens@csie.org, 
	conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org, lars@metafoo.de, 
	jic23@kernel.org, jonathan.cameron@huawei.com, 
	Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH V3 05/15] dt-bindings: power: supply: axp20x: Add
 input-current-limit-microamp
Message-ID: <ro43ccn3w2qsvcnjej7appuasuqphtf54vkyrsex6ypr4dlwhh@vi2jg4nemkvl>
References: <20240819164619.556309-1-macroalpha82@gmail.com>
 <20240819164619.556309-6-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240819164619.556309-6-macroalpha82@gmail.com>

On Mon, Aug 19, 2024 at 11:46:09AM -0500, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Allow specifying a hard limit of the maximum input current. Some PMICs
> such as the AXP717 can pull up to 3.25A, so allow a value to be
> specified that clamps this in the event the hardware is not designed
> for it.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  .../x-powers,axp20x-usb-power-supply.yaml     | 69 ++++++++++++++++++-
>  1 file changed, 66 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-usb-power-supply.yaml b/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-usb-power-supply.yaml
> index 34b7959d6772..9cc300e78f60 100644
> --- a/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-usb-power-supply.yaml
> +++ b/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-usb-power-supply.yaml
> @@ -15,9 +15,6 @@ maintainers:
>    - Chen-Yu Tsai <wens@csie.org>
>    - Sebastian Reichel <sre@kernel.org>
>  
> -allOf:
> -  - $ref: power-supply.yaml#
> -
>  properties:
>    compatible:
>      oneOf:
> @@ -31,8 +28,74 @@ properties:
>            - const: x-powers,axp803-usb-power-supply
>            - const: x-powers,axp813-usb-power-supply
>  
> +  input-current-limit-microamp:
> +    description:
> +      Optional value to clamp the maximum input current limit to for
> +      the device. If omitted, the programmed value from the EFUSE will
> +      be used.

minimum: 100000
maximum: 4000000
(or whatever the values are)

Best regards,
Krzysztof

