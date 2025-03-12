Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5A3241689
	for <linux-sunxi@lists.linux.dev>; Wed, 12 Mar 2025 11:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741778741; cv=none; b=IlOquC2CmeklrAClUiqw2tjUvJp6K5Tbyo4k77cGl2guGKLmS08ExEAb2V0BGyiL0cFlxfuRsqu8EGx5Yz15MqQMGGq+A0k4dRqf9yGYxiV1FR1+xXTRfneBtrWTzcbUD1t+Ddj+/b+r8xLxLdeiXpGBQfpZ/wKyKLZ4XxFd73M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741778741; c=relaxed/simple;
	bh=2mAjhQ38xaV59CAo8Jko5V6MNwT7CgxOmLCldmytZvU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kijDUpAv1BWjwW17maLENR1t3/mrkCxf0SP/NJUng5S8Jck00k4itW3W5r7K3fKhab8q26ZNbioWUxRNhHfMTvu+hKhcTxKNgxS2/uaeY5DKX+Q1bJOcG7q0m15D9hpeIIXuKsokrYO4kfEL8NNcaPUGtYhAYGTQDlLHodJJ/KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KD+U6aM+; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KD+U6aM+"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6feafc707d3so60891837b3.1
        for <linux-sunxi@lists.linux.dev>; Wed, 12 Mar 2025 04:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741778738; x=1742383538; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CiJA8cEstxgkTU1mTKMy0JGKZ+R8iGVjaXw2iJxWSRI=;
        b=KD+U6aM+ikXpfE0lLULj5W6aUBjSLuH2ywcReNX/Q0zAc/gv3B7lcQnEmRy6J6DWr2
         n4Z7GHkjxOe+dikicPt6KwarvxycGoOzbIEVgJ2E1xawp0OCIKI0TDbvyPnjefc2uYbH
         QyimaIudVv1O3KnUkfQR6nb3FnlI9duD0+Kp9p0TAAH6ERcVgyXtDQmuVkhFDYHv5V7q
         8YU72x7qd+E+HlIKbgZ4ddH94Tults8xhAX3V9PNFlG0fuDTz3ph4iUEV7YkV/8ZR7wA
         z47MI9EoKIH7Otv43M13VLzVwj3LqEURsM7dQfUdB0UkZRz5GFWAlOdJSDuyHNFkHgBm
         wM5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741778738; x=1742383538;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CiJA8cEstxgkTU1mTKMy0JGKZ+R8iGVjaXw2iJxWSRI=;
        b=FNqg5JSjQsORm3zS+uxUSRyInWIRsDj19nhljgZdprTINkUL64cJSYRX9mqRPfQfET
         wZQWT0LbE9IVb6isF2S0eyzH0M06HblTfN0e5n1tbTQJUCd7Cn33toWzH5flb8ujDFDu
         u5pg+8v4TQGgNzz1+npjaRvTxXpOxIosx4Xke+Zn+s89tLRlXKETsBvN7yvwC3IYmSh0
         UvwE71v0Ya9McVcsfn9m3kFPzowzja56umi4f3Syic8G8u1qUnQbt3pvJfUQU6lGPYOA
         XbjTzSDY87MDDYQzdNdgK/nFmR+iLqCFTxqQyiosg0mS8+byS4PwgWjt75bEamXBGGut
         YGrw==
X-Forwarded-Encrypted: i=1; AJvYcCVuiAjgGsa1+KGP0oCyNDeqF53dX9PM32xgf/0Mr+HMy4BxDRTk9VQzk/D7FbyBXU/tHA2AZh/wDookhg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwIDNYKtTOs+pfaYM+yiB0/1EEns0i3gPig/O9WULJagSG/Xfqq
	YlIps1F87Tkw0+eKg1dFklf/qXrmEWtuQTGi+ngMsGOZruweFqO/rUIlLs72vViHR5lkZLYJTYK
	bi+KxklxnfDfWlb3FEOu4nG1BlTjJIZiia91xJA==
X-Gm-Gg: ASbGnctdm7NU/ENuuK/Tq9xvMqPaSCwjkGAu4JcbAX1NBYV3zOv/iMTyNXaBKvRCgwQ
	6iwEGJUedoh2OEHVO06qiyz3Sw44ziFUjfiLeHuhXJkE7f0MzxzacJoHNh+z5HZ/tg06qB/5E2G
	SNo3KLCn3jWL8FDHyua2NvwLHU5iA=
X-Google-Smtp-Source: AGHT+IFsXLs0G0P0sl4PUE6UPS3JqqtQHaqryQbTsh+V2XVD4bcZpoq0lGo1l4XslguvHjeCee00G9KHRf+J4fl/2ps=
X-Received: by 2002:a05:690c:4b13:b0:6fd:33a5:59a with SMTP id
 00721157ae682-6ff091eaa41mr105598827b3.18.1741778737979; Wed, 12 Mar 2025
 04:25:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250307005712.16828-1-andre.przywara@arm.com> <20250307005712.16828-3-andre.przywara@arm.com>
In-Reply-To: <20250307005712.16828-3-andre.przywara@arm.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 12 Mar 2025 12:25:02 +0100
X-Gm-Features: AQ5f1JpRnOY3arJkwpPqmP24JF8uLy0s3IwIKNA_9eLVMdzcVYtTB4PX7y_pSng
Message-ID: <CAPDyKFoFesrcYPDNDsvU_mLdkTGE2=7TCFrYkdFW3bp_0fLSMg@mail.gmail.com>
Subject: Re: [PATCH v3 02/15] dt-bindings: mmc: sunxi: add compatible strings
 for Allwinner A523
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 7 Mar 2025 at 01:57, Andre Przywara <andre.przywara@arm.com> wrote:
>
> The Allwinner A523 uses the same MMC IP as the D1.
>
> Introduce the new specific compatible strings, and use them with
> fallbacks to the D1 strings.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  .../devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml      | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml b/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
> index 8e4c77b7e4ab9..9f3b1edacaa02 100644
> --- a/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
> @@ -50,10 +50,14 @@ properties:
>            - enum:
>                - allwinner,sun20i-d1-emmc
>                - allwinner,sun50i-h616-emmc
> +              - allwinner,sun55i-a523-emmc
>            - const: allwinner,sun50i-a100-emmc
>        - items:
>            - const: allwinner,sun50i-h616-mmc
>            - const: allwinner,sun50i-a100-mmc
> +      - items:
> +          - const: allwinner,sun55i-a523-mmc
> +          - const: allwinner,sun20i-d1-mmc
>
>    reg:
>      maxItems: 1
> --
> 2.46.3
>
